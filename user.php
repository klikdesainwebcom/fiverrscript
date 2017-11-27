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

$uname = scriptolution_dotcom_data($_REQUEST['uname']);
if($uname != "")
{
	STemplate::assign('uname',$uname);
	$query = "select USERID, addtime, description, toprated, level, country, scriptolutionuserslogan from members where username='".mysqli_real_escape_string($conn->_connectionID, $uname)."' AND status='1'"; 
	$executequery=$conn->execute($query);
	$USERID = $executequery->fields['USERID'];
	$addtime = $executequery->fields['addtime'];
	STemplate::assign('addtime',$addtime);
	$desc = $executequery->fields['description'];
	STemplate::assign('desc',$desc);
	$toprated = $executequery->fields['toprated'];
	STemplate::assign('toprated',$toprated);
	$level = $executequery->fields['level'];
	STemplate::assign('level',$level);
	$ucountry = $executequery->fields['country'];
	STemplate::assign('ucountry',$ucountry);
	$scriptolutionuserslogan = $executequery->fields['scriptolutionuserslogan'];
	STemplate::assign('scriptolutionuserslogan',$scriptolutionuserslogan);
	if($USERID > 0)
	{
		STemplate::assign('USERID',$USERID);
		$query = "SELECT A.*, B.seo, C.username, C.country, C.toprated from posts A, categories B, members C where A.active='1' AND A.category=B.CATID AND A.USERID=C.USERID AND A.USERID='".mysqli_real_escape_string($conn->_connectionID, $USERID)."' order by A.PID desc";
		$results=$conn->execute($query);
		$posts = $results->getrows();
		STemplate::assign('posts',$posts);
		STemplate::assign('pagetitle',$uname);

		$query="SELECT A.comment, B.username, B.USERID, C.PID, C.gtitle FROM ratings A, members B, posts C WHERE C.USERID='".mysqli_real_escape_string($conn->_connectionID, $USERID)."' AND A.RATER=B.USERID AND A.PID=C.PID and B.status='1' order by A.RID desc limit 50";
		$results=$conn->execute($query);
		$f = $results->getrows();
		STemplate::assign('f',$f);

		$t = 'user.tpl';
	}
	else
	{
		$t = 'scriptolution_error.tpl';
	}
}

//TEMPLATES BEGIN
STemplate::assign('message',$message);
STemplate::display('scriptolution_header.tpl');
STemplate::display($t);
STemplate::display('scriptolution_footer.tpl');
//TEMPLATES END

function insert_scriptolution_userrating_stars_big($a)
{
	global $conn;
    global $config;
	$scriptolutionpid = $a['scriptolutionpid'];
	$scriptolutionperc = get_percent($scriptolutionpid);
	$rating = $scriptolutionperc/20;
    $count = floor($rating);
    $thecount = 0;
	for($i=0;$i<$count;$i++)
	{
		$returnthis.="<img src=\"".$config['imageurl']."/scriptolution_star_big_on.png\" />";
		$thecount++;
	}
	$ratingcount = $rating;
	$ratingcount = $ratingcount - $count;
    if(($ratingcount >= 0.5) && ($ratingcount < 1))
    {
		$returnthis.="<img src=\"".$config['imageurl']."/scriptolution_star_big_half.png\" />";
		$thecount++;
	}
    elseif (($ratingcount > 0) && ($ratingcount < 0.5))
	{
		$returnthis.="<img src=\"".$config['imageurl']."/scriptolution_star_big_off.png\" />";
		$thecount++;
	}
	for($i=$thecount;$i<5;$i++)
	{
		$returnthis.="<img src=\"".$config['imageurl']."/scriptolution_star_big_off.png\" />";
	}
    if($rating > 0)
	{
		echo $returnthis; 
	}
	else
	{
		echo "<img src=\"".$config['imageurl']."/scriptolution_star_big_off.png\" /><img src=\"".$config['imageurl']."/scriptolution_star_big_off.png\" /><img src=\"".$config['imageurl']."/scriptolution_star_big_off.png\" /><img src=\"".$config['imageurl']."/scriptolution_star_big_off.png\" /><img src=\"".$config['imageurl']."/scriptolution_star_big_off.png\" />";
	}
}
?>