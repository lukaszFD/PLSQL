BEGIN
    -- Usuwanie tabel
    FOR tab IN (SELECT table_name FROM user_tables) LOOP
        EXECUTE IMMEDIATE 'DROP TABLE ' || tab.table_name || ' CASCADE CONSTRAINTS';
    END LOOP;

    -- Usuwanie widoków
    FOR view_rec IN (SELECT view_name FROM user_views) LOOP
        EXECUTE IMMEDIATE 'DROP VIEW ' || view_rec.view_name;
    END LOOP;

    -- Usuwanie zmaterializowanych widoków
    FOR mv_rec IN (SELECT mview_name FROM user_mviews) LOOP
        EXECUTE IMMEDIATE 'DROP MATERIALIZED VIEW ' || mv_rec.mview_name;
    END LOOP;

    -- Usuwanie pakietów
    FOR pkg_rec IN (SELECT object_name FROM user_objects WHERE object_type = 'PACKAGE') LOOP
        EXECUTE IMMEDIATE 'DROP PACKAGE ' || pkg_rec.object_name;
    END LOOP;
END;