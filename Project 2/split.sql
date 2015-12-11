CREATE OR REPLACE PROCEDURE split
(
	IN tablename VARCHAR(20)
)
BEGIN
DECLARE rows INTEGER;
DECLARE sql VARCHAR(1000);
DECLARE cursor CURSOR WITH RETURN FOR sql_stmt;
SET sql = 'SELECT count(*) FROM '||tablename;
PREPARE sql_stmt FROM sql;
OPEN cursor;
FETCH cursor INTO rows;
CLOSE cursor;
EXECUTE IMMEDIATE 'CREATE TABLE traindataset LIKE '||tablename;
SET sql = 'INSERT INTO traindataset SELECT * FROM '||tablename||' ORDER BY RAND() LIMIT '||int(rows*0.8);
EXECUTE IMMEDIATE sql;
EXECUTE IMMEDIATE 'CREATE TABLE testdataset LIKE traindataset';
SET sql = 'INSERT INTO testdataset SELECT * FROM '||tablename||' EXCEPT SELECT * FROM traindataset';
EXECUTE IMMEDIATE sql;
END
@