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
     
select * from election where electors = 1001172;
/* preformance tuning questions */
/* sql query to find the total count of female candidates participating in each year */

select year , count(*) as total female candidates
  from election where cand_sex ='F' group by year;