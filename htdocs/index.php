<?PHP
date_default_timezone_set('Europe/Berlin');
session_start();
ob_start("ob_gzhandler");
//require('./exaBD.php');
function microtime_float() {
	list($usec, $sec) = explode(" ", microtime());
	return ((float)$usec + (float)$sec);
}
$time_start = microtime_float();

//##### CONFIG #####
include('config-and-functions.php');
$action = $_REQUEST['action'];

//##### LOGOUT #####
if($action == "logout") {
	unset($_SESSION['account']);
	unset($_SESSION['password']);
}

//##### LOGIN #####
$logged = FALSE;
if(isset($_SESSION['account'])) {
	$account_logged = $ots->createObject('Account');
	$account_logged->load($_SESSION['account']);
	if($account_logged->isLoaded() && $account_logged->getPassword() == $_SESSION['password']) {
		$logged = TRUE;
		$group_id_of_acc_logged = $account_logged->getPageAccess();
	} else {
		$logged = FALSE;
		unset($_SESSION['account']);
		unset($account_logged);
	}
}
$login_account = strtoupper(trim($_POST['account_login']));
$login_password = trim($_POST['password_login']);
if(!$logged && !empty($login_account) && !empty($login_password)) {
	$login_password = password_ency($login_password);
	$account_logged = $ots->createObject('Account');
	$account_logged->find($login_account);
	if($account_logged->isLoaded()) {
		if($login_password == $account_logged->getPassword()) {
			$_SESSION['account'] = $account_logged->getId();
			$_SESSION['password'] = $login_password;
			$logged = TRUE;
			$account_logged->setCustomField("page_lastday", time());
			$group_id_of_acc_logged = $account_logged->getPageAccess();
		} else
			$logged = FALSE;
	}
}

//#### LOAD PAGE ##########
if(empty($_REQUEST['subtopic'])) {
	$_REQUEST['subtopic'] = "latestnews";
	$subtopic = "latestnews";
}
switch($_REQUEST['subtopic']) {

        case "latestnews":
                $topic = "Ultimas Noticias";
                $subtopic = "latestnews";
                include("latestnews.php");
        break;
		
		case "live";
			$subtopic = "live";
			$topic = "Cast ON";
			include("live.php");
		break;
		
	case "foot";
            $topic = "Football Tops";
           $subtopic = "foot";
           include("foot.php");
        break;

	case "promotions":
                $topic = "Promo&ccedil;&otilde;es";
                $subtopic = "promotions";
                include("promotions.php");
        break;
		
		case "calendario":
                $topic = "Calend&aacute;rio";
                $subtopic = "calendario";
                include("calendario.php");
        break;
		
		case "dota":
                $topic = "Dota";
                $subtopic = "dota";
                include("dota.php");
        break;
		
		case "coliseum":
                $topic = "Coliseum";
                $subtopic = "coliseum";
                include("coliseum.php");
        break;
		
		        case "mount":
                $topic = "Mount";
                $subtopic = "mount";
                include("mount.php");
        break;
		
				        case "cassino":
                $topic = "Cassino";
                $subtopic = "cassino";
                include("cassino.php");
        break;
		
						        case "forj":
                $topic = "Forjamento";
                $subtopic = "forj";
                include("forj.php");
        break;

	

	case "suport":
                $topic = "Suport Online";
                $subtopic = "suportonline";
                include("suport.php");
        break;

	case "boss":
                $topic = "Bosses";
                $subtopic = "boss";
                include("boss.php");
        break;

	case "present":
                $topic = "Present Diary";
                $subtopic = "present";
                include("present.php");
        break;
		
		case "tunneltuto":
                $topic = "Tibia Tunnel Tutorial";
                $subtopic = "tunneltuto";
                include("tunneltuto.php");
        break;
		
		case "tunnel":
                $topic = "Falconia Tibia Tunnel";
                $subtopic = "tunnel";
                include("tunnel.php");
        break;
		
		case "task":
                $topic = "Task Quest";
                $subtopic = "task";
                include("task.php");
        break;

	

	case "powergamers";
                $topic = "Powergamers";
                $subtopic = "powergamers";
                include("powergamers.php");
        break;

	case "onlinetime";
        	$topic = "Onlinetime";
        	$subtopic = "onlinetime";
        	include("onlinetime.php");
    	break;

	case "domain":
                $topic = "domain";
                $subtopic = "domain";
                include("domain.php");
        break;

        case "vip":
                $topic = "VIP";
                $subtopic = "vip";
                include("vip.php");
        break; 

	case "chat";
        	$topic = "chat";
        	$subtopic = "chat";
        	include("chat.php");
    	break; 

	case "exphist";
        	$subtopic = "exphist";
        	$topic = "Powergamers";
        	include("exphist.php");
    	break;  

	case "featured":
                $topic = "Featured Article";
                $subtopic = "article";
                include("featured.php");
        break;

	case "viplist";
                $subtopic = "viplist";
                $topic = "Jogadores Vip";
                include("viplist.php");
        break;

	case "home";
                $subtopic = "home";
                $topic = "home";
                include("home.php");
        break;

        case "addons":
                $topic = "Addons";
                $subtopic = "addons";
                include("addons.php");
        break;

	
	case "detalhe";
                $topic = "Detalhes";
                $subtopic = "detalhe";
                include("detalhe.php");
        break;
        

        case "buypoints":
                $topic = "Comprar Pontos";
                $subtopic = "buypoints";
                include("buypoints.php");
        break;

        case "tradeoff";
				$topic = "Trade Off";
				$subtopic = "tradeoff";
				include("tradeoff.php");
		break;

		case "lottery";
			$subtopic = "lottery";
			$topic = "Lottery";
			include("lottery.php");
		break;

        case "wars":
                $topic = "Guild Wars";
                $subtopic = "wars";
                include("wars.php");
        break;
       
        case "creatures";
                $topic = "Monstros";
                $subtopic = "creatures";
                include("creatures.php");
        break;

        case "about";
                $topic = "Sobre o Server";
                $subtopic = "about";
                include("about.php");
        break;
       
        case "spells";
                $topic = "Magias";
                $subtopic = "spells";
                include("spells.php");
        break;
       
 	case "bugtracker";
  	        $topic = "Bug Tracker";
 	        $subtopic = "bugtracker";
 	        include("bug.php");
	break;  

        case "experiencetable";
                $topic = "Tabela de Experiência";
                $subtopic = "experiencetable";
                include("experiencetable.php");
        break;
       
        case "characters";
                $topic = "Players";
                $subtopic = "characters";
                include("characters.php");
        break;
       
        case "whoisonline";
                $topic = "Players Online";
                $subtopic = "whoisonline";
                include("whoisonline.php");
        break;
       
        case "highscores";
                $topic = "Ranking";
                $subtopic = "highscores";
                include("highscores.php");
        break;
       
        case "killstatistics";
                $topic = "Últimas Mortes";
                $subtopic = "killstatistics";
                include("killstatistics.php");
        break;
       
        case "guilds";
                $topic = "Guilds";
                $subtopic = "guilds";
                include("guilds.php");
        break;
       
        case "accountmanagement";
                $topic = "Editar Conta";
                $subtopic = "accountmanagement";
                include("accountmanagement.php");
        break;
       
        case "createaccount";
                $topic = "Criar Conta";
                $subtopic = "createaccount";
                include("createaccount.php");
        break;
       
        case "lostaccount";
                $topic = "Perdeu sua conta?";
                $subtopic = "lostaccount";
                include("lostaccount.php");
        break;

        case "tibiarules";
                $topic = "Regras do Server";
                $subtopic = "tibiarules";
                include("tibiarules.php");
        break;

        case "adminpanel":
                $topic = "Painel do Admin";
                $subtopic = "adminpanel";
                include("adminpanel.php");
        break;

	case "admin";
           $subtopic = "admin";
           $topic = "Advanced Admin Panel";
           include("adminpro.php");
      break;  

        case "confirmacao":
                $topic = "Confirmação";
                $subtopic = "confirmacao";
                include("confirmacao.php");
        break;

        case "vantagens":
                $topic = "Vantagens";
                $subtopic = "vantagens";
                include("vantagens.php");
        break;
       
        case "forum":
                $topic = "Forum";
                $subtopic = "forum";
                include("forum.php");
        break;
       
        case "team";
                $subtopic = "Membros da Staff";
                $topic = "Support List";
                include("team.php");
        break;

        case "downloads";
                $subtopic = "Downloads";
                $topic = "Downloads";
                include("downloads.php");
        break;

        case "serverinfo";
                $subtopic = "Info do Server";
                $topic = "Server Info";
                include("serverinfo.php");
        break;

        case "shopsystem";
                $subtopic = "Loja do Server";
                $topic = "Shop Offerts";
                include("shopsystem.php");
        break;
       
        case "doacao";
                $subtopic = "doação";
                $topic = "Doacao";
                include("doacao.php");
        break;

        case "gallery";
                $subtopic = "gallery";
                $topic = "Gallery";
                include("gallery.php");
        break;
       
        case "namelock";
                $subtopic = "namelock";
                $topic = "Namelock Manager";
                include("namelocks.php");
        break;
       
        case "archive";
                $subtopic = "archive";
                $topic = "News Archives";
                include("archive.php");
        break;
       
        case "mail";
                $subtopic = "mail";
                $topic = "Mass emails sender";
                include("mail.php");
        break;

	case "shopadmin";
		$subtopic = "Loja do Admin";
		$topic = "Shop Admin";
		include("shopadmin.php");
	break;

	case "records";
		$subtopic = "Record de Players ON";
		$topic = "Players Online Records";
		include("records.php");
	break;

	case "restarter";
		$subtopic = "restarter";
		$topic = "Restarter";
		include("restarter.php");
	break;
     
	case "bans";
		$subtopic = "Banidos";
		$topic = "Ban List";
		include("bans.php");
	break;

  	case "polls";
		$topic = "Enquetes";
		$subtopic = "polls";
		include("polls.php");
	break; 	

	case "changelog";
   		 $topic = "Changelog";
  		 $subtopic = "changelog";
  		 include("changelog.php");
	break; 
	
	case "fragers";
   		 $topic = "Top Fragers";
  		 $subtopic = "fragers";
  		 include("fragers.php");
	break;

        case "topguild";
                 $topic = "Top Guild";
                 $subtopic = "Top Guilds";
                 include("topguilds.php");
        break;
		
		case "cast";
                 $topic = "Cast ON";
                 $subtopic = "Cast ON";
                 include("live.php");
        break;

}

if(empty($topic)) {
	$title = $GLOBALS['config']['server']["serverName"]." - OTS";
	$main_content .= 'Invalid subtopic. Can\'t load page.';
} else {
	$title = $GLOBALS['config']['server']["serverName"]." - ".$topic;
}

//#####LAYOUT#####
$layout_header = '<script type=\'text/javascript\'>
function GetXmlHttpObject()
{
var xmlHttp=null;
try
  {
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
  }
return xmlHttp;
}

function MouseOverBigButton(source)
{
  source.firstChild.style.visibility = "visible";
}
function MouseOutBigButton(source)
{
  source.firstChild.style.visibility = "hidden";
}
function BigButtonAction(path)
{
  window.location = path;
}
var';
if($logged) { $layout_header .= "loginStatus=1; loginStatus='true';"; } else { $layout_header .= "loginStatus=0; loginStatus='false';"; };
$layout_header .= " var activeSubmenuItem='".$subtopic."';</script>";
include($layout_name."/layout.php");
ob_end_flush();
?>
