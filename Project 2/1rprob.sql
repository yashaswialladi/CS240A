DROP TABLE TEST_PREDICTED;
CREATE TABLE TEST_PREDICTED(ID INTEGER, DECISION VARCHAR(20));
INSERT INTO TEST_PREDICTED
with temp as
(
	select col,value,max(prob) as max from prob group by col,value having value not in ('ALL')
)
,
temp1 as
(
	select prob.col,prob.value,prob.decision from prob inner join temp on prob.col = temp.col and prob.value=temp.value where prob.prob = max
)
,
temp2 as
(
select id,temp1.col,temp1.decision from vtrain inner join temp1 on vtrain.col = temp1.col and vtrain.value = temp1.value where vtrain.decision<>temp1.decision
)
,
temp3 as
(
select count(*) as C,col from temp2 group by col
)
,
temp4 as
(
	select min(C) as min from temp3
)
,
temp5 as
(
select col from temp3,temp4 where C = min
)
,
temp6 as
(
	select temp5.col,temp1.value,temp1.decision from temp1 inner join temp5 on temp1.col=temp5.col
)
select id,temp6.decision from vtest inner join temp6 on vtest.col=temp6.col where vtest.value=temp6.value;

