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

$ADMINID = intval(scriptolution_dotcom_data($_REQUEST['ADMINID']));
Stemplate::assign('ADMINID',$ADMINID);
if($_POST['submitform'] == "1")
{
	//
	if($_POST['scriptolutiontoken'] != $_SESSION['scriptolutiontoken'])
	{
		$error = "Error: Invalid security token";
	}
	else
	{
			$username = scriptolution_dotcom_data($_POST['username']);
			$password = scriptolution_dotcom_data($_POST['password']);
			$email = scriptolution_dotcom_data($_POST['email']);

			if($ADMINID > 0)
			{
				if($username == "")
				{
					$error = "Error: Please enter a username.";
				}
				elseif($email == "")
				{
					$error = "Error: Please enter a e-mail address.";
				}
				else
				{
					$sql="select count(*) as total from administrators WHERE username='".mysqli_real_escape_string($conn->_connectionID, $username)."' AND ADMINID!='".mysqli_real_escape_string($conn->_connectionID, $ADMINID)."'";
					$executequery = $conn->Execute($sql);
					$tadmins = $executequery->fields['total'];

					if($tadmins == "0")
					{
						$sql="select count(*) as total from administrators WHERE email='".mysqli_real_escape_string($conn->_connectionID, $email)."' AND ADMINID!='".mysqli_real_escape_string($conn->_connectionID, $ADMINID)."'";
						$executequery = $conn->Execute($sql);
						$tadmins = $executequery->fields['total'];

						if($tadmins == "0")
						{
							$addtosql = "";
							if ($password != "")
							{
								$newpassword = md5($password);
								$addtosql = ", password = '".mysqli_real_escape_string($conn->_connectionID, $newpassword)."'";
							}

							$sql = "UPDATE administrators set username='".mysqli_real_escape_string($conn->_connectionID, $username)."', email='".mysqli_real_escape_string($conn->_connectionID, $email)."' $addtosql WHERE ADMINID='".mysqli_real_escape_string($conn->_connectionID, $ADMINID)."'";
							$conn->execute($sql);
							$message = "Administrator Successfully Edited.";
							Stemplate::assign('message',$message);

							if($_SESSION['ADMINID'] == $ADMINID)
							{
								$_SESSION['ADMINUSERNAME'] = $username;

								if ($password != "")
								{
									$_SESSION['ADMINPASSWORD'] = $newpassword;
								}
							}

						}
						else
						{
							$error = "Error: The e-mail address $email is already taken.";
						}
					}
					else
					{
						$error = "Error: The username $username is already taken.";
					}
				}
			}
	}
	//
}

if($ADMINID > 0)
{
	$query = $conn->execute("select * from administrators where ADMINID='".mysqli_real_escape_string($conn->_connectionID, $ADMINID)."' limit 1");
	$admin = $query->getrows();
	Stemplate::assign('admin', $admin[0]);
}

//
$scriptolutiontoken = NewScriptolutionToken();
Stemplate::assign('scriptolutiontoken',$scriptolutiontoken);
$_SESSION['scriptolutiontoken'] = $scriptolutiontoken;
//

$mainmenu = "12";
$submenu = "1";
Stemplate::assign('error',$error);
Stemplate::assign('mainmenu',$mainmenu);
Stemplate::assign('submenu',$submenu);
STemplate::display("administrator/global_header.tpl");
STemplate::display("administrator/admins_edit.tpl");
STemplate::display("administrator/global_footer.tpl");
?>
