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

// DELETE BEGIN
if($_REQUEST['delete']=="1")
{
	$DCATID = intval(scriptolution_dotcom_data($_REQUEST['CATID']));
	if($DCATID > 0)
	{
		$query = "select scriptolution_catimage, scriptolution_bigimage from categories WHERE CATID='".mysqli_real_escape_string($conn->_connectionID, $DCATID)."'"; 
		$results = $conn->execute($query);
		$p1=$results->fields['scriptolution_catimage'];
		if($p1 != "" && $p1 != "scriptolution_default_category.jpg")
		{
			$dp1 = $config['scriptolutioncatdir']."/".$p1;
			$dp2 = $config['scriptolutioncatdir']."/o-".$p1;
			@chmod($dp1, 0777);
			if (file_exists($dp1))
			{
				@unlink($dp1);
			}
			@chmod($dp2, 0777);
			if (file_exists($dp2))
			{
				@unlink($dp2);
			}
		}
		$p1=$results->fields['scriptolution_bigimage'];
		if($p1 != "" && $p1 != "scriptolution_default_bigimage.jpg")
		{
			$dp1 = $config['scriptolutioncatdir']."/bigo".$p1;
			$dp2 = $config['scriptolutioncatdir']."/big-".$p1;
			@chmod($dp1, 0777);
			if (file_exists($dp1))
			{
				@unlink($dp1);
			}
			@chmod($dp2, 0777);
			if (file_exists($dp2))
			{
				@unlink($dp2);
			}
		}
		
		$sql="DELETE FROM categories WHERE CATID='".mysqli_real_escape_string($conn->_connectionID, $DCATID)."'";
		$conn->Execute($sql);
		
		$message = "Category Successfully Deleted.";
		Stemplate::assign('message',$message);
	}
}
// DELETE END

if($_REQUEST['sortby']=="name")
{
	$sortby = "name";
	$sort =" order by name";
	$add1 = "&sortby=name";
}
else
{
	$sortby = "CATID";
	$sort =" order by CATID";
	$add1 = "&sortby=CATID";
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
$name = htmlentities(strip_tags($_REQUEST['name']), ENT_COMPAT, "UTF-8");
$add1 .= "&fromid=$fromid&toid=$toid&name=$name&details=$details";
if($_POST['submitform'] == "1" || ($_REQUEST['fromid']!="" || $toid>0 || $name!=""))
{
	if($fromid > 0)
	{
		$addtosql = "WHERE CATID>='".mysqli_real_escape_string($conn->_connectionID, $fromid)."'";
		Stemplate::assign('fromid',$fromid);
	}
	else
	{
		$addtosql = "WHERE CATID>'".mysqli_real_escape_string($conn->_connectionID, $fromid)."'";
	}
	if($toid > 0)
	{
		$addtosql .= "AND CATID<='".mysqli_real_escape_string($conn->_connectionID, $toid)."'";
		Stemplate::assign('toid',$toid);
	}
	if($name != "")
	{
		$addtosql .= "AND name like'%".mysqli_real_escape_string($conn->_connectionID, $name)."%'";
		Stemplate::assign('name',$name);
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

$queryselected = "select CATID from categories $addtosql $sort $sorthow limit $config[maximum_results]";
$query2 = "select * from categories $addtosql $sort $sorthow limit $pagingstart, $config[items_per_page]";
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
			$pagelinks.="<a href='$adminurl/cat_manage.php?page=1$add1' title='first page'>First</a>&nbsp;";
			$pagelinks.="<a href='$adminurl/cat_manage.php?page=$theprevpage$add1'>Previous</a>&nbsp;";
		};
		$counter=0;
		$lowercount = $currentpage-5;
		if ($lowercount <= 0) $lowercount = 1;
		while ($lowercount < $currentpage)
		{
			$pagelinks.="<a href='$adminurl/cat_manage.php?page=$lowercount$add1'>$lowercount</a>&nbsp;";
			$lowercount++;
			$counter++;
		}
		$pagelinks.=$currentpage."&nbsp;";
		$uppercounter = $currentpage+1;
		while (($uppercounter < $currentpage+10-$counter) && ($uppercounter<=$toppage))
		{
			$pagelinks.="<a href='$adminurl/cat_manage.php?page=$uppercounter$add1'>$uppercounter</a>&nbsp;";
			$uppercounter++;
		}
		if($currentpage < $toppage) 
		{
			$pagelinks.="<a href='$adminurl/cat_manage.php?page=$thenextpage$add1'>Next</a>&nbsp;";
			$pagelinks.="<a href='$adminurl/cat_manage.php?page=$toppage$add1' title='last page'>Last</a>&nbsp;";
		};
	}
}
else
{
	$error = "Sorry, no categories were found.";
}

$mainmenu = "3";
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
STemplate::display("administrator/cat_manage.tpl");
STemplate::display("administrator/global_footer.tpl");
?>