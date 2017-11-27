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

scriptolution_dotcom_software("");	
$PID = intval(scriptolution_dotcom_data($_REQUEST['id']));
$multi = intval(scriptolution_dotcom_data($_REQUEST['multi']));
if($PID > 0)
{
	$query="INSERT INTO order_items SET USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."', PID='".mysqli_real_escape_string($conn->_connectionID, $PID)."'";
	$result=$conn->execute($query);
	$IID = mysqli_insert_id($conn->_connectionID);
	if($IID > 0)
	{					
		$price = scriptolution_pdb("price", $PID);
		$ctp = scriptolution_pdb("ctp", $PID);
		$total = $price;
		$totacom = $ctp;
		if($multi > 1)
		{
			$total = $price * $multi;
			$addmulti = ", multi='".mysqli_real_escape_string($conn->_connectionID, $multi)."'";
		}
		
		$query="UPDATE order_items SET totalprice='".mysqli_real_escape_string($conn->_connectionID, $total)."', ctp='".mysqli_real_escape_string($conn->_connectionID, $totacom)."' $addmulti WHERE IID='".mysqli_real_escape_string($conn->_connectionID, $IID)."'";
		$result=$conn->execute($query);
		
		header("Location:$config[baseurl]/order?item=".$IID);exit;
	}
}
?>