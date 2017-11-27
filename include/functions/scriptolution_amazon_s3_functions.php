<?php

function scriptolution_delete_file($DFID)
{
	global $config, $conn;
	$DFID = intval($DFID);
	if($DFID > 0)
	{		
		$query = "select fname,s from files where FID='".mysql_real_escape_string($DFID)."' limit 1"; 
		$executequery=$conn->execute($query);
		$s = $executequery->fields['s'];
		$fname = $executequery->fields['fname'];
		$path = $config['basedir'].'/files/';
		$cf = md5($DFID).$s;
		$saveme = $path.$cf;
		$file_loc = $saveme."/".$fname; 
		if (file_exists($file_loc))
		{
			@unlink($file_loc);
		}
		$sql="DELETE FROM files WHERE FID='".mysql_real_escape_string($DFID)."'";
		$conn->Execute($sql);
		$sql="UPDATE inbox2 SET FID='0' WHERE FID='".mysql_real_escape_string($DFID)."'";
		$conn->Execute($sql);	
	}
}

?>