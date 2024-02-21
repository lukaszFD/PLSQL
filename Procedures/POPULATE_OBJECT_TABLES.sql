
CREATE TABLE DB_OBJECT (
  OBJECT_TYPE VARCHAR2(30),
  NAME VARCHAR2(30),
  SQL_SCRIPT CLOB
);

CREATE OR REPLACE PROCEDURE POPULATE_OBJECT_TABLES AS
  v_object_type VARCHAR2(30);
  v_object_name VARCHAR2(30);
  v_object_ddl CLOB;
  v_start_pos PLS_INTEGER;
  v_end_pos PLS_INTEGER;
BEGIN
  DELETE FROM DB_OBJECT;

  -- Obsługa tabel
  FOR t IN (SELECT 'TABLE' AS object_type, table_name AS object_name, DBMS_METADATA.GET_DDL('TABLE', table_name) AS object_ddl FROM USER_TABLES) LOOP
    v_object_type := t.object_type;
    v_object_name := t.object_name;
    v_object_ddl := t.object_ddl;

    -- Znajdź początkowy i końcowy indeks dla kolumn tabeli
    v_start_pos := INSTR(v_object_ddl, 'CREATE ', 1, 1);
    v_end_pos := INSTR(v_object_ddl, ')', -1, 1);

    -- Wyciągnij tylko fragment z kolumnami
    v_object_ddl := SUBSTR(v_object_ddl, v_start_pos, v_end_pos - v_start_pos + 1);

    -- Dodaj średnik na końcu
    v_object_ddl := v_object_ddl || ';';

    -- Wstaw do tabeli DB_OBJECT
    INSERT INTO DB_OBJECT (OBJECT_TYPE, NAME, SQL_SCRIPT)
    VALUES (v_object_type, v_object_name, v_object_ddl);
  END LOOP;

  -- Obsługa widoków
  FOR v IN (SELECT 'VIEW' AS object_type, view_name AS object_name, text AS object_ddl FROM all_views) LOOP
    v_object_type := v.object_type;
    v_object_name := v.object_name;
    v_object_ddl := v.object_ddl;

    -- Dodaj średnik na końcu
    v_object_ddl := v_object_ddl || ';';

    -- Wstaw do tabeli DB_OBJECT
    INSERT INTO DB_OBJECT (OBJECT_TYPE, NAME, SQL_SCRIPT)
    VALUES (v_object_type, v_object_name, v_object_ddl);
  END LOOP;

  -- Obsługa materializowanych widoków
  FOR m IN (SELECT 'MVIEW' AS object_type, mview_name AS object_name, query AS object_ddl FROM all_mviews) LOOP
    v_object_type := m.object_type;
    v_object_name := m.object_name;
    v_object_ddl := m.object_ddl;

    -- Dodaj średnik na końcu
    v_object_ddl := v_object_ddl || ';';

    -- Wstaw do tabeli DB_OBJECT
    INSERT INTO DB_OBJECT (OBJECT_TYPE, NAME, SQL_SCRIPT)
    VALUES (v_object_type, v_object_name, v_object_ddl);
  END LOOP;

  COMMIT; 
END POPULATE_OBJECT_TABLES;
/
