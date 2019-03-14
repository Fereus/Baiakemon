<?PHP 
$main_content .= '<center><h1>Lottery</h1><h3>Lotterys held at 9:00, 14:00, 19:00 and 24:00 hour, polish time.</h3></center><br><TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><tr BGCOLOR="'.$config['site']['vdarkborder'].'"><td CLASS=white><center><b>Player Name</b></center></td><td CLASS=white width=184 colspan=2><center><b>Winning Item</b></center></td><td width=100 CLASS=white><center><b>World</b></center></td></tr>'; 
$lottery = $SQL->query('SELECT id, name, item, world_id FROM lottery WHERE world_id = 0 ORDER BY id DESC;'); 
foreach($lottery as $result) { 
 $players++; 
            if(is_int($players / 2)) 
                $bgcolor = $config['site']['lightborder']; 
            else 
                $bgcolor = $config['site']['darkborder']; 

$main_content .= '<TR BGCOLOR='.$bgcolor.'><TD WIDTH=35%><center><a href="?subtopic=characters&name='.urlencode($result['name']).'">'.$result['name'].'</a></center></td><TD WIDTH=5%><img src=\'/images/'.urlencode($result['item']).'.gif\'></td><TD WIDTH=30%><b>'.$result['item'].'</b></td><TD WIDTH=30%><center>Norah World</center></td></tr>'; 
} 
$main_content .= '</table>'; 
?>