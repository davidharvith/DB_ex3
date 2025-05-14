SELECT DISTINCT
    m.name
FROM 
    knessets k
Inner JOIN 
    memberInKnesset mik ON k.number = mik.number
Inner JOIN
    members m ON mik.uid = m.uid
GROUP BY 
    m.name
Having
    COUNT(DISTINCT mik.party) = 1 and
    COUNT(DISTINCT mik.number) >5 
order by 
    m.name;