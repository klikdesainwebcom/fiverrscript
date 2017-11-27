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
$thebaseurl = $config['baseurl'];

scriptolution_dotcom_software("newrequest");
$del = intval(scriptolution_dotcom_data($_REQUEST['del']));
if($del == "1")
{
	$DELID = intval(scriptolution_dotcom_data($_REQUEST['ID']));
	if($DELID > 0)
	{
		scriptolutiondelete_request($DELID);
		$message = $lang['643'];
	}
}


$s = scriptolution_dotcom_data($_REQUEST['s']);
STemplate::assign('s',$s);

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

if($s == "dz")
{
	$dby = "A.REQUESTID asc";	
}
else
{
	$dby = "A.REQUESTID desc";	
}

$query1 = "SELECT count(*) as total from scriptolutionrequests where active='1' AND USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' $addsql order by REQUESTID desc limit $config[maximum_results]";
$query2 = "SELECT A.*, C.username from scriptolutionrequests A, members C where A.active='1' AND A.USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' AND A.USERID=C.USERID order by $dby limit $pagingstart, $config[items_per_page]";
$executequery1 = $conn->Execute($query1);
$scriptolution = $executequery1->fields['total'];
if ($scriptolution > 0)
{
	if($executequery1->fields['total']<=$config['maximum_results'])
	{
		$total = $executequery1->fields['total'];
	}
	else
	{
		$total = $config['maximum_results'];
	}
	$toppage = ceil($total/$config['items_per_page']);
	if($toppage==0)
	{
		$xpage=$toppage+1;
	}
	else
	{
		$xpage = $toppage;
	}
	$executequery2 = $conn->Execute($query2);
	$posts = $executequery2->getrows();
	$beginning=$pagingstart+1;
	$ending=$pagingstart+$executequery2->recordcount();
	$pagelinks="";
	$k=1;
	$theprevpage=$currentpage-1;
	$thenextpage=$currentpage+1;
	if($s != "")
	{
		$adds = "&s=$s";
	}
	if ($currentpage > 0)
	{
		if($currentpage > 1) 
		{
			$pagelinks.="<li class='prev'><a href='$thebaseurl/myrequests?page=$theprevpage$adds'>$theprevpage</a></li>&nbsp;";
		}
		else
		{
			$pagelinks.="<li><span class='prev'>previous page</span></li>&nbsp;";
		}
		$counter=0;
		$lowercount = $currentpage-5;
		if ($lowercount <= 0) $lowercount = 1;
		while ($lowercount < $currentpage)
		{
			$pagelinks.="<li><a href='$thebaseurl/myrequests?page=$lowercount$adds'>$lowercount</a></li>&nbsp;";
			$lowercount++;
			$counter++;
		}
		$pagelinks.="<li><span class='active'>$currentpage</span></li>&nbsp;";
		$uppercounter = $currentpage+1;
		while (($uppercounter < $currentpage+10-$counter) && ($uppercounter<=$toppage))
		{
			$pagelinks.="<li><a href='$thebaseurl/myrequests?page=$uppercounter$adds'>$uppercounter</a></li>&nbsp;";
			$uppercounter++;
		}
		if($currentpage < $toppage) 
		{
			$pagelinks.="<li class='next'><a href='$thebaseurl/myrequests?page=$thenextpage$adds'>$thenextpage</a></li>";
		}
		else
		{
			$pagelinks.="<li><span class='next'>next page</span></li>";
		}
	}
}
$templateselect = "scriptolutionmyrequests.tpl";
//TEMPLATES BEGIN
STemplate::assign('pagetitle',stripslashes($lang['629']));
STemplate::assign('message',$message);
STemplate::assign('beginning',$beginning);
STemplate::assign('ending',$ending);
STemplate::assign('pagelinks',$pagelinks);
STemplate::assign('total',$total);
STemplate::assign('posts',$posts);
STemplate::display('scriptolution_header.tpl');
STemplate::display($templateselect);
STemplate::display('scriptolution_footer_grey.tpl');
//TEMPLATES END
?>