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
	$scriptolutionbannedword = scriptolution_dotcom_data($_POST['add']);
	if($scriptolutionbannedword!="")
	{
		$sql = "insert bans_words set word='".mysqli_real_escape_string($conn->_connectionID, scriptolution_dotcom_data($scriptolutionbannedword))."'";
		$conn->execute($sql);
		$message = "Word Successfully Banned.";
		Stemplate::assign('message',$message);
	}
}

$mainmenu = "5";
$submenu = "4";
Stemplate::assign('mainmenu',$mainmenu);
Stemplate::assign('submenu',$submenu);
STemplate::display("administrator/global_header.tpl");
STemplate::display("administrator/bans_words_add.tpl");
STemplate::display("administrator/global_footer.tpl");
?>
