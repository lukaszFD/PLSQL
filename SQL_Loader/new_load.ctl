LOAD DATA
INFILE 'dane.csv'
INTO TABLE osoby
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
    id,
    name,
    age
)