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

if ($_REQUEST['c'] != "")
{
	if (strlen($_REQUEST['c']) != "15")
	{
		$error = $lang['403'];
	}
	else
	{
		$code = scriptolution_dotcom_data($_REQUEST['c']);
		$query="SELECT * from members_verifycode WHERE code='".mysqli_real_escape_string($conn->_connectionID, $code)."'";
		$result=$conn->execute($query);
		
		if($result->recordcount()>=1)
		{
			$userid = $result->fields['USERID'];
			$verified = scriptolution_db("verified", "scriptolutoution_dotcom_fs_2");
			
			if ($verified == "1")
			{
				$error = $lang['404'];
			}
			else
			{
				$query="UPDATE members SET verified='1' WHERE USERID='$userid'";
				$result=$conn->execute($query);
				$message = $lang['405'];
				if ($_SESSION['USERID'] == $userid)
				{
					$_SESSION['VERIFIED'] = "1";
				}
			}
		}
		else
		{
			$error = $lang['403'];;
		}
	}
}

$pagetitle = $lang['406'];
STemplate::assign('pagetitle',$pagetitle);
STemplate::assign('message',$message);
STemplate::assign('error',$error);

//TEMPLATES BEGIN
if($config['scriptolution_launch_mode'] != "0")
{
	STemplate::display('scriptolution_header_launch.tpl');
}
else
{
STemplate::display('scriptolution_header.tpl');
}
STemplate::display('confirmemail.tpl');
if($config['scriptolution_launch_mode'] != "0")
{
	STemplate::display('scriptolution_footer_launch.tpl');
}
else
{
STemplate::display('scriptolution_footer_nobottom.tpl');
}
//TEMPLATES END
?>