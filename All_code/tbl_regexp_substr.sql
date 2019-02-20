create table t (id int, toaddress clob, domain varchar(4));
/
insert into t (id, toaddress, domain) values (1, 'xxx@gmail.com,yyy@gmail.com,zzz@gmail.com', 'root'); commit;
insert into t (id, toaddress, domain) values (2, 'aaa@gmail.com,bbb@gmail.com,xxx@gmail.com', 'abc');commit;
insert into t (id, toaddress, domain) values (3, 'ccc@gmail.com,xxx@gmail.com', 'root');commit;
insert into t (id, toaddress, domain) values (4, 'yyy@gmail.com,zzz@gmailcom', 'root');commit;
insert into t (id, toaddress, domain) values (5, 'ddd@gmail.com', 'abc');commit;
/
select 
  trim(
    regexp_substr(t.toaddress, '[^,]+', 1, levels.column_value)
  ) as email,
  domain
from  t,
      table(cast(multiset(
        select level from dual 
        connect by level <= length (regexp_replace(t.toaddress, '[^,]+')) + 1
      ) as sys.OdciNumberList)) levels;
