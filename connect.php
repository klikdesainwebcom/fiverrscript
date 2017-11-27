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
$thebaseurl = $config['baseurl'];

scriptolution_dotcom_software("connect.php");
if($SCRIPTOLUTION_U != "")
{
	
}
elseif($_REQUEST['jlog'] == "1")
{	
	$user_username = scriptolution_dotcom_data($_REQUEST['l_username']);
	STemplate::assign('user_username',$user_username);
	if($user_username == "")
	{
		$error = $lang['13'];	
	}
	elseif(strlen($user_username) < 4)
	{
		$error = $lang['25'];	
	}
	elseif(!preg_match("/^[a-zA-Z0-9]*$/i",$user_username))
	{
		$error = $lang['24'];
	}
	elseif(!verify_email_username($user_username))
	{
		$error = $lang['14'];
	}
		
	if($error == "")
	{
		$query="UPDATE members SET username='".mysqli_real_escape_string($conn->_connectionID, $user_username)."' WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' and status='1'";
		$result=$conn->execute($query);
		$_SESSION['USERNAME']=$user_username;
		header("Location:$config[baseurl]/");exit;
	}
}

STemplate::assign('pagetitle',$lang['448']);
//TEMPLATES BEGIN
STemplate::assign('error',$error);
STemplate::display('scriptolution_header_launch.tpl');
STemplate::display('scriptolutionconnect.tpl');
STemplate::display('scriptolution_footer_launch.tpl');
//TEMPLATES END
?>