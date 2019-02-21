    insert into tbl_clob_sql_script
    (
        user_name,
        script_file
    )
    values 
    ( 
        SYS_CONTEXT ('USERENV', 'SESSION_USER') ,
        'select 
            CUSTOMER_ADDRESS_ID,
            CUSTOMER_ID,
            REGION_ID,
            STREET,CITY,POSTAL_CODE,
            CREATEDON 
        from 
            TBL_CUSTOMER_ADDRESS 
        where POSTAL_CODE  = <dupa>'
    );
    commit;