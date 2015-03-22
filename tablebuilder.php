<?php

function buildTable(array $resultset){
    if(count($resultset) < 1){
        return 'fehler';
    }
    $colums = array_keys($resultset[0]);
    $table =    '<table>
                    <tr>';
    foreach ($colums as $column){
        $table .= '<th>' . $column . '</th>';
    }
    $table .= '</tr>';
    foreach ($resultset as $row){
        $table .=   '<tr>';
        foreach ($colums as $column){
            $table .= '<td>' . $row[$column] . '</td>';
        }
        $table .=   '</tr>';
    }
    $table .= '</table>';
    return $table;
}
