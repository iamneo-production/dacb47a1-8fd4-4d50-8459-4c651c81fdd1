

--to get the details of state names from records
select DISTINCT st_name from ELECTION;

--TO KNOW THE PARTYNAMES IN THE RECORD
SELECT DISTINCT PARTYNAME FROM ELECTION;

--TO KNOW HOW MANY YEARS ELECTIONS ARE HELD
SELECT DISTINCT YEAR FROM ELECTION;

-----------------------------------------------------------------------------------------------------------------------------
--                                     ***tuning preformance QUERIES***                                   --
-----------------------------------------------------------------------------------------------------------------------------
--total count of female candidates participating in each year
SELECT YEAR, COUNT(*) AS FEMALE_CANDIDATES
FROM ELECTION WHERE CAND_SEX='F'
GROUP BY YEAR ORDER BY YEAR ASC;
 
-- TOTAL CANDIDATES PARTICIPATED AT EACH STATE IN EACH YEAR
SELECT ST_NAME, YEAR, COUNT(*) AS TOTAL_CANDIDATES
 FROM ELECTION 
 GROUP BY ST_NAME, YEAR;

--TOTAL VOTES BJP GOT IN EACH STATE IN YEAR 1987

SELECT ST_NAME,SUM(TOTVOTPOLL) AS TOTAL_VOTES
FROM ELECTION WHERE YEAR=1987 AND PARTYABBRE='BJP' 
GROUP BY ST_NAME, YEAR, PARTYABBRE
order by st_name ASC;         -- 'no records found' will be result
                          -- as no election held in the year 1987

--total candidates participated in election in each state in the year 2004
SELECT ST_NAME, COUNT(*) AS TOTAL_CANDIDATES
FROM ELECTION 
GROUP BY ST_NAME, YEAR
HAVING YEAR= 2004 
ORDER BY ST_NAME ASC;


--FETCH TOP 5 PARTIES THAT GOT THE MOST VOTES IN UTTAR PRADESH IN THE YEAR 2014
SELECT PARTYNAME 
FROM (SELECT PARTYNAME, SUM(TOTVOTPOLL) AS VOTES
      FROM ELECTION WHERE YEAR=2014 AND ST_NAME='Uttar Pradesh'
      GROUP BY PARTYNAME
    )ORDER BY VOTES DESC
    FETCH FIRST 5 ROWS ONLY;    --NO RECORDS HAS UTTAR PRADESH
------------------------------------------------------------------
-- EXTRA QUERIES 
------------------------------------------------------------------

--TO SELECT TOP 5 PARTIES THAT GOT THE MOST VOTES IN ANDHRA PRADESH IN THE YEAR 1980
SELECT PARTYNAME, VOTES
FROM (SELECT PARTYNAME, SUM(TOTVOTPOLL) AS VOTES
      FROM ELECTION WHERE YEAR=1980 AND ST_NAME='Andhra Pradesh'
      GROUP BY PARTYNAME
    )ORDER BY VOTES DESC
    FETCH FIRST 5 ROWS ONLY;
  
--TOTAL CANDIDATES PARTICIPATED IN EACH STATE IN YEAR 2004
SELECT ST_NAME,COUNT(*) AS TOTAL_CANDIDATES
FROM ELECTION 
GROUP BY ST_NAME, YEAR
HAVING YEAR=2004;

--TOTAL FEMALE CANDIDATES PARTICIPATED IN EACH YEAR
SELECT YEAR, COUNT(*)
FROM ELECTION
GROUP BY YEAR, CAND_SEX
HAVING CAND_SEX='F';

--TOTAL CANDIDATES PARTICIPATED IN WEST BENGAL IN YEAR 2014
SELECT COUNT(*) FROM ELECTION
WHERE ST_NAME='WEST BENGAL' AND YEAR=2014; -- NO RECORDS WITH STATE WEST BENGAL

--TOTAL VOTES BJP GOT IN ANDHRA PRADESH IN THE YEAR 1987
SELECT SUM(TOTVOTPOLL) FROM ELECTION 
WHERE PARTYABBRE='BJP' and ST_NAME='ANDHRA PRADESH'and YEAR=1987; 
--there is no result as no election held in the year 1987

-- total vote percentage of bjp IN GOA STATE IN YEAR 2003
SELECT SUM(TOTVOTPOLL)/SUM(ELECTORS)*100 
FROM ELECTION WHERE ST_NAME='GOA'and YEAR=2003 and PARTYABBRE='BJP';
--no state name with goa in the database

--Number of times has BJP gotten an above 50% votes.
SELECT count(*) AS count_above_50
FROM ELECTION
WHERE PARTYABBRE='BJP' AND ((TOTVOTPOLL/electors)*100)<50;
    
--The state list the BJP gets below 75% vote.
SELECT DISTINCT(st_name) AS state_list
FROM ELECTION
WHERE PARTYABBRE='BJP' and  ((totvotpoll/ELECTORS)*100)<75; 

--To Display the BJP candidate list participated at state Andaman & Nicobar Islands in the year 1984
SELECT CAND_NAME AS BJP_CANDIDATE_LIST
FROM ELECTION
WHERE PARTYNAME = 'BJP' AND ST_NAME = 'Andaman & Nicobar Islands' AND YEAR = 1984;

--To find count of Male Candidates participated in elections in each state
SELECT ST_NAME, COUNT(*) AS Male_Candidates
FROM ELECTION
WHERE CAND_SEX = 'M'
GROUP BY ST_NAME
ORDER BY ST_NAME ASC;

--To Display the Party name in descending order
SELECT DISTINCT PARTYNAME
FROM ELECTION
ORDER BY PARTYNAME DESC;

--Count of Candidates participated in the state West Bengal in the year 1988
SELECT COUNT(DISTINCT CAND_NAME) AS Total_Candidates
FROM ELECTION
WHERE ST_NAME = 'West Bengal' AND YEAR = 1988;  --count is 0 as no records with the state west bengal

--To Display the Tamilnadu Candidate list each year
SELECT DISTINCT YEAR, CAND_NAME
FROM ELECTION
WHERE ST_NAME = 'Tamil Nadu'
ORDER BY YEAR ASC;  --No results will found
                --no records with the state Tamil Nadu in the database


--total votes Got BJP in Bihar State in 1996
SELECT SUM(TOTVOTPOLL) AS TOTAL_VOTES
FROM  ELECTION
WHERE ST_NAME = 'Bihar' AND YEAR = 1996;

--To display the BJP Candidates list in descending order
SELECT distinct CAND_NAME
FROM ELECTION
WHERE PARTYNAME = 'BJP'
ORDER BY CAND_NAME DESC;

-----Write a SQL query to Find the Sikkim Candidate list each year?
SELECT DISTINCT YEAR, CAND_NAME
FROM ELECTION
WHERE ST_NAME = 'Sikkim'
ORDER BY YEAR ASC;   --THERE IS NO records with the STATE NAME SIKKIM 


--To Find total male candidates who participated in the election
SELECT COUNT(DISTINCT CAND_NAME) AS TotalMaleCandidates
FROM ELECTION
WHERE CAND_SEX = 'M'
ORDER BY CAND_NAME ASC;

--To Find total male candidates who participated in the election in each state and year
SELECT YEAR, ST_NAME, COUNT(*)
FROM ELECTION
WHERE CAND_SEX = 'M'  
GROUP BY YEAR, ST_NAME,CAND_SEX
ORDER BY YEAR ASC, ST_NAME ASC;

