<?PHP
$woe = $SQL->query("
	SELECT w.id AS id, w.time AS time, g.name AS guild, p.name AS name, w.started AS start, w.guild AS guild_id
		FROM woe AS w
	INNER JOIN players AS p
		ON p.id = w.breaker
	INNER JOIN guilds AS g
		ON g.id = w.guild
	ORDER BY id DESC LIMIT 10;	
");

foreach ($woe as $k=>$v) {
	$winners .="
		<TR BGCOLOR=\"".$config['site'][($k % 2 == 1 ? 'light' : 'dark').'border']."\">
			<TD>{$v[id]}</TD>
			<TD><a href='index.php?subtopic=guilds&action=show&guild=" . $v[guild_id] . "'>$v[guild]</a></TD>
			<TD>{$v[name]}</TD>
			<TD>" . date("d/m/y   H:i:s", $v[start]) . "</TD>
			<TD>" . date("d/m/y   H:i:s", $v[time]) . "</TD>
		</TR>
	";
}

$main_content .='<center><h1>Castle Domain</h1>';

if(!$winners) {
	$main_content .= '
		<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%>
			<TR BGCOLOR="'.$config['site']['vdarkborder'].'">
				<TD CLASS=white>
					<B>Winners of Castle Domain</B>
				</TD>
			</TR>
			<TR BGCOLOR='.$config['site']['darkborder'].'>
				<TD>
					no Castle Domain in '.$config['server']['serverName'].' yet.
				</TD>
			</TR>
		</TABLE>
	';
} else {
	$main_content .= "
		<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%>
			<TR BGCOLOR=\"{$config['site']['vdarkborder']}\">
				<TD CLASS=white width=5%>
					<B>No.</B>
				</TD>
				<TD CLASS=white width=30%>
					<B>Guild Vencedora</B>
				</TD>
				<TD CLASS=white width=25%>
					<B>Conquistado por</B>
				</TD>
				<TD CLASS=white width=20%>
					<B>Iniciado</B>
				</TD>
				<TD CLASS=white width=20%>
					<B>Conquista Finalizada</B>
				</TD>
			</TR>
			$winners
		</TABLE>
	";
}

$main_content .= '
<br>
<table width="100%" cellspacing="1" cellpadding="6">
	<tr widht="100%" bgcolor="'.$config['site']['vdarkborder'].'">
		<th align="center">Informa&ccedil;&otilde;es do Castle</th>
	</tr>
	<tr widht="100%" bgcolor="'.$config['site']['lightborder'].'">
		<td><font color="red"><b>Morrer no Castle n&atilde;o perde EXP, SKILLS, ML e nem ITENS.</b></font></td>
	</tr>
	<tr widht="100%" bgcolor="'.$config['site']['lightborder'].'">
		<td><b>A guild que ter o dom&iacute;nio do castelo ter&aacute; acesso as hunts localizadas dentro do pr&oacute;prio castelo, as hunts d&atilde;o 20% a mais de EXP.</b></td>
	</tr>
	<tr widht="100%" bgcolor="'.$config['site']['darkborder'].'">
		<td>&Eacute um evento que ocorre Quartas, Sextas e Domingos as 19:00 Horas, no qual as Guilds tentam dominar o castelo destruindo seus Geradores.</td>
	</tr>
	<tr widht="100%" bgcolor="'.$config['site']['lightborder'].'">
		<td>Primeiro, &eacute; obrigatorio ter guild, depois &eacute; s&oacute; registra-la usando o comando <b>!guildjoin</td>
	</tr>
	<tr widht="100%" bgcolor="'.$config['site']['darkborder'].'">
		<td>Durante 1 Hora, as guilds tem que tentar tomar o m&aacute;ximo de controle do castelo Ruthenburg. Apo&oacute;s uma das guilds ter destru&iacute;do o &uacute;ltimo gerador, ela ter&aacute; que defender o seu dom&iacute;nio no castelo evitando que outras guilds destruam o &uacute;ltimo Gerador novamente, isso durante o tempo restante do castelo. Para ajudar na defesa do castelo o lider da guild poder&aacute; puxar uma alavanca localizada logo acima do &uacute;ltimo gerador que ir&aacute; summonar 7 guardi&otilde;es, isso custar&aacute; 1kk.</td>
	</tr>
	<tr widht="100%" bgcolor="'.$config['site']['lightborder'].'">
		<td>Sempre que o evento come&ccedil;ar o teleporte no templo de Baiak City ao <u>lado</u> do "NPC <b>Central de Informacoes</b>" mudar&aacute; de cor.</td>
	</tr>
	<tr widht="100%" bgcolor="'.$config['site']['darkborder'].'">
		<td>Para tomar controle do castle a guild ter&aacute; que destruir 3 Geradores localizados dentro do castelo, ap&oacute;s destruir os 2 primeiros geradores &agrave; Leste e Oeste, aparecer&aacute; 2 teleportes ao Norte e dar&aacute; acesso ao &uacute;ltimo Gerador.</td>
	</tr>
	<tr widht="100%" bgcolor="'.$config['site']['darkborder'].'">
		<td>
		Comandos &uacute;teis no castelo:
		<ul>
		<li>
		<b>!recall</b> s&oacute; pode ser executado pelo l&iacute;der da guild e cada 5 minutos, teletransporta todos os membros da guilda online ao lado dele.
		</li>
		<li>
		<b>/woe info</b> ver quanto tempo resta e quem est&aacute; dominando o castelo atualmente.
		</li>
		</td>
	</tr>
</table>
</center>
<br>
<p align="right"><b>Page Castle By <a href="mailto:fabiohenriquerodriques@hotmail.com">Fabinho</a></p></b>
';
?>