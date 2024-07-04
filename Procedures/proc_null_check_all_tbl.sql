CREATE OR REPLACE PROCEDURE check_all_columns_for_nulls(p_table_name IN VARCHAR2) IS
    v_sql            VARCHAR2(32767);
    v_null_row_count NUMBER;
BEGIN
    -- Construct dynamic query to check if all columns in a row are NULL
    v_sql := 'SELECT COUNT(*) FROM ' || p_table_name || ' WHERE 1=1';

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
        RAISE_APPLICATION_ERROR(-20001, 'Table ' || p_table_name || ' contains rows where all columns are NULL.');
    END IF;
END;
/