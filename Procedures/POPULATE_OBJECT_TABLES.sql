-- Tworzenie tabeli OBJECT_TABLES
CREATE TABLE OBJECT_TABLES (
  OBJECT_TYPE VARCHAR2(30),
  NAME VARCHAR2(30),
  SQL_SCRIPT CLOB
);

-- Tworzenie procedury POPULATE_OBJECT_TABLES
CREATE OR REPLACE PROCEDURE POPULATE_OBJECT_TABLES AS
  v_table_name VARCHAR2(30);
  v_table_ddl CLOB;
  v_start_pos PLS_INTEGER;
  v_end_pos PLS_INTEGER;
BEGIN
  -- Czyszczenie tabeli przed ponownym wypełnieniem
  DELETE FROM OBJECT_TABLES;

  FOR t IN (SELECT table_name FROM USER_TABLES) LOOP
    v_table_name := t.table_name;
    v_table_ddl := DBMS_METADATA.GET_DDL('TABLE', v_table_name);
    
    -- Znajdź początkowy i końcowy indeks dla kolumn tabeli
    v_start_pos := INSTR(v_table_ddl, '(', 1, 1);
    v_end_pos := INSTR(v_table_ddl, ')', -1, 1);
    
    -- Wyciągnij tylko fragment z kolumnami
    v_table_ddl := SUBSTR(v_table_ddl, v_start_pos, v_end_pos - v_start_pos + 1);
    
    -- Dodaj średnik na końcu
    v_table_ddl := v_table_ddl || ';';
    
    -- Dodaj rekord do tabeli OBJECT_TABLES
    INSERT INTO OBJECT_TABLES (OBJECT_TYPE, NAME, SQL_SCRIPT)
    VALUES ('table', v_table_name, v_table_ddl);
  END LOOP;
  
  COMMIT; -- Potwierdzenie zmian w bazie danych
END POPULATE_OBJECT_TABLES;
/
