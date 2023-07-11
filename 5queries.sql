select * from election;

SELECT YEAR, COUNT(DISTINCT CAND_NAME) as count
FROM ELECTION
WHERE CAND_SEX = 'F'
GROUP BY YEAR;

select year,ST_NAME,count(distinct cand_name) as count
from election group by year,ST_NAME;

select ST_NAME,TOTVOTPOLL from election where
 PARTYNAME='BJP' and year=1987 group by ST_NAME,TOTVOTPOLL;

select ST_NAME,count(distinct cand_name) as count 
from election where year=2004 group by ST_NAME;

select PARTYNAME,TOTVOTPOLL from ELECTION
where st_name='uttar pradesh' and year = '2014'
order by TOTVOTPOLL desc fetch first 5 rows only;

