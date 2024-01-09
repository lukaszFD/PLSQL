DECLARE
  target_schema VARCHAR2(30) := 'YOUR_SCHEMA';
BEGIN
  FOR tab IN (SELECT table_name FROM all_tables WHERE owner = target_schema AND table_name LIKE 'STG%') LOOP
    FOR col IN (SELECT column_name FROM all_tab_columns WHERE table_name = tab.table_name AND owner = target_schema) LOOP
      -- Check if the column is used in procedures, functions, views, etc.
      FOR dep IN (SELECT * FROM all_dependencies WHERE referenced_name = col.column_name AND referenced_type = 'COLUMN') LOOP
        -- Update the report
        MERGE INTO REPORT_TABLE rt
        USING (SELECT tab.table_name AS table_name, col.column_name AS column_name FROM DUAL) src
        ON (rt.table_name = src.table_name AND rt.column_name = src.column_name)
        WHEN MATCHED THEN
          UPDATE SET rt.used = 'YES'
        WHEN NOT MATCHED THEN
          INSERT (table_name, column_name, used) VALUES (src.table_name, src.column_name, 'YES');
      END LOOP;
      
      -- If there are no dependencies, it means the column is not used
      IF SQL%NOTFOUND THEN
        -- Update the report
        MERGE INTO REPORT_TABLE rt
        USING (SELECT tab.table_name AS table_name, col.column_name AS column_name FROM DUAL) src
        ON (rt.table_name = src.table_name AND rt.column_name = src.column_name)
        WHEN MATCHED THEN
          UPDATE SET rt.used = 'NO'
        WHEN NOT MATCHED THEN
          INSERT (table_name, column_name, used) VALUES (src.table_name, src.column_name, 'NO');
      END IF;
    END LOOP;
  END LOOP;
END;
/
