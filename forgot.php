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

if($_REQUEST['fpsub'] == "1")
{
	$user_email = scriptolution_dotcom_data($_REQUEST['email']);
	if($user_email == "")
	{
		$error .= "<li>".$lang['12']."</li>";
	}
	
	if($error == "")
	{
		$query="SELECT USERID,username,pwd FROM members WHERE email='".mysqli_real_escape_string($conn->_connectionID, $user_email)."'";
		$result=$conn->execute($query);
		$UID = $result->fields['USERID'];
		$pwd = $result->fields['pwd'];
		$un = $result->fields['username'];
		
		if($pwd == "")
		{
			if(intval($UID) > 0)
			{
				$pwd = scriptolution_dotcom_evaluate(8);
				$mp = md5($pwd);
				$query = "UPDATE members SET password='".mysqli_real_escape_string($conn->_connectionID, $mp)."', pwd='".mysqli_real_escape_string($conn->_connectionID, $pwd)."' WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $UID)."' AND status='1'";
				$conn->execute($query);
			}
		}
		
		// Send E-Mail Begin
		$sendto = $user_email;
		$sendername = $config['site_name'];
		$from = $config['site_email'];
		$subject = $lang['50'];
		$sendmailbody = stripslashes($un).",<br><br>";
		$sendmailbody .= $lang['51']."<br>";
		$sendmailbody .= $lang['52']." $pwd <br><br>";
		$sendmailbody .= $lang['23'].",<br>".stripslashes($sendername);
		mailme($sendto,$sendername,$from,$subject,$sendmailbody,$bcc="");
		// Send E-Mail End
		$msg .= "<li>".$lang['53']."</li>";
	}
}
STemplate::assign('error',$error);
STemplate::assign('msg',$msg);
STemplate::display('forgot.tpl');

?>