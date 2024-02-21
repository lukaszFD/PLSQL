
CREATE TABLE DB_OBJECT (
  OBJECT_TYPE VARCHAR2(30),
  NAME VARCHAR2(30),
  SQL_SCRIPT CLOB
);

CREATE OR REPLACE PROCEDURE POPULATE_OBJECT_TABLES AS
  v_table_name VARCHAR2(30);
  v_table_ddl CLOB;
  v_start_pos PLS_INTEGER;
  v_end_pos PLS_INTEGER;
BEGIN
  DELETE FROM DB_OBJECT;

  FOR t IN (SELECT table_name FROM USER_TABLES) LOOP
    v_table_name := t.table_name;
    v_table_ddl := DBMS_METADATA.GET_DDL('TABLE', v_table_name);
    
    v_start_pos := INSTR(v_table_ddl, 'CREATE ', 1, 1);
    v_end_pos := INSTR(v_table_ddl, ' SEGMENT', v_start_pos);
    
    v_table_ddl := SUBSTR(v_table_ddl, v_start_pos, v_end_pos - v_start_pos + 1);
    
    v_table_ddl := v_table_ddl || ';';
    
    INSERT INTO DB_OBJECT (OBJECT_TYPE, NAME, SQL_SCRIPT)
    VALUES ('table', v_table_name, v_table_ddl);
  END LOOP;
  
  COMMIT; 
END POPULATE_OBJECT_TABLES;
/