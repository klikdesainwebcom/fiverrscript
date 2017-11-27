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
$adminurl = $config['adminurl'];

$ID = intval(scriptolution_dotcom_data($_REQUEST['ID']));
if($ID > 0)
{
	if($_POST['submitform'] == "1")
	{
		$pprice = scriptolution_dotcom_data($_POST['pprice']);
		$pcom = scriptolution_dotcom_data($_POST['pcom']);
		$l1 = intval(scriptolution_dotcom_data($_POST['l1']));
		$l2 = intval(scriptolution_dotcom_data($_POST['l2']));
		$l3 = intval(scriptolution_dotcom_data($_POST['l3']));
		
		if($pprice == "")
		{
			$error = "Error: Please enter a price.";
		}
		elseif($pcom == "")
		{
			$error = "Error: Please enter a percentage commission.";
		}
		else
		{
	
			$sql = "update packs set pprice='".mysqli_real_escape_string($conn->_connectionID, $pprice)."', pcom='".mysqli_real_escape_string($conn->_connectionID, $pcom)."', l1='".mysqli_real_escape_string($conn->_connectionID, $l1)."', l2='".mysqli_real_escape_string($conn->_connectionID, $l2)."', l3='".mysqli_real_escape_string($conn->_connectionID, $l3)."' WHERE ID='".mysqli_real_escape_string($conn->_connectionID, $ID)."'";
			$conn->execute($sql);
			$message = "Price Pack Successfully Edited.";
			Stemplate::assign('message',$message);
	
		}
	}

	$query = $conn->execute("select * from packs where ID='".mysqli_real_escape_string($conn->_connectionID, $ID)."' limit 1");
	$p = $query->getrows();
	Stemplate::assign('p', $p[0]);
}

$mainmenu = "2";
$submenu = "1";
Stemplate::assign('mainmenu',$mainmenu);
Stemplate::assign('submenu',$submenu);
Stemplate::assign('sorthow',$sorthow);
Stemplate::assign('sortby',$sortby);
Stemplate::assign('currentpage',$currentpage);
STemplate::display("administrator/global_header.tpl");
STemplate::assign('beginning',$beginning);
STemplate::assign('ending',$ending);
STemplate::assign('pagelinks',$pagelinks);
STemplate::assign('total',$total+0);
STemplate::assign('results',$results);
Stemplate::assign('error',$error);
STemplate::display("administrator/settings_editpack.tpl");
STemplate::display("administrator/global_footer.tpl");
?>