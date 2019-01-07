DECLARE
  v_xml_dict varchar2(15) := 'XMLSTORE';
  v_xml_file_name VARCHAR2(20);
  v_b_file BFILE;
--  v_XML_ADD XMLTYPE := xmltype(bfilename(xml_dict, '10.xml'),NLS_CHARSET_ID('AL32UTF8'));
  v_return_number NUMBER;
  v_files_numer number := 19971;
BEGIN

  v_return_number := ADD_CUSTOMER
  (
    XML_ADD 
  );
  DBMS_OUTPUT.PUT_LINE( v_return_number);
END;

Declare
plik bfile;
Begin
Plik:=bfilename('XMLDIC', '10.xml');
If Dbms_Lob.Fileexists(Plik)=1 Then
     Dbms_Output.Put_Line('jest taki plik!');
Else Dbms_Output.Put_Line('pliku niet!');
end if;
end;
