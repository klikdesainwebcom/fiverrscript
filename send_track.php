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
	$oid = intval(scriptolution_dotcom_data($_REQUEST['oid']));
	$scriptolution = scriptolution_dotcom_data($_REQUEST['message_message_format']);
	STemplate::assign('oid',$oid);
	$who = scriptolution_dotcom_data($_REQUEST['who']);
	STemplate::assign('who',$who);
	
	$query = "select USERID, PID, status, price from orders where OID='".mysqli_real_escape_string($conn->_connectionID, $oid)."'"; 
	$executequery=$conn->execute($query);
	$USERID = $executequery->fields['USERID'];
	STemplate::assign('USERID',$USERID);
	$PID = $executequery->fields['PID'];
	$status = $executequery->fields['status'];
	$rprice = $executequery->fields['price'];
	$ascriptolutionnotificationwassent = 0; //
	if($status != "2" && $status != "3" && $status != "7")
	{
		if($status == "0")
		{
			$asql = ", start='1'";	
		}
		$days = scriptolution_pdb("days", $PID);
		STemplate::assign('days',$days);
		
		if($scriptolution == "mutual_cancellation_request")
		{
			$asql2 = ", action='".mysqli_real_escape_string($conn->_connectionID, $scriptolution)."'";	
			scriptolution_dotcom_fiverrscript_dotcom("mutual_cancellation_request", $msgto, $oid);
			$ascriptolutionnotificationwassent = 1;
		}
		elseif($scriptolution == "seller_cancellation")
		{
			$asql2 = ", action='".mysqli_real_escape_string($conn->_connectionID, $scriptolution)."', ctime='".time()."'";
			issue_refund($USERID,$oid,$rprice);
			$query="UPDATE orders SET status='3' WHERE OID='".mysqli_real_escape_string($conn->_connectionID, $oid)."' AND PID='".mysqli_real_escape_string($conn->_connectionID, $PID)."' limit 1";
			$results=$conn->execute($query);
			send_update_email($msgto, $oid);
			cancel_revenue($oid);
			$SID = scriptolution_pdb("USERID", $PID);
	
			$query="INSERT INTO ratings SET USERID='".mysqli_real_escape_string($conn->_connectionID, $SID)."', bad='1', time_added='".time()."', OID='".mysqli_real_escape_string($conn->_connectionID, $oid)."'";
			$results=$conn->execute($query);
			scriptolution_dotcom_fiverrscript_dotcom("seller_cancellation", $msgto, $oid);
			$ascriptolutionnotificationwassent = 1;
		}
		elseif($scriptolution == "delivery")
		{
			$asql2 = ", action='".mysqli_real_escape_string($conn->_connectionID, $scriptolution)."'";
			$query="UPDATE orders SET status='4' WHERE OID='".mysqli_real_escape_string($conn->_connectionID, $oid)."' AND PID='".mysqli_real_escape_string($conn->_connectionID, $PID)."' limit 1";
			$results=$conn->execute($query);
			send_update_email($msgto, $oid);
			scriptolution_dotcom_fiverrscript_dotcom("fiverrscript_dotcom_orderdelivered", $msgto, $oid);
			$ascriptolutionnotificationwassent = 1;
		}
		elseif($scriptolution == "rejection")
		{
			$asql2 = ", action='".mysqli_real_escape_string($conn->_connectionID, $scriptolution)."'";
			$query="UPDATE orders SET status='6' WHERE OID='".mysqli_real_escape_string($conn->_connectionID, $oid)."' AND PID='".mysqli_real_escape_string($conn->_connectionID, $PID)."' limit 1";
			$results=$conn->execute($query);
			$query="UPDATE inbox2 SET reject='1' WHERE OID='".mysqli_real_escape_string($conn->_connectionID, $oid)."' AND action='delivery' AND MSGTO='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."'";
			$results=$conn->execute($query);
			send_update_email($msgto, $oid);
			scriptolution_dotcom_fiverrscript_dotcom("fiverrscript_dotcom_orderdeliveryreject", $msgto, $oid);
			$ascriptolutionnotificationwassent = 1;
		}
		
		if($msgto > 0 && $message_body != "")
		{
			$query="INSERT INTO inbox2 SET MSGFROM='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."', MSGTO='".mysqli_real_escape_string($conn->_connectionID, $msgto)."',message='".mysqli_real_escape_string($conn->_connectionID, $message_body)."', FID='".mysqli_real_escape_string($conn->_connectionID, $FID)."', OID='".mysqli_real_escape_string($conn->_connectionID, $oid)."', time='".time()."' $asql $asql2";
			$result=$conn->execute($query);
			$mid = mysqli_insert_id($conn->_connectionID);
			if($mid > 0)
			{
				$UID = $msgto;
				$query="SELECT DISTINCT A.username AS mto, C.username AS mfrom, B.* FROM members A, inbox2 B, members C WHERE A.USERID=B.MSGTO AND C.USERID=B.MSGFROM AND ((B.MSGTO='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' AND B.MSGFROM='".mysqli_real_escape_string($conn->_connectionID, $UID)."') OR (B.MSGTO='".mysqli_real_escape_string($conn->_connectionID, $UID)."' AND B.MSGFROM='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."')) AND B.OID='".mysqli_real_escape_string($conn->_connectionID, $oid)."' order by B.MID asc";
				$results=$conn->execute($query);
				$m = $results->getrows();
				STemplate::assign('m',$m);
				
				if($status == "0")
				{
					$query = "UPDATE orders SET status='1', stime='".time()."' WHERE OID='".mysqli_real_escape_string($conn->_connectionID, $oid)."' AND USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' limit 1"; 
					$conn->execute($query);
					//
					send_update_email($msgto, $oid);
					scriptolution_dotcom_fiverrscript_dotcom("fiverrscript_dotcom_neworder", $msgto, $oid);
					$ascriptolutionnotificationwassent = 1;
					//
				}
				//
				if($ascriptolutionnotificationwassent != "1")
				{
					send_update_email($msgto, $oid);
					scriptolution_dotcom_fiverrscript_dotcom("fiverrscript_dotcom_orderupdate", $msgto, $oid);
				}
				//
			}
		}
	}
	else
	{
		$UID = $msgto;
		$query="SELECT DISTINCT A.username AS mto, C.username AS mfrom, B.* FROM members A, inbox2 B, members C WHERE A.USERID=B.MSGTO AND C.USERID=B.MSGFROM AND ((B.MSGTO='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' AND B.MSGFROM='".mysqli_real_escape_string($conn->_connectionID, $UID)."') OR (B.MSGTO='".mysqli_real_escape_string($conn->_connectionID, $UID)."' AND B.MSGFROM='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."')) AND B.OID='".mysqli_real_escape_string($conn->_connectionID, $oid)."' order by B.MID asc";
		$results=$conn->execute($query);
		$m = $results->getrows();
		STemplate::assign('m',$m);
	}
}

//TEMPLATES BEGIN
STemplate::assign('message',$message);
STemplate::display('send_track.tpl');
//TEMPLATES END
?>