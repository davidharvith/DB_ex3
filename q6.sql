WITH RECURSIVE T(uid, level) as(
    SELECT m.uid, 0 AS level
    FROM members m
    WHERE m.name = 'Menachem Begin'

    UNION all
    SELECT DISTINCT mik2.uid, t.level + 1
    FROM T t
    JOIN memberInKnesset mik1 ON t.uid = mik1.uid  -- previous member's knesset+party
    JOIN memberInKnesset mik2 ON mik1.number = mik2.number AND mik1.party = mik2.party
    WHERE mik2.uid != T.uid

      AND t.level < 3
)

SELECT DISTINCT m.uid, m.name
FROM members m
where not m.uid in (SELECT t.uid FROM T t)
ORDER BY m.uid;
