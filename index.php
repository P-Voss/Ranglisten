<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);
$config = parse_ini_file(__DIR__ . '/config/config.ini', true);

include __DIR__ . '/queries/simpleRanking.php';
if(isset($_GET['query'])){
    switch ($_GET['query']){
        case 'person':
            include __DIR__ . '/queries/personRanking.php';
            break;
        case 'team':
            include __DIR__ . '/queries/teamRanking.php';
            break;
    }
}
require_once __DIR__ . '/db.php';
require_once __DIR__ . '/tablebuilder.php';

$rankingCount = $db->query($sqlCount)->fetchAll();
$rankingCalc = $db->query($sqlCalc)->fetchAll();

$timeCount = takeTimeInMs($db->query('SHOW PROFILE FOR QUERY 1')->fetchAll());
$timeCalc = takeTimeInMs($db->query('SHOW PROFILE FOR QUERY 2')->fetchAll());
?>
<!Doctype HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>How To: Ranglisten-Queries</title>
    </head>
    <body>
        <div id="navigation">
            <a href="index.php">
                simple Person-Liste
            </a>
            <a href="index.php?query=person">
                gruppierte Person-Liste
            </a>
            <a href="index.php?query=team">
                Team-Liste
            </a>
        </div>
        <div class="content">
		<h1>Der Vergleich</h1>
            <fieldset>
                <legend>
                    Output
                </legend>
                Dauer: <?= $timeCount ?>
                <?= buildTable($rankingCount) ?>
            </fieldset>
            <fieldset>
                <legend>
                    Query
                </legend>
                <?= highlight_string($sqlCount) ?>
            </fieldset>
        </div>
        <div class="content">
            <fieldset>
                <legend>
                    Output
                </legend>
                Dauer: <?= $timeCalc ?>
                <?= buildTable($rankingCalc) ?>
            </fieldset>
            <fieldset>
                <legend>
                    Query
                </legend>
                <?= highlight_string($sqlCalc) ?>
            </fieldset>
        </div>
    </body>
</html>