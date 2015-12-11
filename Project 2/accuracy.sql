CREATE OR REPLACE FUNCTION CAL_ACCURACY()
RETURNS DOUBLE
LANGUAGE SQL READS SQL DATA NO EXTERNAL ACTION
DETERMINISTIC
BEGIN
DECLARE TOTAL DOUBLE;
DECLARE CORRECT DOUBLE;
DECLARE ACCURACY DOUBLE;
FOR ROW as rowcursor CURSOR FOR select count(*) as C from vtest where value='ALL'
DO
SET TOTAL = ROW.C;
END FOR;
FOR ROW as rowcursor CURSOR FOR select count(*) as C from test_predicted,vtest where test_predicted.id= vtest.id and test_predicted.decision=vtest.decision and vtest.value='ALL'
DO
SET CORRECT=ROW.C;
END FOR;
SET ACCURACY=CORRECT/TOTAL;
RETURN ACCURACY;
END
@
select CAL_ACCURACY() as ACCURACY from sysibm.sysdummy1
@
