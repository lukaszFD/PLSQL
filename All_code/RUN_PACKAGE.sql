declare 

    Xml_Dict varchar2(10) := 'XMLSTORE';
    Files_Numer number(5,0) := 18000;
    seq_name varchar2(50) := 'CUSTOMER_ID_SEQ';
    ret_1 number;
    ret_2 number;
begin
    ret_1 := pac_add_customers_data_BULK.Fun_Get_Seq_Number(Seq_Name=>seq_name);
    
    pac_add_customers_data_BULK.proc_Read_Bfile(V_Xml_Dict=>Xml_Dict,v_Files_Numer=>Files_Numer); 
    
    ret_2 := pac_add_customers_data_BULK.Fun_Get_Seq_Number(Seq_Name=>seq_name);
    
    pac_add_customers_data_BULK.proc_add_customer_address(v_index_start=> ret_1, v_index_stop=> ret_2);
    pac_add_customers_data_BULK.proc_add_customer_details(v_index_start=> ret_1, v_index_stop=> ret_2);
    
end; 