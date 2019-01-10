create table tbl_Customer_Address
(
    Customer_Address_ID number(38,0) CONSTRAINT pk_CustomerAddress_id primary key not null,
    Customer_ID number(38,0) not null,
    Region_ID number(38,0) null,
    Street nvarchar2(100) null,
    City nvarchar2(100) null,
    Postal_Code nvarchar2(100) null,
    CreatedON date default sysdate not null,
    
    CONSTRAINT fk_CustomerAddress_ID
    FOREIGN KEY (Customer_ID)
    REFERENCES tbl_Customer(Customer_ID)
);