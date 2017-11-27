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

$query = "SELECT A.OID, B.MID, B.time from orders A, inbox2 B where A.status='4' AND A.OID=B.OID AND B.reject='0' AND B.action='delivery' order by B.MID desc";
$executequery = $conn->Execute($query);
$g = $executequery->getrows();
for($i=0; $i<count($g);$i++)
{
	$OID = $g[$i]['OID'];
	$MID = $g[$i]['MID'];
	$atime = $g[$i]['time'];
	$time = time();
	$d = count_days($atime, $time);
	if($d >= 3)
	{
		$query="UPDATE orders SET status='5', cltime='".time()."' WHERE OID='".mysqli_real_escape_string($conn->_connectionID, $OID)."' limit 1";
		$results=$conn->execute($query);
	}
}

$two_days = 2 * 24 * 60 * 60;
$query = "SELECT A.OID, B.MID, B.time, B.MSGTO from orders A, inbox2 B where A.status='1' AND A.OID=B.OID AND B.cancel='0' AND B.action='mutual_cancellation_request' order by B.MID desc";
$executequery = $conn->Execute($query);
$h = $executequery->getrows();
for($i=0; $i<count($h);$i++)
{
	$OID = $h[$i]['OID'];
	$MID = $h[$i]['MID'];
	$atime = $h[$i]['time'];
	$MSGTO = $h[$i]['MSGTO'];
	$time = time();
	$two_time = $atime + $two_days;
	if($time > $two_time)
	{
		$AMID = $MID;
		if($AMID > 0)
		{
			$query="UPDATE inbox2 SET cancel='2', ctime='".time()."', CID='".mysqli_real_escape_string($conn->_connectionID, $MSGTO)."' WHERE MID='".mysqli_real_escape_string($conn->_connectionID, $AMID)."' AND cancel='0' AND MSGTO='".mysqli_real_escape_string($conn->_connectionID, $MSGTO)."' limit 1";
			$results=$conn->execute($query);
			$query = "select USERID, price from orders where OID='".mysqli_real_escape_string($conn->_connectionID, $OID)."'"; 
			$executequery=$conn->execute($query);
			$RUSERID = $executequery->fields['USERID'];
			$rprice = $executequery->fields['price'];
			issue_refund($RUSERID,$OID,$rprice);
			$query="UPDATE orders SET status='2' WHERE OID='".mysqli_real_escape_string($conn->_connectionID, $OID)."' limit 1";
			$results=$conn->execute($query);
			cancel_revenue($OID);
		}
	}
}

$query = "SELECT * from featured WHERE exp='0'";
$executequery = $conn->Execute($query);
$f = $executequery->getrows();
for($i=0; $i<count($f);$i++)
{
	$PID = $f[$i]['PID'];
	$ID = $f[$i]['ID'];
	$atime = $f[$i]['time'];
	$fdays = intval($config['fdays']);
	$fdaystime = $fdays * 24 * 60 * 60;
	$fdexp = $atime + $fdaystime;
	$time = time();
	if($time >= $fdexp)
	{
		$query="UPDATE featured SET exp='1' WHERE ID='".mysqli_real_escape_string($conn->_connectionID, $ID)."'";
		$results=$conn->execute($query);
		$query="UPDATE posts SET feat='0' WHERE PID='".mysqli_real_escape_string($conn->_connectionID, $PID)."'";
		$results=$conn->execute($query);
	}
}

function cron_late($days, $time)
{
	$days = intval($days);
	$time = intval($time);
	$ctime = $days * 24 * 60 * 60;
	$utime = $time + $ctime;
	$now = time();
	if($now > $utime)
	{
		return "1";	
	}
	else
	{
		return "0";	
	}
}

function cron_get_percent($userid)
{
	global $conn;
	$userid = intval($userid);
	$query = "select good, bad from ratings where USERID='".mysqli_real_escape_string($conn->_connectionID, $userid)."'"; 
	$results=$conn->execute($query);
	$f = $results->getrows();
	$grat = 0;
	$brat = 0;
	for($i=0;$i<count($f);$i++)
	{
		$tgood = $f[$i]['good'];
		$tbad = $f[$i]['bad'];
		if($tgood == "1")
		{
			$grat++;	
		}
		elseif($tbad == "1")
		{
			$brat++;	
		}
	}
	$g = $grat;
	$b = $brat;
	$t = $g + $b;
	if($t > 0)
	{
		$r = (($g / $t) * 100);
		return round($r, 1);
	}
	else
	{
		return 0;
	}
}

$query = "SELECT A.OID, A.stime, B.days from orders A, posts B WHERE (A.status='1' OR A.status='6') AND A.PID=B.PID AND B.days!='0' AND A.late='0'";
$executequery = $conn->Execute($query);
$z = $executequery->getrows();
for($i=0; $i<count($z);$i++)
{
	$OID = $z[$i]['OID'];
	$stime = $z[$i]['stime'];
	$days = $z[$i]['days'];
	$islate = cron_late($days, $stime);
	if($islate == "1")
	{
		$query="UPDATE orders SET late='1' WHERE OID='".mysqli_real_escape_string($conn->_connectionID, $OID)."'";
		$results=$conn->execute($query);
	}
}

$level2num = $config['level2num'];
$level3num = $config['level3num'];
$level2rate = $config['level2rate'];
$level3rate = $config['level3rate'];
$query = "SELECT USERID,toprated, level from members WHERE status='1'";
$executequery = $conn->Execute($query);
$m = $executequery->getrows();
for($i=0; $i<count($m);$i++)
{
	$USERID = $m[$i]['USERID'];
	$toprated = $m[$i]['toprated'];
	$level = $m[$i]['level'];
	update_scriptolution_top_rated($USERID, $toprated);
	if($config['enable_levels'] == "1" && $config['price_mode'] == "3" && $level != "3")
	{
		$query = "select A.OID FROM orders A, posts B where B.USERID='".mysqli_real_escape_string($conn->_connectionID, $USERID)."' AND A.PID=B.PID AND A.status='5' AND A.late='0'"; 
		$results = $conn->execute($query);
		$gords = $results->getrows();
		$gort = count($gords);
		if($level == "1")
		{
			if($gort >= $level2num)
			{
				$uper = cron_get_percent($USERID);
				if($uper >= $level2rate)
				{
					$query="UPDATE members SET level='2' WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $USERID)."'";
					$results=$conn->execute($query);
				}
			}
		}
		elseif($level == "2")
		{
			if($gort >= $level3num)
			{
				$uper = cron_get_percent($USERID);
				if($uper >= $level3rate)
				{
					$query="UPDATE members SET level='3' WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $USERID)."'";
					$results=$conn->execute($query);
				}
			}
		}
		
	}
}

?>