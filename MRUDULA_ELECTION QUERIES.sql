---***** ELECTION TABLE DETAILS********


---FETCHING ELECTION TABLE
SELECT * FROM ELECTION;

-- TOTAL STATE NAMES
SELECT DISTINCT(ST_NAME)
FROM ELECTION;

----- TOTAL DATA AVAILABLE IN THE ELECTION TABLE ACCORDING TO YEAR
SELECT DISTINCT(YEAR)
FROM ELECTION
ORDER BY YEAR;

-- TOTAL STATE COUNT
SELECT COUNT(DISTINCT(ST_NAME))
FROM ELECTION;

-- TOTAL AVAILABLE PARTIES IN THE ELECTION DATA
SELECT DISTINCT(PARTYNAME)
FROM ELECTION
ORDER BY  PARTYNAME;

--TOTAL AVAILABLE PARTY ABBREVIATIONS IN THE ELECTION TABLE
SELECT DISTINCT(PARTYABBRE)
FROM ELECTION
ORDER BY PARTYABBRE;




------********** ORACLE WORKSPACE ONLINE VOTING******************


------write a SQL query to find a total count of female candidates participating in each year
SELECT YEAR, COUNT(*) AS FemaleCandidateCount
FROM ELECTION
WHERE CAND_SEX = 'F'
GROUP BY YEAR
ORDER BY YEAR;


------write a SQL query to find total candidates who participated in the election at each state in each year 
SELECT ST_NAME, YEAR, COUNT(*) AS TotalCandidates
FROM ELECTION
GROUP BY ST_NAME, YEAR
ORDER BY ST_NAME,YEAR;


------write a SQL query to find total votes BJP got in each state in the year 1987?
SELECT 
    ST_NAME,
    SUM(TOTVOTPOLL) AS BJP_VOTES_OBTAINED,
    SUM(ELECTORS) AS TOTAL_VOTES
FROM ELECTION
GROUP BY ST_NAME,YEAR,PARTYABBRE
HAVING PARTYABBRE = 'BJP' AND YEAR = 1987
ORDER BY ST_NAME;
---- Therefore According to the database no elections were held in the year 1987 so as a output it gives no rows fetched.
-----so hence we use the  year 1984
SELECT
    ST_NAME,
    SUM(TOTVOTPOLL) AS BJP_VOTES_OBTAINED,
    SUM(ELECTORS) AS TOTAL_VOTES
FROM ELECTION
GROUP BY ST_NAME,YEAR,PARTYABBRE
HAVING PARTYABBRE = 'BJP' AND YEAR = 1984
ORDER BY ST_NAME;


------ write a SQL query to find total candidates who participated in the election at each state in year 2004?
SELECT ST_NAME, COUNT(*) AS TotalCandidates
FROM ELECTION
WHERE YEAR = 2004
GROUP BY ST_NAME,YEAR
ORDER BY ST_NAME;


-------write a SQL query to what are the top 5 parties that got the most votes in Uttar Pradesh in the year 2014?
SELECT PARTYNAME
FROM (
    SELECT  PARTYNAME, SUM(TOTVOTPOLL)AS VOTES
    FROM ELECTION 
    WHERE ST_NAME = 'Uttar Pradesh' AND YEAR = 2014  
    GROUP BY PARTYNAME
    )
ORDER BY VOTES DESC
FETCH FIRST 5 ROWS ONLY;
------Therefore According to the database only five state election details were provided, which does not include Uttar Prdesh
-----SO WE FETCH THE TOP 5 PARTIES THAT GOT THE MOST VOTES IN ANDHRA PRADESH IN THE YEAR 2014
SELECT  PARTYNAME
FROM (
    SELECT  PARTYNAME, SUM(TOTVOTPOLL)AS VOTES
    FROM ELECTION 
    WHERE ST_NAME = 'Andhra Pradesh' AND YEAR = 2014  
    GROUP BY  PARTYNAME
    )
ORDER BY VOTES DESC
FETCH FIRST 5 ROWS ONLY


-------************PERFORMANCE TUNING SET-1***********-----------------

----Write a SQL query to find the total candidates who participated in West Bengal state in the year 2014?
SELECT ST_NAME,COUNT(*) AS TotalCandidates
FROM ELECTION
WHERE ST_NAME = 'West Bengal' AND YEAR = 2014
GROUP BY ST_NAME,YEAR
ORDER BY ST_NAME;
------ THERE IS NO STATE CALLED WEST BENGAL IN THE GIVEN DATABASE SO THE QUERY WILL GIVE OUTPUT AS NO ROWS FETCHED


-----Write a SQL query to Find the Total votes BJP Got in state 'andhra pradesh' in the year 1987?
SELECT ST_NAME,SUM(TOTVOTPOLL) AS BJP_Votes_OBTAINED,
SUM(ELECTORS) AS TOTAL_VOTES
FROM ELECTION
WHERE ST_NAME = 'ANDHRA PRADESH' AND YEAR = 1987 AND PARTYNAME = 'BJP'
GROUP BY ST_NAME,YEAR
ORDER BY ST_NAME;
-----THERE WAS NO ELECTIONS CONDUCTED IN THE YEAR 1987 SO WE GET OUTPUT AS NO ROWS FETCHED


-----Write a SQL query to Find the Total vote percentage of BJP get in goa state in the year 2003?
SELECT TOTVOTPOLL, SUM(TOTVOTPOLL) AS TOTAL_VOTES
FROM ELECTION
WHERE ST_NAME = 'GOA' AND YEAR = 2003 AND PARTYNAME = 'BJP'
GROUP BY TOTVOTPOLL
ORDER BY ST_NAME;
-----THERE WAS NO ELECTIONS CONDUCTED IN THE YEAR 2003


-----Write a SQL query to find How many times has BJP gotten an Above 50% vote?
SELECT COUNT(*) AS Count_Above_50
FROM ELECTION
WHERE PARTYNAME = 'BJP' AND TOTVOTPOLL > 0.5 * TOTVOTPOLL;


-----Write a SQL query to what is the state list the BJP gets below 75% vote?
SELECT  ST_NAME
FROM(
    SELECT ST_NAME,COUNT(*) AS List_Below_75
    FROM ELECTION
    WHERE PARTYNAME = 'BJP' AND (TOTVOTPOLL / TOTVOTPOLL * 100)<75 
    GROUP BY ST_NAME
    )
ORDER BY ST_NAME;


-------------*********** PERFORMANCE SET-2*******----------------------------

-----Write a SQL query to Display the BJP candidate list participated at state Andaman & Nicobar Islands in the year 1984?
SELECT CAND_NAME AS BJP_CANDIDATE_LIST
FROM ELECTION
WHERE PARTYNAME = 'BJP' AND ST_NAME = 'Andaman & Nicobar Islands' AND YEAR = 1984;


-----Write a SQL query to find How many Male Candidates participated in elections in each state?
SELECT ST_NAME, COUNT(*) AS Male_Candidates
FROM ELECTION
WHERE CAND_SEX = 'M'
GROUP BY ST_NAME
ORDER BY ST_NAME;


------Write a SQL qyery to Display the Party name in descending order?
SELECT DISTINCT PARTYNAME
FROM ELECTION
ORDER BY PARTYNAME DESC;


------Write a SQL query to Find how many Candidates participated in the year West Bengal 1988?
SELECT COUNT(DISTINCT CAND_NAME) AS TotalCandidates
FROM ELECTION
WHERE ST_NAME = 'West Bengal' AND YEAR = 1988;
----COUNT WILL BE 0 AS THERE WAS NO STATE CALLED WESTBENGAL IN THE DATABASE


-------Write a SQL query to Display the Tamilnadu Candidate list each year?
SELECT DISTINCT YEAR, CAND_NAME
FROM ELECTION
WHERE ST_NAME = 'Tamil Nadu'
ORDER BY YEAR;
-----THERE WAS NO STATE CALLED TAMILNADU IN THE DATABASE
------*** SO WE USE ARUNACHAL PRADESH IN THE PLACE OF TAMILNADU***-----
SELECT DISTINCT YEAR, CAND_NAME
FROM ELECTION
WHERE ST_NAME = 'Arunachal Pradesh'
ORDER BY YEAR;


-------*********PERFORMANCE SET-3********-----------------

----- Write a SQL query to calculate total votes Got BJP in Bihar State in 1996?
SELECT ST_NAME,YEAR, SUM(TOTVOTPOLL) AS TOTAL_VOTES
FROM  ELECTION
WHERE ST_NAME = 'Bihar' AND YEAR = 1996
GROUP BY  ST_NAME, YEAR;


-----Write a SQL query to display the BJP Candidates list in descending order?
SELECT CAND_NAME
FROM ELECTION
WHERE PARTYNAME = 'BJP'
ORDER BY CAND_NAME DESC;
---- WRITING A SQL QUERY TO DISPLAY BJP CANDIDATES LIST IN DESCENDING ORDER USING YEAR WISE?
SELECT YEAR,CAND_NAME
FROM ELECTION
WHERE PARTYNAME = 'BJP'
ORDER BY YEAR DESC;


-----Write a SQL query to Find how many times congress gets above 50% vote in Bihar state?
SELECT COUNT(DISTINCT YEAR) AS Num_Times
FROM ELECTION
WHERE ST_NAME = 'Bihar' AND PARTYNAME = 'Indian National Congress' AND (TOTVOTPOLL / TOTVOTPOLL * 100) > 50;
----****OR WE CAN USE PARTYABBRE='INC' IN THE PLACE OF PARTYNAME****------


-----Write a SQL query to Find the Sikkim Candidate list each year?
SELECT DISTINCT YEAR, CAND_NAME
FROM ELECTION
WHERE ST_NAME = 'Sikkim'
ORDER BY YEAR;
---THERE IS NO STATE CALLED SIKKIM IN THE GIVEN DATABASE


------Write a SQL query to Find total male candidates who participated in the election?
SELECT COUNT(DISTINCT CAND_NAME) AS TotalMaleCandidates
FROM ELECTION
WHERE CAND_SEX = 'M'
ORDER BY CAND_NAME;
-------Write a SQL query to Find total male candidates who participated in the election in each year?
SELECT YEAR,COUNT(*)
FROM ELECTION
WHERE CAND_SEX = 'M'
GROUP BY YEAR,CAND_SEX
ORDER BY YEAR;
---------------Write a SQL query to Find total male candidates who participated in the election in each state?
SELECT YEAR, ST_NAME, COUNT(*)
FROM ELECTION
WHERE CAND_SEX = 'M'
GROUP BY YEAR, ST_NAME,CAND_SEX
ORDER BY YEAR, ST_NAME;
