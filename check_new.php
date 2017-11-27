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

scriptolution_dotcom_software("check_new.php");
$last_id = intval(scriptolution_dotcom_data($_REQUEST['last_id']));
$UID = intval(scriptolution_dotcom_data($_REQUEST['uid']));
if($UID > 0)
{
	$query="SELECT DISTINCT count(*) as total FROM members A, inbox B, members C WHERE A.USERID=B.MSGTO AND C.USERID=B.MSGFROM AND (B.MSGTO='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' AND B.MSGFROM='".mysqli_real_escape_string($conn->_connectionID, $UID)."') AND B.MID>'".mysqli_real_escape_string($conn->_connectionID, $last_id)."'";
	$executequery=$conn->execute($query);
	$cnt = $executequery->fields['total']+0;
	echo $cnt;
}
else
{
	echo "0";
}

?>