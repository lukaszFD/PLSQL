create table tbl_clob_sql_script
(
script_id numeric(10,0) not null primary key,
user_name varchar2(50) not null,
script_file clob null
);
