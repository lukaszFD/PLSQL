CREATE OR REPLACE PROCEDURE check_for_nulls(p_table_name IN VARCHAR2) IS
    v_sql        VARCHAR2(32767);
    v_column     VARCHAR2(32767);
    v_count      NUMBER;
    v_table_name VARCHAR2(32767);

    CURSOR c_columns IS
        SELECT column_name
        FROM all_tab_columns
        WHERE table_name = UPPER(p_table_name)
          AND owner = USER; -- zakładamy, że sprawdzamy tabele w schemacie użytkownika

BEGIN
    -- Sprawdzenie, czy tabela istnieje
    BEGIN
        SELECT table_name
        INTO v_table_name
        FROM all_tables
        WHERE table_name = UPPER(p_table_name)
          AND owner = USER;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Tabela ' || p_table_name || ' nie istnieje.');
    END;

    -- Tworzenie i wykonanie dynamicznego zapytania
    FOR r_column IN c_columns LOOP
        v_sql := 'SELECT COUNT(*) FROM ' || p_table_name || ' WHERE ' || r_column.column_name || ' IS NULL';

        EXECUTE IMMEDIATE v_sql INTO v_count;

        IF v_count > 0 THEN
            RAISE_APPLICATION_ERROR(-20002, 'Kolumna ' || r_column.column_name || ' w tabeli ' || p_table_name || ' zawiera NULL.');
        END IF;
    END LOOP;
END;
/