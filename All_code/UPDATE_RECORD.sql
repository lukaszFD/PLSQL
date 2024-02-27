DECLARE
   v_new_text VARCHAR2(100);
BEGIN
   -- Ustaw nowy tekst
   v_new_text := 'Load into ';

   -- Aktualizuj tekst w kolumnie dla każdego wiersza
   FOR rec IN (SELECT id, your_column_name, your_condition_column
               FROM your_table_name
               WHERE your_condition_column IS NULL OR your_condition_column <> 'warunek_do_wylaczenia') 
   LOOP
      -- Znajdź pozycję 'Load file into ' w tekście
      DECLARE
         v_position NUMBER;
         v_table_name VARCHAR2(50);
      BEGIN
         v_position := INSTR(rec.your_column_name, 'Load file into ');

         -- Jeśli znaleziono, pobierz nazwę tabeli i zastąp tekst nowym tekstem
         IF v_position > 0 THEN
            v_table_name := SUBSTR(rec.your_column_name, v_position + LENGTH('Load file into '));

            -- Dodaj klauzulę WHERE do wykluczenia pewnych wierszy
            UPDATE your_table_name
            SET your_column_name = v_new_text || v_table_name
            WHERE id = rec.id;
         END IF;
      END;
   END LOOP;
END;
/
