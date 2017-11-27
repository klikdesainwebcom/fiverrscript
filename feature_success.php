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
$PID = intval(base64_decode(scriptolution_dotcom_data($_REQUEST['g'])));
$eid = scriptolution_dotcom_ode($PID);
scriptolution_dotcom_software("feature_success?g=".$eid);	
if($PID > 0)
{	
	$pagetitle = $lang['54'];
	STemplate::assign('pagetitle',$pagetitle);

	$query = "SELECT A.*, B.seo, C.username from posts A, categories B, members C where A.category=B.CATID AND A.USERID=C.USERID AND C.USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' AND C.USERID=A.USERID AND A.PID='".mysqli_real_escape_string($conn->_connectionID, $PID)."'";
	$results=$conn->execute($query);
	$p = $results->getrows();
	STemplate::assign('p',$p[0]);
	$message = $lang['459'];
}
else
{
	header("Location:$config[baseurl]/");exit;
}

//TEMPLATES BEGIN
STemplate::assign('message',$message);
STemplate::display('scriptolution_header.tpl');
STemplate::display('feature_success.tpl');
STemplate::display('scriptolution_footer_nobottom.tpl');
//TEMPLATES END
?>