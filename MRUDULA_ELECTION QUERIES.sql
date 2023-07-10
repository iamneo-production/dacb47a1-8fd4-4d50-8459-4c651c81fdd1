SELECT * FROM ELECTION;
------write a SQL query to find a total count of female candidates participating in each year
SELECT YEAR, COUNT(*) AS FemaleCandidateCount
FROM ELECTION
WHERE CAND_SEX = 'F'
GROUP BY YEAR;