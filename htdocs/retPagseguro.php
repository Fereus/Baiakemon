<?php
include('config-and-functions.php');
define('TOKEN', $config['pagseguro']['token']);

// Incluindo o arquivo da biblioteca
include('retorno.php');

// Função que captura os dados do retorno
function retorno_automatico ( $VendedorEmail, $TransacaoID, $Referencia, $TipoFrete, $ValorFrete, $Anotacao, $DataTransacao, $TipoPagamento, $StatusTransacao, $CliNome, $CliEmail, $CliEndereco, $CliNumero, $CliComplemento, $CliBairro, $CliCidade, $CliEstado, $CliCEP, $CliTelefone, $produtos, $NumItens) {
global $config;
if(strtolower($StatusTransacao) == 'aprovado') {
$account_logged = $ots->createObject('Account');
$account_logged->find($Referencia);
if($account_logged->isLoaded()) {
$pontos = $account_logged->getCustomField("premium_points");
$account_logged->setCustomField("premium_points", $pontos + $produtos[0]['ProdQuantidade']);
$nome = $Referencia.'-'.date('d-m-Y',$_SERVER['REQUEST_TIME']).'.txt';
if(file_exists('logsPagseguro/'.$nome))
$nome = $Referencia.'-2-'.date('d-m-Y',$_SERVER['REQUEST_TIME']).'.txt';
$arquivo = fopen('logsPagseguro/'.$nome, "w+");
$dados = "Conta: ".$Referencia."\n";
$dados = "Email: ".$CliEmail."\n";
$dados .= "Total de Points: ".$produtos[0]['ProdQuantidade']."\n";
$dados .= "Hora da Transação: ". date('d-m-Y H:i:s', $_SERVER['REQUEST_TIME'])."";
fwrite($arquivo, $dados);
fclose($arquivo);
}
}

}

// A partir daqui, é só HTML:

?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
</head>
<body>

<h1>Pedido em processamento</h1>
<p>Recebemos seu pedido e estamos aguardando pela
confirmação do pagamento. Obrigado por comprar conosco.</p>

</body>
</html> 