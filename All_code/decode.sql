select l.*,
    decode(l.col5,'2005','nic',l.col5) as test
from 
    test.tbl_sql_loader l ;