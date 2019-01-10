create package pac_add_customers_data as
  
  /*jest to funkcja która dodaje xml-e do tabelki tbl_customer*/
    function fun_add_customer 
    (
        xml_to_add xmltype
    ) return int;
    
    PROCEDURE proc_read_bfile
    (
        v_xml_dict varchar2,
        v_files_numer number
    );
    
   /*ta procedura dodaje rozparsowane dane xmlowe do tabeli z adresami*/
    PROCEDURE proc_add_customer_address
    (
        v_Customer_ID number,
        v_Region_ID number,
        V_Street nvarchar2,
        v_City nvarchar2,
        v_Postal_Code nvarchar2
    );
    
    procedure proc_add_customer_details
    (
        v_Customer_ID number,
        v_Person_Type char,
        v_First_Name nvarchar2,
        v_Last_Name nvarchar2
    );
    
end pac_add_customers_data;
/
CREATE PACKAGE BODY pac_add_customers_data as 

    /*jest to funkcja która dodaje xml-e do tabelki tbl_customer*/
    function fun_add_customer
    (
        xml_to_add xmltype
    )
    return int is 
    new_customer_id int;
    
    begin 
        SELECT 
            customer_id_seq.NEXTVAL 
        INTO 
            new_customer_id 
        FROM 
            dual;
        
        insert into tbl_customer
            (
                Customer_ID,
                Customer_xml,
                Status
            )
        values 
            (
                new_customer_id,
                xml_to_add, 
                '1'
            );
            commit;
    
    return new_customer_id;
    end fun_add_customer;
    
    /*ta procedura dodaje rozparsowane dane xmlowe do tabeli z adresami*/
    PROCEDURE proc_add_customer_address
    (
        v_Customer_ID number,
        v_Region_ID number,
        V_Street nvarchar2,
        v_City nvarchar2,
        v_Postal_Code nvarchar2
    )
    is
    begin
        insert into tbl_Customer_Address (Customer_ID, Region_ID, Street, City , Postal_Code)
        values (v_Customer_ID, v_Region_ID, V_Street, v_City, v_Postal_Code);
        commit;
    end;
    
    /*ta procedura dodaje rozparsowane dane xmlowe do tabeli z danymi osobowymi klienta*/
    procedure proc_add_customer_details
    (
        v_Customer_ID number,
        v_Person_Type char,
        v_First_Name nvarchar2,
        v_Last_Name nvarchar2
    )
   is
    begin
        insert into tbl_Customer_Details(Customer_ID, Person_Type, First_Name, Last_Name)
        values (v_Customer_ID, v_Person_Type, v_First_Name, v_Last_Name);
        commit;
    end;
    
    /*ta procedura czyta xmle z dysku i zapisuje je w tabelach uzywaj?c funkcji i innych procedur z pakietu*/
    PROCEDURE proc_read_bfile  
    (
        v_xml_dict varchar2,
        v_files_numer number
    )
    is
      v_b_file BFILE;
      v_return_number NUMBER;
      v_xmltype xmltype;
      
      /*zmienne do inserta*/
      
        v_b_file_Person_Type nvarchar2(50);
        v_b_file_First_Name nvarchar2(100);
        v_b_file_Last_Name nvarchar2(100);
        
        v_b_file_Street nvarchar2(100);
        v_b_file_City nvarchar2(100);
        v_b_file_Region_ID number(38,0);
        v_b_file_Postal_Code nvarchar2(100);
      
    BEGIN

    FOR file_number IN 1..v_files_numer LOOP
    
--    v_b_file := bfilename(v_xml_dict, file_number ||'.xml');
    
        If Dbms_Lob.Fileexists(bfilename(v_xml_dict, file_number ||'.xml'))= 1 Then
        
        V_Xmltype := xmltype(bfilename(v_xml_dict, file_number ||'.xml'),NLS_CHARSET_ID('AL32UTF8'));
        
          v_return_number := fun_add_customer
          (
            V_Xmltype
           );
           
        select 
            EXTRACTVALUE( V_Xmltype, '/Customer/Contact/PersonType'),
            EXTRACTVALUE( V_Xmltype, '/Customer/Contact/FirstName'),
            EXTRACTVALUE( V_Xmltype, '/Customer/Contact/LastName'), 
            EXTRACTVALUE( V_Xmltype, '/Customer/Address/Street'),
            EXTRACTVALUE( V_Xmltype, '/Customer/Address/City'),
            EXTRACTVALUE( V_Xmltype, '/Customer/Address/RegionID'),
            EXTRACTVALUE( V_Xmltype, '/Customer/Address/PostalCode')
        into
             v_b_file_Person_Type,
             v_b_file_First_Name,
             v_b_file_Last_Name,
             v_b_file_Street,
             v_b_file_City,
             v_b_file_Region_ID,
             v_b_file_Postal_Code
        from 
            dual;
        
        proc_add_customer_details(v_return_number, v_b_file_Person_Type, v_b_file_First_Name, v_b_file_Last_Name);
        proc_add_customer_address(v_return_number, v_b_file_Region_ID, v_b_file_Street, v_b_file_City, v_b_file_Postal_Code);
           
        Else CONTINUE;
        end if;
    END LOOP;
    
END;

end pac_add_customers_data;