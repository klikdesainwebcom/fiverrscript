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

if($_REQUEST['tab'] == "sales")
{
	scriptolution_dotcom_software("balance?tab=sales");
	$templateselect = "balance_sales.tpl";
}
else
{
	scriptolution_dotcom_software("balance");
	$templateselect = "balance.tpl";
}
	
$pagetitle = $lang['205'];
STemplate::assign('pagetitle',$pagetitle);

$wdfunds = intval(scriptolution_dotcom_data($_POST['wdfunds']));
$wdfunds2 = intval(scriptolution_dotcom_data($_POST['wdfunds2']));
if($wdfunds == "1")
{		
	$pemail = scriptolution_db("pemail", "scriptolutoution_dotcom_fs_2");
	if($pemail == "")
	{
		$error = $lang['650'];
	}
	else
	{
		$query="INSERT INTO withdraw_requests SET USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."', time_added='".time()."', ap='0'";
		$conn->execute($query);
		$message = $lang['395'];
	}
}
elseif($wdfunds2 == "1")
{
	$aemail = scriptolution_db("aemail", "scriptolutoution_dotcom_fs_2");
	if($aemail == "")
	{
		$error = $lang['651'];
	}
	else
	{	
		$query="INSERT INTO withdraw_requests SET USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."', time_added='".time()."', ap='1'";
		$conn->execute($query);
		$message = $lang['395'];
	}
}

$query="SELECT OID, time, t, price, scriptolution_totalwfees3 FROM payments WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' order by ID desc";
$results=$conn->execute($query);
$o = $results->getrows();
STemplate::assign('o',$o);

$query = "select funds, afunds, withdrawn, used from members where USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."'"; 
$executequery=$conn->execute($query);
$funds = $executequery->fields['funds'];
STemplate::assign('funds',$funds);
$afunds = $executequery->fields['afunds'];
STemplate::assign('afunds',$afunds);
$withdrawn = $executequery->fields['withdrawn'];
STemplate::assign('withdrawn',$withdrawn);
$used = $executequery->fields['used'];
STemplate::assign('used',$used);

$query="SELECT A.OID, A.time, A.price, A.cancel, A.wd, B.status, B.cltime, B.IID, C.ctp FROM payments A, orders B, posts C WHERE A.OID=B.OID AND B.PID=C.PID AND C.USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' AND A.t='1' AND B.status>'0' order by A.ID desc";
$results=$conn->execute($query);
$p = $results->getrows();
STemplate::assign('p',$p);

$upcoming = "0.00";
$app = "0.00";
$clr = "0.00";
for($i=0; $i<count($p);$i++)
{
	$stat = $p[$i]['status'];
	$pce = $p[$i]['price'];
	$IID = intval($p[$i]['IID']);
	if($IID > 0)
	{
		$ctp = get_ctp($IID);
	}
	else
	{
		$ctp = $p[$i]['ctp'];
	}
	$pce = get_yprice2($p[$i]['price'], $ctp);
	$tme = $p[$i]['cltime'];
	if($stat == "5")
	{
		$dyz = get_days_withdraw($tme);
		if($dyz > 0)
		{
			$clr = $clr + $pce;
		}
		else
		{
			$iswd = $p[$i]['wd'];
			if($iswd == "0")
			{
				$app = $app + $pce;
			}
		}
	}
	elseif($stat == "2" || $stat == "3" || $stat == "7")
	{
	}
	else
	{
		$upcoming = $upcoming + $pce;	
		$upcoming = sprintf("%01.2f", $upcoming);
	}
}
STemplate::assign('upcoming',$upcoming);
$app = sprintf("%01.2f", $app);
STemplate::assign('app',$app);
$clr = sprintf("%01.2f", $clr);
STemplate::assign('clr',$clr);
$overall = $withdrawn + $upcoming + $app + $clr + $afunds;
$overall = sprintf("%01.2f", $overall);
STemplate::assign('overall',$overall);

//TEMPLATES BEGIN
STemplate::assign('error',$error);
STemplate::assign('message',$message);
STemplate::assign('sm3',"1");
STemplate::display('scriptolution_header.tpl');
STemplate::display($templateselect);
STemplate::display('scriptolution_footer_grey.tpl');
//TEMPLATES END
?>