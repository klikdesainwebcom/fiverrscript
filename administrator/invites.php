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

include("../include/config.php");
include_once("../include/functions/import.php");
verify_login_admin();
$adminurl = $config['adminurl'];
 
if($_REQUEST['invite'] == "everyone")
{
	if($config['scriptolution_launch_mode'] != "1")
	{
		$error = "Error: The website launch mode must be set to Private Beta before you can invite users to join.";
	}
	else
	{
		$query = "SELECT LID from scriptolution_launch where invited='0' limit 10000";
		$executequery = $conn->Execute($query);
		$g = $executequery->getrows();
		for($i=0; $i<count($g);$i++)
		{
			$ILID = intval(scriptolution_dotcom_data($g[$i]['LID']));
			if($ILID > 0)
			{
				$query = "select scriptolutionemail from scriptolution_launch WHERE LID='".mysqli_real_escape_string($conn->_connectionID, $ILID)."'"; 
				$executequery=$conn->execute($query);
				$sendto = $executequery->fields['scriptolutionemail'];
				if($sendto != "")
				{
					$verifycode = generateCode(5).time();
					$query = "INSERT INTO invites_code SET code='".mysqli_real_escape_string($conn->_connectionID, $verifycode)."'";
					$conn->execute($query);
					if(mysqli_affected_rows($conn->_connectionID)>=1)
					{
						$sendername = $config['site_name'];
						$from = $config['site_email'];
						$subject = $lang['603']." ".$sendername;
						$sendmailbody = $lang['604'].",<br><br>";
						$sendmailbody .= $lang['605']."<br>";
						$sendmailbody .= "<a href=".$config['baseurl']."/invite_signup.php?c=$verifycode>".$config['baseurl']."/invite_signup.php?c=$verifycode</a><br><br>";
						$sendmailbody .= $lang['23'].",<br>".stripslashes($sendername);
						mailme($sendto,$sendername,$from,$subject,$sendmailbody,$bcc="");
						
						$query = "UPDATE scriptolution_launch SET invited='1' WHERE LID='".mysqli_real_escape_string($conn->_connectionID, $ILID)."'";
						$conn->Execute($query);
					}			
				}
			}
		}
		
		$message = "Everyone has been invited!";
		Stemplate::assign('message',$message);
	}
	
}
if($_REQUEST['delete']=="1")
{
	$DPID = intval(scriptolution_dotcom_data($_REQUEST['DIP']));
	if($DPID > 0)
	{
		$deleteme = $DPID;
		$query = "DELETE FROM scriptolution_launch WHERE LID='".mysqli_real_escape_string($conn->_connectionID, $deleteme)."'";
		$conn->Execute($query);
		
		$message = "Invitation Request Successfully Deleted.";
		Stemplate::assign('message',$message);
	}
} 
elseif($_REQUEST['go']=="1")
{
	$IID = intval(scriptolution_dotcom_data($_REQUEST['DIP']));
	if($IID > 0)
	{
		if($config['scriptolution_launch_mode'] != "1")
		{
			$error = "Error: The website launch mode must be set to Private Beta before you can invite users to join.";
		}
		else
		{
			$query = "select scriptolutionemail from scriptolution_launch WHERE LID='".mysqli_real_escape_string($conn->_connectionID, $IID)."'"; 
			$executequery=$conn->execute($query);
			$sendto = $executequery->fields['scriptolutionemail'];
			if($sendto != "")
			{
				$verifycode = generateCode(5).time();
				$query = "INSERT INTO invites_code SET code='".mysqli_real_escape_string($conn->_connectionID, $verifycode)."'";
				$conn->execute($query);
				if(mysql_affected_rows()>=1)
				{
					$sendername = $config['site_name'];
					$from = $config['site_email'];
					$subject = $lang['603']." ".$sendername;
					$sendmailbody = $lang['604'].",<br><br>";
					$sendmailbody .= $lang['605']."<br>";
					$sendmailbody .= "<a href=".$config['baseurl']."/invite_signup.php?c=$verifycode>".$config['baseurl']."/invite_signup.php?c=$verifycode</a><br><br>";
					$sendmailbody .= $lang['23'].",<br>".stripslashes($sendername);
					mailme($sendto,$sendername,$from,$subject,$sendmailbody,$bcc="");
					
					$query = "UPDATE scriptolution_launch SET invited='1' WHERE LID='".mysqli_real_escape_string($conn->_connectionID, $IID)."'";
					$conn->Execute($query);
					
					$message = "Invitation Request Successfully Sent.";
					Stemplate::assign('message',$message);
				}			
			}
		}
	}
}

$sortby = "scriptolutionemail";
$sort =" order by scriptolutionemail";
$add1 = "&sortby=scriptolutionemail";

if($_REQUEST['sorthow']=="asc")
{
	$sorthow ="asc";
	$add1 .= "&sorthow=asc";
}
else
{
	$sorthow ="desc";
	$add1 .= "&sorthow=desc";
}

//Search
$scriptolutionemail = htmlentities(strip_tags($_REQUEST['scriptolutionemail']), ENT_COMPAT, "UTF-8");
$add1 .= "&scriptolutionemail=$scriptolutionemail";
if($scriptolutionemail!="")
{
	$addtosql .= "AND scriptolutionemail like'%".mysqli_real_escape_string($conn->_connectionID, $scriptolutionemail)."%'";
	Stemplate::assign('scriptolutionemail',$scriptolutionemail);
	Stemplate::assign('search',"1");
}
//Search End

$page = intval(scriptolution_dotcom_data($_REQUEST['page']));
if($page=="")
{
	$page = "1";
}
$currentpage = $page;

if ($page >=2)
{
	$pagingstart = ($page-1)*$config['items_per_page'];
}
else
{
	$pagingstart = "0";
}

$queryselected = "select count(*) as total from scriptolution_launch WHERE invited='0' $addtosql $sort $sorthow limit $config[maximum_results]";
$query2 = "select * from scriptolution_launch WHERE invited='0' $addtosql $sort $sorthow limit $pagingstart, $config[items_per_page]";
$executequeryselected = $conn->Execute($queryselected);
$totalposts = $executequeryselected->fields['total'];	
if ($totalposts > 0)
{
	if($totalposts<=$config['maximum_results'])
	{
		$total = $totalposts;
	}
	else
	{
		$total = $config['maximum_results'];
	}
	$toppage = ceil($total/$config['items_per_page']);
	if($toppage==0)
	{
		$xpage=$toppage+1;
	}
	else
	{
		$xpage = $toppage;
	}
	$executequery2 = $conn->Execute($query2);	
	$results = $executequery2->getrows();
	$beginning=$pagingstart+1;
	$ending=$pagingstart+$executequery2->recordcount();
	$pagelinks="";
	$k=1;
	$theprevpage=$currentpage-1;
	$thenextpage=$currentpage+1;
	if ($currentpage > 0)
	{	
		if($currentpage > 1) 
		{
			$pagelinks.="<a href='$adminurl/invites.php?page=1$add1' title='first page'>First</a>&nbsp;";
			$pagelinks.="<a href='$adminurl/invites.php?page=$theprevpage$add1'>Previous</a>&nbsp;";
		};
		$counter=0;
		$lowercount = $currentpage-5;
		if ($lowercount <= 0) $lowercount = 1;
		while ($lowercount < $currentpage)
		{
			$pagelinks.="<a href='$adminurl/invites.php?page=$lowercount$add1'>$lowercount</a>&nbsp;";
			$lowercount++;
			$counter++;
		}
		$pagelinks.=$currentpage."&nbsp;";
		$uppercounter = $currentpage+1;
		while (($uppercounter < $currentpage+10-$counter) && ($uppercounter<=$toppage))
		{
			$pagelinks.="<a href='$adminurl/invites.php?page=$uppercounter$add1'>$uppercounter</a>&nbsp;";
			$uppercounter++;
		}
		if($currentpage < $toppage) 
		{
			$pagelinks.="<a href='$adminurl/invites.php?page=$thenextpage$add1'>Next</a>&nbsp;";
			$pagelinks.="<a href='$adminurl/invites.php?page=$toppage$add1' title='last page'>Last</a>&nbsp;";
		};
	}
}
else
{
	$error = "Sorry, no invitiation requests were found.";
}

$mainmenu = "18";
$submenu = "1";
Stemplate::assign('mainmenu',$mainmenu);
Stemplate::assign('submenu',$submenu);
Stemplate::assign('sorthow',$sorthow);
Stemplate::assign('sortby',$sortby);
Stemplate::assign('currentpage',$currentpage);
STemplate::display("administrator/global_header.tpl");
STemplate::assign('beginning',$beginning);
STemplate::assign('ending',$ending);
STemplate::assign('pagelinks',$pagelinks);
STemplate::assign('total',$total+0);
STemplate::assign('results',$results);
Stemplate::assign('error',$error);
STemplate::display("administrator/invites.tpl");
STemplate::display("administrator/global_footer.tpl");
?>