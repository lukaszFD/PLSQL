create table tbl_Customer_Address_History
(
    Customer_Address_ID number(38) not null,
    Region_ID number(3) null,
    Street nvarchar2(50) null,
    City nvarchar2(50) null,
    Postal_Code nvarchar2(50) null,
	Date_From date not null,
    Date_To date default sysdate not null,
);