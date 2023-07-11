--  Total votes got BJP in Bihar State in 1996
SELECT SUM(TOTVOTPOLL) AS "TOTAL_VOTES"
FROM election
WHERE ST_NAME = 'Bihar' AND PARTYABBRE = 'BJP' AND 
YEAR = 1996;


--  BJP Candidates list in descending order
SELECT CAND_NAME
FROM election
WHERE PARTYABBRE = 'BJP'
ORDER BY CAND_NAME DESC;


--  Number of times Congress gets above 50% vote in Bihar state
SELECT COUNT(*)
FROM (
  SELECT YEAR, SUM(TOTVOTPOLL)/(SELECT SUM(TOTVOTPOLL) FROM election WHERE ST_NAME = 'Bihar' AND YEAR = election.YEAR) * 100 AS "CONGRESS_VOTE_PERCENT"
  FROM election
  WHERE ST_NAME = 'Bihar' AND PARTYABBRE = 'INC'
  GROUP BY YEAR
) SUBQUERY
WHERE "CONGRESS_VOTE_PERCENT" > 50;


--  Sikkim Candidate list each year
SELECT YEAR, CAND_NAME
FROM election
WHERE ST_NAME = 'Sikkim'
ORDER BY YEAR;


--  Total male candidates who participated in the election
SELECT COUNT(DISTINCT CAND_NAME)
FROM election
WHERE "CAND_SEX" = 'M';