<?php
	$iptunnel = 'tunnel.draconiaworld.servegame.com';
	$main_content .= '
	
	<h1><center><b>Draconia Tibia Tunnel</h1></center></b>
	
	<table width="100%" cellspacing=1 cellpadding=4 border="0">
		<tr bgcolor="'.$config['site']['vdarkborder'].'">
    <th align="left">Tibia Tunnel</th>
		</tr>
	</table>
	
	<table width="100%" cellspacing=1 cellpadding=4 border="0">
		<tr width="100%" bgcolor="'.$config['site']['darkborder'].'">
	<td width="10%" align="left">
	<img src="images/falconia/tibiatunnel.gif"></img>
	</td>
	
	<td width="90%" align="righ">
	<a href="http://www.megaupload.com/?d=DWROH15X" target="_blank">Draconia Tibia Tunnel Download</a>
	</td>
		</tr>
	</table>
	
	<table width="100%" cellspacing=1 cellpadding=4 border="0">
		<tr width="100%" bgcolor="'.$config['site']['darkborder'].'">
		<td width="100%" align="left">
		<ul>
		<li>
		<b>Servidor: <font color="green">'.$iptunnel.'</font></b>
		</li>
		<li>
		<b>Usu&aacute;rio: <font color="green">tunnel</font></b>
		</li>
		<li>
		<b>Senha: <font color="green">tunnel</font></b>
		</li>
		</ul>
		</td>
		</tr>
	</table>
	
	<table width="100%" cellspacing=1 cellpadding=4 border="0">
		<tr width="100%" bgcolor="'.$config['site']['lightborder'].'">
	<td width="100%" align="left">
	<ul>
	<li>
	Draconia Tibia Tunnel &eacute; um sistema que tem como objetivo principal diminuir o lag.
	</li>
	<li>
	Os dados do jogo s&atilde;o enviados para um servidor de Proxy, onde s&atilde;o encaminhados para o servidor do jogo em uma rota otimizada e descongestionada. O servidor do jogo tamb&eacute;m envia os dados para o servidor de Proxy onde os dados s&atilde;o enviados de volta para voc&ecirc;. 
	</li>
	<li>
	O Draconia Tibia Tunnel usa o sistema de encripta&ccedil;&atilde;o em SSH e te dar total seguran&ccedil;a com o envio e recebimento de dados.
	</ul>
	</td>
		</tr>
	</table>
	
	<table width="100%" cellspacing=1 cellpadding=4 border="0">
	<tr width="100%" bgcolor="'.$config['site']['darkborder'].'">
	<td width="100%" align="center">
	<a href="?subtopic=tunnel&action=tutorial"> -> Tutorial de Como Usar o Draconia Tibia Tunnel <- </a>
	</td>
	</tr>
	</table>
	';
	
	if($action == "tutorial")
           {
			$main_content .= '
	
	<h1><center><b>Tibia Tunnel Tutorial</h1></center></b>
	
	<table width="100%" cellspacing=1 cellpadding=4 border="0">
		<tr bgcolor="'.$config['site']['vdarkborder'].'">
			<th align="left">Abra o arquivo Draconia Tibia Tunnel.exe</th>
		</tr>
		<tr bgcolor="'.$config['site']['darkborder'].'">
			<td width="100%" align="center"><img src="images/falconia/tunnel.jpg"></img></td>
		</tr>
	</table>
	<br>
		<hr width="100%"></hr>
	<br>
	<table width="100%" cellspacing=1 cellpadding=4 border="0">
		<tr bgcolor="'.$config['site']['vdarkborder'].'">
			<th align="left">Ap&oacute;s instalado abra o TibiaTunnel Client</th>
		</tr>
		<tr bgcolor="'.$config['site']['darkborder'].'">
			<td width="100%" align="center"><img src="images/falconia/tunnel1.jpg"></img></td>
		</tr>
	</table>
	<br>
		<hr width="100%"></hr>
	<br>
	<table width="100%" cellspacing=1 cellpadding=4 border="0">
		<tr bgcolor="'.$config['site']['vdarkborder'].'">
			<th align="left">Aparecer&aacute; essa janela</th>
		</tr>
		<tr bgcolor="'.$config['site']['darkborder'].'">
			<td width="100%" align="center"><img src="images/falconia/tunnel2.jpg"></img></td>
		</tr>
	</table>
	<br>
		<hr width="100%"></hr>
	<br>
	<table width="100%" cellspacing=1 cellpadding=4 border="0">
		<tr bgcolor="'.$config['site']['vdarkborder'].'">
			<th align="left">Selecione Servidor Privado</th>
		</tr>
		<tr bgcolor="'.$config['site']['darkborder'].'">
			<td width="100%" align="center"><img src="images/falconia/tunnel3.jpg"></img></td>
		</tr>
	</table>
	<br>
		<hr width="100%"></hr>
	<br>
	<table width="100%" cellspacing=1 cellpadding=4 border="0">
		<tr bgcolor="'.$config['site']['vdarkborder'].'">
			<th align="left">Modifique, servidor: '.$iptunnel.', usu&aacute;rio: tunnel, senha: tunnel</th>
		</tr>
		<tr bgcolor="'.$config['site']['darkborder'].'">
			<td width="100%" align="center"><img src="images/falconia/tunnel4.jpg"></img></td>
		</tr>
	</table>
	<br>
		<hr width="100%"></hr>
	<br>
	<table width="100%" cellspacing=1 cellpadding=4 border="0">
		<tr bgcolor="'.$config['site']['vdarkborder'].'">
			<th align="left">Se aparecer essa janela clique em SIM/YES</th>
		</tr>
		<tr bgcolor="'.$config['site']['darkborder'].'">
			<td width="100%" align="center"><img src="images/falconia/tunnel5.jpg"></img></td>
		</tr>
	</table>
	<br>
		<hr width="100%"></hr>
	<br>
	<table width="100%" cellspacing=1 cellpadding=4 border="0">
		<tr bgcolor="'.$config['site']['vdarkborder'].'">
			<th align="left">Pronto. Conectado !</th>
		</tr>
		<tr bgcolor="'.$config['site']['darkborder'].'">
			<td width="100%" align="center"><img src="images/falconia/tunnel6.jpg"></img></td>
		</tr>	
	</table>
	
	';
		   }
		   
	$main_content .= '<p align="right">Page Coded By <a href="mailto:fabiohenriquerodriques@hotmail.com">Fabinho</a></p>';
	
?>