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
$cid = scriptolution_dotcom_data($_REQUEST['cid']);
if($cid != "")
{
	$query="SELECT name,seo,CATID,parent,mtitle,mdesc,mtags,details FROM categories WHERE seo='".mysqli_real_escape_string($conn->_connectionID, $cid)."'";
	$executequery=$conn->execute($query);
	$CATID = $executequery->fields['CATID'];
	$parent = intval($executequery->fields['parent']);
	$cname = $executequery->fields['name'];
	$cseo = $executequery->fields['seo'];
	$mtitle = $executequery->fields['mtitle'];
	$mdesc = $executequery->fields['mdesc'];
	$mtags = $executequery->fields['mtags'];
	$scriptolutioncdetails = $executequery->fields['details'];
	STemplate::assign('cname',$cname);
	STemplate::assign('cseo',$cseo);
	STemplate::assign('pagetitle',$cname." ".$lang['123']);
	STemplate::assign('CATID',$CATID);
	STemplate::assign('mtitle',$mtitle);
	STemplate::assign('mdesc',$mdesc);
	STemplate::assign('mtags',$mtags);
	STemplate::assign('scriptolutioncdetails',$scriptolutioncdetails);
	if($CATID != "" && is_numeric($CATID))
	{
		if($parent > 0)
		{
			$query = "select seo, name from categories where CATID='".mysqli_real_escape_string($conn->_connectionID, $parent)."'"; 
			$executequery=$conn->execute($query);
			$parentname = $executequery->fields['name'];	
			$parentseo = $executequery->fields['seo'];	
			STemplate::assign('parentname',$parentname);
			STemplate::assign('parentseo',$parentseo);
		}
		
		STemplate::assign('cid',$cid);
		STemplate::assign('catselect',$CATID);
		$s = scriptolution_dotcom_data($_REQUEST['s']);
		STemplate::assign('s',$s);
		
		$sdisplay = scriptolution_dotcom_data($_REQUEST['sdisplay']);
		STemplate::assign('sdisplay',$sdisplay);
		
		$page = intval(scriptolution_dotcom_data($_REQUEST['page']));
		STemplate::assign('currentpage',$page);
		
		if($page=="")
		{
			$page = "1";
		}
		$currentpage = $page;
		
		if ($page >=2)
		{
			$pagingstart = ($page-1)*$config['items_per_page_new'];
		}
		else
		{
			$pagingstart = "0";
		}
		
		if($s == "r")
		{
			$dby = "A.rating desc";	
		}
		elseif($s == "rz")
		{
			$dby = "A.rating asc";	
		}
		elseif($s == "p")
		{
			$dby = "A.viewcount desc";	
		}
		elseif($s == "pz")
		{
			$dby = "A.viewcount asc";	
		}
		elseif($s == "c")
		{
			$dby = "A.price asc";	
		}
		elseif($s == "cz")
		{
			$dby = "A.price desc";	
		}
		elseif($s == "dz")
		{
			$dby = "A.PID asc";	
		}
		else
		{
			$dby = "A.PID desc";	
		}
		
		if($s == "ez")
		{
			$dby = "A.PID asc";	
			$addsql = "AND days='1'";
			$addsqlb = "AND A.days='1'";
		}
		elseif($s == "e")
		{
			$dby = "A.PID desc";	
			$addsql = "AND days='1'";
			$addsqlb = "AND A.days='1'";
		}
		
		$sdeliverytime = intval(scriptolution_dotcom_data($_REQUEST['sdeliverytime']));
		if($sdeliverytime > 0)
		{
			$scriptolution_adddelivery = " AND A.days<='".mysqli_real_escape_string($conn->_connectionID, $sdeliverytime)."'";
		}
		STemplate::assign('sdeliverytime',$sdeliverytime);
		
		$stoprated = intval(scriptolution_dotcom_data($_REQUEST['stoprated']));
		if($stoprated == "1")
		{
			$scriptolution_addtoprated = " AND C.toprated='1'";
		}
		STemplate::assign('stoprated',$stoprated);
		
		$p = intval(scriptolution_dotcom_data($_REQUEST['p']));
		if($p > 0)
		{
			$scriptolution_addprice = " AND A.price='".mysqli_real_escape_string($conn->_connectionID, $p)."'";
			STemplate::assign('p',$p);
			$addp = "&p=$p";
		}
		
		if($parent == "0" && $CATID != "0")
		{
			
			$query="SELECT CATID FROM categories WHERE parent='".mysqli_real_escape_string($conn->_connectionID, $CATID)."'";
			$results=$conn->execute($query);
			$searchsc = $results->getrows();
						
			if(count($searchsc) > 0)
			{
				for($i=0; $i<count($searchsc);$i++)
				{
					$ssc .= " OR A.category='".mysqli_real_escape_string($conn->_connectionID, $searchsc[$i][0])."'";
					$ssd .= " OR category='".mysqli_real_escape_string($conn->_connectionID, $searchsc[$i][0])."'";
				}
				$addtosearch = "AND (A.category='".mysqli_real_escape_string($conn->_connectionID, $CATID)."' $ssc)";
			}
			else
			{
				$addtosearch = "AND A.category='".mysqli_real_escape_string($conn->_connectionID, $CATID)."'";
			}
		}
		else
		{
			$addtosearch = "AND A.category='".mysqli_real_escape_string($conn->_connectionID, $CATID)."'";
		}
		
		$query1 = "SELECT count(*) as total from posts A, members C where A.active='1' $addtosearch $addsqlb AND A.USERID=C.USERID $scriptolution_addprice $scriptolution_adddelivery $scriptolution_addtoprated order by A.PID desc limit $config[maximum_results]";
		$query2 = "SELECT A.*, B.seo, C.username, C.country, C.toprated from posts A, categories B, members C where A.active='1' $addtosearch $addsqlb AND A.category=B.CATID AND A.USERID=C.USERID $scriptolution_addprice $scriptolution_adddelivery $scriptolution_addtoprated order by A.feat desc, $dby limit $pagingstart, $config[items_per_page_new]";
		$executequery1 = $conn->Execute($query1);
		$scriptolution = $executequery1->fields['total'];
		if ($scriptolution > 0)
		{
			if($executequery1->fields['total']<=$config[maximum_results])
			{
				$total = $executequery1->fields['total'];
			}
			else
			{
				$total = $config[maximum_results];
			}
			$toppage = ceil($total/$config[items_per_page_new]);
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
				$adds = "&s=$s&sdeliverytime=$sdeliverytime&stoprated=$stoprated".$addp;
			}
			if ($currentpage > 0)
			{
				if($currentpage > 1) 
				{
					$pagelinks.="<li class='prev'><a href='$thebaseurl/categories/$cid?page=$theprevpage$adds'>$theprevpage</a></li>&nbsp;";
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
					$pagelinks.="<li><a href='$thebaseurl/categories/$cid?page=$lowercount$adds'>$lowercount</a></li>&nbsp;";
					$lowercount++;
					$counter++;
				}
				$pagelinks.="<li><span class='active'>$currentpage</span></li>&nbsp;";
				$uppercounter = $currentpage+1;
				while (($uppercounter < $currentpage+10-$counter) && ($uppercounter<=$toppage))
				{
					$pagelinks.="<li><a href='$thebaseurl/categories/$cid?page=$uppercounter$adds'>$uppercounter</a></li>&nbsp;";
					$uppercounter++;
				}
				if($currentpage < $toppage) 
				{
					$pagelinks.="<li class='next'><a href='$thebaseurl/categories/$cid?page=$thenextpage$adds'>$thenextpage</a></li>";
				}
				else
				{
					$pagelinks.="<li><span class='next'>next page</span></li>";
				}
			}
		}
		
		$queryst = "SELECT name, seo from categories WHERE parent='".mysqli_real_escape_string($conn->_connectionID, $CATID)."'";
		$resultst=$conn->execute($queryst);
		$scats = $resultst->getrows();
		STemplate::assign('scats',$scats);
		
		if(count($posts) == "0")
		{
			STemplate::assign('snotice',$lang['506']);	
		}
		$templateselect = "cat.tpl";
	}
}

//TEMPLATES BEGIN
STemplate::assign('message',$message);
STemplate::assign('error',$error);
STemplate::assign('beginning',$beginning);
STemplate::assign('ending',$ending);
STemplate::assign('pagelinks',$pagelinks);
STemplate::assign('total',$total);
STemplate::assign('posts',$posts);
STemplate::display('scriptolution_header.tpl');
STemplate::display($templateselect);
STemplate::display('scriptolution_footer.tpl');
//TEMPLATES END
?>