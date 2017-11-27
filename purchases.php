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

scriptolution_dotcom_software("purchases");		
$templateselect = "purchases.tpl";
$pagetitle = $lang['461'];
STemplate::assign('pagetitle',$pagetitle);	

$query="SELECT A.gtitle, B.* FROM posts A, featured B WHERE A.USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' AND A.PID=B.PID order by B.ID desc";
$results=$conn->execute($query);
$o = $results->getrows();
STemplate::assign('o',$o);	

//TEMPLATES BEGIN
STemplate::assign('message',$message);
STemplate::assign('sm4',"1");
STemplate::display('scriptolution_header.tpl');
STemplate::display($templateselect);
STemplate::display('scriptolution_footer_grey.tpl');
//TEMPLATES END
?>