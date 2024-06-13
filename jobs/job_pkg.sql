CREATE OR REPLACE PACKAGE job_management_pkg IS
    PROCEDURE create_job(
        p_job_name IN VARCHAR2,
        p_job_code IN VARCHAR2,
        p_created_by IN VARCHAR2,
        p_freq IN VARCHAR2,
        p_byhour IN NUMBER,
        p_byminute IN NUMBER,
        p_bysecond IN NUMBER
    );

    PROCEDURE update_job(
        p_job_id IN NUMBER,
        p_new_job_code IN VARCHAR2,
        p_modified_by IN VARCHAR2,
        p_new_freq IN VARCHAR2,
        p_new_byhour IN NUMBER,
        p_new_byminute IN NUMBER,
        p_new_bysecond IN NUMBER
    );

    PROCEDURE log_job_execution(
        p_job_id IN NUMBER,
        p_log_date IN TIMESTAMP,
        p_execution_status IN VARCHAR2,
        p_error_message IN VARCHAR2,
        p_run_duration IN INTERVAL DAY TO SECOND
    );
    
    PROCEDURE disable_job(
        p_job_id IN NUMBER
    );

    PROCEDURE enable_job(
        p_job_id IN NUMBER
    );

    PROCEDURE update_job_logs;

    PROCEDURE run_jobs;
END job_management_pkg;
/


CREATE OR REPLACE PACKAGE BODY job_management_pkg IS

    PROCEDURE create_job(
        p_job_name IN VARCHAR2,
        p_job_code IN VARCHAR2,
        p_created_by IN VARCHAR2,
        p_freq IN VARCHAR2,
        p_byhour IN NUMBER,
        p_byminute IN NUMBER,
        p_bysecond IN NUMBER
    ) IS
        v_job_id NUMBER;
        v_repeat_interval VARCHAR2(200);
    BEGIN
        -- Wstawienie joba do tabeli
        INSERT INTO jobs (job_name, job_code, created_by, freq, byhour, byminute, bysecond)
        VALUES (p_job_name, p_job_code, p_created_by, p_freq, p_byhour, p_byminute, p_bysecond)
        RETURNING job_id INTO v_job_id;

        -- Przygotowanie repeat_interval
        v_repeat_interval := 'FREQ=' || p_freq || '; BYHOUR=' || p_byhour || '; BYMINUTE=' || p_byminute || '; BYSECOND=' || p_bysecond;

        -- Utworzenie joba w DBMS_SCHEDULER
        DBMS_SCHEDULER.create_job (
            job_name        => p_job_name,
            job_type        => 'PLSQL_BLOCK',
            job_action      => p_job_code,
            start_date      => SYSTIMESTAMP,
            repeat_interval => v_repeat_interval,
            enabled         => TRUE
        );

        COMMIT;
    END create_job;

    PROCEDURE update_job(
        p_job_id IN NUMBER,
        p_new_job_code IN VARCHAR2,
        p_modified_by IN VARCHAR2,
        p_new_freq IN VARCHAR2,
        p_new_byhour IN NUMBER,
        p_new_byminute IN NUMBER,
        p_new_bysecond IN NUMBER
    ) IS
        v_old_job_code VARCHAR2(4000);
        v_old_freq VARCHAR2(20);
        v_old_byhour NUMBER;
        v_old_byminute NUMBER;
        v_old_bysecond NUMBER;
        v_job_name VARCHAR2(128);
        v_repeat_interval VARCHAR2(200);
    BEGIN
        SELECT job_code, freq, byhour, byminute, bysecond, job_name 
        INTO v_old_job_code, v_old_freq, v_old_byhour, v_old_byminute, v_old_bysecond, v_job_name
        FROM jobs
        WHERE job_id = p_job_id;

        -- Wstawienie wpisu do tabeli audytowej
        INSERT INTO job_audit (job_id, old_job_code, new_job_code, modified_by, old_freq, new_freq, old_byhour, new_byhour, old_byminute, new_byminute, old_bysecond, new_bysecond)
        VALUES (p_job_id, v_old_job_code, p_new_job_code, p_modified_by, v_old_freq, p_new_freq, v_old_byhour, p_new_byhour, v_old_byminute, p_new_byminute, v_old_bysecond, p_new_bysecond);

        -- Aktualizacja kodu joba w tabeli
        UPDATE jobs
        SET job_code = p_new_job_code,
            freq = p_new_freq,
            byhour = p_new_byhour,
            byminute = p_new_byminute,
            bysecond = p_new_bysecond,
            modified_by = p_modified_by,
            modified_date = SYSTIMESTAMP
        WHERE job_id = p_job_id;

        -- Przygotowanie repeat_interval
        v_repeat_interval := 'FREQ=' || p_new_freq || '; BYHOUR=' || p_new_byhour || '; BYMINUTE=' || p_new_byminute || '; BYSECOND=' || p_new_bysecond;

        -- Aktualizacja joba w DBMS_SCHEDULER
        DBMS_SCHEDULER.disable (job_name => v_job_name);
        DBMS_SCHEDULER.set_attribute (name => v_job_name, attribute => 'job_action', value => p_new_job_code);
        DBMS_SCHEDULER.set_attribute (name => v_job_name, attribute => 'repeat_interval', value => v_repeat_interval);
        DBMS_SCHEDULER.enable (job_name => v_job_name);

        COMMIT;
    END update_job;

    PROCEDURE log_job_execution(
        p_job_id IN NUMBER,
        p_log_date IN TIMESTAMP,
        p_execution_status IN VARCHAR2,
        p_error_message IN VARCHAR2,
        p_run_duration IN INTERVAL DAY TO SECOND
    ) IS
    BEGIN
        INSERT INTO job_logs (job_id, log_date, execution_status, error_message, run_duration)
        VALUES (p_job_id, p_log_date, p_execution_status, p_error_message, p_run_duration);
        COMMIT;
    END log_job_execution;

    PROCEDURE disable_job(
        p_job_id IN NUMBER
    ) IS
        v_job_name VARCHAR2(128);
    BEGIN
        SELECT job_name INTO v_job_name
        FROM jobs
        WHERE job_id = p_job_id;

        -- Wyłączenie joba w tabeli
        UPDATE jobs
        SET is_active = 'N'
        WHERE job_id = p_job_id;

        -- Wyłączenie joba w DBMS_SCHEDULER
        DBMS_SCHEDULER.disable (job_name => v_job_name);

        COMMIT;
    END disable_job;

    PROCEDURE enable_job(
        p_job_id IN NUMBER
    ) IS
        v_job_name VARCHAR2(128);
    BEGIN
        SELECT job_name INTO v_job_name
        FROM jobs
        WHERE job_id = p_job_id;

        -- Włączenie joba w tabeli
        UPDATE jobs
        SET is_active = 'Y'
        WHERE job_id = p_job_id;

        -- Włączenie joba w DBMS_SCHEDULER
        DBMS_SCHEDULER.enable (job_name => v_job_name);

        COMMIT;
    END enable_job;

    PROCEDURE update_job_logs IS
        CURSOR job_run_cursor IS
            SELECT job_name, log_date, status, additional_info, run_duration
            FROM DBA_SCHEDULER_JOB_RUN_DETAILS
            WHERE log_date >= SYSDATE - 1;  -- or another condition to fetch recent logs
        v_job_id jobs.job_id%TYPE;
    BEGIN
        FOR job_run_rec IN job_run_cursor LOOP
            BEGIN
                SELECT job_id INTO v_job_id
                FROM jobs
                WHERE job_name = job_run_rec.job_name;

                log_job_execution(v_job_id, job_run_rec.log_date, job_run_rec.status, job_run_rec.additional_info, job_run_rec.run_duration);
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    -- Handle case where job is not found in our table
                    NULL;
            END;
        END LOOP;
    END update_job_logs;

    PROCEDURE run_jobs IS
        CURSOR job_cursor IS
            SELECT job_id, job_code FROM jobs WHERE is_active = 'Y';
        v_job_id jobs.job_id%TYPE;
        v_job_code jobs.job_code%TYPE;
    BEGIN
        FOR job_rec IN job_cursor LOOP
            v_job_id := job_rec.job_id;
            v_job_code := job_rec.job_code;

            BEGIN
                EXECUTE IMMEDIATE v_job_code;
                log_job_execution(v_job_id, SYSTIMESTAMP, 'SUCCESS', NULL, NULL);
            EXCEPTION
                WHEN OTHERS THEN
                    log_job_execution(v_job_id, SYSTIMESTAMP, 'FAILURE', SQLERRM, NULL);
            END;
        END LOOP;

        -- Aktualizacja logów jobów
        update_job_logs;
    END run_jobs;

END job_management_pkg;
/
