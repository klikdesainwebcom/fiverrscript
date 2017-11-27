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

$REQID = intval(scriptolution_dotcom_data($_REQUEST['REQID']));
scriptolution_dotcom_software("sendoffer?REQID=".$REQID);	
if($REQID > 0)
{
	STemplate::assign('REQID',$REQID);
	
	$query = "select scriptolutiondesc, USERID from scriptolutionrequests where REQUESTID='".mysqli_real_escape_string($conn->_connectionID, $REQID)."' AND active='1'"; 
	$executequery=$conn->execute($query);
	$scriptolutiondesc = $executequery->fields['scriptolutiondesc'];
	$REUSERID = intval(scriptolution_dotcom_data($executequery->fields['USERID']));
	STemplate::assign('scriptolutiondesc',$scriptolutiondesc);
	
	if($scriptolutiondesc != "")
	{
		if($_POST['subform'] == "1")
		{
			$gdesc = scriptolution_dotcom_data($_REQUEST['gdesc']);
			$gjobscriptolution = intval(scriptolution_dotcom_data($_REQUEST['gjobscriptolution']));		
			
			if($gjobscriptolution == "0")
			{
				$error = $lang['637'];
			}
			elseif($gdesc == "")
			{
				$error = $lang['638'];
			}

			if($error == "")
			{			

				$active = "1";
				$query="INSERT INTO offerscriptolution SET REQUESTID='".mysqli_real_escape_string($conn->_connectionID, $REQID)."', USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."', PID='".mysqli_real_escape_string($conn->_connectionID, $gjobscriptolution)."', scriptolutionmsg='".mysqli_real_escape_string($conn->_connectionID, $gdesc)."'";
				$result=$conn->execute($query);
				
				STemplate::assign('gdesc',"");
				STemplate::assign('gjobscriptolution',"");
				
				$message = $lang['639'];
				
				//mail
				if($REUSERID > 0)
				{
					$query="SELECT USERID,email,username,verified from members WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $REUSERID)."'";
					$result=$conn->execute($query);
					$MUSERID = $result->fields['USERID'];
					$MEMAIL = $result->fields['email'];
					$MUSERNAME = $result->fields['username'];
					$MVERIFIED = $result->fields['verified'];
					if($MVERIFIED == "1")
					{
						$sendto = $MEMAIL;
						$sendername = $config['site_name'];
						$from = $config['site_email'];
						$subject = $lang['646'];
						$sendmailbody = stripslashes($MUSERNAME).",<br><br>";
						$sendmailbody .= $lang['647']." ".$lang['646']."<br>";
						$sendmailbody .= "<a href=".$config['baseurl']."/viewoffers?ID=$REQID>".$lang['648']."</a><br><br>";
						$sendmailbody .= $lang['23'].",<br>".stripslashes($sendername);
						mailme($sendto,$sendername,$from,$subject,$sendmailbody,$bcc="");
					}
				}
				//mail
			}
			else
			{
				STemplate::assign('gdesc',$gdesc);
				STemplate::assign('gjobscriptolution',$gjobscriptolution);
			}
		}
	}
	else
	{
		header("Location:$config[baseurl]/requests");exit;	
	}
}
else
{
	header("Location:$config[baseurl]/requests");exit;	
}
$pagetitle = $lang['634'];
STemplate::assign('pagetitle',$pagetitle);

//TEMPLATES BEGIN
STemplate::assign('sm0',"1");
STemplate::assign('error',$error);
STemplate::assign('message',$message);
STemplate::display('scriptolution_header.tpl');
STemplate::display('scriptolutionsendoffer.tpl');
STemplate::display('scriptolution_footer_nobottom.tpl');
//TEMPLATES END
?>