create or replace FUNCTION fun_get_seq_number
(
    seq_name varchar2
) 
    return int is 
    
    seq_number int;
    v_seq_one number;
    v_sequence_exc_one EXCEPTION;
    PRAGMA EXCEPTION_INIT(v_sequence_exc_one, -1);
    v_sequence_exc_currval EXCEPTION;
    PRAGMA EXCEPTION_INIT(v_sequence_exc_currval, -2);

    begin 

        select  
            last_number
        into v_seq_one
        from  
            user_sequences
        where 
            sequence_name = seq_name;

        if v_seq_one = 1 then 
            raise v_sequence_exc_one;
        elsif v_seq_one > 1 then
            raise v_sequence_exc_currval;
        end if;

    EXCEPTION

       WHEN v_sequence_exc_one THEN 
       return v_seq_one;

       when v_sequence_exc_currval THEN

       EXECUTE IMMEDIATE 'select '|| seq_name ||'.currval from dual' 
       into seq_number;

       return seq_number;
end fun_get_seq_number;