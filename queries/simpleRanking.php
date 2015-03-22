<?php

$sqlCalc = <<<SQL
SELECT
    main.person_id AS Person_ID, 
    persons.vorname AS Vorname, 
    persons.nachname AS Nachname, 
    main.points AS Punkte,
    (SELECT
        COUNT(*)+1 
    FROM
        result_simple sub 
    WHERE
        sub.points > main.points
    ) AS Rang 
FROM
    result_simple main   
LEFT JOIN persons 
    ON main.person_id = persons.person_id
ORDER BY rang, persons.person_id
SQL;

$sqlCount = <<<SQL
SELECT
    rangliste.person_id AS Person_ID,
    persons.vorname AS Vorname, 
    persons.nachname AS Nachname, 
    rangliste.points AS Punkte, 
    rangliste.rang AS Rang 
FROM
    (SELECT
        points,
        person_id,
        @curRank := IF(@prevRank = points, @curRank, @incRank) AS rang,
        @incRank := @incRank + 1,
        @prevRank := points  
    FROM
        result_simple,
        (SELECT
            @curRank :=0,
            @prevRank := NULL,
            @incRank := 1) AS count 
    ORDER BY
        points DESC, person_id 
    ) AS rangliste 
LEFT JOIN persons 
    ON rangliste.person_id = persons.person_id 
SQL;

