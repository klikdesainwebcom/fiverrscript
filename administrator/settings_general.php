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
	$arr = array("site_name", "site_slogan", "site_email", "items_per_page", "items_per_page_new", "approve_stories", "approve_suggests", "enable_fc", "FACEBOOK_APP_ID", "FACEBOOK_SECRET", "twitter", "short_urls", "vonly", "scriptolution_toprated_rating", "scriptolution_toprated_count", "verify_pm", "def_country", "scriptolution_proxy_block", "enable_captcha", "fiverrscript_dotcom_home_featcats", "scriptolution_notify_gigval", "scriptolution_notify_gigval_email", "scriptolution_solve_c", "scriptolution_solve_v", "scriptolution_solve_h", "recaptcha_pubkey", "recaptcha_privkey", "scriptolution_cur_pos", "scriptolution_launch_mode", "scriptolution_mail_from_name", "enablescriptolutionlocations", "scriptolution_map_key", "scriptolution_enable_processing_fee", "scriptolution_processing_fee", "enable_scriptolutionminwd", "scriptolutionminwd");
	foreach ($arr as $value)
	{
		$sql = "update config set value='".mysqli_real_escape_string($conn->_connectionID, scriptolution_dotcom_data($_POST[$value]))."' where setting='$value'";
		$conn->execute($sql);
		Stemplate::assign($value,scriptolution_dotcom_data($_POST[$value]));
	}
	$message = "General Settings Successfully Saved.";
	Stemplate::assign('message',$message);
}

$mainmenu = "2";
$submenu = "1";
Stemplate::assign('mainmenu',$mainmenu);
Stemplate::assign('submenu',$submenu);
STemplate::display("administrator/global_header.tpl");
STemplate::display("administrator/settings_general.tpl");
STemplate::display("administrator/global_footer.tpl");
?>