 <?PHP
$name = stripslashes(ucwords(strtolower(trim($_REQUEST['name']))));
if(empty($name)) {
    $main_content .= '<FORM ACTION="?subtopic=characters" METHOD=post><TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4><TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" CLASS=white><B>Procurar Personagens</B></TD></TR><TR><TD BGCOLOR="'.$config['site']['darkborder'].'"><TABLE BORDER=0 CELLPADDING=1><TR><TD>Nome:</TD><TD><INPUT NAME="name" VALUE=""SIZE=29 MAXLENGTH=29></TD><TD><INPUT TYPE=image NAME="Submit" SRC="'.$layout_name.'/images/buttons/sbutton_submit.gif" BORDER=0 WIDTH=120 HEIGHT=18></TD></TR></TABLE></TD></TR></TABLE></FORM>';
}
else
{
    if(check_name($name)) {
        $player = $ots->createObject('Player');
        $player->find($name);
        if($player->isLoaded()) {
            $account = $player->getAccount();
            $main_content .= '<TABLE border=0 cellpadding=0 width=100%><td VALIGN=top><TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR='.$config['site']['vdarkborder'].'><TD COLSPAN=2 CLASS=white><B>Informações dos Personagens</B></TD></TR>';
            if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
            $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD width=1><nobr><b>Nome:</b></TD><TD><font color="';
            $main_content .= ($player->isOnline()) ? 'green' : 'red';
            $main_content .= '"><b>'.$player->getName().'</b></font>';
            $main_content .= ($account->ispremium()) ? ' ' : '';
            if($player->isDeleted())
                $main_content .= '<font color="red"> [Deletado]</font>';
            if($player->isNameLocked())
                $main_content .= '<font color="red"> [Nome em Mudança]</font>';
            $main_content .= '</TD></TR>';
            if($player->getOldName())
            {
                if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
                if($player->isNameLocked())
                    $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD>Proposition:</TD><TD>'.$player->getOldName().'</TD></TR>';
                else
                    $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD><b>Nome Antigo:</b></TD><TD>'.$player->getOldName().'</TD></TR>';
            }
            
            // BEGIN Position Showing *** Fixed by jerryb1988 from otfans.net
            $group = $player->getGroup();
            if ($group == 2){$group_name = 'Tutor';}
            if ($group == 3){$group_name = 'Senior Tutor';}
            if ($group == 4){$group_name = 'GameMaster';}
            if ($group == 5){$group_name = 'Comunnity Manager';}
	    if ($group == 6){$group_name = 'GOD';}
            if ($group == 7){$group_name = 'Administrador';}

            if($group != 1)
            {
                if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
                $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD><b>Group:</b></TD><TD>'.$group_name.'</TD></TR>';
            }
            // END Position Showing
            
            if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
            $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD><b>Sexo:</b></TD><TD>';
            $main_content .= ($player->getSex() == 0) ? 'Feminino' : 'Masculino';
            $main_content .= '</TD></TR>';
            if($config['site']['show_marriage_info'])
            {
                if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
                $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD>Marital status:</TD><TD>';
                $marriage = new OTS_Player();
                $marriage->load($player->getMarriage());
                if($marriage->isLoaded())
                    $main_content .= 'married to <a href="?subtopic=characters&name='.urlencode($marriage->getName()).'"><b>'.$marriage->getName().'</b></a></TD></TR>';
                else
                    $main_content .= 'single</TD></TR>';
            }
            if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
            $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD><b>Vocação:</b></TD><TD>'.$vocation_name[$player->getWorld()][$player->getPromotion()][$player->getVocation()].'</TD></TR>';
            if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
            $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD><b>Level:</b></TD><TD>'.$player->getLevel().'</TD></TR>';
            if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
            $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD><b>Mundo:</b></TD><TD>'.$config['site']['worlds'][$player->getWorld()].'</TD></TR>';
            if(!empty($towns_list[$player->getWorld()][$player->getTownId()]))
            {
                if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
                $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD><b>Residencia:</b></TD><TD>'.$towns_list[$player->getWorld()][$player->getTownId()].'</TD></TR>';
            }
		/*Vip Status*/ 
            if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;  
            $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD>Vip Status:</TD><TD>';  
            $main_content .= ($account->getPlayerVip_Time()) ? '<b><font color="green">VIP</font></b>' : '<b><font color="red">NOT VIP</font></b>';  
            

            $rank_of_player = $player->getRank();
            if(!empty($rank_of_player))
            {
            $guild_id = $rank_of_player->getGuild()->getId();
            $guild_name = $rank_of_player->getGuild()->getName();
            if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
            $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD><NOBR><b>Guild</b></TD><TD>'.$rank_of_player->getName().' of the <a href="?subtopic=guilds&action=show&guild='.$guild_id.'">'.$guild_name.'</a></TD></TR>';
            }
            
            if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
            $lastlogin = $player->getLastLogin();
            if(empty($lastlogin))
                $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD><NOBR><b>Ultimo Acesso</b></TD><TD><b>Nunca Logou.</b></TD></TR>';
            else
                $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD><NOBR><b>Ultimo Acesso:</b></TD><TD>'.date("j F Y, g:i a", $lastlogin).'</TD></TR>';
                if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
            if($config['site']['show_creationdate'] && $player->getCreated())
            {
                $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD><NOBR><b>Char Criado:</b></TD><TD>'.date("j F Y, g:i a", $player->getCreated()).'</TD></TR>';
            }


		//equipment shower by ballack13
		if($config['site']['show_itens_status'])
			{
			$id = $player->getCustomField("id");
			$number_of_items = 1;
			$main_content .= '<td align=center><table with=100% style="border: solid 1px #888888;" CELLSPACING="1"><TR>';		
                        $list = array('2','1','3','6','4','5','9','7','10','8'); 
                        foreach ($list as $pid => $name) {
                        $top = $SQL->query('SELECT * FROM player_items WHERE player_id = '.$id.' AND pid = '.$list[$pid].';')->fetch();
                           if($top[itemtype] == false) {
                           if($list[$pid] == '8') {
			$main_content .= '<td style="background-color: '.$config['site']['darkborder'].'; text-align: center;">Soul:<br/>'.$player->getSoul().'</td>';
			}
				if(is_int($number_of_items / 3)){
			$main_content .= '<TD style="background-color: '.$config['site']['darkborder'].'; text-align: center;"><img src="images/items/'.$list[$pid].'.gif"/></TD></tr><tr>';
				} else {
			$main_content .= '<TD style="background-color: '.$config['site']['darkborder'].'; text-align: center;"><img src="images/items/'.$list[$pid].'.gif"/></TD>';
			}
				$number_of_items++;
			}
			else
			{
                           if($list[$pid] == '8') {
			$main_content .= '<td style="background-color: '.$config['site']['darkborder'].'; text-align: center;">Soul:<br/>'.$player->getSoul().'</td>';
			}
				if(is_int($number_of_items / 3))
			$main_content .= '<TD style="background-color: '.$config['site']['darkborder'].'; text-align: center;"><img src="images/items/'.$top[itemtype].'.gif" width="45"/></TD></tr><tr>';
				else
			$main_content .= '<TD style="background-color: '.$config['site']['darkborder'].'; text-align: center;"><img src="images/items/'.$top[itemtype].'.gif" width="45"/></TD>';
				$number_of_items++;
			}
                           if($list[$pid] == '8') {
			$main_content .= '<td style="background-color: '.$config['site']['darkborder'].'; text-align: center;">Cap:<br/>'.$player->getCap().'</td>';
			}
			}
			
			$main_content .= '</tr></TABLE></td>';


			//Hp/Mana/Exp Status by ballack13
			if($config['site']['show_hp_status'])
			{
                        $hp = ($player->getHealth() / $player->getHealthMax() * 100);
                        $mana = ($player->getMana() / $player->getManaMax() * 100);
          		$main_content .= '<td align=center ><table width=100%><tr><td align=center><table CELLSPACING="1" CELLPADDING="4"><tr><td BGCOLOR="#D4C0A1" align="left" width="20%"><b>Player Health:</b></td>
                  		          <td BGCOLOR="#D4C0A1" align="left">'.$player->getHealth().'/'.$player->getHealthMax().'<div style="width: 100%; height: 3px; border: 1px solid #000;"><div style="background: red; width: '.$hp.'%; height: 3px;"></td></tr>
                  		          <tr><td BGCOLOR="#F1E0C6" align="left"><b>Player Mana:</b></td><td BGCOLOR="#F1E0C6" align="left">'.$player->getMana().'/'.$player->getManaMax().'<div style="width: 100%; height: 3px; border: 1px solid #000;"><div style="background: blue; width: '.$mana.'%; height: 3px;"></td></tr></table><tr>';

                        $next = ($player->getLevel() + 1);
                        $exp = ((50 / 3) * ($player->getLevel() * $player->getLevel() * $player->getLevel()) - (100 * ($player->getLevel() * $player->getLevel())) + ((850/3) * $player->getLevel()) - 200);
                        $expnext = ((50 / 3) * ($next * $next * $next) - (100 * ($next * $next)) + ((850/3) * $next) - 200 - $player->getExperience());
                        $expresult = (100 - ($expnext / (($expnext  + $player->getExperience()) - $exp) * 100));
           	        $main_content .= '<tr><table CELLSPACING="1" CELLPADDING="4"><tr><td BGCOLOR="#D4C0A1" align="left" width="20%"><b>Player Level:</b></td><td BGCOLOR="#D4C0A1" align="left">'.$player->getLevel().'</td></tr>
                        		  <tr><td BGCOLOR="#F1E0C6" align="left"><b>Player Experience:</b></td><td BGCOLOR="#F1E0C6" align="left">'.$player->getExperience().' EXP.</td></tr>
                		          <tr><td BGCOLOR="#D4C0A1" align="left"><b>To Next Level:</b></td><td BGCOLOR="#D4C0A1" align="left">You need <b>'.$expnext.' EXP</b> to Level <b>'.$next.'</b>.<div title="99.320604545 %" style="width: 100%; height: 3px; border: 1px solid #000;"><div style="background: red; width: '.$expresult.'%; height: 3px;"></td></tr></table></td></tr></table></tr></TABLE></td>';
                    
            }
		}

		if($config['site']['show_skills_info']) {
			//Skills Pics v2. Table borders optimized by Absolute Mango
			$main_content .= '<br/><table cellspacing="0" cellpadding="0" border="0" width="200" align="center"><caption><strong>Skills</strong></caption><tbody><tr>
            <td align="center"><a href="?subtopic=highscores&list=experience"><img src="images/skills/level.png" style="border: none;"/></a></td>
            <td align="center"><a href="?subtopic=highscores&list=magic"><img src="images/skills/ml.png" style="border: none;"/></a></td>
            <td align="center"><a href="?subtopic=highscores&list=fist"><img src="images/skills/fist.png" style="border: none;"/></a></td>
            <td align="center"><a href="?subtopic=highscores&list=club"><img src="images/skills/club.png" style="border: none;"/></a></td>
            <td align="center"><a href="?subtopic=highscores&list=sword"><img src="images/skills/sword.png" style="border: none;"/></a></td>
            <td align="center"><a href="?subtopic=highscores&list=axe"><img src="images/skills/axe.png" style="border: none;"/></a></td>
            <td align="center"><a href="?subtopic=highscores&list=distance"><img src="images/skills/dist.png" style="border: none;"/></a></td>
            <td align="center"><a href="?subtopic=highscores&list=shield"><img src="images/skills/def.png" style="border: none;"/></a></td>
            <td align="center"><a href="?subtopic=highscores&list=fishing"><img src="images/skills/fish.png" style="border: none;"/></a></td>
			</tr></tbody></table>
			<table cellspacing="0" cellpadding="0" border="1" width="360" align="center"><tbody><tr><tr bgcolor="'.$config['site']['darkborder'].'">
            <td align="center" width="38"><strong>Level</strong></td>
            <td align="center" width="38"><strong>ML</strong></td>
            <td align="center" width="42"><strong>Fist</strong></td>
            <td align="center" width="40"><strong>Club</strong></td>
            <td align="center" width="38"><strong>Swrd</strong></td>
            <td align="center" width="38"><strong>Axe</strong></td>
            <td align="center" width="38"><strong>Dist</strong></td>
            <td align="center" width="38"><strong>Shield</strong></td>
            <td align="center" width="38"><strong>Fish</strong></td></font>
        </tr>
        <tr bgcolor="'.$config['site']['lightborder'].'">
            <td align="center" width="38">'.$player->getLevel().'</td>
            <td align="center" width="38">'.$player->getMagLevel().'</td>
            <td align="center" width="38">'.$player->getSkill(0).'</td>
            <td align="center" width="38">'.$player->getSkill(1).'</td>
            <td align="center" width="38">'.$player->getSkill(2).'</td>
            <td align="center" width="38">'.$player->getSkill(3).'</td>
            <td align="center" width="38">'.$player->getSkill(4).'</td>
            <td align="center" width="38">'.$player->getSkill(5).'</td>
            <td align="center" width="38">'.$player->getSkill(6).'</td>
        </tr></tbody></table><div table align="center">&nbsp;<br />&nbsp;</div>';
			//skill script end
			}
	
            if($config['site']['show_health_information']) // Modified by Jerryb1988 from otfans.net
            {    
                if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
                $playerhp = $player->getHealth();
                $playermaxhp = $player->getHealthMax();
                $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><td>Health:</td><td>' .number_format($playerhp). '/' .number_format($playermaxhp). '<div style="width: 100%; height: 3px; border: 1px solid #000;"><div style="background: red; width: '.(($playerhp / $playermaxhp) * 100).'%; height: 3px;"></td></tr>';
            }
            if($config['site']['show_mana_information']) // Modified by Jerryb1988 from otfans.net
            {    
                if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
                $playermana = $player->getMana();
                $playermaxmana = $player->getManaMax();
                $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><td>Mana:</td><td>' .number_format($playermana). '/' .number_format($playermaxmana). '<div style="width: 100%; height: 3px; border: 1px solid #000;"><div style="background: blue; width: '.(($playermana / $playermaxmana) * 100).'%; height: 3px;"></td></tr>';
            }
            if($config['site']['show_exp_information']) // Modified by Jerryb1988 from otfans.net
            {    
                // BEGIN *** Fixed EXP bar by Jerryb1988 from otfans.net
                if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;

                $currentlevel = $player->getLevel();
                $currentexp = $player->getExperience();
                $currentlevelexp = (50 * ($currentlevel - 1) * ($currentlevel - 1) * ($currentlevel - 1) - 150 * ($currentlevel - 1) * ($currentlevel - 1) + 400 * ($currentlevel - 1)) / 3;
                $nextlevel = ($currentlevel + 1);
                $nextlevelexp = (50 * ($currentlevel) * ($currentlevel) * ($currentlevel) - 150 * ($currentlevel) * ($currentlevel) + 400 * ($currentlevel)) / 3;
                $leveldifference = ($nextlevelexp - $currentlevelexp);
                $expremaining = ($nextlevelexp - $currentexp);
                $partofcurrentexp = ($currentexp-$currentlevelexp);
                $expbarpercentage = (($partofcurrentexp / $leveldifference)*100);
                $togopercentage = (100 - $expbarpercentage);
                $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD>EXP:</td><td> ' .number_format($currentexp).'/' .number_format($nextlevelexp).' ('.number_format($expbarpercentage,2).'%) *** '.number_format($expremaining).' EXP (' .number_format($togopercentage,2). '%) Remaining.<div title="'.number_format($expbarpercentage,2).'%" style="width: 100%; height: 3px; border: 1px solid #000;"><div style="background: red; width: '.number_format($expbarpercentage,2).'%; height: 3px;"></td></tr>';
                
                // END *** Fixed EXP bar by Jerryb1988 from otfans.net
            }

            //Outfit shower by Pening edited by loleslav
            // ** ADDED GM/CM/GOD outfits by Jerryb1988 from otfans.net
            if($config['site']['show_outfit']) {
                $id = $player->getCustomField("id");
                if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
                $main_content .= '<TD BGCOLOR="'.$bgcolor.'">Outfit:';
                $listaddon = array('75','128','129','130','131','132','133','134','135','136','137','138','139','140','141','142','143','144','145','146','147','148','149','150','151','152','153','154','155','158','159','251','252','266','268','269','270','273','278','279','288','289','302','324','325');
                $lookadd = array('0','1','2','3');
                foreach ($listaddon as $pid => $name)
                    foreach ($lookadd as $addo => $name) {
                        $addon1 = $SQL->query('SELECT * FROM players WHERE id = '.$id.' AND looktype = '.$listaddon[$pid].' AND lookaddons = '.$lookadd[$addo].';')->fetch();
                        if($addon1[looktype] == true ) {
                            $finaddon = $addon1[looktype] + $addon1[lookaddons] * 300;
                            $main_content .= '<TD style="background-color: '.$bgcolor.'"><img src="images/addons/'.$finaddon.'.gif"/></center></TD></TD>';
                        }
                    }
            }
            //end   Outfit shower by Pening edited by loleslav
            
            // Char Comment
            $comment = $player->getComment();
            $newlines   = array("\r\n", "\n", "\r");
            $comment_with_lines = str_replace($newlines, '<br />', $comment, $count);
            if($count < 50)
                $comment = $comment_with_lines;
            if(!empty($comment))
            {
                if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
                $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD VALIGN=top><b>Comentário:</b></TD><TD>'.$comment.'</TD></TR>';
            }
            $main_content .= '</td></table></td>';
            // END Char Comment

            //modified status scripts by ballack13
            
                    
                    
            
            // Signature by makr0mango.
            if($config['site']['show_signature']) {
                function randomSignature( $folder ) {
                    $files = scandir ( "./$folder/" );
                    $signature = array();

                    foreach ( $files as $file ):
                        if ( substr ( strtolower ( $file ) , -4 ) == ".png" )
                            $signature[] = $file;
                    endforeach;

                    return rand(0,count($signature)-1);
                    }
                    $random = randomSignature("signatures");
                    $main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR='.$config['site']['vdarkborder'].'><TD COLSPAN=2 CLASS=white><B>Signature</B></TD></TR>';
                    $main_content .= "<TR BGCOLOR=".$config['site']['darkborder']."><TD WIDTH=20%>Forum Link:</TD><TD><input type='text' size='75' onclick='this.select();' value='[url=\"http://" . $_SERVER['HTTP_HOST'] . "\"][IMG]http://" . $_SERVER['HTTP_HOST'] . "/signature.php?character=" .$player->getName(). "&image=" . $random . "[/IMG][/url]' /></TD></TR>";
                    $main_content .= "<TR BGCOLOR=".$config['site']['lightborder']."><TD WIDTH=20%>Direct Link:</TD><TD><input type='text' size='75' onclick='this.select();' value='http://" . $_SERVER['HTTP_HOST'] . "/signature.php?character=" .$player->getName(). "&image=" . $random . "' /></TD></TR>";
                    $main_content .= "<TR BGCOLOR=".$config['site']['darkborder']."><TD COLSPAN='2' style='text-align: center;'><img src='signature.php?character=" .$player->getName(). "&image=" . $random . "' /></TD></TR>";
                    $main_content .= '</TD></TR></TABLE>';
                    
            }
            // Signature by makr0mango.
            
            //BEGIN Player advances by jerryb1988 from otfans.net
            if($config['site']['number_of_advances'] > 0) {
                $numadvances = $config['site']['number_of_advances'];
                $advances = 0;
                $player_advances = $SQL->query('SELECT * FROM `player_advances` WHERE `cid` = '.$player->getId().' ORDER BY `time` DESC LIMIT '.$numadvances.';');

                foreach($player_advances as $advance)
                {
                    $skill = $advance['skill'];
                    if ($skill == 0){$skill_name = '<font color=purple><B>Fist</B></font>';}
                    if ($skill == 1){$skill_name = '<font color=purple><B>Club</B></font>';}
                    if ($skill == 2){$skill_name = '<font color=purple><B>Sword</B></font>';}
                    if ($skill == 3){$skill_name = '<font color=purple><B>Axe</B></font>';}
                    if ($skill == 4){$skill_name = '<font color=purple><B>Distance</B></font>';}
                    if ($skill == 5){$skill_name = '<font color=purple><B>Shielding</B></font>';}
                    if ($skill == 6){$skill_name = '<font color=purple><B>Fishing</B></font>';}
                    if ($skill == 7){$skill_name = '<font color=blue><B>Magic</B></font>';}
                    if ($skill == 8){$skill_name = '<font color=red><B>Level</B></font>';}
                
                    if(is_int($advances / 2)) { $bgcolor = $config['site']['lightborder']; } else { $bgcolor = $config['site']['darkborder']; } $advances++;
                    
                    $advances_add_content .= "<tr bgcolor=\"".$bgcolor."\"><td width=\"20%\" align=\"center\"><nobr>".date("j M Y, g:i a", $advance['time'])."</td><td>".$skill_name."</td><td width=75><font color=red><B>".$advance['oldlevel']."</B></font></td><td width=75><font color=green><B>".$advance['newlevel']."</B></font></tr>";
                    
                }

                if($advances > 0)
                    $main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR='.$config['site']['vdarkborder'].'><TD COLSPAN=4 CLASS=white><B>Lastest Skill Advances</B></TD></TR><tr bgcolor='.$config['site']['darkborder'].'><td><b>Time</b></td><td><b>Skill</b></td><td><b>Old Level</b></td><td><b>New Level</b></td></tr>' . $advances_add_content . '</TABLE><br />';
            }
            //END Advances by jerryb1988 from otfans.net
            
            //deaths list



            $deads = 0;
            $player_deaths = $SQL->query('SELECT `id`, `date`, `level` FROM `player_deaths` WHERE `player_id` = '.$player->getId().' ORDER BY `date` DESC LIMIT 0,10;');
            foreach($player_deaths as $death)
            {
                if(is_int($number_of_rows / 2))
                    $bgcolor = $config['site']['darkborder']; else $bgcolor = $config['site']['lightborder'];

                $number_of_rows++; $deads++;
                $dead_add_content .= "<tr bgcolor=\"".$bgcolor."\"><td width=\"20%\" align=\"center\"><nobr>".date("j M Y, g:i a", $death['date'])."</td><td>";
                $killers = $SQL->query("SELECT environment_killers.name AS monster_name, players.name AS player_name, players.deleted AS player_exists FROM killers LEFT JOIN environment_killers ON killers.id = environment_killers.kill_id LEFT JOIN player_killers ON killers.id = player_killers.kill_id LEFT JOIN players ON players.id = player_killers.player_id WHERE killers.death_id = ".$SQL->quote($death['id'])." ORDER BY killers.final_hit DESC, killers.id ASC")->fetchAll();

                $i = 0;
                $count = count($killers);
                foreach($killers as $killer)
                {
                    $i++;
                    if(in_array($i, array(1, $count)))
                        $killer['monster_name'] = str_replace(array("an ", "a "), array("", ""), $killer['monster_name']);

                    if($killer['player_name'] != "")
                    {
                        if($i == 1)
                            $dead_add_content .= "Killed at level <b>".$death['level']."</b> by ";
                        else if($i == $count)
                            $dead_add_content .= " and by ";
                        else
                            $dead_add_content .= ", ";

                        if($killer['monster_name'] != "")
                            $dead_add_content .= $killer['monster_name']." summoned by ";

                        if($killer['player_exists'] == 0)
                            $dead_add_content .= "<a href=\"index.php?subtopic=characters&name=".urlencode($killer['player_name'])."\">";

                        $dead_add_content .= $killer['player_name'];
                        if($killer['player_exists'] == 0)
                            $dead_add_content .= "</a>";
                    }
                    else
                    {
                        if($i == 1)
                            $dead_add_content .= "Morto no Level <b>".$death['level']."</b> por ";
                        else if($i == $count)
                            $dead_add_content .= " e por ";
                        else
                            $dead_add_content .= ", ";

                        $dead_add_content .= $killer['monster_name'];
                    }

                    if($i == $count)
                        $dead_add_content .= ".";
                }

                $dead_add_content .= "</td></tr>";
            }

			if($deads > 0)
				$main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR='.$config['site']['vdarkborder'].'><TD COLSPAN=2 CLASS=white><B>Mortes</B></TD></TR>' . $dead_add_content . '</TABLE>';

			//end
            //frags list by Xampy 
             
            $frags_limit = 5; // frags limit to show? // default: 5 
            $player_frags = $SQL->query('SELECT `player_deaths`.*, `players`.`name`, `killers`.`unjustified` FROM `player_deaths` LEFT JOIN `killers` ON `killers`.`death_id` = `player_deaths`.`id` LEFT JOIN `player_killers` ON `player_killers`.`kill_id` = `killers`.`id` LEFT JOIN `players` ON `players`.`id` = `player_deaths`.`player_id` WHERE `player_killers`.`player_id` = '.$player->getId().' ORDER BY `date` DESC LIMIT 0,'.$frags_limit.';'); 
            if(count($player_frags)) 
            { 
                $frags = 0; 
                $frag_add_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><br><TR BGCOLOR='.$config['site']['vdarkborder'].'><TD COLSPAN=2 CLASS=white><B>Vítimas</B></TD></TR>'; 
                foreach($player_frags as $frag) 
                { 
                $frags++; 
                    if(is_int($number_of_rows / 2)) $bgcolor = $config['site']['darkborder']; else $bgcolor = $config['site']['lightborder']; 
                    $number_of_rows++; 
                    $frag_add_content .= "<tr bgcolor=\"".$bgcolor."\"> 
                    <td width=\"20%\" align=\"center\">".date("j M Y, H:i", $frag['date'])."</td> 
                    <td>".(($player->getSex() == 0) ? 'Ela' : 'Ele')." matou <a href=\"index.php?subtopic=characters&name=".$frag[name]."\">".$frag[name]."</a> no Level ".$frag[level].""; 
 
                    $frag_add_content .= ". (".(($frag[unjustified] == 0) ? "<font size=\"1\" color=\"green\">Justificado</font>" : "<font size=\"1\" color=\"red\">Injustificado</font>").")</td></tr>"; 
                } 
            if($frags >= 1) 
                $main_content .= $frag_add_content . '</TABLE>'; 
            } 
            // end of frags list by Xampy  
            //end DEATHS
            
          
            if(!$player->getHideChar()) {
                $main_content .= '<TABLE BORDER=0><TR><TD></TD></TR></TABLE><TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR='.$config['site']['vdarkborder'].'><TD COLSPAN=2 CLASS=white><B>Informações da Conta</B></TD></TR>';
                if($account->getRLName())
                {
                    if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
                    $main_content .= '<TR BGCOLOR='.$config['site']['lightborder'].'><TD WIDTH=20%><b>Nome Verdadeiro:</b></TD><TD>'.$account->getRLName().'</TD></TR>';
                }
                if($account->getLocation())
                {
                    if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
                    $main_content .= '<TR BGCOLOR='.$config['site']['darkborder'].'><TD WIDTH=20%><b>Mora Em:</b></TD><TD>'.$account->getLocation().'</TD></TR>';
                }
                if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
                if($account->getLastLogin())
                    $main_content .= '<TR BGCOLOR='.$config['site']['lightborder'].'><TD WIDTH=20%><b>Ultima Visita:</b></TD><TD>'.date("j F Y, g:i a", $account->getLastLogin()).'</TD></TR>';
                else
                    $main_content .= '<TR BGCOLOR='.$config['site']['lightborder'].'><TD WIDTH=20%><b>Ultima Visita:</b></TD><TD>Nun nos visitou.</TD></TR>';
                if($account->getCreated())
                {
                    if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
                    $main_content .= '<TR BGCOLOR='.$config['site']['darkborder'].'><TD WIDTH=20%><b>Criada em:</b></TD><TD>'.date("j F Y, g:i a", $account->getCreated()).'</TD></TR>';
                }
                if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['lightborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
                
                if($account->isBanned())
                    if($account->getBanTime() > 0)
                        $main_content .= '<font color="red"> [Banished until '.date("j F Y, G:i", $account->getBanTime()).']</font>';
                    else
                        $main_content .= '<font color="red"> [Banished FOREVER]</font>';
                $main_content .= '</TD></TR></TABLE>';
                $main_content .= '<br><TABLE BORDER=0><TR><TD></TD></TR></TABLE><TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR='.$config['site']['vdarkborder'].'><TD COLSPAN=5 CLASS=white><B>Outros Personagens</B></TD></TR>
                <TR BGCOLOR='.$config['site']['darkborder'].'><TD><B>Nome</B></TD><TD><B>Mundo</B></TD><TD><B>Level</B></TD><TD><b>Status</b></TD><TD><B>*</B></TD></TR>';
                $account_players = $account->getPlayersList();
                $account_players->orderBy('name');
                $player_number = 0;
                foreach($account_players as $player_list)
                {
                    if(!$player_list->getHideChar())
                    {
                        $player_number++;
                        if(is_int($player_number / 2))
                            $bgcolor = $config['site']['darkborder'];
                        else
                            $bgcolor = $config['site']['lightborder'];
                        if(!$player_list->isOnline())
                            $player_list_status = '<font color="red">Deslogado</font>';
                        else
                            $player_list_status = '<font color="green">Logado</font>';
                        $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD WIDTH=52%><NOBR><a href="?subtopic=characters&name='.urlencode($player_list->getName()).'">'.$player_list->getName();
                        $main_content .= ($player_list->isDeleted()) ? '<font color="red"> [DELETED]</font>' : '';
                        $main_content .= '</NOBR></TD><TD WIDTH=15%>'.$config['site']['worlds'][$player_list->getWorld()].'</TD><TD WIDTH=25%>'.$player_list->getLevel().' '.$vocation_name[$player_list->getWorld()][$player_list->getPromotion()][$player_list->getVocation()].'</TD><TD WIDTH="8%"><b>'.$player_list_status.'</b></TD><TD><TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0><FORM ACTION="?subtopic=characters" METHOD=post><TR><TD><INPUT TYPE=hidden NAME=name VALUE="'.$player_list->getName().'"><INPUT TYPE=image NAME="View '.$player_list->getName().'" ALT="View '.$player_list->getName().'" SRC="'.$layout_name.'/images/buttons/sbutton_view.gif" BORDER=0 WIDTH=120 HEIGHT=18></TD></TR></FORM></TABLE></TD></TR>';
                    }
                }
                $main_content .= '</TABLE></TD><TD><IMG SRC="'.$layout_name.'/images/general/blank.gif" WIDTH=10 HEIGHT=1 BORDER=0></TD></TR></TABLE>';
            }
            $main_content .= '<BR><BR><FORM ACTION="?subtopic=characters" METHOD=post><TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4><TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" CLASS=white><B>Procurar Mais Personagens</B></TD></TR><TR><TD BGCOLOR="'.$config['site']['darkborder'].'"><TABLE BORDER=0 CELLPADDING=1><TR><TD>Nome:</TD><TD><INPUT NAME="name" VALUE=""SIZE=29 MAXLENGTH=29></TD><TD><INPUT TYPE=image NAME="Submit" SRC="'.$layout_name.'/images/buttons/sbutton_submit.gif" BORDER=0 WIDTH=120 HEIGHT=18></TD></TR></TABLE></TD></TR></TABLE></FORM>';
            $main_content .= '</TABLE>';
        }
        else
            $search_errors[] = 'Character <b>'.$name.'</b> does not exist.';
    }
    else
        $search_errors[] = 'This name contains invalid letters. Please use only A-Z, a-z and space.';
    if(!empty($search_errors))
    {
        $main_content .= '<div class="SmallBox" >  <div class="MessageContainer" >    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div>    <div class="BoxFrameEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="BoxFrameEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="ErrorMessage" >      <div class="BoxFrameVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div>      <div class="BoxFrameVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div>      <div class="AttentionSign" style="background-image:url('.$layout_name.'/images/content/attentionsign.gif);" /></div><b>The Following Errors Have Occurred:</b><br/>';
        foreach($search_errors as $search_error)
            $main_content .= '<li>'.$search_error;
        $main_content .= '</div>    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div>    <div class="BoxFrameEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="BoxFrameEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>  </div></div><br/>';
        $main_content .= '<BR><FORM ACTION="?subtopic=characters" METHOD=post><TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4><TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" CLASS=white><B>Search Character</B></TD></TR><TR><TD BGCOLOR="'.$config['site']['darkborder'].'"><TABLE BORDER=0 CELLPADDING=1><TR><TD>Name:</TD><TD><INPUT NAME="name" VALUE=""SIZE=29 MAXLENGTH=29></TD><TD><INPUT TYPE=image NAME="Submit" SRC="'.$layout_name.'/images/buttons/sbutton_submit.gif" BORDER=0 WIDTH=120 HEIGHT=18></TD></TR></TABLE></TD></TR></TABLE></FORM>';
    }
}
?> 