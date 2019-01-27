DECLARE
  var_dividend NUMBER := 24;
  var_divisor NUMBER := 0;
  var_result NUMBER;
  ex_DivZero EXCEPTION;
BEGIN
  IF var_divisor = 0 THEN
    RAISE ex_DivZero;
  END IF;
  var_result := var_dividend/var_divisor;
  DBMS_OUTPUT.PUT_LINE('Result = ' ||var_result);
  EXCEPTION WHEN ex_DivZero THEN
      DBMS_OUTPUT.PUT_LINE('Error Error - Your Divisor is Zero');
END;