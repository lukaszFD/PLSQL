create or replace function fun_return_xmltype
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
    