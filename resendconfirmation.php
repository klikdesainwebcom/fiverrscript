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

scriptolution_dotcom_software("resendconfirmation.php");

$verifycode = scriptolution_db("code", "scriptolutoution_dotcom_fs_1");

$sendto = $SCRIPTOLUTION_E;
$sendername = $config['site_name'];
$from = $config['site_email'];
$subject = $lang['406'];
$sendmailbody = stripslashes($SCRIPTOLUTION_U).",<br><br>";
$sendmailbody .= $lang['482']."<br>";
$sendmailbody .= "<a href=".$config['baseurl']."/confirmemail?c=$verifycode>".$config['baseurl']."/confirmemail?c=$verifycode</a><br><br>";
$sendmailbody .= $lang['23'].",<br>".stripslashes($sendername);
mailme($sendto,$sendername,$from,$subject,$sendmailbody,$bcc="");
$message = $lang['481'];

STemplate::assign('pagetitle',$lang['480']);
STemplate::assign('message',$message);
STemplate::assign('error',$error);

//TEMPLATES BEGIN
STemplate::display('scriptolution_header.tpl');
STemplate::display('resendconfirmation.tpl');
STemplate::display('scriptolution_footer_nobottom.tpl');
//TEMPLATES END
?>