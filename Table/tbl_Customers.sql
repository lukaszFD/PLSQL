create table tbl_Customers
(
CustomerID number(38) CONSTRAINT cus_id primary key not null,
ExternalID varchar2(32) default SYS_GUID() not null,
DateFrom date default sysdate not null,
DateTo date 
);
