DECLARE
    synonym_count NUMBER;
BEGIN
    FOR table_rec IN (SELECT table_name FROM all_tables) LOOP
        SELECT COUNT(*) INTO synonym_count FROM user_synonyms WHERE synonym_name = table_rec.table_name;
        
        IF synonym_count = 0 THEN
            BEGIN
                EXECUTE IMMEDIATE 'CREATE SYNONYM ' || table_rec.table_name || ' FOR ' || table_rec.table_name;
                DBMS_OUTPUT.PUT_LINE('Utworzono synonim dla tabeli ' || table_rec.table_name);
            EXCEPTION
                WHEN OTHERS THEN
                    DBMS_OUTPUT.PUT_LINE('Błąd podczas tworzenia synonimu dla tabeli ' || table_rec.table_name);
            END;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Synonim dla tabeli ' || table_rec.table_name || ' już istnieje.');
        END IF;
    END LOOP;
END;