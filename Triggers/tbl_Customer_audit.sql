create or replace TRIGGER tbl_Customer_audit
before update or delete on tbl_Customer
for each row
enable 

declare 
date_time DATE;
user_n varchar2(50);

begin

select 
    TO_DATE(sysdate , 'dd/mm/yyyy hh24:mi:ss'),
    user
into 
    date_time,
    user_n
from 
    dual;

if updating 
then 
    insert into tbl_Customer
        ( 
            External_ID, 
            Customer_xml, 
            Date_From, 
            Date_To,
            Status,
            User_name
        )
    values 
        (
            :old.External_ID, 
            :old.Customer_xml, 
            :old.Date_From, 
            date_time,
            1,
            user_n
        );
elsif deleting 
then 
    insert into tbl_Customer
        ( 
            External_ID, 
            Customer_xml, 
            Date_From, 
            Date_To,
            Status,
            User_name
        )
    values 
        (
            :old.External_ID, 
            :old.Customer_xml, 
            :old.Date_From, 
            date_time,
            0,
            user_n
        );
    
end if;
    
end;