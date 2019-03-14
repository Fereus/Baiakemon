<?php
if(!$logged)
if($action == "logout")
$main_content .= '<div class="TableContainer" > <table class="Table1" cellpadding="0" cellspacing="0" > <div class="CaptionContainer" > <div class="CaptionInnerContainer" > <span class="CaptionEdgeLeftTop" style="background-image:url(tibiacom/images/content/box-frame-edge.gif);" /></span> <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span> <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span> <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span> <div class="Text" >Logout Successful</div> <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span> <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span> <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span> <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span> </div> </div> <tr> <td> <div class="InnerTableContainer" > <table style="width:100%;" ><tr><td>You have logged out of your '.$config['server']['serverName'].' account. In order to view your account you need to <a href="?subtopic=accountmanagement" >log in</a> again.</td></tr> </table> </div> </table></div></td></tr>';
else
$main_content .= 'Digite sua conta e sua senha para logar.<br/><a href="?subtopic=createaccount" >Cria Sua Conta</a> Caso Você não tenha criado ainda.<br/><br/><form action="?subtopic=accountmanagement" method="post" ><div class="TableContainer" > <table class="Table1" cellpadding="0" cellspacing="0" > <div class="CaptionContainer" > <div class="CaptionInnerContainer" > <span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span> <span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span> <span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span> <span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span> <div class="Text" >Account Login</div> <span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></span> <span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/content/table-headline-border.gif);" ></span> <span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span> <span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></span> </div> </div> <tr> <td> <div class="InnerTableContainer" > <table style="width:100%;" ><tr><td class="LabelV" ><span >Account Name:</span></td><td style="width:100%;" ><input type="password" name="account_login" SIZE="10" maxlength="10" ></td></tr><tr><td class="LabelV" ><span >Password:</span></td><td><input type="password" name="password_login" size="30" maxlength="29" ></td></tr> </table> </div> </table></div></td></tr><br/><table width="100%" ><tr align="center" ><td><table border="0" cellspacing="0" cellpadding="0" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Submit" alt="Submit" src="'.$layout_name.'/images/buttons/_sbutton_submit.gif" ></div></div></td><tr></form></table></td><td><table border="0" cellspacing="0" cellpadding="0" ><form action="?subtopic=lostaccount" method="post" ><tr><td style="border:0px;" ><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Account lost?" alt="Account lost?" src="'.$layout_name.'/images/buttons/_sbutton_accountlost.gif" ></div></div></td></tr></form></table></td></tr></table>';
else
{
$main_content .= '   
<br><table width="100%" border="2" cellpadding="4" cellspacing="1"> 
<tbody><tr> 
  <td class="white" colspan="3" bgcolor="#505050"><span class="style4">Detalhes dos Points.</span></td> 
 
</tr> 
<tr bgcolor="#f1e0c6"><td width="35%"><b>Quantidade de Points</b></td><td width="35%"><b>Valor da Doação</b></td></tr> 
<tr bgcolor="#d4c0a1"><td><img src="./layouts/tibiacom/images/content/bullet.gif"> 5 Points</td><td>R$5,00</td></tr> 
 
<tr bgcolor="#f1e0c6"><td><img src="./layouts/tibiacom/images/content/bullet.gif"> 10 Points</td><td>R$10,00</td></tr> 
<tr bgcolor="#d4c0a1"><td><img src="./layouts/tibiacom/images/content/bullet.gif"> 20 Points</td><td>R$20,00</td></tr> 
<tr bgcolor="#f1e0c6"><td><img src="./layouts/tibiacom/images/content/bullet.gif"> 40 Points</td><td>R$40,00</td></tr> 
<tr bgcolor="#d4c0a1"><td><img src="./layouts/tibiacom/images/content/bullet.gif"> 60 Points</td><td>R$60,00</td></tr> 
<tr bgcolor="#f1e0c6"><td><center><img src="./layouts/tibiacom/images/content/bullet.gif"> E assim por diante!!! <img src="./layouts/tibiacom/images/content/bullet.gif"></center></td><td><center><img src="./layouts/tibiacom/images/content/bullet.gif"> E assim por diante!!! <img src="./layouts/tibiacom/images/content/bullet.gif"></center></td></tr> 
</tbody></table> 
<br></br>
<table border="2"><tbody><tr border="2"><td bgcolor="#505050"> 
<center><font size="2"><b></b></font></center>
<div style="width: 0%">
<form method="post" target="_new" action="https://pagseguro.uol.com.br/security/webpagamentos/webpagto.aspx" name="LOGIN" class="formulario" style="width: 450px; margin: 0 0 10px 0; float: left;">
<p>
<input type="hidden" name="email_cobranca" value="SEU-EMAIL PAG SEGURO AQUI">
<input type="hidden" name="tipo" value="CP"> 
<input type="hidden" name="moeda" value="BRL"> 
<input type="hidden" name="item_id_1" value="2000050"> 
<br><table border="2"><tbody><tr border="2"><td bgcolor="#505050" class="white"><strong>Nome do Seu Character (Sem erro):</strong></td></tr></tbody></table> 
<table border="2"><tbody><tr border="2"><td bgcolor="grey"><input type="text" name="item_descr_1"></td></tr></tbody></table><br> 
<input type="hidden" name="item_quant_1" value="1"> 
<br><table border="2"><tbody><tr border="2"><td width="153" bgcolor="#505050" class="white"><span class="style11 style4"><strong>Valor do pagamento:</strong></span></td>
</tr></tbody></table> 
<table border="0"><tbody><tr border="2">
  <td width="96" bgcolor="grey"><label>
    <select name="item_valor_1" id="item_valor_1" tabindex="2">
      <option selected>Selecione</option>
      <option value="5,00">5 Points</option>
      <option value="10,00">10 Points</option>
      <option value="20,00">20 Points</option>
      <option value="30,00">30 Points</option>
      <option value="40,00">40 Points</option>
      <option value="50,00">50 Points</option>
      <option value="60,00">60 Points</option>
      <option value="70,00">70 Points</option>
      <option value="80,00">80 Points</option>
      <option value="90,00">90 Points</option>
      <option value="100,00">100 Points</option>
      <option value="110,00">110 Points</option>
      <option value="120,00">120 Points</option>
      <option value="130,00">130 Points</option>
      <option value="140,00">140 Points</option>
      <option value="150,00">150 Points</option>
                                </select>
  </label></td>
</tr></tbody></table>
</td>
</tr>
<br> 
<br> 
<input type="hidden" name="item_frete_1" value="000"> 
<br> 
<table border="2"><tbody><tr border="2"><td bgcolor="#505050"><input type="submit" value="Finalizar Compra"></td></tr></tbody></table> 
</p>

<div></div> 
<tr>
</tr>
</tbody></table></form>
<br></br><br></br><b><font size="1">Pelo PagSeguro é possível realizar doações por Boletos Bancários, Cartões de credito e Transferências entre contas PagSeguro. Após efetuar a doação aguarde o prazo de 24/48hrs para a conclusão da sua doação.Os Coins serão entregues dentro do prazo definido ou após a aprovação do pagamento no PagSeguro.</b></font>'; } ?> 