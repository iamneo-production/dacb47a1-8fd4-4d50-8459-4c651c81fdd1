--fetch data from the table
select * from election;

desc election;


-- Total female candidates participating each year
SELECT YEAR, COUNT(DISTINCT CAND_NAME)
FROM ELECTION
WHERE CAND_SEX = 'F'
GROUP BY YEAR;

--Total candidates who participated in the election at each state in each year
SELECT YEAR, ST_NAME, COUNT(DISTINCT CAND_NAME)
FROM ELECTION
GROUP BY YEAR, ST_NAME;


--Total votes BJP got in each state in the year 1987
SELECT ST_NAME, SUM(TOTVOTPOLL) AS TOTAL_VOTES
FROM ELECTION
WHERE PARTYABBRE = 'BJP' AND YEAR = 1987
GROUP BY ST_NAME;


-- Total candidates who participated in the election in each state in the year 2004
SELECT ST_NAME, COUNT(DISTINCT CAND_NAME)
FROM ELECTION
WHERE YEAR = 2004
GROUP BY ST_NAME;

-- Top 5 parties that got the most votes in Uttar Pradesh in the year 2014
SELECT PARTYNAME, SUM(TOTVOTPOLL) AS TOTAL_VOTES
FROM ELECTION
WHERE ST_NAME = 'Uttar Pradesh' AND YEAR = 2014
GROUP BY PARTYNAME
ORDER BY TOTAL_VOTES DESC;

