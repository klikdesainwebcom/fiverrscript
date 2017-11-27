<?php
/**************************************************************************************************
| Fiverr Script
| http://www.fiverrscript.com
| webmaster@fiverrscript.com
|
|**************************************************************************************************
|
| By using this software you agree that you have read and acknowledged our End-User License 
| Agreement available at http://www.fiverrscript.com/eula.html and to be bound by it.
|
| Copyright (c) FiverrScript.com. All rights reserved.
|**************************************************************************************************/

include("include/config.php");
include("include/functions/import.php");
$thebaseurl = $config['baseurl'];
$scriptolutionpid = intval(scriptolution_dotcom_data($_REQUEST['id']));
if($scriptolutionpid > 0)
{
	$query="SELECT A.*, B.name, B.seo, C.username, C.rating, C.ratingcount, C.toprated, C.country, C.addtime, C.level FROM posts A, categories B, members C WHERE A.PID='".mysqli_real_escape_string($conn->_connectionID, $scriptolutionpid)."' AND A.category=B.CATID AND A.USERID=C.USERID AND A.active='1'";
	$executequery = $conn->Execute($query);
	$p = $executequery->getrows();
	$fnd = count($p);
	$title = stripslashes($p[0]['gtitle']);
	$uname = stripslashes($p[0]['username']);
	$PD = stripslashes($p[0]['PID']);
	$gtags = stripslashes($p[0]['gtags']);
	$uid = stripslashes($p[0]['USERID']);
	include("view_ship1.scriptolution.com.php");
	STemplate::assign('pagetitle', $lang['62']." ".$title." ".$lang['63'].$p[0]['price']." : ".$uname);
	if(is_numeric($PD) && $PD > 0)
	{
		$tags = str_replace(",", " ", $p[0]['gtags']);
		$tags = str_replace("  ", " ", $tags);
		$tags = str_replace("/", "", $tags);
		$tags = explode(" ", $tags);
		STemplate::assign('tags',$tags);
		for($i=0;$i<count($tags);$i++)
		{
			$addme .= " OR A.gtags like '%".mysqli_real_escape_string($conn->_connectionID, $tags[$i])."%'";	
		}
		$query="SELECT A.PID, A.gtitle, A.p1, A.price, B.name, B.seo, C.username, C.country, C.toprated, C.USERID FROM posts A, categories B, members C WHERE A.PID!='".mysqli_real_escape_string($conn->_connectionID, $scriptolutionpid)."' AND A.category=B.CATID AND A.USERID=C.USERID and A.active='1' AND (A.gtags like '%".mysqli_real_escape_string($conn->_connectionID, $gtags)."%' $addme) order by rand() limit 6";
		$results=$conn->execute($query);
		$r = $results->getrows();
		STemplate::assign('r',$r);
		
		$query="SELECT A.PID, A.gtitle, A.p1, A.price, B.name, B.seo FROM posts A, categories B WHERE A.PID!='".mysqli_real_escape_string($conn->_connectionID, $scriptolutionpid)."' AND A.category=B.CATID and A.active='1' AND A.USERID='".mysqli_real_escape_string($conn->_connectionID, $uid)."' order by rand() limit 5";
		$results=$conn->execute($query);
		$u = $results->getrows();
		STemplate::assign('u',$u);
		
		$query="SELECT A.comment, A.good, A.bad, B.username, B.USERID FROM ratings A, members B WHERE A.PID='".mysqli_real_escape_string($conn->_connectionID, $PD)."' AND A.RATER=B.USERID and B.status='1' order by A.RID desc";
		$results=$conn->execute($query);
		$f = $results->getrows();
		STemplate::assign('f',$f);
		$grat = 0;
		$brat = 0;
		for($i=0;$i<count($f);$i++)
		{
			$tgood = $f[$i]['good'];
			$tbad = $f[$i]['bad'];
			if($tgood == "1")
			{
				$grat++;	
			}
			elseif($tbad == "1")
			{
				$brat++;	
			}
		}
		STemplate::assign('grat',$grat);
		STemplate::assign('brat',$brat);
		$scriptolutiontotalvotes = $grat + $brat + 0;
		STemplate::assign('scriptolutiontotalvotes',$scriptolutiontotalvotes);

		$queryb = "select count(*) as total from orders where PID='".mysqli_real_escape_string($conn->_connectionID, $PD)."' AND (status='1' OR status='6')"; 
		$executequeryb=$conn->execute($queryb);
		$quecount = $executequeryb->fields['total']+0;
		STemplate::assign('quecount',$quecount);
		
		$queryb="SELECT count(*) as total FROM bookmarks WHERE PID='".intval($PD)."'";
		$executequeryb=$conn->execute($queryb);
		$ftot = $executequeryb->fields['total']+0;
		STemplate::assign('ftot',$ftot);
		include("view_ship2.scriptolution.com.php");	
	}
	update_viewcount($scriptolutionpid);
	if($fnd > 0)
	{
		$theme = "view.tpl";
		$ftheme = "scriptolution_footer.tpl";
	}
	else
	{
		$theme = "view2.tpl";
		$ftheme = "scriptolution_footer_nobottom.tpl";
	}
}

//TEMPLATES BEGIN
STemplate::assign('viewpage',1);
STemplate::assign('p',$p[0]);
STemplate::display('scriptolution_header.tpl');
STemplate::display($theme);
STemplate::display($ftheme);
//TEMPLATES END
?>