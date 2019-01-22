declare 

    Xml_Dict varchar2(10) := 'XMLSTORE';
    Files_Numer number(5,0) := 18000;

begin
    
    pac_add_customers_data.proc_Read_Bfile(V_Xml_Dict=>Xml_Dict,v_Files_Numer=>Files_Numer); 
    
end; 