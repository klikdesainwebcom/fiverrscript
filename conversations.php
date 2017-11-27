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


$u = scriptolution_dotcom_data($_REQUEST['u']);	
$aboutid = intval(scriptolution_dotcom_data($_REQUEST['id']));
scriptolution_dotcom_software("conversations/".$u."?id=".$aboutid);

$verify_pm = $config['verify_pm'];
if($verify_pm == "1" && $SCRIPTOLUTION_V == "0")
{
	$error = $lang['479'];
	$templateselect = "empty.tpl";
}
else
{
	$aboutid = intval(scriptolution_dotcom_data($_REQUEST['id']));
	if($aboutid > 0)
	{
		STemplate::assign('aboutid',$aboutid);
	}
	$u = scriptolution_dotcom_data($_REQUEST['u']);
	if($u != "")
	{
		$query="SELECT username, USERID FROM members WHERE username='".mysqli_real_escape_string($conn->_connectionID, $u)."' limit 1";
		$results=$conn->execute($query);
		$u = $results->getrows();
		STemplate::assign('u',$u[0]);
		$UID = $u[0]['USERID'];
		
		if($UID > 0)
		{
			$templateselect = "conversations.tpl";
			$pagetitle = $lang['235']." ".$u[0]['username'];
			STemplate::assign('pagetitle',$pagetitle);
			
			$query="SELECT DISTINCT A.username AS mto, C.username AS mfrom, B.* FROM members A, inbox B, members C WHERE A.USERID=B.MSGTO AND C.USERID=B.MSGFROM AND ((B.MSGTO='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' AND B.MSGFROM='".mysqli_real_escape_string($conn->_connectionID, $UID)."') OR (B.MSGTO='".mysqli_real_escape_string($conn->_connectionID, $UID)."' AND B.MSGFROM='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."')) order by B.MID asc";
			$results=$conn->execute($query);
			$m = $results->getrows();
			STemplate::assign('m',$m);
			$totalm = count($m);
			if($totalm > 0)
			{
				$lastm = $totalm - 1;
				$lastm = $m[$lastm]['MID'];
			}
			else
			{
				$lastm = "0";
			}
			STemplate::assign('lastm',$lastm);
		}
	}
}

//TEMPLATES BEGIN
STemplate::assign('error',$error);
STemplate::assign('message',$message);
STemplate::display('scriptolution_header.tpl');
STemplate::display($templateselect);
STemplate::display('scriptolution_footer_grey.tpl');
//TEMPLATES END
?>