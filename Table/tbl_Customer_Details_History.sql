create table tbl_Customer_Details_History
(
    Customer_Detail_ID number(38) not null,
    Person_Type char(2) null,
    First_Name nvarchar2(50) null,
    Last_Name nvarchar2(50) null,
	Date_From date not null,
    Date_To date default sysdate not null,
);