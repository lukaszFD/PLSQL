DECLARE
    v_mv_name         VARCHAR2(128) := 'YOUR_MATERIALIZED_VIEW_NAME';
    v_start_time      TIMESTAMP;
    v_end_time        TIMESTAMP;
    v_error_message   VARCHAR2(4000);
    v_refresh_duration INTERVAL DAY TO SECOND;
BEGIN
    -- Zapisz czas rozpoczęcia odświeżania
    v_start_time := SYSTIMESTAMP;

    -- Spróbuj odświeżyć zmaterializowany widok
    BEGIN
        DBMS_MVIEW.REFRESH(v_mv_name, 'C');
        v_error_message := NULL;  -- Jeśli brak błędu, wyczyść wiadomość błędu
    EXCEPTION
        WHEN OTHERS THEN
            -- Przechwyć błąd i zapisz wiadomość błędu
            v_error_message := SQLERRM;
    END;

    -- Zapisz czas zakończenia odświeżania
    v_end_time := SYSTIMESTAMP;

    -- Oblicz czas trwania odświeżania
    v_refresh_duration := v_end_time - v_start_time;

    -- Wstaw wynik do tabeli logów
    INSERT INTO MV_REFRESH_LOG (
        MV_NAME, 
        REFRESH_STATUS, 
        REFRESH_START_TIME, 
        REFRESH_END_TIME, 
        ERROR_MESSAGE,
        REFRESH_DURATION
    )
    VALUES (
        v_mv_name,
        CASE WHEN v_error_message IS NULL THEN 'SUCCESS' ELSE 'FAILURE' END,
        v_start_time,
        v_end_time,
        v_error_message,
        v_refresh_duration
    );

    COMMIT;
END;