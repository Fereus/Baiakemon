<?PHP 
$main_content .= '  <form name="form1" method="post" action="donate/gravar.php"> 
</SCRIPT> 
<FIELDSET id=fieldcontato><LEGEND><STRONG>Formulario</STRONG> </LEGEND> 
<FORM id=form1 method=post name=form1> 
<TABLE border=0 cellSpacing=3 cellPadding=3 width=500> 
<TBODY> 
<TR> 
<TD width="29%"><STRONG>Pago via</STRONG></TD> 
<TD width="71%"><LABEL><SELECT id=assunto name=assunto> <OPTION selected>Pagseguro (Boleto, Cartao de Credito e etc)</OPTION> <OPTION>Santander</OPTION></SELECT> </LABEL></TD></TR> 
<TR></TD> 
<TD height=20 vAlign=center colSpan=2> 
<HR color=#c0c0c0 noShade> 
</TD></TR> 
<TR> 
<TD><STRONG>Nome</STRONG></TD> 
<TD><SPAN id=nome><LABEL><INPUT id=nome maxLength=40 size=25 name=nome> </LABEL><SPAN class=textfieldRequiredMsg><FONT size=1>Digite seu nome completo.</FONT></SPAN></SPAN></TD></TR> 
<TR></TD> 
<TD height=20 vAlign=center colSpan=2> 
<HR color=#c0c0c0 noShade> 
</TD></TR> 
<TR> 
<TD><STRONG>Email da sua Account</STRONG></TD> 
<TD><SPAN id=email><LABEL><INPUT id=email size=25 name=email> </LABEL><SPAN class=textfieldRequiredMsg><FONT size=1>Digite o email da sua conta.</FONT></SPAN><SPAN class=textfieldInvalidFormatMsg></SPAN></SPAN></TD></TR> 
<TR></TD> 
<TD height=20 vAlign=center colSpan=2> 
<HR color=#c0c0c0 noShade> 
</TD></TR> 
<TR> 
<TD><STRONG>Sua Account</STRONG></TD> 
<TD><SPAN id=conta><LABEL><INPUT id=account maxLength=25 size=25 name=account> </LABEL><SPAN class=textfieldRequiredMsg><FONT size=1>Digite sua conta.</FONT></SPAN><SPAN class=textfieldInvalidFormatMsg></SPAN></SPAN></TD></TR> 
<TR></TD> 
<TD height=20 vAlign=center colSpan=2> 
<HR color=#c0c0c0 noShade> 
</TD></TR> 
<TR> 
<TD><STRONG>Personagem</STRONG></TD> 
<TD><SPAN id=personagem><LABEL><INPUT id=personagem size=25 name=personagem> </LABEL><SPAN class=textfieldRequiredMsg><FONT size=1>Digite seu personagem.</FONT></SPAN></SPAN></TD></TR> 
<TR></TD> 
<TD height=20 vAlign=center colSpan=2> 
<HR color=#c0c0c0 noShade> 
</TD></TR> 
<TR></TR> 
<TR> 
<TD><STRONG>Valor da doacao</STRONG></TD> 
<TD><SPAN id=valor><LABEL><INPUT id=valor maxLength=5 size=25 name=valor> <SPAN class=textfieldRequiredMsg><FONT size=1>Exemplo: 12,50</FONT></SPAN></SPAN></LABEL></TD></TR> 
<TR></TD> 
<TD height=20 vAlign=center colSpan=2> 
<HR color=#c0c0c0 noShade> 
</TD></LABEL></TR> 
<TR> 
<TD><STRONG>Data do deposito</STRONG></TD> 
<TD><SPAN id=data><LABEL><INPUT id=data maxLength=10 size=25 name=data> </LABEL><SPAN class=textfieldRequiredMsg><FONT size=1>Exemplo: 15/07/2009</FONT></SPAN><SPAN class=textfieldInvalidFormatMsg></SPAN></SPAN></TD></TR> 
<TR></TD> 
<TD height=20 vAlign=center colSpan=2> 
<HR color=#c0c0c0 noShade> 
</TD></TR> 
<TR> 
<TD><STRONG>Hora do deposito</STRONG></TD> 
<TD><SPAN id=hora><LABEL><INPUT id=hora maxLength=5 size=25 name=hora> </LABEL><SPAN class=textfieldRequiredMsg><FONT size=1>Exemplo: 14:20</FONT></SPAN><SPAN class=textfieldInvalidFormatMsg></SPAN></SPAN></TD></TR> 
<TR></TD> 
<TD height=20 vAlign=center colSpan=2> 
<HR color=#c0c0c0 noShade> 
</TD></TR> 
<TR> 
<TR> 
<TD><STRONG>Codigo PagSeguro</STRONG></TD> 
<TD><SPAN id=Codigo><LABEL><INPUT id=hora maxLength=44 size=25 name=hora> </LABEL><SPAN class=textfieldRequiredMsg><FONT size=1>Exemplo: 8FE9B3BC-6BB3-495E-9EE5-2835FF8729FF</FONT></SPAN><SPAN class=textfieldInvalidFormatMsg></SPAN></SPAN></TD></TR> 
<TR></TD> 
<TD height=20 vAlign=center colSpan=2> 
<HR color=#c0c0c0 noShade> 
</TD></TR> 
<TR> 
<TD><STRONG>Imagem do comprovante</STRONG><BR><FONT color=red>(Apenas por Deposito)</FONT></TD> 
<TD><LABEL><INPUT id=imagem size=25 name=imagem> <BR> 
<H5>Hospede a foto do seu comprovante no <A href="http://www.imageshack.us" target=_blank>ImageShack</A></H5></LABEL></TD></TR> 
<TR></TD> 
<TD height=20 vAlign=center colSpan=2> 
<HR color=#c0c0c0 noShade> 
</TD></TR> 
<TR> 
<TD>&nbsp;</TD></TR></TBODY></TABLE> 
<P><INPUT value=Enviar type=submit name=enviar> <INPUT value=Limpar type=reset name=limpar></P></FORM></FIELDSET><BR> 
<H3>Duvidas.</H3><FONT color=red>Apos efetuar o pagamento entre no site e clica Confirmar pagamento e coloca os dado do comprovante i espere ate seus points ser liberados<br>Prazo maximo de liberacao e de 4 Horas apos a confirmacao do pagamento ou mande um email para baiakciteronwar@hotmail.com (mande o nome do char o comprovante etc tudo que tem que mandar)<br>Por email a liberacao e mais rapida.<BR></FONT> 

<script type=text/javascript> 
<!-- 
var sprytextfield1 = new Spry.Widget.ValidationTextField("nome", "none", {validateOn:["blur", "change"]}); 
var sprytextfield2 = new Spry.Widget.ValidationTextField("email", "email", {validateOn:["blur", "change"]}); 
var sprytextarea1 = new Spry.Widget.ValidationTextarea("dados", {validateOn:["blur", "change"]}); 
var sprytextfield3 = new Spry.Widget.ValidationTextField("conta", "integer", {validateOn:["blur", "change"]}); 
var sprytextfield4 = new Spry.Widget.ValidationTextField("personagem", "none", {validateOn:["blur", "change"]}); 
var sprytextfield5 = new Spry.Widget.ValidationTextField("data", "date", {format:"dd/mm/yyyy", validateOn:["blur"]}); 
var sprytextfield6 = new Spry.Widget.ValidationTextField("valor", "integer", {validateOn:["blur", "change"]}); 
var sprytextfield7 = new Spry.Widget.ValidationTextField("hora", "time", {validateOn:["blur", "change"]}); 
//--> 
  </SCRIPT> 
<BR><BR></TD></TABLE> 
<CENTER></CENTER></TD></TABLE></DIV> '; 
?>