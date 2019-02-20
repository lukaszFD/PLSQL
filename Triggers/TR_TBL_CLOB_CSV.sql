create or replace trigger TR_TBL_CLOB_CSV  
   before insert on "TEST"."TBL_CLOB_CSV" 
   for each row 
begin  
   if inserting then 
      if :NEW."FILE_ID" is null then 
         select SEQ_TBL_CLOB_CSV.nextval into :NEW."FILE_ID" from dual; 
      end if; 
   end if; 
end;
