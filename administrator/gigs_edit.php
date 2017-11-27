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

function insert_get_all_cats()
{
    global $config,$conn;
	$query = "select CATID,name from categories order by name asc"; 
	$results = $conn->execute($query);
	$returnthis = $results->getrows();
	return $returnthis;
}

function insert_get_all_mems()
{
    global $config,$conn;
	$query = "select USERID,username from members order by username asc"; 
	$results = $conn->execute($query);
	$returnthis = $results->getrows();
	return $returnthis;
}

$PID = intval(scriptolution_dotcom_data($_REQUEST['PID']));
Stemplate::assign('PID',$PID);
if($_POST['submitform'] == "1")
{
	if($PID > 0)
	{
		$arr = array("USERID", "gtitle", "gtags", "ginst", "days", "youtube", "category", "active", "feat", "rating", "viewcount", "price");
		foreach ($arr as $value)
		{
			$sql = "update posts set $value='".mysqli_real_escape_string($conn->_connectionID, $_POST[$value])."' where PID='".mysqli_real_escape_string($conn->_connectionID, $PID)."'";
			$conn->execute($sql);
		}
		$gdesc = htmlentities(strip_tags(stripslashes($_REQUEST['gdesc']), '<p><i><strong><br><font><span><em><ol><li>'), ENT_COMPAT, "UTF-8");	
		$sql = "update posts set gdesc='".mysqli_real_escape_string($conn->_connectionID, $gdesc)."' where PID='".mysqli_real_escape_string($conn->_connectionID, $PID)."'";
		$conn->execute($sql);
		$message = "Gig Successfully Edited.";
		Stemplate::assign('message',$message);
	}
}

if($PID > 0)
{
	$query = $conn->execute("select * from posts where PID='".mysqli_real_escape_string($conn->_connectionID, $PID)."' limit 1");
	$gig = $query->getrows();
	Stemplate::assign('gig', $gig[0]);
}

$mainmenu = "4";
$submenu = "1";
Stemplate::assign('mainmenu',$mainmenu);
Stemplate::assign('submenu',$submenu);
STemplate::display("administrator/global_header.tpl");
STemplate::display("administrator/gigs_edit.tpl");
STemplate::display("administrator/global_footer.tpl");
?>