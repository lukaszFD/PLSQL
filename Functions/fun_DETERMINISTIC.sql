CREATE or replace  FUNCTION strip_transaction_rolled_back
( p_sqlerrm IN VARCHAR2
) RETURN VARCHAR2
DETERMINISTIC
IS
BEGIN
  RETURN
    CASE
    WHEN p_sqlerrm LIKE 'ORA-02091%ORA-%'
    THEN
      SUBSTR(p_sqlerrm,INSTR(p_sqlerrm,'ORA-',1,2))
    ELSE
      p_sqlerrm
    END
  ;
END strip_transaction_rolled_back;
/

--set timing on
declare
  t varchar2(100);
begin
  for i in 1..1000000
  loop
    t := strip_transaction_rolled_back
    ( 'ORA-02091: Transaction rolled back ORA-12345: bla bla'
    );
  end loop;
end;