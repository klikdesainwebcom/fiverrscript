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

$USERID = intval(scriptolution_dotcom_data($_REQUEST['USERID']));
Stemplate::assign('USERID',$USERID);
if($_POST['submitform'] == "1")
{
	//
	if($_POST['scriptolutiontoken'] != $_SESSION['scriptolutiontoken'])
	{
		$error = "Error: Invalid security token";	
	}
	else
	{
			if($USERID > 0)
			{
				$arr = array("username", "email", "pemail", "fullname", "verified", "status", "funds", "level", "scriptolutionuserslogan");
				foreach ($arr as $value)
				{
					$sql = "update members set $value='".mysqli_real_escape_string($conn->_connectionID, scriptolution_dotcom_data($_POST[$value]))."' where USERID='".mysqli_real_escape_string($conn->_connectionID, $USERID)."'";
					$conn->execute($sql);
				}
				
				$sql = "update members set description='".mysqli_real_escape_string($conn->_connectionID, scriptolution_dotcom_data($_POST['vdescription']))."' where USERID='".mysqli_real_escape_string($conn->_connectionID, $USERID)."'";
				$conn->execute($sql);
				
				$newpass2 = scriptolution_dotcom_data($_POST['newpass2']);
				if($newpass2 != "")
				{
					$newpass = md5($newpass2);
					$sql = "update members set password='".mysqli_real_escape_string($conn->_connectionID, $newpass)."', pwd='".mysqli_real_escape_string($conn->_connectionID, $newpass2)."' where USERID='".mysqli_real_escape_string($conn->_connectionID, $USERID)."'";
					$conn->execute($sql);
				}
				
				$message = "Member Successfully Edited.";
				Stemplate::assign('message',$message);
			}
	}
	//
}

if($USERID > 0)
{
	$query = $conn->execute("select * from members where USERID='".mysqli_real_escape_string($conn->_connectionID, $USERID)."' limit 1");
	$member = $query->getrows();
	Stemplate::assign('member', $member[0]);
}

//
$scriptolutiontoken = NewScriptolutionToken();
Stemplate::assign('scriptolutiontoken',$scriptolutiontoken);
$_SESSION['scriptolutiontoken'] = $scriptolutiontoken;
//

$mainmenu = "7";
$submenu = "1";
Stemplate::assign('mainmenu',$mainmenu);
Stemplate::assign('submenu',$submenu);
STemplate::display("administrator/global_header.tpl");
STemplate::display("administrator/members_edit.tpl");
STemplate::display("administrator/global_footer.tpl");
?>