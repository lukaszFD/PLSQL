create table tbl_CLOB_CSV 
(
file_id numeric(10,0) not null primary key,
user_name varchar2(50) not null,
csv_file clob null
);
