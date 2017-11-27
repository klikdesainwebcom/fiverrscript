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

//DELETE MEMBER
if($_REQUEST[delete]=="1")
{
	$DUSERID = intval(scriptolution_dotcom_data($_REQUEST['USERID']));	
	if($DUSERID > 0)
	{
		$query = "select A.FID, B.fname, B.s from inbox A, files B WHERE (A.MSGTO='".mysqli_real_escape_string($conn->_connectionID, $DUSERID)."' OR A.MSGFROM='".mysqli_real_escape_string($conn->_connectionID, $DUSERID)."') AND A.FID=B.FID"; 
		$results = $conn->execute($query);
		$dfiles = $results->getrows();
		foreach ($dfiles as &$delme) 
		{
			$dnow = $config['basedir']."/files/".md5($delme['FID']).$delme['s']."/".$delme['fname'];
			if (file_exists($dnow))
			{
				@unlink($dnow);
			}
		}
		$query = "select A.FID, B.fname, B.s from inbox2 A, files B WHERE (A.MSGTO='".mysqli_real_escape_string($conn->_connectionID, $DUSERID)."' OR A.MSGFROM='".mysqli_real_escape_string($conn->_connectionID, $DUSERID)."') AND A.FID=B.FID"; 
		$results = $conn->execute($query);
		$dfiles = $results->getrows();
		foreach ($dfiles as &$delme) 
		{
			$dnow = $config['basedir']."/files/".md5($delme['FID']).$delme['s']."/".$delme['fname'];
			if (file_exists($dnow))
			{
				@unlink($dnow);
			}
		}
		$sql="DELETE FROM archive WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $DUSERID)."'";
		$conn->Execute($sql);
		$sql="DELETE FROM bookmarks WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $DUSERID)."'";
		$conn->Execute($sql);
		$sql="DELETE FROM inbox WHERE MSGTO='".mysqli_real_escape_string($conn->_connectionID, $DUSERID)."'";
		$conn->Execute($sql);
		$sql="DELETE FROM inbox WHERE MSGFROM='".mysqli_real_escape_string($conn->_connectionID, $DUSERID)."'";
		$conn->Execute($sql);
		$sql="DELETE FROM inbox2 WHERE MSGTO='".mysqli_real_escape_string($conn->_connectionID, $DUSERID)."'";
		$conn->Execute($sql);
		$sql="DELETE FROM inbox2 WHERE MSGFROM='".mysqli_real_escape_string($conn->_connectionID, $DUSERID)."'";
		$conn->Execute($sql);
		$sql="DELETE FROM inbox_reports WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $DUSERID)."'";
		$conn->Execute($sql);
		$query = "select profilepicture from members WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $DUSERID)."' limit 1"; 
		$results = $conn->execute($query);
		$profilepicture=$results->fields['profilepicture'];
		if($profilepicture != "")
		{
			$videopath = $config['videodir']."/".$deletevideo.".".$DHD;
			$imageaaa=$config['membersprofilepicdir']."/o/".$profilepicture;
			@chmod($imageaaa, 0777);
			if (file_exists($imageaaa))
			{
				@unlink($imageaaa);
			}
			$imageaaa=$config['membersprofilepicdir']."/thumbs/".$profilepicture;
			@chmod($imageaaa, 0777);
			if (file_exists($imageaaa))
			{
				@unlink($imageaaa);
			}
			$imageaaa=$config['membersprofilepicdir']."/".$profilepicture;
			@chmod($imageaaa, 0777);
			if (file_exists($imageaaa))
			{
				@unlink($imageaaa);
			}
		}		
		$sql="DELETE FROM members WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $DUSERID)."'";
		$conn->Execute($sql);
		$sql="DELETE FROM members_passcode WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $DUSERID)."'";
		$conn->Execute($sql);
		$sql="DELETE FROM members_verifycode WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $DUSERID)."'";
		$conn->Execute($sql);
		$sql="DELETE FROM orders WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $DUSERID)."'";
		$conn->Execute($sql);
		$sql="DELETE FROM payments WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $DUSERID)."'";
		$conn->Execute($sql);
		
		$sql="DELETE FROM offerscriptolution WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $DUSERID)."'";
		$conn->Execute($sql);
		
		$sql="DELETE FROM posts WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $DUSERID)."'";
		$conn->Execute($sql);
		$sql="DELETE FROM ratings WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $DUSERID)."'";
		$conn->Execute($sql);
		
		$query = "SELECT REQUESTID from scriptolutionrequests where USERID='".mysqli_real_escape_string($conn->_connectionID, $DUSERID)."'";
		$executequery = $conn->Execute($query);
		$g = $executequery->getrows();
		for($i=0; $i<count($g);$i++)
		{
			$DREQUESTID = $g[$i]['REQUESTID'];
			if($DREQUESTID > 0)
			{
				$sql="DELETE FROM offerscriptolution WHERE REQUESTID='".mysqli_real_escape_string($conn->_connectionID, $DREQUESTID)."' ";
				$conn->Execute($sql);
			}
		}
		$sql="DELETE FROM scriptolutionrequests WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $DUSERID)."'";
		$conn->Execute($sql);
		
		$message = "Member Successfully Deleted.";
		Stemplate::assign('message',$message);
	}
}
//DELETE MEMBER END

//ACTIVE
if($_POST['asub']=="1")
{
	$AUSERID = scriptolution_dotcom_data($_POST['AUSERID']);
	$aval = scriptolution_dotcom_data($_POST['aval']);
	if($aval == "0")
	{
		$aval2 = "1";
	}
	else
	{
		$aval2 = "0";
	}
	$sql="UPDATE members SET status='".intval($aval2)."' WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $AUSERID)."'";
	$conn->Execute($sql);
}
//ACTIVE

//VERIFIED
if($_POST['vsub']=="1")
{
	$VUSERID = scriptolution_dotcom_data($_POST['VUSERID']);
	$vval = scriptolution_dotcom_data($_POST['vval']);
	if($vval == "0")
	{
		$vval2 = "1";
	}
	else
	{
		$vval2 = "0";
	}
	$sql="UPDATE members SET verified='".intval($vval2)."' WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $VUSERID)."'";
	$conn->Execute($sql);
}
//VERIFIED

if($_REQUEST['sortby']=="username")
{
	$sortby = "username";
	$sort =" order by username";
	$add1 = "&sortby=username";
}
elseif($_REQUEST['sortby']=="email")
{
	$sortby = "email";
	$sort =" order by email";
	$add1 = "&sortby=email";
}
elseif($_REQUEST['sortby']=="verified")
{
	$sortby = "verified";
	$sort =" order by verified";
	$add1 = "&sortby=verified";
}
elseif($_REQUEST['sortby']=="addtime")
{
	$sortby = "addtime";
	$sort =" order by addtime";
	$add1 = "&sortby=addtime";
}
elseif($_REQUEST['sortby']=="status")
{
	$sortby = "status";
	$sort =" order by status";
	$add1 = "&sortby=status";
}
else
{
	$sortby = "USERID";
	$sort =" order by USERID";
	$add1 = "&sortby=USERID";
}

if($_REQUEST['sorthow']=="desc")
{
	$sorthow ="desc";
	$add1 .= "&sorthow=desc";
}
else
{
	$sorthow ="asc";
	$add1 .= "&sorthow=asc";
}

//Search
$fromid = intval(scriptolution_dotcom_data($_REQUEST['fromid']));
$toid = intval(scriptolution_dotcom_data($_REQUEST['toid']));
$username = htmlentities(strip_tags($_REQUEST['username']), ENT_COMPAT, "UTF-8");
$email = htmlentities(strip_tags($_REQUEST['email']), ENT_COMPAT, "UTF-8");
$verified = htmlentities(strip_tags($_REQUEST['verified']), ENT_COMPAT, "UTF-8");
$status = htmlentities(strip_tags($_REQUEST['status']), ENT_COMPAT, "UTF-8");
$add1 .= "&fromid=$fromid&toid=$toid&username=$username&email=$email&verified=$verified&status=$status";
if($_POST['submitform'] == "1" || ($_REQUEST['fromid']!="" || $toid>0 || $username!="" || $email!="" || $verified!="" || $status!=""))
{
	if($fromid > 0)
	{
		$addtosql = "WHERE USERID>='".mysqli_real_escape_string($conn->_connectionID, $fromid)."'";
		Stemplate::assign('fromid',$fromid);
	}
	else
	{
		$addtosql = "WHERE USERID>'".mysqli_real_escape_string($conn->_connectionID, $fromid)."'";
	}
	if($toid > 0)
	{
		$addtosql .= "AND USERID<='".mysqli_real_escape_string($conn->_connectionID, $toid)."'";
		Stemplate::assign('toid',$toid);
	}
	if($username != "")
	{
		$addtosql .= "AND username like'%".mysqli_real_escape_string($conn->_connectionID, $username)."%'";
		Stemplate::assign('username',$username);
	}
	if($email != "")
	{
		$addtosql .= "AND email like'%".mysqli_real_escape_string($conn->_connectionID, $email)."%'";
		Stemplate::assign('email',$email);
	}
	if($verified != "")
	{
		$addtosql .= "AND verified='1'";
		Stemplate::assign('verified',$verified);
	}
	if($status != "")
	{
		$addtosql .= "AND status='1'";
		Stemplate::assign('status',$status);
	}
	Stemplate::assign('search',"1");
}
//Search End

$page = intval(scriptolution_dotcom_data($_REQUEST['page']));
if($page=="")
{
	$page = "1";
}
$currentpage = $page;

if ($page >=2)
{
	$pagingstart = ($page-1)*$config['items_per_page'];
}
else
{
	$pagingstart = "0";
}

$queryselected = "select USERID from members $addtosql $sort $sorthow limit $config[maximum_results]";
$query2 = "select * from members $addtosql $sort $sorthow limit $pagingstart, $config[items_per_page]";
$executequeryselected = $conn->Execute($queryselected);
$totalvideos = $executequeryselected->rowcount();	
if ($totalvideos > 0)
{
	if($totalvideos<=$config[maximum_results])
	{
		$total = $totalvideos;
	}
	else
	{
		$total = $config[maximum_results];
	}
	$toppage = ceil($total/$config[items_per_page]);
	if($toppage==0)
	{
		$xpage=$toppage+1;
	}
	else
	{
		$xpage = $toppage;
	}
	$executequery2 = $conn->Execute($query2);	
	$results = $executequery2->getrows();
	$beginning=$pagingstart+1;
	$ending=$pagingstart+$executequery2->recordcount();
	$pagelinks="";
	$k=1;
	$theprevpage=$currentpage-1;
	$thenextpage=$currentpage+1;
	if ($currentpage > 0)
	{	
		if($currentpage > 1) 
		{
			$pagelinks.="<a href='$adminurl/members_manage.php?page=1$add1' title='first page'>First</a>&nbsp;";
			$pagelinks.="<a href='$adminurl/members_manage.php?page=$theprevpage$add1'>Previous</a>&nbsp;";
		};
		$counter=0;
		$lowercount = $currentpage-5;
		if ($lowercount <= 0) $lowercount = 1;
		while ($lowercount < $currentpage)
		{
			$pagelinks.="<a href='$adminurl/members_manage.php?page=$lowercount$add1'>$lowercount</a>&nbsp;";
			$lowercount++;
			$counter++;
		}
		$pagelinks.=$currentpage."&nbsp;";
		$uppercounter = $currentpage+1;
		while (($uppercounter < $currentpage+10-$counter) && ($uppercounter<=$toppage))
		{
			$pagelinks.="<a href='$adminurl/members_manage.php?page=$uppercounter$add1'>$uppercounter</a>&nbsp;";
			$uppercounter++;
		}
		if($currentpage < $toppage) 
		{
			$pagelinks.="<a href='$adminurl/members_manage.php?page=$thenextpage$add1'>Next</a>&nbsp;";
			$pagelinks.="<a href='$adminurl/members_manage.php?page=$toppage$add1' title='last page'>Last</a>&nbsp;";
		};
	}
}
else
{
	$error = "Sorry, no members were found.";
}

$mainmenu = "7";
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
STemplate::display("administrator/members_manage.tpl");
STemplate::display("administrator/global_footer.tpl");
?>