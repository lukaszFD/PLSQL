create function add_customer 
(
xml_to_add xmltype
)
return int  is 
new_customer_id int;

begin 
    SELECT customer_id_seq.NEXTVAL INTO new_customer_id FROM dual;
    insert into tbl_customer(Customer_ID,Customer_xml,Status)
    values 
    (new_customer_id,xml_to_add, '1');

return new_customer_id;
end add_customer;

