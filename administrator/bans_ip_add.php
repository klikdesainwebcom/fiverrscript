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

if($_POST['submitform'] == "1")
{
	$myip = $_SERVER['REMOTE_ADDR'];
	$toaddip = scriptolution_dotcom_data($_POST['add']);
	if($myip == $toaddip)
	{
		$error = "Error: You cannot ban yourself.";
		Stemplate::assign('error',$error);
	}
	else
	{
		$sql = "insert bans_ips set ip='".mysqli_real_escape_string($conn->_connectionID, $toaddip)."'";
		$conn->execute($sql);
		$message = "IP Successfully Banned.";
		Stemplate::assign('message',$message);
	}
}

$mainmenu = "13";
$submenu = "2";
Stemplate::assign('mainmenu',$mainmenu);
Stemplate::assign('submenu',$submenu);
STemplate::display("administrator/global_header.tpl");
STemplate::display("administrator/bans_ip_add.tpl");
STemplate::display("administrator/global_footer.tpl");
?>