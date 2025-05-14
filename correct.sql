SELECT DISTINCT D0.name, D1.name
FROM donors D0
JOIN donors D1 ON D0.name < D1.name
WHERE NOT EXISTS (
    SELECT cause
    FROM donors D2
    WHERE D2.name = D0.name
    EXCEPT
    SELECT cause
    FROM donors D3
    WHERE D3.name = D1.name
)
AND NOT EXISTS (
    SELECT cause
    FROM donors D2
    WHERE D2.name = D1.name
    EXCEPT
    SELECT cause
    FROM donors D3
    WHERE D3.name = D0.name
)
ORDER BY D0.name, D1.name;
