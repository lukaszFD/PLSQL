DECLARE
  ex_age    EXCEPTION;
  age       NUMBER    := 17;
  PRAGMA EXCEPTION_INIT(ex_age, -20008);
BEGIN
  IF age<18 THEN
    RAISE_APPLICATION_ERROR(-20008, 'You should be 18 or above for the drinks!');
  END IF;
   
  DBMS_OUTPUT.PUT_LINE('Sure! What would you like to have?');
   
  EXCEPTION WHEN ex_age THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM || 'ErrorCode : ' ||SQLCODE);   
END;