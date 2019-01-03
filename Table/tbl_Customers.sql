create table tbl_Customers
(
    Customer_ID number(38) CONSTRAINT cus_id primary key not null,
    External_ID varchar2(32) default SYS_GUID() not null,
    Date_From date default sysdate not null,
    Date_To date default TO_DATE('31.12.9999 23:59:59', 'dd/mm/yyyy hh24:mi:ss')
);
