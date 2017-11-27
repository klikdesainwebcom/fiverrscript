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

$scriptolutionk = scriptolution_dotcom_data($_REQUEST['g']);
scriptolution_dotcom_software("thank_you?g=".$scriptolutionk);

if(isset($_REQUEST['g']) && isset($_POST['item_number']))
{
	header("Location:$config[baseurl]/thank_you?g=".scriptolution_dotcom_data($_REQUEST['g']));exit;	
}
$pagetitle = $lang['23'];
STemplate::assign('pagetitle',$pagetitle);

$IID = intval(scriptolution_dotcom_code(scriptolution_dotcom_data($_REQUEST['g'])));
$query = "select PID, multi from order_items where IID='".mysqli_real_escape_string($conn->_connectionID, $IID)."' AND USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."'"; 
$executequery=$conn->execute($query);
$PID = $executequery->fields['PID'];
$multi = $executequery->fields['multi'];

if($PID > 0)
{
	if($multi > 1)
	{
		$query = "select OID from orders where PID='".mysqli_real_escape_string($conn->_connectionID, $PID)."' AND USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' order by OID desc limit $multi"; 
		$results = $conn->execute($query);
		$returnthis = $results->getrows();
		STemplate::assign('OID',$returnthis);
		$templateselect = "thank_you_multi.tpl";
	}
	else
	{
		$query = "select OID from orders where PID='".mysqli_real_escape_string($conn->_connectionID, $PID)."' AND USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' order by OID desc limit 1"; 
		$executequery=$conn->execute($query);
		$OID = $executequery->fields['OID'];
		STemplate::assign('OID',$OID);
		$templateselect = "thank_you.tpl";
	}
}
else
{
	header("Location:$config[baseurl]/orders");exit;
}

//TEMPLATES BEGIN
STemplate::assign('message',$message);
STemplate::display('scriptolution_header.tpl');
STemplate::display($templateselect);
STemplate::display('scriptolution_footer_nobottom.tpl');
//TEMPLATES END
?>