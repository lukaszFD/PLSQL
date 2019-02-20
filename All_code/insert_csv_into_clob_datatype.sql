declare
    v_clob  clob;
    l_row   varchar2(4000);
begin
    dbms_lob.createtemporary(v_clob, true);
    for i in ( select d.* from tbl_customer_details d )
    loop
        l_row := i.CUSTOMER_DETAIL_ID||';'||i.CUSTOMER_ID||';'||i.PERSON_TYPE||';'||i.FIRST_NAME||';'||i.LAST_NAME||';'||i.CREATEDON||chr(10);
        dbms_lob.writeappend (v_clob, length(l_row), l_row);
    end loop;

    insert into tbl_clob_csv 
    (
        user_name,
        csv_file
    )
    values 
    ( 
        SYS_CONTEXT ('USERENV', 'SESSION_USER') ,
        v_clob 
    );

    dbms_lob.freetemporary(v_clob);
end;