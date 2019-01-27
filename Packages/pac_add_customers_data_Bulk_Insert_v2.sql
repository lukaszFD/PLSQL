create or replace PACKAGE pac_add_customers_data_BULK_v2 as

    function fun_return_xmltype 
    (
        v_xml_dict varchar2,
        v_xml_name varchar2
    ) return xmltype;
    
    PROCEDURE proc_add_customer
    (
        v_dict varchar2,
        v_name varchar2,
        v_limit number
    );
    

end pac_add_customers_data_BULK_v2;
/
create or replace PACKAGE BODY pac_add_customers_data_BULK_v2 as 

    function fun_return_xmltype
        (
            v_xml_dict varchar2,
            v_xml_name varchar2
        )
        return xmltype is 
    
        V_Xmltype xmltype;
    
    BEGIN
        select xmltype(bfilename(v_xml_dict, v_xml_name),NLS_CHARSET_ID('AL32UTF8'))
        into V_Xmltype  
        from dual;    
    
        return V_Xmltype;
    end fun_return_xmltype;
    
    PROCEDURE proc_add_customer
    (
        v_dict varchar2,
        v_name varchar2,
        v_limit number
    )
    is
    
    /*-------------------------------------------------------------------------------------------------------*/
    type v_customer_id_det      is table of Tbl_Customer.customer_Id%type           INDEX BY BINARY_INTEGER;
    type v_b_file_Person_Type   is table of Tbl_Customer_Details.person_Type%type   INDEX BY BINARY_INTEGER;
    type v_b_file_First_Name    is table of Tbl_Customer_Details.first_Name%type    INDEX BY BINARY_INTEGER;
    type v_b_file_Last_Name     is table of Tbl_Customer_Details.last_Name%type     INDEX BY BINARY_INTEGER;
    type v_b_file_Region_ID     is table of tbl_Customer_Address.region_id%type     INDEX BY BINARY_INTEGER;
    type v_b_file_Street        is table of tbl_Customer_Address.street%type        INDEX BY BINARY_INTEGER;
    type v_b_file_City          is table of tbl_Customer_Address.city%type          INDEX BY BINARY_INTEGER;
    type v_b_file_Postal_Code   is table of tbl_Customer_Address.postal_code%type   INDEX BY BINARY_INTEGER;
    type v_b_file_Customer_XML  is table of tbl_customer.customer_xml%type          INDEX BY BINARY_INTEGER;
    
    TYPE typ_Details_rec IS RECORD
    (
        t_customer_id_det   v_customer_id_det,
        t_Person_Type       v_b_file_Person_Type,
        t_First_Name        v_b_file_First_Name,
        t_Last_Name         v_b_file_Last_Name,
        t_Region_ID         v_b_file_Region_ID,
        t_Street            v_b_file_Street,
        t_City              v_b_file_City,
        t_Postal_Code       v_b_file_Postal_Code,
        t_Customer_XML      v_b_file_Customer_XML
    );
    tab_cust typ_Details_rec; 
    
    /*-------------------------------------------------------------------------------------------------------*/
    cursor xml_cur 
    is 

        with cte_cust as
        (
        select 
            fun_return_xmltype(v_dict, v_name) as xml_data
        from 
            dual
        )
        
        Select 
            cust_data.*
        FROM 
            cte_cust cust, 
        xmltable
        (
           '$C/Customers/Customer' Passing cust.xml_data as "C"
           COLUMNS 
                "CustomerID"    number(38,0)   path 'CustomerID',
                "Person_Type"   nvarchar2(50)  Path 'Contact/PersonType',
                "First_Name"    nvarchar2(100) Path 'Contact/FirstName',
                "Last_Name"     nvarchar2(100) Path 'Contact/LastName',
                "Region_ID"     number(38,0)   path 'Address/RegionID',
                "Street"        nvarchar2(100) Path 'Address/Street',
                "City"          nvarchar2(100) Path 'Address/City',
                "Postal_Code"   nvarchar2(100) path 'Address/PostalCode',
                "Customer_XML"  xmltype        path '/Customer'
        ) cust_data;  
    /*-------------------------------------------------------------------------------------------------------*/
    begin 
    
    open xml_cur;
    
        loop
            fetch xml_cur BULK COLLECT into  
                tab_cust.t_customer_id_det,
                tab_cust.t_Person_Type,
                tab_cust.t_First_Name,
                tab_cust.t_Last_Name,
                tab_cust.t_Region_ID,
                tab_cust.t_Street,
                tab_cust.t_City,
                tab_cust.t_Postal_Code,
                tab_cust.t_Customer_XML
            limit v_limit;
            
            if tab_cust.t_customer_id_det.count > 0 then 
            
            /*----------------------------------------------------------------------------*/
            FORALL x IN tab_cust.t_customer_id_det.FIRST ..tab_cust.t_customer_id_det.LAST
            insert into tbl_Customer
            (
                Customer_ID, 
                Status,
                customer_xml
            )           
            values
            (
                tab_cust.t_customer_id_det(x), 
                1,
                tab_cust.t_Customer_XML(x)
            ); 
            COMMIT; 
            /*----------------------------------------------------------------------------*/
            FORALL i IN tab_cust.t_customer_id_det.FIRST ..tab_cust.t_customer_id_det.LAST
            insert into tbl_Customer_Details
            (
                customer_id,
                Person_Type, 
                First_Name, 
                Last_Name
            )           
            values
            (
                tab_cust.t_customer_id_det(i),
                tab_cust.t_Person_Type(i), 
                tab_cust.t_First_Name(i), 
                tab_cust.t_Last_Name(i)
            );
           COMMIT; 
           /*----------------------------------------------------------------------------*/
            FORALL ii IN tab_cust.t_customer_id_det.FIRST ..tab_cust.t_customer_id_det.LAST
            insert into tbl_Customer_Address 
            (
                Customer_ID, 
                Region_ID, 
                Street, City, 
                Postal_Code
            )
            values
            (
                tab_cust.t_customer_id_det(ii), 
                tab_cust.t_Region_ID(ii),
                tab_cust.t_Street(ii),
                tab_cust.t_City(ii),
                tab_cust.t_Postal_Code(ii)
            );
            COMMIT; 
    
           end if;
            
        EXIT WHEN xml_cur%NOTFOUND;
        end loop;
    close xml_cur;
        
    end proc_add_customer;

end pac_add_customers_data_BULK_v2;