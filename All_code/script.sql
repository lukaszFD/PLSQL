DECLARE

  v_xml_dict varchar2(15) := 'XMLSTORE';
  v_b_file BFILE;
  v_return_number NUMBER;
  v_files_numer number := 18000;
  
BEGIN

    FOR file_number IN 1..v_files_numer LOOP
    
    v_b_file := bfilename(v_xml_dict, file_number ||'.xml');
    
        If Dbms_Lob.Fileexists(v_b_file)= 1 Then
        
          v_return_number := ADD_CUSTOMER
          (
            xmltype(v_b_file,NLS_CHARSET_ID('AL32UTF8')) 
           );
           
        Else CONTINUE;
        end if;
    END LOOP;
    
END;

