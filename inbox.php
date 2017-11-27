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

scriptolution_dotcom_software("inbox");
if($_POST['subarc'] == "1")
{
	$auid = intval(scriptolution_dotcom_data($_REQUEST['auid']));
	if($auid > 0)
	{
		$query="INSERT INTO archive SET USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."', AID='".mysqli_real_escape_string($conn->_connectionID, $auid)."'";
		$results=$conn->execute($query);	
		$message = $lang['244'];
	}
}

$templateselect = "inbox.tpl";
$pagetitle = $lang['28'];
STemplate::assign('pagetitle',$pagetitle);

$s = scriptolution_dotcom_data($_REQUEST['s']);
if($s == "" || $s == "all")
{
	$s = "all";
}
elseif($s == "unread")
{
	$s = "unread";
}
elseif($s == "archived")
{
	$s = "archived";
}
STemplate::assign('s',$s);

$a = scriptolution_dotcom_data($_REQUEST['a']);
if($a != "1")
{
	$a = "0";	
}
STemplate::assign('a',$a);
$o = scriptolution_dotcom_data($_REQUEST['o']);
if($o == "" || $o == "time")
{
	$o = "time";
	if($a == "1")
	{
		$addsql2 = "time asc";
	}
	else
	{
		$addsql2 = "time desc";
	}
}
elseif($o == "name")
{
	$o = "name";
	if($a == "1")
	{
		$addsql2 = "B.username asc";
	}
	else
	{
		$addsql2 = "B.username desc";
	}
}
STemplate::assign('o',$o);

$u = intval(scriptolution_dotcom_data($_REQUEST['u']));
if($u > 0)
{
	$addsql3 = "AND B.USERID='".mysqli_real_escape_string($conn->_connectionID, $u)."'";	
}
STemplate::assign('u',$u);

$query="SELECT AID FROM archive WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."'";
$results=$conn->execute($query);
$arc = $results->getrows();
STemplate::assign('arc',$arc);

$query = "select max(A.time) as time, max(A.unread) as unread, B.username, B.USERID from inbox A, members B where ((A.MSGFROM='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' AND A.MSGTO=B.USERID) OR (A.MSGTO='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' AND A.MSGFROM=B.USERID)) $addsql3 GROUP BY B.username order by $addsql2";
$results=$conn->execute($query);
$m = $results->getrows();
STemplate::assign('m',$m);

//TEMPLATES BEGIN
STemplate::assign('message',$message);
STemplate::display('scriptolution_header.tpl');
STemplate::display($templateselect);
STemplate::display('scriptolution_footer_grey.tpl');
//TEMPLATES END
?>