-- import_danych.sql
SPOOL import.log
!sqlldr userid=nazwa_użytkownika/hasło@baza control=dane.ctl log=dane.log
SELECT * FROM osoby;
SPOOL OFF;
EXIT;