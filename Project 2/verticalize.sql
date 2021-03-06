DROP TABLE VTRAIN
@
DROP TABLE VTEST
@
CREATE TABLE VTRAIN(id INTEGER, col INTEGER, value VARCHAR(20),decision VARCHAR(20))
@
CREATE TABLE VTEST(id INTEGER, col INTEGER, value VARCHAR(20),decision VARCHAR(20))
@
CREATE OR REPLACE PROCEDURE VERTICALIZE()
BEGIN
DECLARE CTR INTEGER;
DECLARE val varchar(20);
DECLARE sql VARCHAR(2048);
DECLARE cursor CURSOR WITH RETURN FOR sql_stmt;
FOR ROW as rowcursor CURSOR FOR SELECT * FROM TRAINDATASET
DO
SET CTR = 1;
FOR COL AS COLCURSOR CURSOR FOR select name from sysibm.syscolumns where tbname = 'TRAINDATASET' and name not in ('DECISION', 'ID') order by colno 
DO
	SET sql = 'select '||COL.NAME||' as myval from TRAINDATASET where ID ='||ROW.ID; 
	PREPARE sql_stmt from sql;
	OPEN CURSOR;
	FETCH cursor INTO val;
	CLOSE cursor;
	INSERT INTO VTRAIN VALUES (ROW.ID,CTR, val, ROW.DECISION);
	SET CTR=CTR+1;
END FOR;
INSERT INTO VTRAIN(ID, COL,VALUE,DECISION) VALUES (ROW.ID,CTR, 'ALL', ROW.DECISION);
SET CTR=0;
END FOR;
FOR ROW as rowcursor CURSOR FOR SELECT * FROM TESTDATASET
DO
SET CTR = 1;
FOR COL AS COLCURSOR CURSOR FOR select name from sysibm.syscolumns where tbname = 'TESTDATASET' and name not in ('DECISION', 'ID') order by colno 
DO
	SET sql = 'select '||COL.NAME||' as myval from TESTDATASET where ID ='||ROW.ID; 
	PREPARE sql_stmt from sql;
	OPEN CURSOR;
	FETCH cursor INTO val;
	CLOSE cursor;
	INSERT INTO VTEST(ID, COL,VALUE,DECISION) VALUES (ROW.ID,CTR, val, ROW.DECISION);
	SET CTR=CTR+1;
END FOR;
INSERT INTO VTEST(ID, COL,VALUE,DECISION) VALUES (ROW.ID,CTR, 'ALL', ROW.DECISION);
SET CTR=0;
END FOR;
END
@
CALL VERTICALIZE()
@