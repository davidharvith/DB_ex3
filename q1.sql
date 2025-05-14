SELECT DISTINCT
    k.number,
    COUNT(DISTINCT mik.party) AS partyCount
FROM 
    knessets k
LEFT JOIN 
    memberInKnesset mik ON k.number = mik.number
GROUP BY 
    k.number
order by 
    k.number;