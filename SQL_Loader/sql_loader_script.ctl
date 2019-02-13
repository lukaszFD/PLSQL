load data 
infile 'CreditCard.txt' "str '\r\n'"
append
into table TBL_SQL_LOADER
fields terminated by ';'
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( 
			 COL1 CHAR(100),
             COL2 CHAR(100),
             COL3 CHAR(100),
             COL4 CHAR(100),
             COL5 CHAR(100),
             COL6 CHAR(100),
             COL7 CHAR(100)
           )
