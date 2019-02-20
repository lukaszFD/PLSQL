create or replace trigger TR_TBL_CLOB_SQL_SCRIPT  
   before insert on "TEST"."TBL_CLOB_SQL_SCRIPT" 
   for each row 
begin  
   if inserting then 
      if :NEW."SCRIPT_ID" is null then 
         select SEQ_TBL_CLOB_SQL_SCRIPT.nextval into :NEW."SCRIPT_ID" from dual; 
      end if; 
   end if; 
end;
