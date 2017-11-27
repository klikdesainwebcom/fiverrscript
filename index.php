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
$SCRIPTOLUTIONADMINPANEL = "1";
include("include/config.php");
include("include/functions/import.php");
$thebaseurl = $config['baseurl'];

$skiplaunch = "0";
if($config['scriptolution_launch_mode'] == "0")
{
	$skiplaunch = "1";
}
elseif($_SESSION['ADMINUSERNAME'] != "")
{
	$skiplaunch = "1";
}
elseif($_SESSION['SCRIPTOLUTIONAUTHORIZED'] == "1")
{
	$skiplaunch = "1";
}
if($skiplaunch == "0")
{
	if($config['scriptolution_launch_mode'] == "2")
	{
		if($_REQUEST['jscriptolution'] == "1")
		{
			$scriptolutionemail = scriptolution_dotcom_data($_REQUEST['scriptolutionemail']);	
			if($scriptolutionemail == "")
			{
				$error = $lang['12'];
			}
			elseif(!verify_valid_email($scriptolutionemail))
			{
				$error = $lang['15'];
			}
			elseif (!verify_email_unique($scriptolutionemail))
			{
				$error = $lang['16'];
			}
			else
			{
				$query="INSERT INTO scriptolution_launch SET scriptolutionemail='".mysqli_real_escape_string($conn->_connectionID, $scriptolutionemail)."', time_added='".time()."', invited='0'";
				$result=$conn->execute($query);
				$message = $lang['602'];
			}
		}
		STemplate::assign('error',$error);
		STemplate::assign('message',$message);
		STemplate::assign('pagetitle',$lang['595']." | ".stripslashes($config['site_slogan']));
		STemplate::display('scriptolution_header_launch.tpl');
		STemplate::display('index_prelaunch.tpl');
		STemplate::display('scriptolution_footer_launch.tpl');
	}
	elseif($config['scriptolution_launch_mode'] == "1")
	{
		if($_REQUEST['jscriptolution'] == "1")
		{
			$scriptolutionemail = scriptolution_dotcom_data($_REQUEST['scriptolutionemail']);	
			if($scriptolutionemail == "")
			{
				$error = $lang['12'];
			}
			elseif(!verify_valid_email($scriptolutionemail))
			{
				$error = $lang['15'];
			}
			elseif (!verify_email_unique($scriptolutionemail))
			{
				$error = $lang['16'];
			}
			else
			{
				$query="INSERT INTO scriptolution_launch SET scriptolutionemail='".mysqli_real_escape_string($conn->_connectionID, $scriptolutionemail)."', time_added='".time()."', invited='0'";
				$result=$conn->execute($query);
				$message = $lang['602'];
			}
		}
		if($_REQUEST['jlog'] == "1")
		{	
			$user_username = scriptolution_dotcom_data($_REQUEST['l_username']);
			$user_password = scriptolution_dotcom_data($_REQUEST['l_password']);			
			if($user_username == "")
			{
				$error = $lang['13'];	
			}	
			elseif($user_password == "")
			{
				$error = $lang['17'];	
			}
			if($error == "")
			{
				$encryptedpassword = md5($user_password);
				$query="SELECT status,USERID,email,username,verified from members WHERE username='".mysqli_real_escape_string($conn->_connectionID, $user_username)."' and password='".mysqli_real_escape_string($conn->_connectionID, $encryptedpassword)."'";
				$result=$conn->execute($query);
				if($result->recordcount()<1)
				{
					$error = $lang['42'];
				}
				elseif($result->fields['status']=="0")
				{
					$error = $lang['43'];
				}
				if($error=="")
				{
					$query="update members set lastlogin='".time()."', lip='".$_SERVER['REMOTE_ADDR']."' WHERE username='".mysqli_real_escape_string($conn->_connectionID, $user_username)."'";
					$conn->execute($query);
					$_SESSION['USERID']=$result->fields['USERID'];
					$_SESSION['EMAIL']=$result->fields['email'];
					$_SESSION['USERNAME']=$result->fields['username'];
					$_SESSION['VERIFIED']=$result->fields['verified'];	
					if($_SESSION['USERID'] != "")
					{	
						$_SESSION['SCRIPTOLUTIONAUTHORIZED'] = 1;
						header("Location:$thebaseurl/index.php");exit;
					}
				}	
			}
		}
		STemplate::assign('error',$error);
		STemplate::assign('message',$message);
		STemplate::assign('pagetitle',$lang['596']." | ".stripslashes($config['site_slogan']));
		STemplate::display('scriptolution_header_launch.tpl');
		STemplate::display('index_privatebeta.tpl');
		STemplate::display('scriptolution_footer_launch.tpl');
	}
}
else
{
	$s = scriptolution_dotcom_data($_REQUEST['s']);
	STemplate::assign('s',$s);
	
	$sdisplay = scriptolution_dotcom_data($_REQUEST['sdisplay']);
	STemplate::assign('sdisplay',$sdisplay);
	
	$page = intval(scriptolution_dotcom_data($_REQUEST['page']));
	
	if($page=="")
	{
		$page = "1";
	}
	elseif($page=="0")
	{
		$page = "1";
	}
	$currentpage = $page;
	STemplate::assign('currentpage',$currentpage);
	
	if ($page >=2)
	{
		$pagingstart = ($page-1)*$config['items_per_page_new'];
	}
	else
	{
		$pagingstart = "0";
	}
	
	if($s == "r")
	{
		$dby = "A.rating desc";	
	}
	elseif($s == "rz")
	{
		$dby = "A.rating asc";	
	}
	elseif($s == "p")
	{
		$dby = "A.viewcount desc";	
	}
	elseif($s == "pz")
	{
		$dby = "A.viewcount asc";	
	}
	elseif($s == "c")
	{
		$dby = "A.price asc";	
	}
	elseif($s == "cz")
	{
		$dby = "A.price desc";	
	}
	elseif($s == "dz")
	{
		$dby = "A.PID asc";	
	}
	else
	{
		$dby = "A.PID desc";	
	}
	
	if($s == "ez")
	{
		$dby = "A.PID asc";	
		$addsql = "AND days='1'";
		$addsqlb = "AND A.days='1'";
	}
	elseif($s == "e")
	{
		$dby = "A.PID desc";	
		$addsql = "AND days='1'";
		$addsqlb = "AND A.days='1'";
	}
	
	$p = intval(scriptolution_dotcom_data($_REQUEST['p']));
	if($p > 0)
	{
		$scriptolution_addprice = " AND A.price='".mysqli_real_escape_string($conn->_connectionID, $p)."'";
		$scriptolution_addpriced = " AND price='".mysqli_real_escape_string($conn->_connectionID, $p)."'";
		STemplate::assign('p',$p);
		$addp = "&p=$p";
	}
	
	$query1 = "SELECT count(*) as total from posts where active='1' $addsql $scriptolution_addpriced order by PID desc limit $config[maximum_results]";
	$query2 = "SELECT A.*, B.seo, C.username, C.country, C.toprated from posts A, categories B, members C where A.active='1' AND A.category=B.CATID AND A.USERID=C.USERID $addsqlb $scriptolution_addprice order by A.feat desc, $dby limit $pagingstart, $config[items_per_page_new]";
	$executequery1 = $conn->Execute($query1);
	$scriptolution = $executequery1->fields['total'];
	if ($scriptolution > 0)
	{
		if($executequery1->fields['total']<=$config['maximum_results'])
		{
			$total = $executequery1->fields['total'];
		}
		else
		{
			$total = $config['maximum_results'];
		}
		$toppage = ceil($total/$config['items_per_page_new']);
		if($toppage==0)
		{
			$xpage=$toppage+1;
		}
		else
		{
			$xpage = $toppage;
		}
		$executequery2 = $conn->Execute($query2);
		$posts = $executequery2->getrows();
		$beginning=$pagingstart+1;
		$ending=$pagingstart+$executequery2->recordcount();
		$pagelinks="";
		$k=1;
		$theprevpage=$currentpage-1;
		$thenextpage=$currentpage+1;
		if($s != "")
		{
			$adds = "&s=$s".$addp;
			STemplate::assign('adds',$adds);
		}
		if ($currentpage > 0)
		{
			if($currentpage > 1) 
			{
				STemplate::assign('tpp',$theprevpage);
			}
			$counter=0;
			$lowercount = $currentpage-5;
			if ($lowercount <= 0) $lowercount = 1;
			while ($lowercount < $currentpage)
			{
				$lowercount++;
				$counter++;
			}		
			$uppercounter = $currentpage+1;
			while (($uppercounter < $currentpage+10-$counter) && ($uppercounter<=$toppage))
			{
				$uppercounter++;
			}
			if($currentpage < $toppage) 
			{
				STemplate::assign('tnp',$thenextpage);
			}
		}
	}
	
	$query = "select A.*, B.seo, C.username, C.country from posts A, categories B, members C where A.active='1' AND A.category=B.CATID AND A.USERID=C.USERID order by rand() limit 5"; 
	$results = $conn->execute($query);
	$scriptolutionrand = $results->getrows();
	STemplate::assign('scriptolutionrand',$scriptolutionrand);
	
	$query = "select A.*, B.seo, C.username, C.country from posts A, categories B, members C where A.active='1' AND A.category=B.CATID AND A.USERID=C.USERID order by rating desc, rand() limit 5"; 
	$results = $conn->execute($query);
	$scriptolutionrating = $results->getrows();
	STemplate::assign('scriptolutionrating',$scriptolutionrating);
		
	$templateselect = "index.tpl";

	//TEMPLATES BEGIN
	STemplate::assign('scriptolutionhome',"1");
	STemplate::assign('pagetitle',stripslashes($config['site_slogan']));
	STemplate::assign('posts',$posts);
	STemplate::display('scriptolution_header.tpl');
	STemplate::display($templateselect);
	STemplate::display('scriptolution_footer.tpl');
	//TEMPLATES END
}
?>