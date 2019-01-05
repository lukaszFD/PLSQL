create table tbl_Customer_History
(
    Customer_ID number(38) not null,
    Customer_xml xmltype not null,
	Date_From date not null,
    Date_To date default sysdate not null,
);