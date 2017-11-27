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

scriptolution_dotcom_software("");

$spamid = intval(scriptolution_dotcom_data($_REQUEST['id']));
if($spamid > 0)
{
	$query="INSERT INTO inbox_reports SET USERID='".mysqli_real_escape_string($conn->_connectionID, $_SESSION['USERID'])."', time='".time()."', MID='".mysqli_real_escape_string($conn->_connectionID, $spamid)."'";
	$result=$conn->execute($query);
	echo "document.getElementById('spam_message' + ".$spamid.").innerHTML = '&nbsp;".$lang['247']."';";
}
?>