
--to view the records in election
select * from election;

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
GROUP BY YEAR ORDER BY YEAR;
 
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

/*SELECT ST_NAME, COUNT(*) AS TOTAL_CANDIDATES
FROM ELECTION WHERE YEAR=2004
GROUP BY ST_NAME
ORDER BY ST_NAME;
*/

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
    

--      **SET1**
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
--no state name with gos in the database

--SET 2
--To Display the BJP candidate list participated at state Andaman & Nicobar Islands in the year 1984
SELECT CAND_NAME AS BJP_CANDIDATE_LIST
FROM ELECTION
WHERE PARTYNAME = 'BJP' AND ST_NAME = 'Andaman & Nicobar Islands' AND YEAR = 1984;

--To find count of Male Candidates participated in elections in each state
SELECT ST_NAME, COUNT(*) AS Male_Candidates
FROM ELECTION
WHERE CAND_SEX = 'M'
GROUP BY ST_NAME
ORDER BY ST_NAME;

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
ORDER BY YEAR;  --No results will found
                --no records with the state Tamil Nadu in the database

--set 3


