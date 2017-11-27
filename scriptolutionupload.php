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

$path = $config['basedir'].'/files/';
 
if (isset($_FILES["fileInput"])) 
{ 
	if ($_FILES["fileInput"]["error"] > 0) 
	{ 
		echo "document.getElementById('message_validation_error').innerHTML = '".$lang['240']."'; $('.msg-error').show(); Scriptolution.messages.hide_progress();";
	} 
	else 
	{ 
		$clean_file = $_FILES['fileInput']['name'];
		$ext = substr(strrchr($_FILES['fileInput']['name'], '.'), 1);
		$ext2 = strtolower($ext); 
		if($ext2 == "jpeg" || $ext2 == "jpg" || $ext2 == "gif" || $ext2 == "png" || $ext2 == "tif" || $ext2 == "bmp" || $ext2 == "avi" || $ext2 == "mpeg" || $ext2 == "mpg" || $ext2 == "mov" || $ext2 == "rm" || $ext2 == "3gp" || $ext2 == "flv" || $ext2 == "mp4" || $ext2 == "zip" || $ext2 == "rar" || $ext2 == "mp3" || $ext2 == "wav" || $ext2 == "wma" || $ext2 == "ogg" || $ext2 == "doc" || $ext2 == "docx" || $ext2 == "rtf" || $ext2 == "ppt" || $ext2 == "xls" || $ext2 == "pdf")
		{
			$query="INSERT INTO files SET fname='".mysqli_real_escape_string($conn->_connectionID, $clean_file)."', time='".time()."', ip='".$_SERVER['REMOTE_ADDR']."'";
			$result=$conn->execute($query);
			$fid = mysqli_insert_id($conn->_connectionID);
			$s = scriptolution_dotcom_evaluate(5).time();
			$cf = md5($fid).$s;
			$saveme = $path.$cf;
			exec("mkdir ".$saveme);
			$file_loc = $saveme."/".$_FILES["fileInput"]["name"]; 
			move_uploaded_file($_FILES["fileInput"]["tmp_name"], $file_loc); 
			$query="UPDATE files SET s='".mysqli_real_escape_string($conn->_connectionID, $s)."' WHERE FID='".mysqli_real_escape_string($conn->_connectionID, $fid)."'";
			$conn->execute($query);
			$clean_file = scriptolution_dotcom_data($clean_file);
			$clean_file = str_replace("'", "", $clean_file);
			$clean_file = str_replace('"', '', $clean_file);
			echo $fid;
		}
		else
		{
			echo "0";
		}
	} 
}
?>