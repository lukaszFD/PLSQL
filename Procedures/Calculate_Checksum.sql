CREATE OR REPLACE PROCEDURE Calculate_Checksum (
    p_table_name IN VARCHAR2
) AS
    v_sql      VARCHAR2(32767);
    v_checksum NUMBER;
BEGIN
    -- Dynamiczne zapytanie SQL do obliczenia sumy kontrolnej
    v_sql := 'SELECT SUM(DBMS_SQLHASH.get_hash_value(''SHA256'', *)) FROM ' || p_table_name;

    -- Wykonanie dynamicznego SQL-a i zapisanie sumy kontrolnej do zmiennej
    EXECUTE IMMEDIATE v_sql INTO v_checksum;

    -- Aktualizacja tabeli kontrolnej (zakładam, że nazwa tej tabeli to CHECKSUM_TABLE)
    UPDATE CHECKSUM_TABLE
    SET checksum_value = v_checksum,
        calculation_time = SYSDATE
    WHERE table_name = p_table_name;

    -- Zatwierdzenie zmian
    COMMIT;
END;
/