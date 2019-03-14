<?php  
//PEGA OS DADOS ENVIADOS PELO FORMULÁRIO 
$nome = $_POST["nome"];
$nomedochar = $_POST["nomedochar"];
$assunto = $_POST["assunto"];
$assunto2 = $_POST["assunto2"];
$email = $_POST["email"];
$valor = $_POST["valor"];
$deposito = $_POST["deposito"]; 
$hora1 = $_POST["hora1"]; 
$data1 = $_POST["data1"];
$link = $_POST["link"];
$mensagem = $_POST["mensagem"];  

//PREPARA O CONTEÚDO A SER GRAVADO 
$conteudo = "
<=============================>
Nome: $nome,
Nome do Char: $nomedochar,
Assunto: $assunto,
Pagamento: $assunto2,
E-mail: $email,
Valor: $valor,
Deposito: $deposito,
Horas: $hora1,
Data: $data1,
Link: $link
Mensagem: $mensagem
<=============================>
";

//ARQUIVO TXT 
$arquivo = "/xampp/htdocs/arquivo.txt"; 

//TENTA ABRIR O ARQUIVO TXT 
if (!$abrir = fopen($arquivo, "a")) { 
echo "Erro ao abrir o arquivo: ($arquivo)"; 
exit; 
} 

//ESCREVE NO ARQUIVO TXT 
if (!fwrite($abrir, $conteudo)) { 
print "Erro escrevendo no arquivo: ($arquivo)"; 
exit; 
} 

echo "Sua Confirma&ccedil;&atilde;o foi bem sucedida. Aguarde at&eacute; 48 horas <b>&Uacute;TEIS</b> para entrega do seus points!.<br><b>Obs:</b> S&aacute;bado, Domingo e Feriados n&atilde;o s&atilde;o dias &uacute;teis !";

//FECHA O ARQUIVO  
fclose($abrir); 

?>