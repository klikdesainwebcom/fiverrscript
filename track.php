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
$OID = intval(scriptolution_dotcom_data($_REQUEST['id']));
scriptolution_dotcom_software("track?id=".$OID);	
if($OID > 0)
{
	$pagetitle = $lang['260']." #".$OID;
	STemplate::assign('pagetitle',$pagetitle);
	
	$query="SELECT A.*, B.gtitle, B.p1, B.price, B.USERID AS owner, B.days, B.ginst, C.username, D.seo, E.username as buyer FROM orders A, posts B, members C, categories D, members E WHERE C.USERID=B.USERID AND B.category=D.CATID AND E.USERID=A.USERID AND A.OID='".mysqli_real_escape_string($conn->_connectionID, $OID)."' AND B.PID=A.PID limit 1";
	$results=$conn->execute($query);
	$o = $results->getrows();
	STemplate::assign('o',$o[0]);
	$owner = $o[0]['owner'];
	$buyer = $o[0]['USERID'];
	$me = $SCRIPTOLUTION_ID;
	$PID = $o[0]['PID'];
	$rprice = $o[0]['price'];
	
	if($owner == $me)
	{
		$v = "owner";	
		STemplate::assign('sm2',"1");
		$templateselect = "track2.tpl";
		$UID = $buyer;
	}
	elseif($buyer == $me)
	{
		$v = "buyer";
		$templateselect = "track.tpl";
		$UID = $owner;
		
		if($_POST['subrat'] == "1")
		{
			$ratingvalue = scriptolution_dotcom_data($_POST['ratingvalue']);
			if($ratingvalue == "1")
			{
				$rad = ", good='1'";
			}
			elseif($ratingvalue == "0")
			{
				$rad = ", bad='1'";
			}
			$ratingcomment = scriptolution_dotcom_data($_POST['ratingcomment']);
			$query="INSERT INTO ratings SET USERID='".mysqli_real_escape_string($conn->_connectionID, $owner)."', PID='".mysqli_real_escape_string($conn->_connectionID, $PID)."', OID='".mysqli_real_escape_string($conn->_connectionID, $OID)."', RATER='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."', comment='".mysqli_real_escape_string($conn->_connectionID, $ratingcomment)."', time_added='".time()."' $rad";
			$results=$conn->execute($query);
			$message = $lang['312'];
			$query="UPDATE orders SET status='5', cltime='".time()."' WHERE OID='".mysqli_real_escape_string($conn->_connectionID, $OID)."' AND USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' AND status='4' limit 1";
			$results=$conn->execute($query);
			$query="SELECT A.*, B.gtitle, B.p1, B.price, B.USERID AS owner, B.days, B.ginst, C.username, D.seo, E.username as buyer FROM orders A, posts B, members C, categories D, members E WHERE C.USERID=B.USERID AND B.category=D.CATID AND E.USERID=A.USERID AND A.OID='".mysqli_real_escape_string($conn->_connectionID, $OID)."' AND B.PID=A.PID limit 1";
			$results=$conn->execute($query);
			$o = $results->getrows();
			STemplate::assign('o',$o[0]);
			send_update_email($owner, $OID);
			update_gig_rating($PID);
			
			if($owner == $me)
			{
				scriptolution_dotcom_fiverrscript_dotcom("fiverrscript_dotcom_orderfeedback", $buyer, $OID);
			}
			elseif($buyer == $me)
			{
				scriptolution_dotcom_fiverrscript_dotcom("fiverrscript_dotcom_orderfeedback", $owner, $OID);
			}
		}
	}
	else
	{
		header("Location:$config[baseurl]/");exit;
	}
	if($_POST['subabort'] == "1")
	{
		$AMID = intval(scriptolution_dotcom_data($_POST['AMID']));
		if($AMID > 0)
		{
			$query="UPDATE inbox2 SET cancel='1', ctime='".time()."', CID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' WHERE MID='".mysqli_real_escape_string($conn->_connectionID, $AMID)."' AND cancel='0' AND MSGFROM='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' limit 1";
			$results=$conn->execute($query);
			
			if($owner == $me)
			{
				scriptolution_dotcom_fiverrscript_dotcom("scriptolution_abort_cancellation", $buyer, $OID);
			}
			elseif($buyer == $me)
			{
				scriptolution_dotcom_fiverrscript_dotcom("scriptolution_abort_cancellation", $owner, $OID);
			}
		}
	}
	if($_POST['subdecline'] == "1")
	{
		$DMID = intval(scriptolution_dotcom_data($_POST['DMID']));
		if($DMID > 0)
		{
			$query="UPDATE inbox2 SET cancel='1', ctime='".time()."', CID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' WHERE MID='".mysqli_real_escape_string($conn->_connectionID, $DMID)."' AND cancel='0' AND MSGTO='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' limit 1";
			$results=$conn->execute($query);
			
			if($owner == $me)
			{
				scriptolution_dotcom_fiverrscript_dotcom("scriptolution_reject_cancellation", $buyer, $OID);
			}
			elseif($buyer == $me)
			{
				scriptolution_dotcom_fiverrscript_dotcom("scriptolution_reject_cancellation", $owner, $OID);
			}
		}
	}
	if($_POST['subaccept'] == "1")
	{
		$AMID = intval(scriptolution_dotcom_data($_POST['AMID']));
		if($AMID > 0)
		{
			$query="UPDATE inbox2 SET cancel='2', ctime='".time()."', CID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' WHERE MID='".mysqli_real_escape_string($conn->_connectionID, $AMID)."' AND cancel='0' AND MSGTO='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' limit 1";
			$results=$conn->execute($query);
			issue_refund($buyer,$OID,$rprice);
			$query="UPDATE orders SET status='2' WHERE OID='".mysqli_real_escape_string($conn->_connectionID, $OID)."' limit 1";
			$results=$conn->execute($query);
			cancel_revenue($OID);
			$query="SELECT A.*, B.gtitle, B.p1, B.price, B.USERID AS owner, B.days, B.ginst, C.username, D.seo, E.username as buyer FROM orders A, posts B, members C, categories D, members E WHERE C.USERID=B.USERID AND B.category=D.CATID AND E.USERID=A.USERID AND A.OID='".mysqli_real_escape_string($conn->_connectionID, $OID)."' AND B.PID=A.PID limit 1";
			$results=$conn->execute($query);
			$o = $results->getrows();
			STemplate::assign('o',$o[0]);
			
			if($owner == $me)
			{
				scriptolution_dotcom_fiverrscript_dotcom("scriptolution_accept_cancellation", $buyer, $OID);
			}
			elseif($buyer == $me)
			{
				scriptolution_dotcom_fiverrscript_dotcom("scriptolution_accept_cancellation", $owner, $OID);
			}
		}
	}
	$query="SELECT DISTINCT A.username AS mto, C.username AS mfrom, B.* FROM members A, inbox2 B, members C WHERE A.USERID=B.MSGTO AND C.USERID=B.MSGFROM AND ((B.MSGTO='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' AND B.MSGFROM='".mysqli_real_escape_string($conn->_connectionID, $UID)."') OR (B.MSGTO='".mysqli_real_escape_string($conn->_connectionID, $UID)."' AND B.MSGFROM='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."')) AND B.OID='".mysqli_real_escape_string($conn->_connectionID, $OID)."' order by B.MID asc";
	$results=$conn->execute($query);
	$m = $results->getrows();
	STemplate::assign('m',$m);
	STemplate::assign('v',$v);

	$query="UPDATE fiverrscript_dotcom_notity SET scriptolution_unread='0' WHERE scriptolution_OID='".mysqli_real_escape_string($conn->_connectionID, $OID)."' AND USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."'";
	$results=$conn->execute($query);
	
}

//TEMPLATES BEGIN
STemplate::assign('message',$message);
STemplate::display('scriptolution_header.tpl');
STemplate::display($templateselect);
STemplate::display('scriptolution_footer_grey.tpl');
//TEMPLATES END
?>