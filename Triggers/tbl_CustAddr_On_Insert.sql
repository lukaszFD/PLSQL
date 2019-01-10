create or replace TRIGGER tbl_CustAddr_On_Insert
  BEFORE INSERT ON TBL_CUSTOMER_ADDRESS
  FOR EACH ROW
BEGIN
  SELECT Customer_Address_id_seq.nextval
  INTO :new.Customer_Address_ID
  FROM dual;
END;