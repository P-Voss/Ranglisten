<?php

function takeTimeInMs(array $tasks){
    $time = 0;
    foreach ($tasks as $task){
        $time += $task['Duration'];
    }
    return $time * 1000 . 'MS';
}

$db = new PDO($config['dbhost'] .';dbname=' . $config['dbname'] . ';charset=utf8;', $config['dbuser'], $config['dbpw']);
$db->setAttribute(PDO::ATTR_CASE, PDO::CASE_NATURAL);
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
$db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);

if($config['dbcache'] !== "true"){
    $db->query('SET SESSION query_cache_type = off');
}
$db->query('set profiling = 1');

