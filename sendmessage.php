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

if($_POST['submg'] == "1")
{
	$msgto = intval(scriptolution_dotcom_data($_REQUEST['msgto']));
	$FID = intval(scriptolution_dotcom_data($_REQUEST['message_message_attachment_id']));
	$message_body = scriptolution_dotcom_data($_REQUEST['message_body']);
	$aboutid = intval(scriptolution_dotcom_data($_REQUEST['aboutid']));
	if($msgto > 0 && $message_body != "")
	{
		$message_body_scriptolution = filter_scriptolution_messages($message_body);
		if($message_body_scriptolution == "1")
		{
			STemplate::assign('notice',$lang['466']);
			$UID = $msgto;
			$query="SELECT DISTINCT A.username AS mto, C.username AS mfrom, B.* FROM members A, inbox B, members C WHERE A.USERID=B.MSGTO AND C.USERID=B.MSGFROM AND ((B.MSGTO='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' AND B.MSGFROM='".mysqli_real_escape_string($conn->_connectionID, $UID)."') OR (B.MSGTO='".mysqli_real_escape_string($conn->_connectionID, $UID)."' AND B.MSGFROM='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."')) order by B.MID asc";
			$results=$conn->execute($query);
			$m = $results->getrows();
			STemplate::assign('m',$m);
		}
		else
		{
			$query="INSERT INTO inbox SET MSGFROM='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."', MSGTO='".mysqli_real_escape_string($conn->_connectionID, $msgto)."',message='".mysqli_real_escape_string($conn->_connectionID, $message_body)."', FID='".mysqli_real_escape_string($conn->_connectionID, $FID)."', PID='".mysqli_real_escape_string($conn->_connectionID, $aboutid)."', time='".time()."'";
			$result=$conn->execute($query);
			$mid = mysqli_insert_id($conn->_connectionID);
			if($mid > 0)
			{
				$UID = $msgto;
				$query="SELECT DISTINCT A.username AS mto, C.username AS mfrom, B.* FROM members A, inbox B, members C WHERE A.USERID=B.MSGTO AND C.USERID=B.MSGFROM AND ((B.MSGTO='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' AND B.MSGFROM='".mysqli_real_escape_string($conn->_connectionID, $UID)."') OR (B.MSGTO='".mysqli_real_escape_string($conn->_connectionID, $UID)."' AND B.MSGFROM='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."')) order by B.MID asc";
				$results=$conn->execute($query);
				$m = $results->getrows();
				STemplate::assign('m',$m);
				
				$query="DELETE FROM archive WHERE AID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' AND USERID='".mysqli_real_escape_string($conn->_connectionID, $msgto)."'";
				$result=$conn->execute($query);
				
				$query = "select username,email from members where USERID='".mysqli_real_escape_string($conn->_connectionID, $msgto)."'"; 
				$executequery=$conn->execute($query);
				$sendto = $executequery->fields['email'];
				$sendname = $executequery->fields['username'];
				if($sendto != "")
				{
					$myname = stripslashes($_SESSION['USERNAME']);
					$sendername = $config['site_name'];
					$from = $config['site_email'];
					$subject = $lang['437'];
					$sendmailbody = stripslashes($sendname).",<br><br>".$myname." ";
					$sendmailbody .= $lang['438']."<br><br>".$lang['439'].": ".stripslashes($message_body)."<br><br>";
					$sendmailbody .= $lang['23'].",<br>".stripslashes($sendername);
					mailme($sendto,$sendername,$from,$subject,$sendmailbody,$bcc="");
				}
			}
		}
	}
}


//TEMPLATES BEGIN
STemplate::assign('message',$message);
STemplate::display('sendmessage.tpl');
//TEMPLATES END
?>