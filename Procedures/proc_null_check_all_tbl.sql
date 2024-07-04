CREATE OR REPLACE PROCEDURE check_first_row_for_nulls(p_table_name IN VARCHAR2) IS
    v_sql             VARCHAR2(32767);
    v_null_column_count NUMBER := 0;
    v_total_columns   NUMBER := 0;

BEGIN
    -- Build the dynamic query to count the total number of columns in the table
    SELECT COUNT(*)
    INTO v_total_columns
    FROM all_tab_columns
    WHERE table_name = UPPER(p_table_name)
      AND owner = USER; -- Assuming we are checking tables in the user's schema

    -- Build the dynamic query to check if all columns in the first row are NULL
    v_sql := 'SELECT COUNT(*) FROM ' || p_table_name || ' WHERE ROWNUM = 1 AND (';

    FOR rec IN (
        SELECT column_name 
        FROM all_tab_columns 
        WHERE table_name = UPPER(p_table_name)
          AND owner = USER -- Assuming we are checking tables in the user's schema
    ) LOOP
        v_sql := v_sql || rec.column_name || ' IS NULL AND ';
    END LOOP;

    -- Remove the trailing ' AND ' and close the parenthesis
    v_sql := RTRIM(v_sql, ' AND ') || ')';

    -- Execute the dynamic query to count how many rows match the condition
    EXECUTE IMMEDIATE v_sql INTO v_null_column_count;

    -- If the first row has all columns as NULL, raise an error
    IF v_null_column_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'The first row in table ' || p_table_name || ' contains all NULL values in its columns.');
    END IF;
END;
/