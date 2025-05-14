SELECT DISTINCT
    k.number,
    AVG( k.startYear- m.birthYear) AS avgAge
FROM 
    knessets k
Inner JOIN 
    memberInKnesset mik ON k.number = mik.number
Inner JOIN
    members m ON mik.uid = m.uid
GROUP BY 
    k.number
order by 
    k.number;