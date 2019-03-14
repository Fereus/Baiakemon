<?PHP
$zapytanie = $SQL->query('SELECT `player_storage`.`player_id`, `player_storage`.`key`, `player_storage`.`value`, `players`.`id`, `players`.`name`, `players`.`level`, `players`.`online` FROM `player_storage`, `players` WHERE `key` = 13540 AND `player_storage`.`player_id` = `players`.`id` ORDER BY `players`.`level` DESC;')->fetchall();
foreach($zapytanie as $zap) {
$kolor++;
            if(is_int($kolor / 2))
                $bgcolor = $config['site']['lightborder'];
            else
                $bgcolor = $config['site']['darkborder'];
                
                    if($zap['online'] == 0)
                        $player_list_status = '<font color="red"><b>Offline</b></font>';
                    else
                        $player_list_status = '<font color="green"><b>Online</b></font>';
                
$tresc .= '<TR BGCOLOR='.$bgcolor.'><TD><center><a href="?subtopic=characters&name='.urlencode($zap['name']).'">'.$zap['name'].'</a></TD><TD><center>'.$zap['level'].'</TD><TD><center>'.$player_list_status.'</center></TD></TR>';
                        
}
$main_content .= '<center><hr/><b>Jogadores Vip Do '.$config['server']['serverName'].'.</b><hr/><br><TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR="'.$config['site']['vdarkborder'].'"><TD CLASS=white WIDTH=32%><b><center>Name</center></b></TD><TD class="white" WIDTH=32%><b><center>Level</center></b></TD><TD class="white" WIDTH=32%><b><center>Status</center></b></TD></TR>'.$tresc.'</TABLE>';

$main_content .= '<div align="right"><small><b></small></div><br />';

?> 