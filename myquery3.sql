-- BJP candidate list participated at state Andaman & Nicobar Islands in the year 1984
SELECT CAND_NAME
FROM election
WHERE ST_NAME = 'Andaman & Nicobar Islands' AND PARTYABBRE = 'BJP' AND YEAR = 1984;

-- BJP candidate list participated at state Andhra Pradesh in the year 1984
SELECT CAND_NAME
FROM election
WHERE ST_NAME = 'Andhra Pradesh' AND PARTYABBRE = 'BJP' AND YEAR = 1984;

--  How many Male Candidates participated in elections in each state
SELECT ST_NAME, COUNT(DISTINCT CAND_NAME)
FROM election
WHERE CAND_SEX = 'M'
GROUP BY ST_NAME;

--  Display the Party name in descending order
SELECT DISTINCT PARTYNAME
FROM election
ORDER BY PARTYNAME DESC;

--  How many candidates participated in the year West Bengal 1988
SELECT COUNT(DISTINCT CAND_NAME)
FROM election
WHERE ST_NAME = 'West Bengal' AND YEAR = 1988;

--  How many candidates participated in the year Assam 1998
SELECT COUNT(DISTINCT CAND_NAME)
FROM election
WHERE ST_NAME = 'Assam' AND YEAR = 1998;

--  Display the Tamilnadu Candidate list each year
SELECT YEAR, CAND_NAME
FROM election
WHERE ST_NAME = 'Tamilnadu'
ORDER BY YEAR;

--  Display the Bihar Candidate list each year
SELECT YEAR, CAND_NAME
FROM election
WHERE ST_NAME = 'Bihar'
ORDER BY YEAR;