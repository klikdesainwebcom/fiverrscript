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

$BID = intval(scriptolution_dotcom_data($_REQUEST['id']));
$do = scriptolution_dotcom_data($_REQUEST['do']);
if($BID > 0)
{
	if($do == "add")
	{
		$query="INSERT INTO bookmarks SET USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."', PID='".mysqli_real_escape_string($conn->_connectionID, $BID)."', time_added='".time()."'";
		$result=$conn->execute($query);
	}
	elseif($do == "rem")
	{
		$query="DELETE FROM bookmarks WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' AND PID='".mysqli_real_escape_string($conn->_connectionID, $BID)."'";
		$result=$conn->execute($query);
	}
}


?>