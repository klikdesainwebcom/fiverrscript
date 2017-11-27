<?php
function xml_seotitle_from_videoid($a)
{
    global $config,$conn;
    $query="select gtitle from posts where PID='".mysqli_real_escape_string($conn->_connectionID, $a)."'";
    $executequery=$conn->execute($query);
	return seo_clean_titles($executequery->fields['gtitle']);
}
?>