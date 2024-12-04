BEGIN
    -- Czyszczenie wszystkich tabel w schemacie TESTS
    FOR table_row IN (
        SELECT table_name
        FROM all_tables
        WHERE owner = 'TESTS'
    ) LOOP
        EXECUTE IMMEDIATE 'TRUNCATE TABLE TESTS.' || table_row.table_name;
    END LOOP;

    -- Odświeżenie wszystkich materializowanych widoków w schemacie TESTS
    FOR mv_row IN (
        SELECT mview_name
        FROM all_mviews
        WHERE owner = 'TESTS'
    ) LOOP
        EXECUTE IMMEDIATE 'REFRESH MATERIALIZED VIEW TESTS.' || mv_row.mview_name;
    END LOOP;
END;
/