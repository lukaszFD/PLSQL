create or replace PACKAGE pac_add_customers_data_BULK as
  
  /*jest to funkcja która dodaje xml-e do tabelki tbl_customer*/
    function fun_add_customer 
    (
        xml_to_add xmltype
    ) return int;
    
    FUNCTION fun_get_seq_number
    (
        seq_name varchar2
    ) return int;
    
    PROCEDURE proc_read_bfile  
    (
        v_xml_dict varchar2,
        v_files_numer number
    );
    
    PROCEDURE proc_add_customer_details
    (
        v_index_start number,
        v_index_stop number
    );
    PROCEDURE proc_add_customer_address
    (
        v_index_start number,
        v_index_stop number
    );
    
end pac_add_customers_data_BULK;
/
create or replace PACKAGE BODY pac_add_customers_data_BULK as 

    PROCEDURE proc_add_customer_address
    (
        v_index_start number,
        v_index_stop number
    )
    is
    
    Cursor cur_customer_address
    is
    
    select 
        customer_id,
        EXTRACTVALUE( customer_xml, '/Customer/Address/RegionID') as region_id,
        EXTRACTVALUE( customer_xml, '/Customer/Address/Street') as street,
        EXTRACTVALUE( customer_xml, '/Customer/Address/City') as city,
        EXTRACTVALUE( customer_xml, '/Customer/Address/PostalCode') as postal_code
    from 
        tbl_customer
    where 
        customer_id between v_index_start and v_index_stop;
    
    type v_customer_id_adr is table of tbl_Customer_Address.customer_id%type INDEX BY BINARY_INTEGER;
    type v_b_file_Region_ID is table of tbl_Customer_Address.region_id%type INDEX BY BINARY_INTEGER;
    type v_b_file_Street is table of tbl_Customer_Address.street%type INDEX BY BINARY_INTEGER;
    type v_b_file_City is table of tbl_Customer_Address.city%type INDEX BY BINARY_INTEGER;
    type v_b_file_Postal_Code is table of tbl_Customer_Address.postal_code%type INDEX BY BINARY_INTEGER;
    
    TYPE typ_Address_rec IS RECORD
    (
       t_customer_id_adr v_customer_id_adr,
       t_Region_ID v_b_file_Region_ID,
       t_Street v_b_file_Street,
       t_City v_b_file_City,
       t_Postal_Code v_b_file_Postal_Code
    );
            
    tab_Address typ_Address_rec;   
    C_BATCH CONSTANT PLS_INTEGER := 500;
        
    begin
    open cur_customer_address;
        loop
        fetch cur_customer_address bulk collect into tab_Address limit C_BATCH;
            if tab_Address.t_customer_id_adr.count > 0 then
            
                FORALL i IN tab_Address.t_customer_id_adr.FIRST ..tab_Address.t_customer_id_adr.LAST
                insert into tbl_Customer_Address 
                    (
                        Customer_ID, 
                        Region_ID, 
                        Street, City, 
                        Postal_Code
                    )
                values
                    (
                        tab_Address.t_customer_id_adr(i), 
                        tab_Address.t_Region_ID(i),
                        tab_Address.t_Street(i),
                        tab_Address.t_City(i),
                        tab_Address.t_Postal_Code(i)
                    );
            END IF;
            exit when cur_customer_address%notfound;
        end loop;
    
    close cur_customer_address;
    
    end proc_add_customer_address;
    
    PROCEDURE proc_add_customer_details
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

    /*jest to funkcja która zwraca ostani numer z sekwencji*/
    FUNCTION fun_get_seq_number
    (
        seq_name varchar2
    ) 
    return int is 
    
    seq_number int;
    v_seq_one number;
    v_sequence_exc_one EXCEPTION;
    PRAGMA EXCEPTION_INIT(v_sequence_exc_one, -1);
    v_sequence_exc_currval EXCEPTION;
    PRAGMA EXCEPTION_INIT(v_sequence_exc_currval, -2);

    begin 

        select  
            last_number
        into v_seq_one
        from  
            user_sequences
        where 
            sequence_name = seq_name;

        if v_seq_one = 1 then 
            raise v_sequence_exc_one;
        elsif v_seq_one > 1 then
            raise v_sequence_exc_currval;
        end if;

    EXCEPTION

       WHEN v_sequence_exc_one THEN 
       return v_seq_one;

       when v_sequence_exc_currval THEN

       EXECUTE IMMEDIATE 'select '|| seq_name ||'.currval from dual' 
       into seq_number;

       return seq_number;
    end fun_get_seq_number;
    
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
    
    
    /*ta procedura czyta xmle z dysku i zapisuje je w tabelach uzywajac funkcji i innych procedur z pakietu*/
    PROCEDURE proc_read_bfile  
    (
        v_xml_dict varchar2,
        v_files_numer number
    )
    is
      v_b_file BFILE;
      v_return_number NUMBER;
      V_Xmltype xmltype;

    BEGIN

    FOR file_number IN 1..v_files_numer LOOP
    
        If Dbms_Lob.Fileexists(bfilename(v_xml_dict, file_number ||'.xml'))= 1 Then
        
        V_Xmltype := xmltype(bfilename(v_xml_dict, file_number ||'.xml'),NLS_CHARSET_ID('AL32UTF8'));
        
          v_return_number := fun_add_customer
          (
            V_Xmltype
           );    
        Else CONTINUE;
        end if;
    END LOOP;
    
END;

end pac_add_customers_data_BULK;