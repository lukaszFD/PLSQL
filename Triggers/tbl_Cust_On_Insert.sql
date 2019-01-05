create or replace TRIGGER tbl_Cust_On_Insert
  BEFORE INSERT ON tbl_Customer
  FOR EACH ROW
BEGIN
  SELECT Customer_id_seq.nextval
  INTO :new.Customer_ID
  FROM dual;
END;