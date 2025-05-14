SELECT k.number, mik.party, COUNT(DISTINCT mik.uid) AS participant_count
FROM knessets k
JOIN memberInKnesset mik ON k.number = mik.number
JOIN members m ON mik.uid = m.uid
GROUP BY k.number, mik.party
HAVING COUNT(DISTINCT mik.uid) = (
    SELECT MAX(party_count)
    FROM (
        SELECT COUNT(DISTINCT mik2.uid) AS party_count
        FROM memberInKnesset mik2
        WHERE mik2.number = k.number
        GROUP BY mik2.party
    ) AS sub
)
ORDER BY k.number;
