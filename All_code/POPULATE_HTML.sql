SET SERVEROUTPUT ON
DECLARE
  v_template     CLOB;
  v_output_html  CLOB := '';
  v_table_rows   CLOB := '';
  v_pos_start    PLS_INTEGER;
  v_pos_end      PLS_INTEGER;
BEGIN
  -- Pobierz szablon z bazy
  SELECT TEMPLATE_BODY INTO v_template
  FROM TEMPLATES
  WHERE TEMPLATE_NAME = 'LOAD_STATUS_TEMPLATE';

  -- Zbuduj wiersze HTML z danych
  FOR r IN (
    SELECT LOAD_TABLE_NAME, LAST_LOAD_DATE, LAST_CNT, STATUS, REQUIRED
    FROM LOAD_STATUS
  ) LOOP
    v_table_rows := v_table_rows || '<tr>' ||
      '<td>' || r.LOAD_TABLE_NAME || '</td>' ||
      '<td>' || TO_CHAR(r.LAST_LOAD_DATE, 'YYYY-MM-DD HH24:MI:SS') || '</td>' ||
      '<td>' || r.LAST_CNT || '</td>' ||
      '<td>' || r.STATUS || '</td>' ||
      '<td>' || r.REQUIRED || '</td>' ||
    '</tr>';
  END LOOP;

  -- Znajdź miejsce, gdzie znajduje się th:each i je usuń
  v_pos_start := INSTR(v_template, '<tr th:each="entity');
  v_pos_end := INSTR(v_template, '</tr>', v_pos_start) + LENGTH('</tr>');

  -- Usuń oryginalny wiersz z th:each
  v_template := SUBSTR(v_template, 1, v_pos_start - 1) || v_table_rows || SUBSTR(v_template, v_pos_end + 1);

  -- Zwróć wynik
  DBMS_OUTPUT.PUT_LINE(SUBSTR(v_template, 1, 4000)); -- skrócony output dla testu
  -- Możesz tu też zapisać do pliku UTL_FILE, przesłać dalej itp.
END;
/