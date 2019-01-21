drop TABLE xml_tab;
/
CREATE TABLE xml_tab (
  id        NUMBER,
  xml_data  XMLTYPE
);
/
DECLARE

v_xml xmltype;

begin 

SELECT 
    XMLELEMENT
    ("Customer",
       XMLAGG
       (
         XMLELEMENT
         ("Contact",
           XMLFOREST(
           
             e.first_name AS "fisrst_name",
             e.last_name AS "last_name"
           )
         )
       ) 
    )
into v_xml
FROM   
    tbl_customer_details e
where 
    rownum<=100;
    
  INSERT INTO xml_tab VALUES (1, v_xml);
  COMMIT;
    
end; 
/

SELECT x.xml_data.getClobVal()
FROM   xml_tab x;

SELECT xt.*
FROM   xml_tab x,
       XMLTABLE('/Customer/Contact'
         PASSING x.xml_data
         COLUMNS 
           fisrst_name     nvarchar2(100) PATH 'fisrst_name',
           last_name     nvarchar2(100) PATH 'last_name'
         ) xt;






