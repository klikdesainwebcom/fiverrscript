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
$SCRIPTOLUTIONADMINPANEL = "1";
include("include/config.php");
include("include/functions/import.php");
$thebaseurl = $config['baseurl'];

$r = scriptolution_dotcom_data(stripslashes($_REQUEST['r']));
STemplate::assign('r',$r);

if($config['scriptolution_launch_mode'] != "0")
{
	$c = scriptolution_dotcom_data(stripslashes($_REQUEST['c']));
	if($c == "")
	{
		$error = $lang['610'];
		$templateselect = "error.tpl";
	}
	else
	{
		$query = "select count(*) as total from invites_code where code='".mysqli_real_escape_string($conn->_connectionID, $c)."'"; 
		$executequery = $conn->execute($query);
		$totalc = intval($executequery->fields['total']);
		if($totalc > 0)
		{
			STemplate::assign('c',$c);

			$scriptolution_proceed = "0";
			if($config['enable_captcha'] == "3")
			{
				require_once("ayah.php");
				$ayah = new AYAH();	
				
				if($_REQUEST['jsub'] == "1")
				{
					$score = $ayah->scoreResult();
					if ($score)
					{
						$scriptolution_proceed = "1";
					}
					else
					{
						$error = $lang['19'];
					}
				}	
				$scriptolutiongetplaythru = $ayah->getPublisherHTML();
				STemplate::assign('scriptolutiongetplaythru',$scriptolutiongetplaythru);
			}
			elseif($config['enable_captcha'] == "4")
			{
				require_once("solvemedialib.php");
				if($_REQUEST['jsub']!="")
				{		
					$privkey = $config['scriptolution_solve_v'];
					$hashkey = $config['scriptolution_solve_h'];
					$solvemedia_response = solvemedia_check_answer($privkey,
										$_SERVER["REMOTE_ADDR"],
										$_POST["adcopy_challenge"],
										$_POST["adcopy_response"],
										$hashkey);
					if (!$solvemedia_response->is_valid) {
						$error = $lang['19'];
					}
					else {
						$scriptolution_proceed = "1";
					}		
				}	
				$scriptolutionsolvemedia = solvemedia_get_html($config['scriptolution_solve_c']);
				STemplate::assign('scriptolutionsolvemedia',$scriptolutionsolvemedia);
			}
			elseif($config['enable_captcha'] == "2")
			{
				$pubkey  = $config['recaptcha_pubkey'];
				$privkey = $config['recaptcha_privkey'];
				if($_REQUEST['jsub']!="")
				{
					if(isset($_POST['g-recaptcha-response']))
					{
					  $captcha=$_POST['g-recaptcha-response'];
					}
					if(!$captcha)
					{
						$error = $lang['19'];
					}
					else
					{
						$response = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=".$privkey."&response=".$captcha."&remoteip=".$_SERVER['REMOTE_ADDR']);
						if($response.success==false)
						{
							$error = $lang['19'];
						}
						else
						{
							$scriptolution_proceed = "1";
						}
					}
				}
			}
			else
			{
				$scriptolution_proceed = "1";
			}
			if($_REQUEST['jsub'] == "1" && $scriptolution_proceed == "1")
			{
				$user_email = scriptolution_dotcom_data($_REQUEST['user_email']);
				$user_username = scriptolution_dotcom_data($_REQUEST['user_username']);
				$user_password = scriptolution_dotcom_data($_REQUEST['user_password']);
				$user_password2 = str_replace(" ", "", $user_password);
				$user_terms_of_use = scriptolution_dotcom_data($_REQUEST['user_terms_of_use']);
				
				if($user_email == "")
				{
					$error = $lang['12'];
				}
				elseif(!verify_valid_email($user_email))
				{
					$error = $lang['15'];
				}
				elseif (!verify_email_unique($user_email))
				{
					$error = $lang['16'];
				}	
				elseif($user_username == "")
				{
					$error = $lang['13'];	
				}
				elseif(strlen($user_username) < 4)
				{
					$error = $lang['25'];	
				}
				elseif(strlen($user_username) > 15)
				{
					$error = $lang['508'];	
				}
				elseif(!preg_match("/^[a-zA-Z0-9]*$/i",$user_username))
				{
					$error = $lang['24'];
				}
				elseif(!verify_email_username($user_username))
				{
					$error = $lang['14'];
				}	
				elseif($user_password == "" || $user_password2 == "")
				{
					$error = $lang['17'];	
				}	
				elseif($user_terms_of_use != "1")
				{
					$error = $lang['20'];	
				}
				
				if ($config['enable_captcha'] == "1")
				{
					$user_captcha_solution = scriptolution_dotcom_data($_REQUEST['user_captcha_solution']);
					if($user_captcha_solution == "")
					{
						$error = $lang['18'];	
					}
					elseif($user_captcha_solution != $_SESSION['imagecode'])
					{
						$error = $lang['19'];	
					}
				}

				if($error == "")
				{
					$md5pass = md5($user_password);
					$def_country = $config['def_country'];
					if($def_country == "")
					{
						$def_country = "US";	
					}
					$query="INSERT INTO members SET email='".mysqli_real_escape_string($conn->_connectionID, $user_email)."',username='".mysqli_real_escape_string($conn->_connectionID, $user_username)."', password='".mysqli_real_escape_string($conn->_connectionID, $md5pass)."', pwd='".mysqli_real_escape_string($conn->_connectionID, $user_password)."', addtime='".time()."', lastlogin='".time()."', ip='".$_SERVER['REMOTE_ADDR']."', lip='".$_SERVER['REMOTE_ADDR']."', country='".mysqli_real_escape_string($conn->_connectionID, $def_country)."'";
					$result=$conn->execute($query);
					$userid = mysqli_insert_id($conn->_connectionID);
		
					if(scriptolution_dotcom_script($userid))
					{
						$query="SELECT USERID,email,username,verified from members WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $userid)."'";
						$result=$conn->execute($query);
						
						$SUSERID = $result->fields['USERID'];
						$SEMAIL = $result->fields['email'];
						$SUSERNAME = $result->fields['username'];
						$SVERIFIED = $result->fields['verified'];
						$_SESSION['USERID']=$SUSERID;
						$_SESSION['EMAIL']=$SEMAIL;
						$_SESSION['USERNAME']=$SUSERNAME;
						$_SESSION['VERIFIED']=$SVERIFIED;
						$_SESSION['SCRIPTOLUTIONAUTHORIZED'] = 1;
						
						// Generate Verify Code Begin
						$verifycode = generateCode(5).time();
						$query = "INSERT INTO members_verifycode SET USERID='".mysqli_real_escape_string($conn->_connectionID, $SUSERID)."', code='$verifycode'";
						$conn->execute($query);
						if(mysql_affected_rows()>=1)
						{
							$proceedtoemail = true;
						}
						else
						{
							$proceedtoemail = false;
						}
						// Generate Verify Code End
						
						// Send Welcome E-Mail Begin
						if ($proceedtoemail)
						{
							$sendto = $SEMAIL;
							$sendername = $config['site_name'];
							$from = $config['site_email'];
							$subject = $lang['21']." ".$sendername;
							$sendmailbody = stripslashes($_SESSION['USERNAME']).",<br><br>";
							$sendmailbody .= $lang['22']."<br>";
							$sendmailbody .= "<a href=".$config['baseurl']."/confirmemail?c=$verifycode>".$config['baseurl']."/confirmemail?c=$verifycode</a><br><br>";
							$sendmailbody .= $lang['23'].",<br>".stripslashes($sendername);
							mailme($sendto,$sendername,$from,$subject,$sendmailbody,$bcc="");
						}
						// Send Welcome E-Mail End
						
						$query = "DELETE FROM invites_code WHERE code='".mysqli_real_escape_string($conn->_connectionID, $c)."'";
						$conn->Execute($query);
						
						header("Location:$thebaseurl/index.php");exit;
					}	
				}
				else
				{
					STemplate::assign('user_email',$user_email);
					STemplate::assign('user_username',$user_username);
					STemplate::assign('user_password',$user_password);
					STemplate::assign('user_password2',$user_password2);
					STemplate::assign('user_terms_of_use',$user_terms_of_use);
				}
			}
			$templateselect = "invite_signup.tpl";
		}
		else
		{
			$error = $lang['610'];
			$templateselect = "error.tpl";
		}
	}
}
else
{
	$rto = $thebaseurl."/signup";
	header("Location:$rto");exit;
}

$pagetitle = $lang['1'];
STemplate::assign('pagetitle',$pagetitle);

//TEMPLATES BEGIN
STemplate::assign('error',$error);
STemplate::display('scriptolution_header_launch.tpl');
STemplate::display($templateselect);
STemplate::display('scriptolution_footer_launch.tpl');
//TEMPLATES END
?>