<?PHP
	//Script 100% By Fabinho
	$main_content .= '
	<center><h1>Calend&aacute;rio de Eventos</center></h1>
	';
	
	$main_content .= '
	<table border="0" cellspacing=1 cellpadding=4 width="100%">
	<tr bgcolor="'.$config['site']['vdarkborder'].'">
	<th width="100%"><font class=black><b>Calend&aacute;rio</b></font></th>
	</tr>
	</table>
	<table border="0" cellspacing=1 cellpadding=4 width="100%">
	<tr>
	<td bgcolor="'.$config['site']['darkborder'].'" witdh="2%"><center><b>Segunda-Feira</center></b></td>
	<td bgcolor="'.$config['site']['darkborder'].'" witdh="2%"><center><b>Ter&ccedil;a-Feira</center></b></td>
	<td bgcolor="'.$config['site']['darkborder'].'" witdh="2%"><center><b>Quarta-Feira</center></b></td>
	<td bgcolor="'.$config['site']['darkborder'].'" witdh="2%"><center><b>Quinta-Feira</center></b></td>
	<td bgcolor="'.$config['site']['darkborder'].'" witdh="2%"><center><b>Sexta-Feira</center></b></td>
	<td bgcolor="'.$config['site']['darkborder'].'" witdh="2%"><center><b>S&aacute;bado</center></b></td>
	<td bgcolor="'.$config['site']['darkborder'].'" witdh="2%"><center><b>Domingo</center></b></td>
	</tr>
	<tr>
	<td bgcolor="'.$config['site']['lightborder'].'" witdh="2%"><center><b>Dota</center></b></td>
	<td bgcolor="'.$config['site']['lightborder'].'" witdh="2%"><center><b>Coliseum</center></b></td>
	<td bgcolor="'.$config['site']['lightborder'].'" witdh="2%"><center><b>Castle</center></b></td>
	<td bgcolor="'.$config['site']['lightborder'].'" witdh="2%"><center><b>Coliseum ou Dota</center></b></td>
	<td bgcolor="'.$config['site']['lightborder'].'" witdh="2%"><center><b>Castle</center></b></td>
	<td bgcolor="'.$config['site']['lightborder'].'" witdh="2%"><center><b>Coliseum ou Dota</center></b></td>
	<td bgcolor="'.$config['site']['lightborder'].'" witdh="2%"><center><b>Castle</center></b></td>
	</tr>
	<tr>
	<td bgcolor="'.$config['site']['lightborder'].'" witdh="2%"><center><b>14:00 ou 20:00 Hrs</center></b></td>
	<td bgcolor="'.$config['site']['lightborder'].'" witdh="2%"><center><b>14:00 ou 20:00 Hrs</center></b></td>
	<td bgcolor="'.$config['site']['lightborder'].'" witdh="2%"><center><b>19:00 Hrs</center></b></td>
	<td bgcolor="'.$config['site']['lightborder'].'" witdh="2%"><center><b>14:00 ou 20:00 Hrs</center></b></td>
	<td bgcolor="'.$config['site']['lightborder'].'" witdh="2%"><center><b>19:00 Hrs</center></b></td>
	<td bgcolor="'.$config['site']['lightborder'].'" witdh="2%"><center><b>14:00 ou 20:00 Hrs</center></b></td>
	<td bgcolor="'.$config['site']['lightborder'].'" witdh="2%"><center><b>19:00 Hrs</center></b></td>
	</tr>
	</table>
	<table border="0" cellspacing=1 cellpadding=4 width="100%">
	<tr bgcolor="'.$config['site']['vdarkborder'].'">
	<td width="100%"></td>
	</tr>
	</table>
	<br>
	';
	
	$main_content.='
	<table border="0" cellspacing=1 cellpadding=4 width="100%">
	<tr bgcolor="'.$config['site']['vdarkborder'].'">
	<th width="100%"><font class=black>Observa&ccedil;&otilde;es</b></th>
	</tr>
	</table>
	<table border="0" cellspacing=1 cellpadding=4 width="100%">
	<tr bgcolor="'.$config['site']['darkborder'].'">
	<td width="100%"><ul><li>O hor&aacute;rio dos eventos n&atilde;o s&atilde;o 100% precisos, se caso n&atilde;o ocorra o evento no dia e por que n&atilde;o tinha nenhum <b>Administrador</b> online naquele momento para administrar o evento.</li></ul></td>
	</tr>
	<tr bgcolor="'.$config['site']['darkborder'].'">
	<td width="100%"><ul><li>O evento <b>Castle</b> &eacute; automatico, se caso ele n&atilde;o se iniciar na hora marcada no calend&aacute;rio, poste no forum pois poder&aacute; ser um bug !</li></ul></td>
	</tr>
	</table>
	';

?>
