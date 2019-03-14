<?PHP
//######################## SHOW TICKERS AND NEWS #######################
$time = time();

/////////////////////////////////////////////////////////////////////////////////////////
//The new edition of my script: Best Player, Last joined and something new Server Motd.//
/////////////////////////Everything in the new appearance.///////////////////////////////
//////////////////////////////////////by  Aleh///////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
///Queries ///
$query = $SQL->query('SELECT `players`.`name`,`players`.`id`,`players`.`level`, `players`.`experience`, `server_motd`.`id`, `server_motd`.`text` FROM `players`,`server_motd` WHERE `players`.`group_id` < '.$config['site']['players_group_id_block'].' AND `players`.`name` != "Account Manager" ORDER BY `players`.`level` DESC, `players`.`experience` DESC, `server_motd`.`id` DESC LIMIT 1;')->fetch();
$query2 = $SQL->query('SELECT `id`, `name` FROM `players` ORDER BY `id` DESC LIMIT 1;')->fetch();
$housesfree = $SQL->query('SELECT COUNT(*) FROM `houses` WHERE `owner`=0;')->fetch();
$housesrented = $SQL->query('SELECT COUNT(*) FROM `houses` WHERE `owner`=1;')->fetch();
$players = $SQL->query('SELECT COUNT(*) FROM `players` WHERE `id`>0;')->fetch();
$accounts = $SQL->query('SELECT COUNT(*) FROM `accounts` WHERE `id`>0;')->fetch();
$banned = $SQL->query('SELECT COUNT(*) FROM `bans` WHERE `id`>0;')->fetch();
$guilds = $SQL->query('SELECT COUNT(*) FROM `guilds` WHERE `id`>0;')->fetch();
///End Queries ///

    $main_content .= '<table bgcolor='.$config['site']['darkborder'].' border=0 cellpadding=4 cellspacing=1 width=100%>
    <tr bgcolor='. $config['site']['vdarkborder'] .'><td align="center" class=white colspan=1><b>Welcome to '.$config['server']['serverName'].'</b></td></tr>
    <tr><td><table border=0 cellpadding=1 cellspacing=1 width=100%>

    <tr bgcolor='. $config['site']['lightborder'] .'><td><center>Last joined us: <a href="?subtopic=characters&name='.urlencode($query2['name']).'">'.$query2['name'].'</a>, player number '.$query2['id'].'. Welcome and wish you a nice game!</center></td></tr>
    <tr bgcolor='. $config['site']['lightborder'] .'><td><center>Currently, the best player on the server is: <a href="index.php?subtopic=characters&name='.urlencode($query['name']).'"> '.$query['name'].'</a> ('.urlencode($query['level']).'). Congratulations!</center></td></tr>
    <tr bgcolor='. $config['site']['lightborder'] .'><td><center><b>Server motd:</b> '.$query['text'].'</center></td></tr> 
    <table border=0 cellpadding=0 cellspacing=1 width=100%>
      <tr bgcolor='. $config['site']['lightborder'] .'><td><center><b>Free Houses:</b> '.$housesfree[0].'</center></td>
    <td><center><b>Rented Houses:</b> '.$housesrented[0].'</center></td></tr>      
    <tr bgcolor='. $config['site']['lightborder'] .'><td><center><b>Accounts</b> in database: '.$accounts[0].'</center></td>
    <td><center><b>Players</b> in database: '.$players[0].'</center></td></tr>
    <tr bgcolor='. $config['site']['lightborder'] .'><td><center><b>Banned</b> accounts: '.$banned[0].'</center></td>
    <td><center><b>Guilds</b> in databese: '.$guilds[0].'</center></td></tr>

</table></td></tr></table>';

$main_content .= '<div class="NewsHeadline">
        <div class="NewsHeadlineBackground" style="background-image:url(' . $layout_name . '/images/news/newsheadline_background.gif)">
                <table border="0">
                        <tr>
                                
                                        <center><font color="white"><b><font size="3">.:: Most Powerfull Guilds ::.</b></font></center>

                        </tr>
                </table>
        </div>
</div>
<table border="0" cellspacing="3" cellpadding="4" width="100%">
        <tr>';

foreach($SQL->query('SELECT `g`.`id` AS `id`, `g`.`name` AS `name`,
        `g`.`logo_gfx_name` AS `logo`, COUNT(`g`.`name`) as `frags`
FROM `killers` k
        LEFT JOIN `player_killers` pk ON `k`.`id` = `pk`.`kill_id`
        LEFT JOIN `players` p ON `pk`.`player_id` = `p`.`id`
        LEFT JOIN `guild_ranks` gr ON `p`.`rank_id` = `gr`.`id`
        LEFT JOIN `guilds` g ON `gr`.`guild_id` = `g`.`id`
WHERE `k`.`unjustified` = 1 AND `k`.`final_hit` = 1
        GROUP BY `name`
        ORDER BY `frags` DESC, `name` ASC
        LIMIT 0, 4;') as $guild)
        $main_content .= '              <td style="width: 25%; text-align: center;">
                        <a href="?subtopic=guilds&action=show&guild=' . $guild['id'] . '"><img src="guilds/' . ((!empty($guild['logo']) && file_exists('guilds/' . $guild['logo'])) ? $guild['logo'] : 'default_logo.gif') . '" width="64" height="64" border="0"/><br />' . $guild['name'] . '</a><br />' . $guild['frags'] . ' kills
                </td>';

$main_content .= '      </tr>
</table>';

///Don't delete this! Please respect my work! I
if($action == "") {

//show tickers if any in database or not blocked (tickers limit = 0)
$tickers = $SQL->query('SELECT * FROM `z_news_tickers` WHERE hide_ticker != 1 ORDER BY date DESC LIMIT 4;');
$number_of_tickers = 0;
if(is_object($tickers)) {
foreach($tickers as $ticker) {
if(is_int($number_of_tickers / 2))
        $color = "Odd";
else
        $color = "Even";
$tickers_to_add .= '<div id="TickerEntry-'.$number_of_tickers.'" class="Row" onclick=\'TickerAction("TickerEntry-'.$number_of_tickers.'")\'>
  <div class="'.$color.'">
    <div class="NewsTickerIcon" style="background-image: url('.$layout_name.'/images/news/icon_'.$ticker['image_id'].'.gif);"></div>
    <div id="TickerEntry-'.$number_of_tickers.'-Button" class="NewsTickerExtend" style="background-image: url('.$layout_name.'/images/general/plus.gif);"></div>
    <div class="NewsTickerText">
      <span class="NewsTickerDate">'.date("j M Y", $ticker['date']).' -</span>
      <div id="TickerEntry-'.$number_of_tickers.'-ShortText" class="NewsTickerShortText">';
//if admin show button to delete (hide) ticker
if($group_id_of_acc_logged >= $config['site']['access_admin_panel']) {
$tickers_to_add .= '<a href="?subtopic=latestnews&action=deleteticker&id='.$ticker['date'].'"><img src="'.$layout_name.'/images/news/delete.png" border="0"></a>';
}
$tickers_to_add .= short_text($ticker['text'], 60).'</div>
      <div id="TickerEntry-'.$number_of_tickers.'-FullText" class="NewsTickerFullText">';
//if admin show button to delete (hide) ticker
if($group_id_of_acc_logged >= $config['site']['access_admin_panel']) {
$tickers_to_add .= '<a href="?subtopic=latestnews&action=deleteticker&id='.$ticker['date'].'"><img src="'.$layout_name.'/images/news/delete.png" border="0"></a>';
}
$tickers_to_add .= $ticker['text'].'</div>
    </div>
  </div>
</div>';
$number_of_tickers++;
}
}

if(!empty($tickers_to_add)) {
//show table with tickers
$news_content .= '<div id="newsticker" class="Box">
    <div class="Corner-tl" style="background-image: url('.$layout_name.'/images/content/corner-tl.gif);"></div>
    <div class="Corner-tr" style="background-image: url('.$layout_name.'/images/content/corner-tr.gif);"></div>
    <div class="Border_1" style="background-image: url('.$layout_name.'/images/content/border-1.gif);"></div>
    <div class="BorderTitleText" style="background-image: url('.$layout_name.'/images/content/title-background-green.gif);"></div>
    <img class="Title" src="'.$layout_name.'/images/header/headline-newsticker.gif" alt="Contentbox headline">
    <div class="Border_2">
      <div class="Border_3">
        <div class="BoxContent" style="background-image: url('.$layout_name.'/images/content/scroll.gif);">';
if($group_id_of_acc_logged >= $config['site']['access_admin_panel'])
$news_content .= '<script type="text/javascript">
var showednewticker_state = "0";
function showNewTickerForm()
{
if(showednewticker_state == "0") {
document.getElementById("newtickerform").innerHTML = \'<form action="?subtopic=latestnews&action=newticker" method="post" ><table border="0"><tr><td bgcolor="D4C0A1" align="center"><b>Select icon:</b></td><td><table border="0" bgcolor="F1E0C6"><tr><td><img src="images/news/icon_0.gif" width="20"></td><td><img src="images/news/icon_1.gif" width="20"></td><td><img src="images/news/icon_2.gif" width="20"></td><td><img src="images/news/icon_3.gif" width="20"></td><td><img src="images/news/icon_4.gif" width="20"></td></tr><tr><td><input type="radio" name="icon_id" value="0" checked="checked"></td><td><input type="radio" name="icon_id" value="1"></td><td><input type="radio" name="icon_id" value="2"></td><td><input type="radio" name="icon_id" value="3"></td><td><input type="radio" name="icon_id" value="4"></td></tr></table></td></tr><tr><td align="center" bgcolor="D4C0A1"><b>New<br>ticker<br>text:</b></td><td bgcolor="F1E0C6"><textarea name="new_ticker" rows="3" cols="45"></textarea></td></tr><tr><td><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Submit" alt="Submit" src="'.$layout_name.'/images/buttons/_sbutton_submit.gif" ></div></div></form><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><img class="ButtonText" id="AddTicker" src="'.$layout_name.'/images/buttons/_sbutton_cancel.gif" onClick="showNewTickerForm()" alt="AddTicker" /></div></div></td></tr></table>\';
document.getElementById("jajo").innerHTML = \'\';
showednewticker_state = "1";
}
else {
document.getElementById("newtickerform").innerHTML = \'\';
document.getElementById("jajo").innerHTML = \'<div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><img class="ButtonText" id="AddTicker" src="'.$layout_name.'/images/buttons/addticker.gif" onClick="showNewTickerForm()" alt="AddTicker" /></div></div>\';
showednewticker_state = "0";
}
}
</script><div id="newtickerform"></div><div id="jajo"><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><img class="ButtonText" id="AddTicker" src="'.$layout_name.'/images/buttons/addticker.gif" onClick="showNewTickerForm()" alt="AddTicker" /></div></div></div><hr/>';
//add tickers list
$news_content .= $tickers_to_add;
//koniec
$news_content .= '</div>
      </div>
    </div>
    <div class="Border_1" style="background-image: url('.$layout_name.'/images/content/border-1.gif);"></div>
    <div class="CornerWrapper-b"><div class="Corner-bl" style="background-image: url('.$layout_name.'/images/content/corner-bl.gif);"></div></div>
    <div class="CornerWrapper-b"><div class="Corner-br" style="background-image: url('.$layout_name.'/images/content/corner-br.gif);"></div></div>
  </div>';
}
}
//##################### ADD NEW TICKER #####################
if($action == "newticker") {
if($group_id_of_acc_logged >= $config['site']['access_tickers']) {
$ticker_text = stripslashes(trim($_POST['new_ticker']));
$ticker_icon = (int) $_POST['icon_id'];
if(empty($ticker_text)) {
$main_content .= 'You can\'t add empty ticker.';
}
else
{
if(empty($ticker_icon)) {
$ticker_icon = 0;
}
$SQL->query('INSERT INTO '.$SQL->tableName('z_news_tickers').' (date, author, image_id, text, hide_ticker) VALUES ('.$SQL->quote($time).', '.$account_logged->getId().', '.$ticker_icon.', '.$SQL->quote($ticker_text).', 0)');
$main_content .= '<center><h2><font color="red">Added new ticker:</font></h2></center><hr/><div id="newsticker" class="Box"><div id="TickerEntry-1" class="Row" onclick=\'TickerAction("TickerEntry-1")\'>
  <div class="Odd">
    <div class="NewsTickerIcon" style="background-image: url('.$layout_name.'/images/news/icon_'.$ticker['image_id'].'.gif);"></div>
    <div id="TickerEntry-1-Button" class="NewsTickerExtend" style="background-image: url('.$layout_name.'/images/general/plus.gif);"></div>
    <div class="NewsTickerText">
      <span class="NewsTickerDate">'.date("j M Y", $time).' -</span>
      <div id="TickerEntry-1-ShortText" class="NewsTickerShortText">';
$main_content .= '<a href="?subtopic=latestnews&action=deleteticker&id='.$time.'"><img src="'.$layout_name.'/images/news/delete.png" border="0"></a>';
$main_content .= short_text($ticker_text, 60).'</div>
      <div id="TickerEntry-1-FullText" class="NewsTickerFullText">';
$main_content .= '<a href="?subtopic=latestnews&action=deleteticker&id='.$time.'"><img src="'.$layout_name.'/images/news/delete.png" border="0"></a>';
$main_content .= $ticker_text.'</div>
    </div>
  </div>
</div></div><hr/>';
}
}
else
{
$main_content .= 'You don\'t have admin rights. You can\'t add new ticker.';
}
$main_content .= '<form action="?subtopic=latestnews" METHOD=post><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></form>';
}
//#################### DELETE (HIDE only!) TICKER ############################
if($action == "deleteticker") {
if($group_id_of_acc_logged >= $config['site']['access_tickers']) {
header("Location: ");
$date = (int) $_REQUEST['id'];
$SQL->query('UPDATE '.$SQL->tableName('z_news_tickers').' SET hide_ticker = 1 WHERE '.$SQL->fieldName('date').' = '.$date.';');
$main_content .= '<center>News tickets with <b>date '.date("j F Y, g:i a", $date).'</b> has been deleted.<form action="?subtopic=latestnews" METHOD=post><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></form></center>';
}
else
{
$main_content .= '<center>You don\'t have admin rights. You can\'t delete tickers.<form action="?subtopic=latestnews" METHOD=post><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></form></center>';
}
}
if($group_id_of_acc_logged >= $config['site']['access_admin_panel']){$main_content .=  '<a href="?subtopic=forum&action=new_topic&section_id=1">Add new news</a>';}
$zapytanie = $SQL->query("SELECT `z_forum`.`post_topic`, `z_forum`.`author_guid`, `z_forum`.`post_date`, `z_forum`.`post_text`, `z_forum`.`id`, `z_forum`.`replies`, `players`.`name` FROM `z_forum`, `players` WHERE `section` = '1' AND `z_forum`.`id` = `first_post` AND `players`.`id` = `z_forum`.`author_guid` ORDER BY `post_date` DESC LIMIT 3;")->fetchAll();
foreach ($zapytanie as $row)
{
         $BB = array(
		'/\[b\](.*?)\[\/b\]/is' => '<strong>$1</strong>',
		'/\[quote\](.*?)\[\/quote\]/is' => '<table cellpadding="0" style="background-color: #c4c4c4; width: 480px; border-style: dotted; border-color: #007900; border-width: 2px"><tr><td>$1</td></tr></table>',
		'/\[u\](.*?)\[\/u\]/is' => '<u>$1</u>',
		'/\[i\](.*?)\[\/i\]/is' => '<i>$1</i>',
		'/\[url](.*?)\[\/url\]/is' => '<a href=$1>$1</a>',
		'/\[img\](.*?)\[\/img\]/is' => '<img src=$1 alt=$1 />',
		'/\[player\](.*?)\[\/player\]/is' => '<a href='.$server['ip'].'?subtopic=characters&amp;name=$1>$1</a>',
		'/\[code\](.*?)\[\/code\]/is' => '<div dir="ltr" style="margin: 0px;padding: 2px;border: 1px inset;width: 500px;height: 290px;text-align: left;overflow: auto"><code style="white-space:nowrap">$1</code></div>'
		);
		$message = preg_replace(array_keys($BB), array_values($BB), nl2br($row['post_text']));
        $main_content .= '<div class=\'NewsHeadline\'>
		<div class=\'NewsHeadlineBackground\' style=\'background-image:url('.$layout_name.'/images/news/newsheadline_background.gif)\'>
		<table border=0><tr><td><img src="'.$layout_name.'/images/news/icon_1.gif" class=\'NewsHeadlineIcon\' alt=\'\' />
		</td><td><font color="'.$layout_ini['news_title_color'].'">'.date('d.m.y H:i:s', $row['post_date']).' - <b>'.$row['post_topic'].'</b></font></td></tr></table>
		</div>
		</div>
		<table style=\'clear:both\' border=0 cellpadding=0 cellspacing=0 width=\'100%\'><tr>
		<td><img src="'.$layout_name.'/images/global/general/blank.gif" width=10 height=1 border=0 alt=\'\' /></td>';
		if($group_id_of_acc_logged >= $config['site']['access_admin_panel'])
		{
			$main_content .='<td width="100%">'.$message.'<br><h6><i>Posted by </i><font color="green">'.$row['name'].'</font></h6><p align="right"><a href="?subtopic=forum&action=remove_post&id='.$row['id'].'"><font color="red">[Delete this news]</font></a>  <a href="?subtopic=forum&action=edit_post&id='.$row['id'].'"><font color="green">[Edit this news]</font></a>      <a href="?subtopic=forum&action=show_thread&id='.$row['id'].'">Comments: '.$row['replies'].'</a></p>';
		}
		else		
		{
			$main_content .='<td width="100%">'.$message.'<br><h6><i>Posted by </i><font color="green">'.$row['name'].'</font></h6><p align="right"><a href="?subtopic=forum&action=show_thread&id='.$row['id'].'">Comments: '.$row['replies'].'</a></p>';		
		}
		$main_content .= '</td>
		<td><img src="'.$layout_name.'/images/global/general/blank.gif" width=10 height=1 border=0 alt=\'\' /></td>
		</tr></table>';
}

?>

