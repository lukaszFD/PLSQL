accept v_age number prompt 'What is your age ?';

declare

    age number := &v_age;
    
begin 

    if age < 18 then
    
    RAISE_APPLICATION_ERROR(-20001, 'You are too young to drink alcohol !!');
    end if;
    
    DBMS_OUTPUT.PUT_LINE('You can drink :) ');
    
EXCEPTION when OTHERS then 
/* ta funkcja wywoluje blad i wyswietlam*/
DBMS_OUTPUT.PUT_LINE(sqlerrm);

end;