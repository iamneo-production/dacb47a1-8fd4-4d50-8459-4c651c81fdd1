-- fetch data from table
select * from election;

-- total female candidate participating each year
SELECT YEAR, COUNT(DISTINCT CAND_NAME) as count
FROM ELECTION
WHERE CAND_SEX = 'F'
GROUP BY YEAR;

--total candidates who participted in election at each state in each year
select year,ST_NAME,count(distinct cand_name) as count
from election group by year,ST_NAME;

--total votes bjp got in each state in year 1987
select ST_NAME,sum(TOTVOTPOLL) as totalvotes from election where
 PARTYNAME='BJP' and year=1987 group by
ST_NAME,TOTVOTPOLL;

--total candidates who participated in election in each state in year 2004
select ST_NAME,count(distinct cand_name) as count 
from election where year=2004 group by ST_NAME;

--top5 parties got the most votes in uttarpradesh in year 2014
SELECT 
    PARTYNAME FROM (SELECT PARTYNAME, SUM(TOTVOTPOLL)AS totalvotes
    FROM 
    ELECTION WHERE ST_NAME = 'uttar Pradesh' AND YEAR = 1977
    GROUP BY 
        PARTYNAME
)
ORDER BY totalvotes DESC
FETCH FIRST 5 ROWS ONLY; 


