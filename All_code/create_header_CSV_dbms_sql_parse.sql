declare 
    v_clob clob;
    v_cursor_id int;
    v_col_cnt int;
    v_desc_tab2 dbms_sql.desc_tab2;
    v_row_col varchar2(4000);
    v_row clob;
    v_test clob; 
begin 

SELECT script_file 
into v_test 
FROM 
    tbl_clob_sql_script 
where 
    script_id = 11;

v_cursor_id := dbms_sql.open_cursor;
dbms_sql.parse( v_cursor_id, v_test, dbms_sql.native );
dbms_sql.describe_columns2( v_cursor_id, v_col_cnt, v_desc_tab2 );

for loop_dc in 1..v_col_cnt
loop
    dbms_sql.define_column(v_cursor_id, loop_dc,v_desc_tab2(loop_dc).col_name,500);
    v_row := v_row||'"'||v_desc_tab2(loop_dc).col_name ||'",';
    v_row_col :=v_row_col||'''"''||i."'||v_desc_tab2(loop_dc).col_name||'"||''",''||';
    DBMS_OUTPUT.PUT_LINE(v_row_col);
end loop loop_dc;

end; 