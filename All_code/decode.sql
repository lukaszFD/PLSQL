select l.*,
    decode(col5,'2005','nic',col5) as test
from 
    test.tbl_sql_loader l ;