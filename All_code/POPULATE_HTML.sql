SET SERVEROUTPUT ON
DECLARE
  v_template     CLOB;
  v_output_html  CLOB := '';
  v_table_data   CLOB := '';
BEGIN
  -- Pobierz szablon HTML z tabeli
  SELECT TEMPLATE_BODY INTO v_template
  FROM TEMPLATES
  WHERE TEMPLATE_NAME = 'LOAD_STATUS_TEMPLATE';

  -- Zainicjalizuj nagłówek tabeli
  v_table_data := v_table_data || 
    '<tr>' ||
    '<th>Table Name</th><th>Last Load Date</th><th>Last Table Count</th><th>Status</th><th>Required</th>' ||
    '</tr>';

  -- Zbuduj dynamicznie wiersze tabeli
  FOR r IN (
    SELECT LOAD_TABLE_NAME, LAST_LOAD_DATE, LAST_CNT, STATUS, REQUIRED
    FROM LOAD_STATUS
  ) LOOP
    v_table_data := v_table_data || '<tr>' ||
      '<td>' || r.LOAD_TABLE_NAME || '</td>' ||
      '<td>' || TO_CHAR(r.LAST_LOAD_DATE, 'YYYY-MM-DD HH24:MI:SS') || '</td>' ||
      '<td>' || r.LAST_CNT || '</td>' ||
      '<td>' || r.STATUS || '</td>' ||
      '<td>' || r.REQUIRED || '</td>' ||
      '</tr>';
  END LOOP;

  -- Podstaw tabelę danych w miejsce {{TABLE_DATA}}
  v_output_html := REPLACE(v_template, '{{TABLE_DATA}}', v_table_data);

  -- Wyświetl wynik lub zapisz do pliku / zwróć dalej
  DBMS_OUTPUT.PUT_LINE(SUBSTR(v_output_html, 1, 4000)); -- tylko do testu
END;
/