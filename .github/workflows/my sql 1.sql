DESC ELECTION;

select*from election;

SELECT
    ST_NAME,
    "YEAR",
    PC_NO,
    PC_NAME,
    PC_TYPE,
    CAND_NAME,
    CAND_SEX,
    PARTYNAME,
    PARTYABBRE,
    TOTVOTPOLL,
    ELECTORS
FROM
    ELECTION
WHERE
    ST_NAME = 'VARCHAR2(50)';

select*from election where electors = 1001172;
/* preformance tuning questions */
/* sql query to find the total count of female candidates participating in each year */
SELECT YEAR,COUNT(TOTVOTPOLL) AS TOTAL_FEMALE FROM ELECTION WHERE CAND_SEX='F' GROUP BY YEAR ;

/* WRITE A SQL QUERY TO FIND THE TOTAL CANDIDATES WHO PARTICIPATED IN THE ELECTION AT EACH STATE IN EACH YEAR*/
SELECT YEAR,ST_NAME,COUNT(CAND_NAME) AS TOTAL_CAND FROM ELECTION GROUP BY YEAR,ST_NAME ; 

/* WRITE A SQL QUERY TO FIND TOTAL VOTES BJP GOT IN EACH STATE IN THE YEAR 1987 */
SELECT ST_NAME,
  TOTVOTPOLL AS TOTAL_VOTES                       /* THE OUTPUT SHOWS NO ROWS SELECTED OR NO DATA IS FETCHED BECAUSE
   FROM ELECTION                                          ELECTION WAS NOT CONDUCTED IN THE YEAR 1987*/
    WHERE PARTYNAME='BJP' AND YEAR=1987; 

    /*WRITE A SQL QUERY TO FIND TOTAL CANDIDATES WHO PARTICIPATED IN THE ELECTION IN EACH STATE IN THE YEAR 2004 */
   
     SELECT ST_NAME ,COUNT(CAND_NAME)  AS TOTAL_VOTES FROM ELECTION WHERE YEAR= 2004 GROUP BY ST_NAME;  

     /* WRITE A SQL QUERY TO FIND WHAT ARE THE TOP 5 PARTIES THAT GOT THE MOST VOTES IN UTTAR PRADESH IN THE YEAR 2014*/

     SELECT PARTYNAME ,SUM(TOTVOTPOLL) AS TOTAL_VOTES FROM ELECTION WHERE ST_NAME='UTTAR PRADESH' AND YEAR=2014
           ORDER BY TOTAL_VOTES DESC  LIMIT 5;