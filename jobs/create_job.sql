BEGIN
    DBMS_SCHEDULER.create_job (
        job_name        => 'daily_job',
        job_type        => 'PLSQL_BLOCK',
        job_action      => 'BEGIN MY_PACKAGE.MY_PROCEDURE; END;',
        start_date      => SYSTIMESTAMP,
        repeat_interval => 'FREQ=DAILY; BYHOUR=7; BYMINUTE=0; BYSECOND=0',
        enabled         => TRUE
    );
END;
/