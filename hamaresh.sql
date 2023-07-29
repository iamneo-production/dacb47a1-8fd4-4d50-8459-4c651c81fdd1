desc election;
--WRITE A SQL QUERY TO FIND THE TOTAL COUNT OF FEMALE CANDIDATES   PARTICIPATING EACH YEAR 
SELECT 
    YEAR,
    COUNT(*) AS FEMALE_CANDIDATES
FROM 
    ELECTION
WHERE
    CAND_SEX = 'F'
GROUP BY 
    YEAR
ORDER BY 
    YEAR ASC;
--FIND THE TOTAL CANDIDATES WHO PARTICIPATED IN THE ELECTION AT EACH STATE IN EACH YEAR
SELECT 
    ST_NAME,
    YEAR,
    COUNT(*) AS TOTAL_CANDIDATES
FROM 
    ELECTION
GROUP BY
    ST_NAME,
    YEAR
ORDER BY
    ST_NAME ASC,
    YEAR ASC;
--WRITE SQL QUERY TO FIND THE TOTAL VOTES BJP GOT IN EACH STATE IN THE YEAR 1987 
SELECT
    ST_NAME,
    SUM(TOTVOTPOLL) AS BJP_VOTES_OBTAINED,
    SUM(ELECTORS) AS TOTAL_VOTES
FROM
    ELECTION
GROUP BY 
    ST_NAME,
    YEAR,
    PARTYABBRE
HAVING
    PARTYABBRE = 'BJP' AND YEAR = 1987  
ORDER BY
    ST_NAME ASC;  
--.WRITE SQL QUERY TO FIND THE TOTAL CANDIDATES PARTITCIPATED IN ELECTION IN EACH STATE IN THE YEAR 2004 
SELECT 
    ST_NAME,
    COUNT(*) AS TOTAL_CANDIDATES
FROM 
    ELECTION
GROUP BY 
    ST_NAME,
    YEAR
HAVING
    YEAR = 2004
ORDER BY 
 ST_NAME ASC;
--WRITE SQL QUERY TO FETCH THE TOP 5 PARTIES THAT GOT THE MOST VOTES IN UTTAR PRADESH IN THE YEAR 2014 
  SELECT 
    PARTYNAME
FROM (
    SELECT 
        PARTYNAME, SUM(TOTVOTPOLL)AS VOTES
    FROM 
        ELECTION 
    WHERE 
        ST_NAME = 'Uttar Pradesh' AND YEAR = 2014  
    GROUP BY 
        PARTYNAME
)
ORDER BY VOTES DESC
FETCH FIRST 5 ROWS ONLY;
--index created on totvotpoll column in election table
create index ind_ele on election(totvotpoll);
--Basic sql queries
select count(electors) from election;
select max(totvotpoll) from election;
select min(totvotpoll) from election;
select year from election;
--sql query to fetch the count the votes for each party
select count(totvotpoll) from election where partyabbre='INC';
select count(totvotpoll) from election where partyabbre='BLD';
select count(totvotpoll) from election where partyabbre='IND';
select count(totvotpoll) from election where partyabbre='CPI';
select count(totvotpoll) from election where partyabbre='CPM';
--sql query to fetch the maximum voting of each party
select max(totvotpoll) from election where partyabbre='INC';
select max(totvotpoll) from election where partyabbre='IND';
select max(totvotpoll) from election where partyabbre='BLD';
select max(totvotpoll) from election where partyabbre='CPI';
select max(totvotpoll) from election where partyabbre='CPM';
--sql query to fetch the avg voting of each party
select avg(totvotpoll) from election where partyabbre='INC';
select avg(totvotpoll) from election where partyabbre='IND';
select avg(totvotpoll) from election where partyabbre='BLD';
select avg(totvotpoll) from election where partyabbre='CPI';
--sql query to fetch the count of male and female candidate for participating on elections
select cand_sex,count(cand_name) from election group by cand_sex;
select st_name from election;
select electors from election;
select max(electors) from election;
select min(electors) from election;
select avg(electors) from election;

--fetch the record from view table
select electors from view_ele;
select max(electors) from view_ele;
select partyname from view_ele;





