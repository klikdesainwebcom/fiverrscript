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
 
if ($_REQUEST['scriptolutionsubmit'] == "1") 
{ 
	$scriptolutionfilename = scriptolution_dotcom_data($_REQUEST['scriptolutionfilename']);
	$ext = substr(strrchr($scriptolutionfilename, '.'), 1);
	$ext2 = strtolower($ext); 
	if($ext2 == "jpeg" || $ext2 == "jpg" || $ext2 == "gif" || $ext2 == "png" || $ext2 == "tif" || $ext2 == "bmp" || $ext2 == "avi" || $ext2 == "mpeg" || $ext2 == "mpg" || $ext2 == "mov" || $ext2 == "rm" || $ext2 == "3gp" || $ext2 == "flv" || $ext2 == "mp4" || $ext2 == "zip" || $ext2 == "rar" || $ext2 == "mp3" || $ext2 == "wav" || $ext2 == "wma" || $ext2 == "ogg" || $ext2 == "doc" || $ext2 == "docx" || $ext2 == "rtf" || $ext2 == "ppt" || $ext2 == "xls" || $ext2 == "pdf")
	{
		echo "1";
	}
	else
	{
		echo "0";	
	}
}
else
{
	echo "0";
}
?>