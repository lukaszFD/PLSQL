DECLARE
    synonym_count NUMBER;
    table_name_from_all_tables VARCHAR2(100);
BEGIN
    SELECT COUNT(*) INTO synonym_count FROM user_synonyms WHERE synonym_name = 'NAZWA_TABELI';

    IF synonym_count = 0 THEN
        SELECT table_name INTO table_name_from_all_tables FROM all_tables WHERE table_name = 'NAZWA_TABELI';
        IF table_name_from_all_tables IS NOT NULL THEN
            EXECUTE IMMEDIATE 'CREATE SYNONYM NAZWA_TABELI FOR ' || table_name_from_all_tables;
            DBMS_OUTPUT.PUT_LINE('Utworzono synonim dla tabeli.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Tabela o podanej nazwie nie istnieje.');
        END IF;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Synonim dla tabeli już istnieje.');
    END IF;
END;