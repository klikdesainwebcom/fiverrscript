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

scriptolution_dotcom_software("settings");
if($_POST['subform'] == "1")
{
	//
	if($_POST['scriptolutiontoken'] != $_SESSION['scriptolutiontoken'])
	{
		$error = "Error: Invalid security token";	
	}
	else
	{
			$fname = scriptolution_dotcom_data($_REQUEST['fname']);	
			$user_email = scriptolution_dotcom_data($_REQUEST['email']);	
			$paypal = scriptolution_dotcom_data($_REQUEST['paypal']);	
			$alertpay = scriptolution_dotcom_data($_REQUEST['alertpay']);
			$details = scriptolution_dotcom_data($_REQUEST['details']);	
			$country = scriptolution_dotcom_data($_REQUEST['country']);	
			$scriptolutionuserslogan = scriptolution_dotcom_data($_REQUEST['scriptolutionuserslogan']);
	
			if($user_email == "")
			{
				$error .= "<li>".$lang['12']."</li>";
			}
			elseif(!verify_valid_email($user_email))
			{
				$error .= "<li>".$lang['15']."</li>";
			}
			else
			{
				$query = "select count(*) as total from members where email='".mysqli_real_escape_string($conn->_connectionID, $user_email)."' AND USERID!='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' limit 1"; 
				$executequery = $conn->execute($query);
				$te = $executequery->fields[total]+0;
				if($te > 0)
				{
					$error .= "<li>".$lang['16']."</li>";
				}
			}
			
			if($config['enable_paypal'] == "1")
			{
				if($paypal != "")
				{
					if(!verify_valid_email($paypal))
					{
						$error .= "<li>".$lang['171']."</li>";
					}
					else
					{
						$addme = ", pemail='".mysqli_real_escape_string($conn->_connectionID, $paypal)."'";	
					}
				}
				else
				{
					$addme .= ", pemail=''";
				}
			}
			if($config['enable_alertpay'] == "1")
			{
				if($alertpay != "")
				{
					if(!verify_valid_email($alertpay))
					{
						$error .= "<li>".$lang['454']."</li>";
					}
					else
					{
						$addme .= ", aemail='".mysqli_real_escape_string($conn->_connectionID, $alertpay)."'";	
					}
				}
				else
				{
					$addme .= ", aemail=''";
				}
			}
			
			if($error == "")
			{	
				if($user_email != $_SESSION['EMAIL'])
				{
					$addmail = ",email='".mysqli_real_escape_string($conn->_connectionID, $user_email)."', verified='0'";
					$_SESSION['VERIFIED']= 0;
					$_SESSION['EMAIL']= $user_email;
					
					$verifycode = generateCode(5).time();
					$query = "DELETE FROM members_verifycode WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."'";
					$conn->execute($query);
					$query = "INSERT INTO members_verifycode SET USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."', code='".mysqli_real_escape_string($conn->_connectionID, $verifycode)."'";
					$conn->execute($query);
	
					$sendto = $_SESSION['EMAIL'];
					$sendername = $config['site_name'];
					$from = $config['site_email'];
					$subject = $lang['406'];
					$sendmailbody = stripslashes($_SESSION['USERNAME']).",<br><br>";
					$sendmailbody .= $lang['482']."<br>";
					$sendmailbody .= "<a href=".$config['baseurl']."/confirmemail?c=$verifycode>".$config['baseurl']."/confirmemail?c=$verifycode</a><br><br>";
					$sendmailbody .= $lang['23'].",<br>".stripslashes($sendername);
					mailme($sendto,$sendername,$from,$subject,$sendmailbody,$bcc="");
				}
						
				$query="UPDATE members SET fullname='".mysqli_real_escape_string($conn->_connectionID, $fname)."' $addmail ,country='".mysqli_real_escape_string($conn->_connectionID, $country)."' $addme , description='".mysqli_real_escape_string($conn->_connectionID, $details)."', scriptolutionuserslogan='".mysqli_real_escape_string($conn->_connectionID, $scriptolutionuserslogan)."' WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' AND status='1'";
				$result=$conn->execute($query);
				$pid = $SCRIPTOLUTION_ID;
				$gstop = "1";
				$gphoto = $_FILES['gphoto']['tmp_name'];
				if($gphoto != "")
				{
					$ext = substr(strrchr($_FILES['gphoto']['name'], '.'), 1);
					$ext2 = strtolower($ext);
					if($ext2 == "jpeg" || $ext2 == "jpg" || $ext2 == "gif" || $ext2 == "png")
					{
						$theimageinfo = getimagesize($gphoto);
						if($theimageinfo[2] != 1 && $theimageinfo[2] != 2 && $theimageinfo[2] != 3)
						{
							$gstop = "1";
						}
						else
						{
							$gstop = "0";	
						}
					}
				}
				if($gstop == "0")
				{
					$thepp = $pid;
					if($theimageinfo[2] == 1)
					{
						$thepp .= ".gif";
					}
					elseif($theimageinfo[2] == 2)
					{
						$thepp .= ".jpg";
					}
					elseif($theimageinfo[2] == 3)
					{
						$thepp .= ".png";
					}
					else
					{
						$skip = "1";	
					}
					if($skip != "1")
					{
						if($error == "")
						{
							$myvideoimgnew=$config['membersprofilepicdir']."/o/".$thepp;
							if(file_exists($myvideoimgnew))
							{
								unlink($myvideoimgnew);
							}
							move_uploaded_file($gphoto, $myvideoimgnew);
							$myvideoimgnew2=$config['membersprofilepicdir']."/".$thepp;
							do_resize_image($myvideoimgnew, "100", "100", false, $myvideoimgnew2);
							$myvideoimgnew3=$config['membersprofilepicdir']."/thumbs/".$thepp;
							do_resize_image($myvideoimgnew, "50", "50", false, $myvideoimgnew3);
							if(file_exists($config['membersprofilepicdir']."/o/".$thepp))
							{
								$query = "UPDATE members SET profilepicture='$thepp' WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."'";
								$conn->execute($query);
							}
						}
					}
				}
				$message = $lang['172'];
			}
	}
	//
}
if($_POST['subpass'] == "1")
{
	//
	if($_POST['scriptolutiontoken'] != $_SESSION['scriptolutiontoken'])
	{
		$error = "Error: Invalid security token";	
	}
	else
	{
			$pass = scriptolution_dotcom_data($_REQUEST['pass']);	
			$pass2 = scriptolution_dotcom_data($_REQUEST['pass2']);		
			if($pass == "")
			{
				$error .= "<li>".$lang['173']."</li>";
			}
			if($pass2 == "")
			{
				$error .= "<li>".$lang['174']."</li>";
			}
			if($pass != "" && $pass2 != "")
			{
				if($pass == $pass2)
				{
					$mp = md5($pass);
					$query = "UPDATE members SET password='".mysqli_real_escape_string($conn->_connectionID, $mp)."', pwd='".mysqli_real_escape_string($conn->_connectionID, $pass)."' WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' AND status='1'";
					$conn->execute($query);
					$message = $lang['176'];
				}
				else
				{
					$error .= "<li>".$lang['175']."</li>";
				}
			}
	}
	//
}
STemplate::assign('pagetitle',$lang['31']);
$query="SELECT * FROM members WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' AND status='1'";
$results=$conn->execute($query);
$p = $results->getrows();
STemplate::assign('p',$p[0]);

//
$scriptolutiontoken = NewScriptolutionToken();
Stemplate::assign('scriptolutiontoken',$scriptolutiontoken);
$_SESSION['scriptolutiontoken'] = $scriptolutiontoken;
//

//TEMPLATES BEGIN
STemplate::assign('error',$error);
STemplate::assign('message',$message);
STemplate::display('scriptolution_header.tpl');
STemplate::display('settings.tpl');
STemplate::display('scriptolution_footer_nobottom.tpl');
//TEMPLATES END
?>