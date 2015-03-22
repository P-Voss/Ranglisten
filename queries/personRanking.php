<?php

$sqlCalc = <<<SQL
SELECT 
    persons.person_id AS Person_ID, 
    persons.vorname AS Vorname, 
    persons.nachname AS Nachname, 
    SUM(result.punkte) AS Punkte, 
    (SELECT 
        COUNT(*) +1 
    FROM 
        (SELECT 
            ergebnis.person_id 
        FROM 
            (SELECT 
                SUM(points) AS personpunkte, 
                results.person_id 
            FROM 
                results 
            GROUP BY 
                results.person_id 
        ) AS ergebnis 
        INNER JOIN ( 
            SELECT 
                SUM(points) AS personpunkte, 
                results.person_id 
            FROM 
                results 
            GROUP BY 
                results.person_id 
        ) AS vergleichspunkte 
            ON ergebnis.personpunkte < vergleichspunkte.personpunkte 
    ) AS Ergebnis 
    WHERE 
        Ergebnis.person_id = persons.person_id 
    ) AS Rang 
FROM 
    persons 
LEFT JOIN ( 
    SELECT 
        person_id, 
        SUM(points) AS punkte 
    FROM 
        results 
    GROUP BY 
        person_id 
    ) AS result 
    ON persons.person_id = result.person_id 
GROUP BY 
    persons.person_id 
ORDER BY 
    Punkte DESC, person_id
SQL;

$sqlCount = <<<SQL
SELECT
    person_id AS Person_ID,
    vorname AS Vorname,
    nachname AS Nachname,
    gesamtpunktzahl AS Punkte,
    rang AS Rang 
FROM
    (SELECT
        Ergebnis.*,
        @curRank := IF(@prevRank = gesamtpunktzahl, @curRank, @incRank) AS rang,
        @incRank := @incRank + 1,
        @prevRank := gesamtpunktzahl    
    FROM
        (SELECT
            persons.person_id,
            persons.vorname,
            persons.nachname,
            SUM(result.punkte) gesamtpunktzahl     
        FROM
            persons     
        LEFT JOIN
            (SELECT
                person_id,
                SUM(points) AS punkte       
            FROM
                results       
            GROUP BY
                person_id       
            ) AS result         
                ON persons.person_id = result.person_id     
        GROUP BY
            persons.person_id     
        ORDER BY
            Gesamtpunktzahl DESC, persons.person_id   
        ) AS Ergebnis ,
        (SELECT
            @curRank :=0,
            @prevRank := NULL,
            @incRank := 1 
        ) AS r
    ) AS Rangliste
SQL;

