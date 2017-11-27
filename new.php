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

scriptolution_dotcom_software("new");
	
$allowposting = "1";
$vonly = $config['vonly'];
if($vonly == "1")
{
	$uverified = $_SESSION['VERIFIED'];
	if($uverified != "1")
	{
		$allowposting = "0";
	}
}
if($config['enable_levels'] == "1" && $config['price_mode'] == "3")
{
	$timecheck = time() - 86400;
	$query = "select count(*) as total from posts where USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' AND time_added>='".mysqli_real_escape_string($conn->_connectionID, $timecheck)."'"; 
	$executequery=$conn->execute($query);
	$lastjobs = $executequery->fields['total']+0;
	
	$query = "select level from members where USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."'"; 
	$executequery=$conn->execute($query);
	$mlevel = intval($executequery->fields['level']);
	if($mlevel == "3")
	{
		$jlimit = $config['level3job'];
	}
	elseif($mlevel == "2")
	{
		$jlimit = $config['level2job'];
	}
	elseif($mlevel == "1")
	{
		$jlimit = $config['level1job'];
	}
	else
	{
		$jlimit = "";
	}
	if($jlimit != "")
	{
		if($lastjobs >= $jlimit)
		{
			$allowposting = "2";
		}
	}
}

if($allowposting == "1")
{
	if($_POST['subform'] == "1")
	{
		$gtitle = scriptolution_dotcom_data($_REQUEST['gtitle']);	
		$gcat = intval(scriptolution_dotcom_data($_REQUEST['gcat']));
		$gdesc = htmlentities(strip_tags(stripslashes($_REQUEST['gdesc']), '<p><i><strong><br><font><span><em><ol><li><b>'), ENT_COMPAT, "UTF-8");	
		$ginst = scriptolution_dotcom_data($_REQUEST['ginst']);	
		$gtags = scriptolution_dotcom_data($_REQUEST['gtags']);
		$gtags = str_replace(".", "", $gtags);	
		$gdays = intval(scriptolution_dotcom_data($_REQUEST['gdays']));
		$gyoutube = scriptolution_dotcom_data($_REQUEST['gyoutube']);
		$shipme = intval(scriptolution_dotcom_data($_REQUEST['shipme']));
		$multipleme = intval(scriptolution_dotcom_data($_REQUEST['multipleme']));
		$extrasme = intval(scriptolution_dotcom_data($_REQUEST['extrasme']));
		$instanturl = scriptolution_dotcom_data($_REQUEST['instanturl']);
		if($config['enablescriptolutionlocations'] == "1")
		{
			$scriptolutionjoblocation = scriptolution_dotcom_data($_REQUEST['scriptolutionjoblocation']);
			$scriptolutioncity = scriptolution_dotcom_data($_REQUEST['scriptolutioncity']);
			$scriptolutionstate = scriptolution_dotcom_data($_REQUEST['scriptolutionstate']);
			$scriptolutioncountry = scriptolution_dotcom_data($_REQUEST['scriptolutioncountry']);
			$addlocation = ", scriptolutionjoblocation='".mysqli_real_escape_string($conn->_connectionID, $scriptolutionjoblocation)."', scriptolutioncity='".mysqli_real_escape_string($conn->_connectionID, $scriptolutioncity)."', scriptolutionstate='".mysqli_real_escape_string($conn->_connectionID, $scriptolutionstate)."', scriptolutioncountry='".mysqli_real_escape_string($conn->_connectionID, $scriptolutioncountry)."'";
		}
		if($gtitle == "")
		{
			$error = "<li>".$lang['92']."</li>";
		}
		elseif(strlen($gtitle) > 200)
		{
			$error = "<li>".$lang['509']."</li>";
		}
		if($shipme == "1")
		{
			include("new_ship.scriptolution.com.php");
		}
		elseif($multipleme == "1")
		{
			$multiplemax = intval(scriptolution_dotcom_data($_REQUEST['multiplemax']));
			if($multiplemax > 0)
			{
				$scriptolution_add_multiple = ", scriptolution_add_multiple='".mysqli_real_escape_string($conn->_connectionID, $multiplemax)."'";	
			}
			$fiverrscriptdotcom = "1";
		}
		elseif($extrasme == "1")
		{
			$scriptolution_process_extras = "1";
			$fiverrscriptdotcom = "1";
		}
		else
		{
			$fiverrscriptdotcom = "1";	
		}
		if($fiverrscriptdotcom == "1")
		{
			if($config['price_mode'] == "1")
			{
				$price = intval(scriptolution_dotcom_data($_REQUEST['gprice']));
				if($price == "0")
				{
					$error = "<li>".$lang['127']."</li>";
				}
				$comper = intval($config['commission_percent']);
				$count1 = $comper / 100;
				$count2 = $count1 * $price;
				$ctp = number_format($count2, 2, '.', '');
			}
			elseif($config['price_mode'] == "3")
			{
				$PACID = intval(scriptolution_dotcom_data($_REQUEST['gprice']));
				STemplate::assign('PACID',$PACID);
				$query = "select pprice,pcom from packs where ID='".mysqli_real_escape_string($conn->_connectionID, $PACID)."'"; 
				$executequery=$conn->execute($query);
				$price = intval(scriptolution_dotcom_data($executequery->fields['pprice']));
				$comper = intval(scriptolution_dotcom_data($executequery->fields['pcom']));
				if($price == "0")
				{
					$error = "<li>".$lang['435']."</li>";
				}
				$count1 = $comper / 100;
				$count2 = $count1 * $price;
				$ctp = number_format($count2, 2, '.', '');
				
			}
			elseif($config['price_mode'] == "2")
			{
				$price = intval($config['price']);
				$comper = intval($config['commission_percent']);
				$count1 = $comper / 100;
				$count2 = $count1 * $price;
				$ctp = number_format($count2, 2, '.', '');
			}
			else
			{
				$price = intval($config['price']);
				$mysetc = $config['commission'];
				$ctp = number_format($mysetc, 2);
			}
		}
		if($gcat == "0")
		{
			$error .= "<li>".$lang['93']."</li>";
		}
		if($gdesc == "")
		{
			$error .= "<li>".$lang['94']."</li>";
		}
		elseif(strlen($gdesc) > 50000)
		{
			$error = "<li>".$lang['593']."</li>";
		}
		if($ginst == "")
		{
			$error .= "<li>".$lang['95']."</li>";
		}
		if($gtags == "")
		{
			$error .= "<li>".$lang['96']."</li>";
		}

		if(scriptolution_banned_words_chk($gtitle))
		{
			$error .= "<li>".$lang['593']."</li>";
		}
		if(scriptolution_banned_words_chk($gdesc))
		{
			$error .= "<li>".$lang['586']."</li>";
		}
		if(scriptolution_banned_words_chk($gtags))
		{
			$error .= "<li>".$lang['587']."</li>";
		}
		if(scriptolution_banned_words_chk($ginst))
		{
			$error .= "<li>".$lang['588']."</li>";
		}

		if($gdays == "0")
		{
			if($instanturl=="" && $_FILES['instantfile']['tmp_name']=="")
			{
				$error .= "<li>".$lang['97']."</li>";
			}
		}
		if($instanturl!="" || $_FILES['instantfile']['tmp_name']!="")
		{
			include("new_instant.scriptolution.com.php");
		}
		$gphoto = $_FILES['gphoto']['tmp_name'];
		if($gphoto != "")
		{
			$ext = substr(strrchr($_FILES['gphoto']['name'], '.'), 1);
			$ext2 = strtolower($ext);
			if($ext2 == "jpeg" || $ext2 == "jpg" || $ext2 == "gif" || $ext2 == "png")
			{
				$theimageinfo = getimagesize($gphoto);
				if($theimageinfo[2] != 1 && $theimageinfo[2] != 2 && $theimageinfo[2] != 3)
				{
					$error .= "<li>".$lang['100']."</li>";
				}
			}
			else
			{
				$error .= "<li>".$lang['100']."</li>";
			}
		}
		else
		{
			$error .= "<li>".$lang['101']."</li>";
		}
		if($gyoutube != "")
		{
			$gyoutube = str_replace("https://", "http://", $gyoutube);
			$pos = strpos($gyoutube, "http://www.youtube.com/watch?v=");
			$posb = strpos($gyoutube, "http://www.youtu.be/");
			$posc = strpos($gyoutube, "http://youtu.be/");
			if ($pos === false)
			{
				if ($posb === false)
				{
					if ($posc === false)
					{
						$error .= "<li>".$lang['133']."</li>";
					}
				}
			}
		}
		
		if($error == "")
		{			
			$approve_stories = $config['approve_stories'];
			if($approve_stories == "1")
			{
				$active = "0";
			}
			else
			{
				$active = "1";
			}
			$query="INSERT INTO posts SET USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."', gtitle='".mysqli_real_escape_string($conn->_connectionID, $gtitle)."',gtags='".mysqli_real_escape_string($conn->_connectionID, $gtags)."', gdesc='".mysqli_real_escape_string($conn->_connectionID, $gdesc)."', ginst='".mysqli_real_escape_string($conn->_connectionID, $ginst)."', days='".mysqli_real_escape_string($conn->_connectionID, $gdays)."', youtube='".mysqli_real_escape_string($conn->_connectionID, $gyoutube)."', category='".mysqli_real_escape_string($conn->_connectionID, $gcat)."', price='".mysqli_real_escape_string($conn->_connectionID, $price)."', time_added='".time()."', date_added='".date("Y-m-d")."', pip='".$_SERVER['REMOTE_ADDR']."', active='$active', ctp='".mysqli_real_escape_string($conn->_connectionID, $ctp)."' $scriptolution_add_multiple $addship $scriptolution_add_instant $addlocation";
			$result=$conn->execute($query);
			$pid = mysqli_insert_id($conn->_connectionID);
			
			if($scriptolution_process_extras == "1")
			{
				include("new_extras.scriptolution.com.php");
			}
			if($gphoto != "")
			{
				$thepp = $pid."-1";
				if($theimageinfo[2] == 1)
				{
					$thepp .= ".gif";
				}
				elseif($theimageinfo[2] == 2)
				{
					$thepp .= ".jpg";
				}
				elseif($theimageinfo[2] == 3)
				{
					$thepp .= ".png";
				}
				if($error == "")
				{
					$myvideoimgnew=$config['pdir']."/".$thepp;
					if(file_exists($myvideoimgnew))
					{
						unlink($myvideoimgnew);
					}
					move_uploaded_file($gphoto, $myvideoimgnew);
					do_resize_image($myvideoimgnew, "380", "265", false, $config['pdir']."/t/".$thepp);
					do_resize_image($myvideoimgnew, "102", "72", false, $config['pdir']."/t2/".$thepp);
					do_resize_image($myvideoimgnew, "678", "458", false, $config['pdir']."/t3/".$thepp);
					do_resize_image($myvideoimgnew, "214", "132", false, $config['pdir']."/t4/".$thepp);
					if(file_exists($config['pdir']."/".$thepp))
					{
						$query = "UPDATE posts SET p1='$thepp' WHERE PID='".mysqli_real_escape_string($conn->_connectionID, $pid)."'";
						$conn->execute($query);
					}
				}
			}
			$gphoto2 = $_FILES['gphoto2']['tmp_name'];
			if($gphoto2 != "")
			{
				$ext = substr(strrchr($_FILES['gphoto2']['name'], '.'), 1);
				$ext2 = strtolower($ext);
				if($ext2 == "jpeg" || $ext2 == "jpg" || $ext2 == "gif" || $ext2 == "png")
				{
					$theimageinfo = getimagesize($gphoto2);
					if($theimageinfo[2] != 1 && $theimageinfo[2] != 2 && $theimageinfo[2] != 3)
					{
						$gstop = "1";
					}
					else
					{
						$gstop = "0";
					}
				}
				if($gstop == "0")
				{
					$thepp = $pid."-2";
					if($theimageinfo[2] == 1)
					{
						$thepp .= ".gif";
					}
					elseif($theimageinfo[2] == 2)
					{
						$thepp .= ".jpg";
					}
					elseif($theimageinfo[2] == 3)
					{
						$thepp .= ".png";
					}

					$myvideoimgnew=$config['pdir']."/".$thepp;
					if(file_exists($myvideoimgnew))
					{
						unlink($myvideoimgnew);
					}
					move_uploaded_file($gphoto2, $myvideoimgnew);
					do_resize_image($myvideoimgnew, "380", "265", false, $config['pdir']."/t/".$thepp);
					do_resize_image($myvideoimgnew, "102", "72", false, $config['pdir']."/t2/".$thepp);
					do_resize_image($myvideoimgnew, "678", "458", false, $config['pdir']."/t3/".$thepp);
					do_resize_image($myvideoimgnew, "214", "132", false, $config['pdir']."/t4/".$thepp);
					if(file_exists($config['pdir']."/".$thepp))
					{
						$query = "UPDATE posts SET p2='$thepp' WHERE PID='".mysqli_real_escape_string($conn->_connectionID, $pid)."'";
						$conn->execute($query);
					}
				}
			}
			$gphoto3 = $_FILES['gphoto3']['tmp_name'];
			if($gphoto3 != "")
			{
				$ext = substr(strrchr($_FILES['gphoto3']['name'], '.'), 1);
				$ext2 = strtolower($ext);
				if($ext2 == "jpeg" || $ext2 == "jpg" || $ext2 == "gif" || $ext2 == "png")
				{
					$theimageinfo = getimagesize($gphoto3);
					if($theimageinfo[2] != 1 && $theimageinfo[2] != 2 && $theimageinfo[2] != 3)
					{
						$gstop = "1";
					}
					else
					{
						$gstop = "0";
					}
				}
				if($gstop == "0")
				{
					$thepp = $pid."-3";
					if($theimageinfo[2] == 1)
					{
						$thepp .= ".gif";
					}
					elseif($theimageinfo[2] == 2)
					{
						$thepp .= ".jpg";
					}
					elseif($theimageinfo[2] == 3)
					{
						$thepp .= ".png";
					}

					$myvideoimgnew=$config['pdir']."/".$thepp;
					if(file_exists($myvideoimgnew))
					{
						unlink($myvideoimgnew);
					}
					move_uploaded_file($gphoto3, $myvideoimgnew);
					do_resize_image($myvideoimgnew, "380", "265", false, $config['pdir']."/t/".$thepp);
					do_resize_image($myvideoimgnew, "102", "72", false, $config['pdir']."/t2/".$thepp);
					do_resize_image($myvideoimgnew, "678", "458", false, $config['pdir']."/t3/".$thepp);
					do_resize_image($myvideoimgnew, "214", "132", false, $config['pdir']."/t4/".$thepp);
					if(file_exists($config['pdir']."/".$thepp))
					{
						$query = "UPDATE posts SET p3='$thepp' WHERE PID='".mysqli_real_escape_string($conn->_connectionID, $pid)."'";
						$conn->execute($query);
					}
				}
			}
			if($approve_stories == "1")
			{
				$message = $lang['126'];
				if($config['scriptolution_notify_gigval'] == "1")
				{
					$scriptolution_notify_gigval_email = $config['scriptolution_notify_gigval_email'];
					if($scriptolution_notify_gigval_email != "")
					{
						$sendername = $config['site_name'];
						$from = $config['site_email'];
						$subject = $lang['553'];
						$sendmailbody = $lang['554']."<br><br>";
						$sendmailbody .= $lang['555']."<br>";
						$sendmailbody .= "<a href=".$config['baseurl']."/administrator/gigs_validate.php>".$config['baseurl']."/administrator/gigs_validate.php</a><br><br>";
						$sendmailbody .= $lang['23'].",<br>".stripslashes($sendername);
						mailme($scriptolution_notify_gigval_email,$sendername,$from,$subject,$sendmailbody,$bcc="");
					}
				}					
			}
			else
			{
				$gurl = $config['baseurl']."/".get_cat_seo($gcat)."/".$pid."/".seo_clean_titles($gtitle);
				$feurl = $config['baseurl']."/feature?id=".$pid;
				header("Location:$feurl");exit;
			}
		}
		else
		{
			STemplate::assign('gprice',$price);
			STemplate::assign('gtitle',$gtitle);
			STemplate::assign('gcat',$gcat);
			STemplate::assign('gdesc',$gdesc);
			STemplate::assign('ginst',$ginst);
			STemplate::assign('gtags',$gtags);
			STemplate::assign('gdays',$gdays);
			STemplate::assign('gyoutube',$gyoutube);
		}
	}
	else
	{
		$gtitle = scriptolution_dotcom_data($_REQUEST['quicktitle']);
		STemplate::assign('gtitle',$gtitle);
	}
	$templateselect = "new.tpl";
}
elseif($allowposting == "2")
{
	$error = $lang['498'];
	$templateselect = "new2.tpl";
}
else
{
	$error = $lang['445'];
	$templateselect = "new2.tpl";
}
$pagetitle = $lang['61'];
STemplate::assign('pagetitle',$pagetitle);

//TEMPLATES BEGIN
STemplate::assign('sm0',"1");
STemplate::assign('error',$error);
STemplate::assign('message',$message);
STemplate::display('scriptolution_header.tpl');
STemplate::display($templateselect);
STemplate::display('scriptolution_footer_nobottom.tpl');
//TEMPLATES END
?>