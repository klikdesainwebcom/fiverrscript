<?php
if($config['enable_fc'] == "1")
{
	if($_SESSION['USERID'] == "")
	{
		$A = $config['FACEBOOK_APP_ID'];
		$B = $config['FACEBOOK_SECRET'];
		define('FACEBOOK_APP_ID', $A);
		define('FACEBOOK_SECRET', $B);
		STemplate::assign('FACEBOOK_APP_ID',$A);
		STemplate::assign('FACEBOOK_SECRET',$B);
		
		function get_facebook_cookie($app_id, $application_secret) {
		  $args = array();
		  parse_str(trim($_COOKIE['fbs_' . $app_id], '\\"'), $args);
		  ksort($args);
		  $payload = '';
		  foreach ($args as $key => $value) {
			if ($key != 'sig') {
			  $payload .= $key . '=' . $value;
			}
		  }
		  if (md5($payload . $application_secret) != $args['sig']) {
			return null;
		  }
		  return $args;
		}
		
		$code = htmlentities(strip_tags(stripslashes($_REQUEST['code'])), ENT_COMPAT, "UTF-8");
		if($code != "")
		{
			$my_url = $config['baseurl']."/";
			$token_url = "https://graph.facebook.com/oauth/access_token?"
			. "client_id=" . $A . "&redirect_uri=" . urlencode($my_url)
			. "&client_secret=" . $B . "&code=" . $code;
			$response = @file_get_contents($token_url);

			preg_match_all("/access_token\"\:\"(.+?)\"/", $response, $scriptolution7);
			$scriptolution6 = array_unique($scriptolution7);
			$scriptolutionaccesstoken = $scriptolution6[0][0];
			$scriptolutionaccesstoken = str_replace(":", "", $scriptolutionaccesstoken);
			$scriptolutionaccesstoken = str_replace("\"", "", $scriptolutionaccesstoken);
			$scriptolutionaccesstoken = str_replace("access_token", "", $scriptolutionaccesstoken);				
			
			$params = null;
			parse_str($response, $params);
			$graph_url = "https://graph.facebook.com/me?&fields=email,name&access_token=".$scriptolutionaccesstoken; //up1
		
			$user = json_decode(file_get_contents($graph_url));
			$fname = htmlentities(strip_tags($user->name), ENT_COMPAT, "UTF-8");
			$femail = htmlentities(strip_tags($user->email), ENT_COMPAT, "UTF-8");
			$fbpid = htmlentities(strip_tags($user->id), ENT_COMPAT, "UTF-8");
			$fbpicurl = "http://graph.facebook.com/".$fbpid."/picture";
			$fbpicurl2 = "http://graph.facebook.com/".$fbpid."/picture?type=large";
			$query="SELECT USERID FROM members WHERE email='".mysqli_real_escape_string($conn->_connectionID, $femail)."' limit 1";
			$executequery=$conn->execute($query);
			$FUID = intval($executequery->fields['USERID']);
		
			if($FUID > 0)
			{									
				$query="SELECT USERID,email,username,verified from members WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $FUID)."' and status='1'";
				$result=$conn->execute($query);
				if($result->recordcount()>0)
				{
					$query="update members set lastlogin='".time()."', lip='".$_SERVER['REMOTE_ADDR']."' WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $FUID)."'";
					$conn->execute($query);
					$_SESSION['USERID']=$result->fields['USERID'];
					$_SESSION['EMAIL']=$result->fields['email'];
					$_SESSION['USERNAME']=$result->fields['username'];
					$_SESSION['VERIFIED']=$result->fields['verified'];
					$_SESSION['FB']="1";			
					header("Location:$config[baseurl]/");exit;
				}
			}
			else
			{
				$md5pass = md5(generateCode(5).time());
				
				if($fname != "" && $femail != "")
				{
					$def_country = $config['def_country'];
					if($def_country == "")
					{
						$def_country = "US";	
					}
					$query="INSERT INTO members SET email='".mysqli_real_escape_string($conn->_connectionID, $femail)."',username='', password='".mysqli_real_escape_string($conn->_connectionID, $md5pass)."', addtime='".time()."', lastlogin='".time()."', ip='".$_SERVER['REMOTE_ADDR']."', lip='".$_SERVER['REMOTE_ADDR']."', verified='1', country='".mysqli_real_escape_string($conn->_connectionID, $def_country)."'";

					$result=$conn->execute($query);
					$userid = mysqli_insert_id($conn->_connectionID);
					if($userid != "" && is_numeric($userid) && $userid > 0)
					{
						$query="SELECT USERID,email,verified from members WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $userid)."'";
						$result=$conn->execute($query);
						
						$SUSERID = $result->fields['USERID'];
						$SEMAIL = $result->fields['email'];
						$SVERIFIED = $result->fields['verified'];
						$_SESSION['USERID']=$SUSERID;
						$_SESSION['EMAIL']=$SEMAIL;
						$_SESSION['VERIFIED']=$SVERIFIED;
						$_SESSION['FB']="1";		
						if(intval($fbpid) > 0)
						{
							$fp1 = $fbpicurl;
							$fp2 = $fbpicurl2;
							$tfpp = $userid.".jpg";
							$fimage=$config['membersprofilepicdir']."/o/".$tfpp;
							if(!download_photo($fp2, $fimage))
							{
								if(file_exists($fimage))
								{
									unlink($fimage);
								}
							}
							else
							{
								$fi2=$config['membersprofilepicdir']."/".$tfpp;
								do_resize_image_2($fimage, "100", "100", false, $fi2);
								$fi3=$config['membersprofilepicdir']."/thumbs/".$tfpp;
								do_resize_image_2($fimage, "50", "50", false, $fi3);	
								if(file_exists($config['membersprofilepicdir']."/o/".$tfpp))
								{
									$query = "UPDATE members SET profilepicture='$tfpp' WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $userid)."'";
									$conn->execute($query);
								}
							}
						}
						header("Location:$config[baseurl]/connect.php");exit;
					}
				}
			}
		}
	} 
	if($_SESSION['USERNAME'] == "" && $_SESSION['FB'] == "1")
	{	
		$url = getCurrentPageUrl();
		$myurl = $config['baseurl']."/connect.php";
		$cssurl = $config['baseurl']."/css/style.php";
		$myurl2 = $config['baseurl']."/logout.php";
		$smyurl = $config['baseurl'].":443/connect.php";
		$scssurl = $config['baseurl'].":443/css/style.php";
		$smyurl2 = $config['baseurl'].":443/logout.php";
		if(($url != $myurl) && ($url != $cssurl) && ($url != $myurl2) && ($url != $smyurl) && ($url != $scssurl) && ($url != $smyurl2))
		{
			header("Location:$config[baseurl]/connect.php");exit;
		}
	}
}
?>