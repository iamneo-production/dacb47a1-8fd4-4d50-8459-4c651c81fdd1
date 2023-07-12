-- fetch data from table
select * from election;

-------------------------------oracle workspace queries-----------------------------------------


1-- total female candidate participating each year
SELECT YEAR, COUNT(DISTINCT CAND_NAME) as count
FROM ELECTION
WHERE CAND_SEX = 'F'
GROUP BY YEAR;

2--total candidates who participted in election at each state in each year
select year,ST_NAME,count(distinct cand_name) as count
from election group by year,ST_NAME;

3--total votes bjp got in each state in year 1987
select ST_NAME,sum(TOTVOTPOLL) 
as totalvotes from election where
 PARTYABBRE='BJP' and year=1987 group by
ST_NAME,TOTVOTPOLL;

4--total candidates who participated in election in each state in year 2004
select ST_NAME,count(distinct cand_name) as count 
from election where year=2004 group by ST_NAME;

5--top5 parties got the most votes in uttarpradesh in year 2014
SELECT 
    PARTYNAME FROM (SELECT PARTYNAME, SUM(TOTVOTPOLL)AS totalvotes
    FROM 
    ELECTION WHERE ST_NAME = 'uttar Pradesh' AND YEAR = 1977
    GROUP BY 
        PARTYNAME
)
ORDER BY totalvotes DESC
FETCH FIRST 5 ROWS ONLY; 


------------------------------Example Queries----------------------------------------------

--------------------performance tuning set1 queries-----------------------------------------------------

1--totalvotes bjp party got in each state in year 1989
select sum(TOTVOTPOLL) as totalvotes,ST_NAME as state
from ELECTION where year=1989 and PARTYABBRE='BJP'
 group by st_name;

2--total candidates who participated from Arunachal Pradesh in year 2014
select count(distinct CAND_NAME) as candidatecount from election
where ST_NAME='Arunachal Pradesh' and year=2014;

3--total votes bjp got in state of Andhra Pradesh in year 1989

select sum(TOTVOTPOLL) as totalvotes from ELECTION
where ST_NAME='Andhra Pradesh' and year= 1989
and partyabbre='BJP';

4--total vote percentage bjp got in state of Andhra Pradesh in 1989
select (sum(TOTVOTPOLL)/sum(ELECTORS))*100 as votepercentage
from election where ST_NAME = 'Andhra Pradesh' and year=1989
and PARTYABBRE='BJP';

5-- how many times bjp has gotten above 50% votes
SELECT COUNT(*)
FROM (
  SELECT ST_NAME, YEAR, SUM(TOTVOTPOLL)/(SELECT SUM(TOTVOTPOLL) FROM ELECTION WHERE YEAR = ELECTION.YEAR AND ST_NAME = ELECTION.ST_NAME) * 100 AS 
  Above_vote_percent
  FROM ELECTION
  WHERE PARTYABBRE = 'BJP'
  GROUP BY ST_NAME, YEAR
)  SUBQUERY
WHERE Above_vote_percent> 50;


6--state list of bjp where it gets 75% below votes
select ST_NAME as state from election where
PARTYABBRE='BJP' and ((totvotpoll/electors)*100)<75;

-----------------------performance tuning set2 queries--------------------------------------------

1--bjp candidate list in andaman&nicobar islands,party='bjp' and year=1984
select CAND_NAME from election where st_name='Andaman & Nicobar Islands' and 
PARTYABBRE='BJP' and year= 1984;

2--male candidates participated in elections in each state
SELECT st_name, COUNT(DISTINCT CAND_NAME) as count
FROM ELECTION
WHERE CAND_SEX = 'M'
GROUP BY st_name;

3--select partyname in descending order
select  distinct partyname from election order by partyname desc;

4--candidates participated in year 1988 in west bengal
select count(distinct cand_name) from ELECTION where year= 1988
 and st_name='West Bengal';

5-- tamilnadu candidate list each year
select year,cand_name from election where 
st_name='Andhra Pradesh';







