--------------GENERAL QUERIES ON ELECTION TABLE --------------------------------------

-- describing the ELECTION table
DESC ELECTION;

-- TOTAL YEARS OF DATA AVAILABLE IN THE ELECTION TABLE
SELECT 
    DISTINCT(YEAR)
FROM
    ELECTION
ORDER BY YEAR ASC;

-- TOTAL STATES AND UNION TERRITORIES  IN THE ELECTION TABLE AND STATE NAMES
--STATE COUNT
SELECT
    COUNT(DISTINCT(ST_NAME))
FROM
    ELECTION;

-- STATE NAMES
SELECT
    DISTINCT(ST_NAME)
FROM
    ELECTION;

-- TOTAL PARTIES AVAILABLE IN THE ELECTION DATA
SELECT 
    DISTINCT(PARTYNAME)
FROM
    ELECTION
ORDER BY 
    PARTYNAME ASC;

--TOTAL PARTY ABBREVIATIONS AVAILABLE IN THE ELECTION TABLE
SELECT 
    DISTINCT(PARTYABBRE)
FROM
    ELECTION
ORDER BY 
    PARTYABBRE ASC;

------------------------------------------------------------------------------------------------------------
--------------------PERFORMANCE TUNING QUERIES ON ELECTION TABLE--------------------------------------------
------------------------------------------------------------------------------------------------------------
-- INDEXES 
CREATE INDEX ELECTION_YEAR_STATE_IDX ON ELECTION(YEAR,ST_NAME);


-- total count of female candidates participating each year

SELECT 
    YEAR,
    COUNT(*) AS FEMALE_CANDIDATES
FROM 
    ELECTION
WHERE
    CAND_SEX = 'F' AND YEAR IS NOT NULL
GROUP BY 
    YEAR
ORDER BY 
    YEAR ASC;


-- TOTAL CANDIDATES PARTICIPATED IN ELECTION AT EACH STATE IN EACH YEAR
SELECT 
    ST_NAME,
    YEAR,
    COUNT(*) AS TOTAL_CANDIDATES
FROM 
    ELECTION
WHERE 
    YEAR IS NOT NULL AND ST_NAME IS NOT NULL
GROUP BY
    ST_NAME,
    YEAR
ORDER BY
    ST_NAME ASC,
    YEAR ASC;

--TOTAL VOTES BJP GOT IN EACH STATE IN THE YEAR 1987
SELECT
    ST_NAME,
    SUM(TOTVOTPOLL) AS BJP_VOTES_OBTAINED,
    SUM(ELECTORS) AS TOTAL_VOTES
FROM
    ELECTION
WHERE 
    YEAR IS NOT NULL AND ST_NAME IS NOT NULL
GROUP BY 
    ST_NAME,
    YEAR,
    PARTYABBRE
HAVING
    PARTYABBRE = 'BJP' AND YEAR = 1987  -- no elections were held in the year 1987
ORDER BY
    ST_NAME ASC;                            -- hence the result for this query will be "no rows are fetched"


    
-- TOTAL CANDIDATES PARTITCIPATED IN ELECTION IN EACH STATE IN THE YEAR 2004
SELECT 
    ST_NAME,
    COUNT(*) AS TOTAL_CANDIDATES
FROM 
    ELECTION
WHERE 
    YEAR IS NOT NULL AND ST_NAME IS NOT NULL
GROUP BY 
    ST_NAME,
    YEAR
HAVING
    YEAR = 2004
ORDER BY 
    ST_NAME ASC;

-- FETCH THE TOP 5 PARTIES THAT GOT THE MOST VOTES IN UTTAR PRADESH IN THE YEAR 2014
SELECT 
    PARTYNAME
FROM (
    SELECT 
        PARTYNAME, SUM(TOTVOTPOLL)AS VOTES
    FROM 
        ELECTION 
    WHERE 
        ST_NAME = 'Uttar Pradesh' AND YEAR = 2014  --In the database, only five state election details are provided,which does not include Uttar Prdesh
    GROUP BY 
        PARTYNAME
)
ORDER BY VOTES DESC
FETCH FIRST 5 ROWS ONLY;                -- hence the result for this query will be "no rows are fetched"



--------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------- EXTRA QUERIES ON ELECTION TABLE ----------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------

-- FETCH THE TOP 5 PARTIES THAT GOT THE MOST VOTES IN ANDHRA PRADESH IN THE YEAR 2014
SELECT 
    PARTYNAME
FROM (
    SELECT 
        PARTYNAME, SUM(TOTVOTPOLL)AS VOTES
    FROM 
        ELECTION 
    WHERE 
        ST_NAME = 'Andhra Pradesh' AND YEAR = 2014  
    GROUP BY 
        PARTYNAME
)
ORDER BY VOTES DESC
FETCH FIRST 5 ROWS ONLY;

--TOTAL VOTES BJP GOT IN EACH STATE IN THE YEAR 1984
SELECT
    ST_NAME,
    SUM(TOTVOTPOLL) AS BJP_VOTES_OBTAINED,
    SUM(ELECTORS) AS TOTAL_VOTES
FROM
    ELECTION
WHERE 
    YEAR IS NOT NULL AND ST_NAME IS NOT NULL
GROUP BY 
    ST_NAME,
    YEAR,
    PARTYABBRE
HAVING
    PARTYABBRE = 'BJP' AND YEAR = 1984  
ORDER BY
    ST_NAME ASC;                            

-- SQL query to calculate total votes Got BJP in Bihar State in 1996
SELECT
    ST_NAME,
    YEAR,
    SUM(TOTVOTPOLL) AS TOTAL_VOTES
FROM 
    ELECTION
WHERE 
    YEAR IS NOT NULL AND ST_NAME IS NOT NULL
GROUP BY 
    ST_NAME,
    YEAR
HAVING  
    ST_NAME = 'Bihar' AND YEAR = 1996;

-- SQL query to display the BJP Candidates list in descending order
SELECT 
    YEAR,
    CAND_NAME
FROM
    ELECTION
WHERE 
    PARTYABBRE = 'BJP' AND YEAR IS NOT NULL
ORDER BY
    YEAR DESC;

-- SQL query to find how many times congress gets above 50% vote in Bihar state
SELECT
    COUNT(*) AS CONGRESS_VOTE
FROM 
    ELECTION
WHERE
    (TOTVOTPOLL/ELECTORS)*100 >50 AND
    ST_NAME = 'Bihar' AND PARTYNAME = 'INC'
    AND ST_NAME IS NOT NULL ;

--SQL query to find the Arunachal Pradesh Candidate list each year
SELECT
    CAND_NAME,
    YEAR
FROM
    ELECTION
WHERE
    ST_NAME = 'Arunachal Pradesh' AND YEAR IS NOT NULL
ORDER BY
    YEAR ASC;


-- SQL query to find total male candidates who participated in the election
SELECT
    YEAR,
    COUNT(*)
FROM
    ELECTION
WHERE 
    YEAR IS NOT NULL
GROUP BY
    YEAR,
    CAND_SEX
HAVING
    CAND_SEX = 'M'
ORDER BY
    YEAR ASC;

-- How many Male Candidates participated in elections in each state?
SELECT
    ST_NAME,
    YEAR,
    COUNT(*)
FROM
    ELECTION
WHERE 
    YEAR IS NOT NULL AND ST_NAME IS NOT NULL
GROUP BY
    ST_NAME,
    YEAR,
    CAND_SEX
HAVING
    CAND_SEX = 'M'
ORDER BY
    YEAR ASC, 
    ST_NAME ASC;

-- Display the BJP candidate list participated at state Andaman & Nicobar Islands in the year 1984
SELECT 
    CAND_NAME
FROM 
    ELECTION
WHERE 
    ST_NAME = 'Andaman & Nicobar Islands' AND PARTYABBRE = 'BJP' AND YEAR = 1984;


-- How many times has BJP gotten an Above 50% vote
SELECT
    COUNT(*)
FROM
    (
        SELECT  -- THIS QUERY PROVIDES THE TABLE OF VOTES OBTAINED BY BJP IN EACH STATE IN EVERY ELECTION
            ST_NAME,
            YEAR,
            SUM(TOTVOTPOLL) AS TOTAL_VOTES,
            SUM(ELECTORS) AS TOTAL_ELECTORS
        FROM
            ELECTION
        WHERE 
            YEAR IS NOT NULL AND ST_NAME IS NOT NULL
        GROUP BY
            ST_NAME,
            YEAR,
            PARTYABBRE
        HAVING
            PARTYABBRE = 'BJP'
        ORDER BY
            ST_NAME ASC,
            YEAR ASC
    )
WHERE 
    (TOTAL_VOTES/TOTAL_ELECTORS)*100 >50;

-- SQL QUERY TO FIND VOTE PERCENTAGE OF BJP IN EVERY STATE IN EACH ELECTION
SELECT
    ST_NAME,
    YEAR,
    ROUND((TOTAL_VOTES/TOTAL_ELECTORS)*100,2) AS BJP_VOTE_PERCENTAGE
FROM
    (
        SELECT  -- THIS QUERY PROVIDES THE TABLE OF VOTES OBTAINED BY BJP IN EACH STATE IN EVERY ELECTION
            ST_NAME,
            YEAR,
            SUM(TOTVOTPOLL) AS TOTAL_VOTES,
            SUM(ELECTORS) AS TOTAL_ELECTORS
        FROM
            ELECTION
        WHERE 
            YEAR IS NOT NULL AND ST_NAME IS NOT NULL
        GROUP BY
            ST_NAME,
            YEAR,
            PARTYABBRE
        HAVING
            PARTYABBRE = 'BJP'
        ORDER BY
            ST_NAME ASC,
            YEAR ASC
    );



