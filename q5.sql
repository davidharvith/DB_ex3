SELECT mik.party, mik.number, AVG(CASE WHEN m.gender = 'female' THEN 1 ELSE 0 END)*100 AS female_percentage
FROM members m
INNER JOIN memberInKnesset mik ON m.uid = mik.uid
GROUP BY mik.party, mik.number
HAVING AVG(CASE WHEN m.gender = 'female' THEN 1 ELSE 0 END) > 0.3
ORDER BY mik.party, mik.number;
