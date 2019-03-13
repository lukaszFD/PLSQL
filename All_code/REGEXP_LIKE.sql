create table sec_systems 
(
Name varchar2(100)
)
/
insert into sec_systems(Name) values ('Windows XP'); commit;
insert into sec_systems(Name) values ('Windows 7'); commit;
insert into sec_systems(Name) values ('Windows'); commit;
insert into sec_systems(Name) values ('Linux - Red Hat'); commit;
insert into sec_systems(Name) values ('Mint Mate - Linux'); commit;
insert into sec_systems(Name) values ('Ubuntu - Linux'); commit;
insert into sec_systems(Name) values ('8100 DPCX - IBM'); commit;
insert into sec_systems(Name) values ('IBM 7090/94 IBSYS'); commit;
insert into sec_systems(Name) values ('7090/94 IBSYS - IBM'); commit;

/

select *
from 
    sec_systems
where 
    not REGEXP_LIKE (name, '(Linux)');