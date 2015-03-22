<?php

$sqlCalc = <<<SQL
SELECT
    points,
    person_id,
    (SELECT
        COUNT(*)+1 
    FROM
        result_simple b 
    WHERE
        b.points > a.points
    ) AS rang 
FROM
    result_simple a   
ORDER BY
    rang
SQL;

$sqlCount = <<<SQL
SELECT
    points,
    person_id,
    rang 
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
        points DESC  
    ) AS rangliste
SQL;

