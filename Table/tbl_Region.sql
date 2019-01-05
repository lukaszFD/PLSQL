create table tbl_Region
(
    Region_ID number (3) not null,
    State_Province_Code varchar2(5) not null,
    Country_Region_Code char(2),
    Name nvarchar2(50) not null,
    CreatedON date default sysdate not null
);
