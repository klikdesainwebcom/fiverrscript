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

$REQUESTID = intval(scriptolution_dotcom_data($_REQUEST['ID']));
scriptolution_dotcom_software("viewoffers?ID=".$REQUESTID);		
if($REQUESTID > 0)
{
	$pagetitle = $lang['641'];
	STemplate::assign('pagetitle',$pagetitle);
	
	$query = "select * from scriptolutionrequests where REQUESTID='".mysqli_real_escape_string($conn->_connectionID, $REQUESTID)."' AND active='1' AND USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' limit 1"; 
	$executequery=$conn->execute($query);
	$scriptolutionz = $executequery->getrows();
	STemplate::assign('scriptolutionz',$scriptolutionz);
	
	if(count($scriptolutionz) > 0)
	{
		$REQUESTID = $scriptolutionz[0]['REQUESTID'];
		STemplate::assign('REQUESTID',$REQUESTID);
		
		$query = "select A.scriptolutionmsg, B.gtitle, B.p1, B.price, B.days, B.category, B.PID, C.USERID, C.username from offerscriptolution A, posts B, members C WHERE A.PID=B.PID AND B.USERID=C.USERID AND A.REQUESTID='".mysqli_real_escape_string($conn->_connectionID, $REQUESTID)."' order by A.SCRIPTOLUTIONOFID desc"; 
		$results = $conn->execute($query);
		$offers = $results->getrows();
		STemplate::assign('offers',$offers);
	}		
}
else
{
	header("Location:$config[baseurl]/myrequests");exit;
}

//TEMPLATES BEGIN
STemplate::assign('message',$message);
STemplate::assign('sm1',"1");
STemplate::display('scriptolution_header.tpl');
STemplate::display('scriptolutionviewoffers.tpl');
STemplate::display('scriptolution_footer_grey.tpl');
//TEMPLATES END
?>