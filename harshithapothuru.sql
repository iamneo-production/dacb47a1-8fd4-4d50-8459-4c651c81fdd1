--to view the records in election
select * from election;

--to get the details of state names from records
select st_name from election group by st_name;

--tuning preformance QUERIES

--total count of female candidates participating in each year
SELECT YEAR, COUNT(*) AS FEMALE_CANDIDATES
FROM ELECTION WHERE CAND_SEX='F'
GROUP BY YEAR, ORDER YEAR;
 
-- TOTAL CANDIDATES PARTICIPATED AT EACH STATE IN EACH YEAR
SELECT ST_NAME, YEAR, COUNT(*) AS TOTAL_CANDIDATES
 FROM ELECTION 
 GROUP BY ST_NAME, YEAR;

--TOTAL VOTES BJP GOT IN EACH STATE IN YEAR 1987

SELECT ST_NAME,SUM(TOTVOTPOLL) AS TOTAL_VOTES
FROM ELECTION WHERE YEAR=1987 AND PARTYABBRE='BJP' 
GROUP BY ST_NAME, YEAR, PARTYABBRE
order by st_name;         -- 'no records found' will be result
                          -- as no election held in the year 1987

--total candidates participated in election in each state in the year 2004
SELECT ST_NAME, COUNT(*) AS TOTAL_CANDIDATES
FROM ELECTION 
GROUP BY ST_NAME, YEAR
HAVING YEAR= 2004 
ORDER BY ST_NAME;

--FETCH TOP 5 PARTIES THAT GOT THE MOST VOTES IN UTTAR PRADESH IN THE YEAR 2014
SELECT PARTYNAME 
FROM (SELECT PARTYNAME, SUM(TOTVOTPOLL) AS VOTES
      FROM ELECTION WHERE YEAR=2014 AND ST_NAME='Uttar Pradesh'
      GROUP BY PARTYNAME
    )ORDER BY VOTES DESC
    FETCH FIRST 5 ROWS ONLY;
------------------------------------------------------------------
-- EXTRA QUERIES 
SELECT PARTYNAME, VOTES
FROM (SELECT PARTYNAME, SUM(TOTVOTPOLL) AS VOTES
      FROM ELECTION WHERE YEAR=1980 AND ST_NAME='Andhra Pradesh'
      GROUP BY PARTYNAME
    )ORDER BY VOTES DESC
    FETCH FIRST 5 ROWS ONLY;