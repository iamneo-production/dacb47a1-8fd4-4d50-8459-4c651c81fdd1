--describes the table--
desc election;

SELECT DISTINCT(ST_NAME)
FROM ELECTION;

SELECT DISTINCT(PARTYABBRE)
FROM ELECTION;

SELECT DISTINCT(PARTYNAME)
FROM ELECTION;

SELECT DISTINCT(PC_TYPE)
FROM ELECTION;

SELECT DISTINCT(PC_NAME)
FROM ELECTION;
-----------------------------------------------------------------------------------------
--Performance tuning set----
-------------------------------------------------------------------------------------------

-- Total female candidates participating each year
SELECT YEAR, COUNT( CAND_NAME)
FROM ELECTION
WHERE CAND_SEX = 'F'
GROUP BY YEAR;

--Total candidates who participated in the election at each state in each year
SELECT YEAR, ST_NAME, COUNT( CAND_NAME)
FROM ELECTION
GROUP BY YEAR, ST_NAME;


--Total votes BJP got in each state in the year 1987
SELECT ST_NAME, SUM(TOTVOTPOLL) AS TOTAL_VOTES
FROM ELECTION
WHERE PARTYABBRE = 'BJP' AND YEAR = 1987
GROUP BY ST_NAME;


-- Total candidates who participated in the election in each state in the year 2004
SELECT ST_NAME, COUNT(CAND_NAME)
FROM ELECTION
WHERE YEAR = 2004
GROUP BY ST_NAME;

-- Top 5 parties that got the most votes in Uttar Pradesh in the year 2014
SELECT PARTYNAME, SUM(TOTVOTPOLL) AS TOTAL_VOTES
FROM ELECTION
WHERE ST_NAME = 'Uttar Pradesh' AND YEAR = 2014
GROUP BY PARTYNAME
ORDER BY TOTAL_VOTES DESC
FETCH FIRST 5 ROWS ONLY; 

---------------------------------------------------------------------------------------------
--example queries on election table---
----------------------------------------------------------------------------------------------

--Total candidates who participated in West Bengal state in the year 2014
SELECT COUNT( CAND_NAME)
FROM ELECTION
WHERE ST_NAME = 'West Bengal' AND YEAR = 2014;

--Total candidates who participated in Arunachal Pradesh state in the year 2004
SELECT COUNT( CAND_NAME)
FROM ELECTION
WHERE ST_NAME = 'Arunachal Pradesh' AND YEAR = 2004;

--Total votes BJP Got in state Andhra Pradesh in the year 1987
SELECT SUM(TOTVOTPOLL) AS TOTAL_VOTES
FROM ELECTION
WHERE ST_NAME = 'Andhra Pradesh' AND PARTYABBRE = 'BJP' 
AND YEAR = 1987;

--Total votes BJP Got in the year 1989
SELECT SUM(TOTVOTPOLL) AS TOTAL_VOTES
FROM ELECTION
WHERE PARTYABBRE = 'BJP'
 AND YEAR = 1989;

 -- Number of times BJP has gotten an Above 50% vote
SELECT COUNT(ST_NAME)
FROM (
  SELECT ST_NAME, YEAR, SUM(TOTVOTPOLL)/(SELECT SUM(TOTVOTPOLL) FROM ELECTION WHERE YEAR = ELECTION.YEAR AND ST_NAME = ELECTION.ST_NAME) * 100 AS BJP_VOTE_PERCENT
  FROM ELECTION
  WHERE PARTYABBRE = 'BJP'
  GROUP BY ST_NAME, YEAR
)  SUBQUERY
WHERE BJP_VOTE_PERCENT > 50;

-- Number of times BJP has gotten an below 50% vote
SELECT COUNT(ST_NAME)
FROM (
  SELECT ST_NAME, YEAR, SUM(TOTVOTPOLL)/(SELECT SUM(TOTVOTPOLL) FROM ELECTION WHERE YEAR = ELECTION.YEAR AND ST_NAME = ELECTION.ST_NAME) * 100 AS BJP_VOTE_PERCENT
  FROM ELECTION
  WHERE PARTYABBRE = 'BJP'
  GROUP BY ST_NAME, YEAR
)  SUBQUERY
WHERE BJP_VOTE_PERCENT < 50;

-- State list where the BJP gets below 75% vote
SELECT ST_NAME, YEAR
FROM (
  SELECT ST_NAME, YEAR, SUM(TOTVOTPOLL)/(SELECT SUM(TOTVOTPOLL) FROM ELECTION WHERE YEAR = ELECTION.YEAR AND ST_NAME = ELECTION.ST_NAME) * 100 AS BJP_VOTE_PERCENT
  FROM ELECTION
  WHERE PARTYABBRE = 'BJP'
  GROUP BY ST_NAME, YEAR
)  SUBQUERY
whERE BJP_VOTE_PERCENT < 75;

-- BJP candidate list participated at state Andaman & Nicobar Islands in the year 1984
SELECT CAND_NAME
FROM election
WHERE ST_NAME = 'Andaman & Nicobar Islands' AND PARTYABBRE = 'BJP' AND YEAR = 1984;

-- BJP candidate list participated at state Andhra Pradesh in the year 1984
SELECT CAND_NAME
FROM election
WHERE ST_NAME = 'Andhra Pradesh' AND PARTYABBRE = 'BJP' AND YEAR = 1984;

--  How many Male Candidates participated in elections in each state
SELECT ST_NAME, COUNT(CAND_NAME)
FROM election
WHERE CAND_SEX = 'M'
GROUP BY ST_NAME;

--  Display the Party name in descending order
SELECT DISTINCT PARTYNAME
FROM election
ORDER BY PARTYNAME DESC;

--  How many candidates participated in the year West Bengal
SELECT COUNT( CAND_NAME)
FROM election
WHERE ST_NAME = 'West Bengal';

--  How many candidates participated in the year  1998
SELECT COUNT( CAND_NAME)
FROM election
WHERE YEAR = 1998;

--  Display the Tamilnadu Candidate list each year
SELECT YEAR, CAND_NAME
FROM election
WHERE ST_NAME = 'Tamilnadu'
ORDER BY YEAR asc;

--  Display the Bihar Candidate list each year
SELECT YEAR, CAND_NAME
FROM election
WHERE ST_NAME = 'Bihar'
ORDER BY YEAR asc;

--  Total votes got BJP in 1996
SELECT SUM(TOTVOTPOLL) AS "TOTAL_VOTES"
FROM election
WHERE PARTYABBRE = 'BJP' AND 
YEAR = 1996;

--  BJP Candidates list in descending order
SELECT CAND_NAME
FROM election
WHERE PARTYABBRE = 'BJP'
ORDER BY CAND_NAME DESC;

--  Assam Candidate list each year
SELECT YEAR, CAND_NAME
FROM election
WHERE ST_NAME = 'Assam'
ORDER BY YEAR asc;

--  Total male candidates who participated in the election
SELECT COUNT(CAND_NAME)
FROM election
WHERE "CAND_SEX" = 'M';

--  Total female candidates who participated in the election
SELECT COUNT(CAND_NAME)
FROM election
WHERE "CAND_SEX" = 'F';