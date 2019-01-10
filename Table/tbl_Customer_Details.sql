create table tbl_Customer_Details
(
    Customer_Detail_ID number(38,0)  CONSTRAINT pk_CustomerDetails_id primary key not null,
    Customer_ID number(38,0) not null,
    Person_Type nvarchar2(50) null,
    First_Name nvarchar2(100) null,
    Last_Name nvarchar2(100) null,
    CreatedON date default sysdate not null,
    
    CONSTRAINT fk_CustomerDetails_ID
    FOREIGN KEY (Customer_ID)
    REFERENCES tbl_Customer(Customer_ID)
);