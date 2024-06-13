-- Tworzenie joba
BEGIN
    job_management_pkg.create_job(
        p_job_name    => 'daily_data_refresh',
        p_job_code    => 'BEGIN DBMS_MVIEW.REFRESH(''my_materialized_view''); END;',
        p_created_by  => 'user1',
        p_freq        => 'DAILY',
        p_byhour      => 7,
        p_byminute    => 0,
        p_bysecond    => 0
    );
END;
/

-- Aktualizacja joba
BEGIN
    job_management_pkg.update_job(
        p_job_id        => 1,
        p_new_job_code  => 'BEGIN DBMS_MVIEW.REFRESH(''another_materialized_view''); END;',
        p_modified_by   => 'user2',
        p_new_freq      => 'WEEKLY',
        p_new_byhour    => 8,
        p_new_byminute  => 30,
        p_new_bysecond  => 0
    );
END;
/

-- Logowanie wykonania joba
BEGIN
    job_management_pkg.log_job_execution(
        p_job_id           => 1,
        p_log_date         => SYSTIMESTAMP,
        p_execution_status => 'SUCCESS',
        p_error_message    => NULL,
        p_run_duration     => INTERVAL '00:05:00' HOUR TO SECOND
    );
END;
/

-- Wyłączenie joba
BEGIN
    job_management_pkg.disable_job(
        p_job_id => 1
    );
END;
/

-- Włączenie joba
BEGIN
    job_management_pkg.enable_job(
        p_job_id => 1
    );
END;
/

-- Aktualizacja logów jobów
BEGIN
    job_management_pkg.update_job_logs;
END;
/

-- Uruchomienie jobów
BEGIN
    job_management_pkg.run_jobs;
END;
/
