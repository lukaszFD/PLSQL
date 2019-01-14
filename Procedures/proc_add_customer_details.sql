create or replace PROCEDURE proc_add_customer_details
    (
        v_index_start number,
        v_index_stop number
    )
    is
    
    Cursor cur_customer_Details
    is
    
    select 
        customer_id,
        EXTRACTVALUE( customer_xml, '/Customer/Contact/PersonType') as person_Type,
        EXTRACTVALUE( customer_xml, '/Customer/Contact/FirstName') as first_Name,
        EXTRACTVALUE( customer_xml, '/Customer/Contact/LastName') as last_name
    from 
        tbl_customer
    where 
        customer_id between v_index_start and v_index_stop;
    
    /*zmienne do inserta*/
    type v_customer_id_det is table of Tbl_Customer_Details.customer_Id%type INDEX BY BINARY_INTEGER;
    type v_b_file_Person_Type is table of  Tbl_Customer_Details.person_Type%type INDEX BY BINARY_INTEGER;
    type v_b_file_First_Name is table of Tbl_Customer_Details.first_Name%type INDEX BY BINARY_INTEGER;
    type v_b_file_Last_Name is table of  Tbl_Customer_Details.last_Name%type  INDEX BY BINARY_INTEGER;
    
    TYPE typ_Details_rec IS RECORD
    (
        t_customer_id_det v_customer_id_det,
        t_Person_Type v_b_file_Person_Type,
        t_First_Name v_b_file_First_Name,
        t_Last_Name v_b_file_Last_Name
    );
    tab_Details typ_Details_rec; 
    C_BATCH CONSTANT PLS_INTEGER := 500;
    
    begin
    
    open cur_customer_Details;
        loop
        fetch cur_customer_Details bulk collect into tab_Details limit C_BATCH;
            if tab_Details.t_customer_id_det.count > 0 then
            
                FORALL i IN tab_Details.t_customer_id_det.FIRST ..tab_Details.t_customer_id_det.LAST
                  insert into tbl_Customer_Details
                    (
                        Customer_ID, 
                        Person_Type, 
                        First_Name, 
                        Last_Name
                    )           
                 values
                    (
                        tab_Details.t_customer_id_det(i), 
                        tab_Details.t_Person_Type(i), 
                        tab_Details.t_First_Name(i), 
                        tab_Details.t_Last_Name(i)
                    );
            END IF;
            exit when cur_customer_Details%notfound;
        end loop;
    
    close cur_customer_Details;
    
       end proc_add_customer_details;