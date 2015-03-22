<?php

$sqlCalc = <<<SQL
SELECT 
    teams.team_id AS Team_ID, 
    teams.name AS Teamname, 
    SUM(result.punkte) AS Punkte, 
    (SELECT
        COUNT(*) + 1 
    FROM 
       ( 
        SELECT 
          ergebnis.team_id 
        FROM ( 
            SELECT 
                SUM(points) AS teampunkte, persons.team_id 
            FROM 
                results 
            LEFT JOIN 
                persons 
                    ON results.person_id = persons.person_id 
            GROUP BY 
                persons.team_id 
            ) AS ergebnis 
        INNER JOIN ( 
            SELECT 
                SUM(points) AS teampunkte, persons.team_id 
            FROM 
                results 
            LEFT JOIN 
                persons 
                    ON results.person_id = persons.person_id 
            GROUP BY 
                persons.team_id 
            ) AS vergleichspunkte 
                ON ergebnis.teampunkte < vergleichspunkte.teampunkte 
        ) AS Ergebnis 
    WHERE 
        Ergebnis.team_id = teams.team_id 
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
LEFT JOIN 
    teams 
        ON persons.team_id = teams.team_id 
GROUP BY 
    persons.team_id 
ORDER BY 
    Punkte DESC, Teamname
SQL;

$sqlCount = <<<SQL
SELECT 
    team_id AS Team_ID, 
    name AS Teamname, 
    gesamtpunktzahl AS Punkte, 
    rang AS Rang 
FROM (
    SELECT Ergebnis.*, 
        @curRank := IF(@prevRank = gesamtpunktzahl, @curRank, @incRank) AS rang, 
        @incRank := @incRank + 1, 
        @prevRank := gesamtpunktzahl 
    FROM (
        SELECT 
            teams.team_id, teams.name, SUM(result.punkte) gesamtpunktzahl
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
        LEFT JOIN 
            teams 
                ON persons.team_id = teams.team_id 
        GROUP BY 
            persons.team_id 
        ORDER BY 
            Gesamtpunktzahl DESC, name
    ) AS Ergebnis, 
    (
    SELECT @curRank :=0, @prevRank := NULL, @incRank := 1
    ) r 
) AS rangliste
SQL;

