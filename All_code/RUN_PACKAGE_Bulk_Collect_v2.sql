declare 
    v_dict varchar2(20) := 'ONE_XML';
    v_name varchar2(20) := 'Customers_2.xml';
    v_limit decimal(5) := 250;
begin 
    pac_add_customers_data_BULK_v2.proc_add_customer
    (
        v_dict=>v_dict,
        v_name=>v_name,
        v_limit=>v_limit
    );
    
    dbms_output.put_line('koniec');
    
end;
