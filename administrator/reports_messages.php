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

//DELETE REPORT
if($_REQUEST['delete']=="1")
{
	$DRID = intval(scriptolution_dotcom_data($_REQUEST['DRID']));	
	if($DRID > 0)
	{
		$sql="DELETE FROM inbox_reports WHERE RID='".mysqli_real_escape_string($conn->_connectionID, $DRID)."'";
		$conn->Execute($sql);
	}
	$message = "Report Successfully Deleted.";
	Stemplate::assign('message',$message);
}
//DELETE REPORT END

//DELETE MESSAGE
if($_REQUEST['delete']=="2")
{
	$DMID = intval(scriptolution_dotcom_data($_REQUEST['DMID']));	
	if($DMID > 0)
	{
		$sql="DELETE FROM inbox WHERE MID='".mysqli_real_escape_string($conn->_connectionID, $DMID)."'";
		$conn->Execute($sql);
	}
	$DRID = intval(scriptolution_dotcom_data($_REQUEST['DRID']));	
	if($DRID > 0)
	{
		$sql="DELETE FROM inbox_reports WHERE RID='".mysqli_real_escape_string($conn->_connectionID, $DRID)."'";
		$conn->Execute($sql);
	}
	$message = "Message Successfully Deleted.";
	Stemplate::assign('message',$message);
}
//DELETE MESSAGE END

if($_REQUEST['sortby']=="username")
{
	$sortby = "username";
	$sort =" order by C.username";
	$add1 = "&sortby=username";
}
elseif($_REQUEST['sortby']=="msg")
{
	$sortby = "msg";
	$sort =" order by B.message";
	$add1 = "&sortby=msg";
}
else
{
	$sortby = "RID";
	$sort =" order by A.RID";
	$add1 = "&sortby=RID";
}

if($_REQUEST['sorthow']=="desc")
{
	$sorthow ="desc";
	$add1 .= "&sorthow=desc";
}
else
{
	$sorthow ="asc";
	$add1 .= "&sorthow=asc";
}

//Search
$fromid = intval(scriptolution_dotcom_data($_REQUEST['fromid']));
$toid = intval(scriptolution_dotcom_data($_REQUEST['toid']));
$username = htmlentities(strip_tags($_REQUEST['username']), ENT_COMPAT, "UTF-8");
$msg = htmlentities(strip_tags($_REQUEST['msg']), ENT_COMPAT, "UTF-8");
$add1 .= "&fromid=$fromid&toid=$toid&username=$username&msg=$msg";
if($_POST['submitform'] == "1" || ($_REQUEST['fromid']!="" || $toid>0 || $username!="" || $msg!=""))
{
	if($fromid > 0)
	{
		$addtosql = "AND A.MID>='".mysqli_real_escape_string($conn->_connectionID, $fromid)."'";
		Stemplate::assign('fromid',$fromid);
	}
	else
	{
		$addtosql = "AND A.MID>'".mysqli_real_escape_string($conn->_connectionID, $fromid)."'";
	}
	if($toid > 0)
	{
		$addtosql .= "AND A.MID<='".mysqli_real_escape_string($conn->_connectionID, $toid)."'";
		Stemplate::assign('toid',$toid);
	}
	if($username != "")
	{
		$addtosql .= "AND C.username like'%".mysqli_real_escape_string($conn->_connectionID, $username)."%'";
		Stemplate::assign('username',$username);
	}
	if($msg != "")
	{
		$addtosql .= "AND B.message like'%".mysqli_real_escape_string($conn->_connectionID, $msg)."%'";
		Stemplate::assign('msg',$msg);
	}
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

$queryselected = "select A.RID, B.message, C.username from inbox_reports A, inbox B, members C WHERE A.MID=B.MID AND B.MSGFROM=C.USERID $addtosql $sort $sorthow limit $config[maximum_results]";
$query2 = "select A.RID, A.MID, A.time, B.message, C.username from inbox_reports A, inbox B, members C WHERE A.MID=B.MID AND B.MSGFROM=C.USERID $addtosql $sort $sorthow limit $pagingstart, $config[items_per_page]";
$executequeryselected = $conn->Execute($queryselected);
$totalvideos = $executequeryselected->rowcount();	
if ($totalvideos > 0)
{
	if($totalvideos<=$config[maximum_results])
	{
		$total = $totalvideos;
	}
	else
	{
		$total = $config[maximum_results];
	}
	$toppage = ceil($total/$config[items_per_page]);
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
			$pagelinks.="<a href='$adminurl/reports_messages.php?page=1$add1' title='first page'>First</a>&nbsp;";
			$pagelinks.="<a href='$adminurl/reports_messages.php?page=$theprevpage$add1'>Previous</a>&nbsp;";
		};
		$counter=0;
		$lowercount = $currentpage-5;
		if ($lowercount <= 0) $lowercount = 1;
		while ($lowercount < $currentpage)
		{
			$pagelinks.="<a href='$adminurl/reports_messages.php?page=$lowercount$add1'>$lowercount</a>&nbsp;";
			$lowercount++;
			$counter++;
		}
		$pagelinks.=$currentpage."&nbsp;";
		$uppercounter = $currentpage+1;
		while (($uppercounter < $currentpage+10-$counter) && ($uppercounter<=$toppage))
		{
			$pagelinks.="<a href='$adminurl/reports_messages.php?page=$uppercounter$add1'>$uppercounter</a>&nbsp;";
			$uppercounter++;
		}
		if($currentpage < $toppage) 
		{
			$pagelinks.="<a href='$adminurl/reports_messages.php?page=$thenextpage$add1'>Next</a>&nbsp;";
			$pagelinks.="<a href='$adminurl/reports_messages.php?page=$toppage$add1' title='last page'>Last</a>&nbsp;";
		};
	}
}
else
{
	$error = "There are no reported messages yet.";
}

$mainmenu = "10";
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
STemplate::display("administrator/reports_messages.tpl");
STemplate::display("administrator/global_footer.tpl");
?>