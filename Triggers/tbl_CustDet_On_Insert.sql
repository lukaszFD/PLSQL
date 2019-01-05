create or replace TRIGGER tbl_CustDet_On_Insert
  BEFORE INSERT ON tbl_Customer_Details
  FOR EACH ROW
BEGIN
  SELECT Customer_Detail_ID_seq.nextval
  INTO :new.Customer_Detail_ID
  FROM dual;
END;