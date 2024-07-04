CREATE OR REPLACE PROCEDURE check_first_row_for_nulls(p_table_name IN VARCHAR2) IS
    v_sql            VARCHAR2(32767);
    v_null_row_count NUMBER;
BEGIN
    -- Construct dynamic query to check if all columns in the first row are NULL
    v_sql := 'SELECT COUNT(*) FROM (SELECT * FROM ' || p_table_name || ' WHERE ROWNUM = 1) WHERE 1=1';

    FOR rec IN (
        SELECT column_name 
        FROM all_tab_columns 
        WHERE table_name = UPPER(p_table_name)
          AND owner = USER -- Assuming we are checking tables in the user's schema
    ) LOOP
        v_sql := v_sql || ' AND ' || rec.column_name || ' IS NULL';
    END LOOP;

    EXECUTE IMMEDIATE v_sql INTO v_null_row_count;

    IF v_null_row_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'The first row in table ' || p_table_name || ' contains all NULL values.');
    END IF;
END;
/