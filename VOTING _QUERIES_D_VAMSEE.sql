-- describing the voting table
desc voting;

-- PERFORMANCE TUNING QUERIES ON VOTING TABLE
-- total count of female candidates participating each year
SELECT 
    YEAR,
    COUNT(*) AS FEMALE_CANDIDATES
FROM 
    VOTING
WHERE
    CAND_SEX = 'F'
GROUP BY 
    YEAR
ORDER BY 
    YEAR;

