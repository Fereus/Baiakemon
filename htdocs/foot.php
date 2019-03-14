<?php
$main_content .= '<div style="text-align: center; font-weight: bold;">Top 20 Goals on ' . $config['server']['serverName'] . '</div>
<table border="0" cellspacing="1" cellpadding="4" width="100%">
    <tr bgcolor="' . $config['site']['vdarkborder'] . '">
        <td class="white" style="text-align: center; font-weight: bold;">Name</td>
        <td class="white" style="text-align: center; font-weight: bold;">Goals</td>
        <td class="white" style="text-align: center; font-weight: bold;">Wins</td>
    </tr>';

$i = 0;
foreach($SQL->query('SELECT `name`,`goals`,`total`,`wins` FROM `players`
GROUP BY `name`
 ORDER BY (`wins`/`total`)*(`goals`+`wins`) DESC LIMIT 0,20') as $player)
{
    $i++;
    $main_content .= '<tr bgcolor="' . (is_int($i / 2) ? $config['site']['lightborder'] : $config['site']['darkborder']) . '">
        <td><a href="?subtopic=characters&name=' . urlencode($player['name']) . '">' . $player['name'] . '</a></td>
        <td style="text-align: center;">' . $player['goals'] . '</td>
        <td style="text-align: center;">' . $player['wins'] . '</td>
    </tr>';
}

$main_content .= '</table>';
?>