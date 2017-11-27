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

$iid = intval(scriptolution_dotcom_data($_REQUEST['item']));
scriptolution_dotcom_software("order?item=".$iid);
$templateselect = "order.tpl";
$pagetitle = $lang['550']; 
STemplate::assign('pagetitle',$pagetitle);

if($iid > 0)
{
	$query="SELECT A.IID, A.PID, A.totalprice, A.multi, B.gtitle FROM order_items A, posts B WHERE A.IID='".mysqli_real_escape_string($conn->_connectionID, $iid)."' AND A.USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."' AND A.PID=B.PID";
	$results=$conn->execute($query);
	$p = $results->getrows();
	STemplate::assign('p',$p[0]);
	$eid = base64_encode($p[0]['IID']);
	STemplate::assign('eid',$eid);
	$id = $p[0]['PID'];
	$multi = $p[0]['multi'];
	
	//
	$scriptolutionponly = $p[0]['totalprice'];
	$scriptolution1price = number_format($scriptolutionponly, 2, '.', '');
	$scriptolution_total_fee = scriptolution_dotcom_16729();
	$scriptolution_total_fees = scriptolution_dotcom_16739($multi);
	$scriptolution_total_price = scriptolution_dotcom_16749($p[0]['totalprice'], $scriptolution_total_fees);	
	STemplate::assign('scriptolution1price',$scriptolution1price);
	STemplate::assign('scriptolution_total_fee',$scriptolution_total_fee);
	STemplate::assign('scriptolution_total_fees',$scriptolution_total_fees);
	STemplate::assign('scriptolution_total_price',$scriptolution_total_price);
	$query1 = "UPDATE order_items SET scriptolution_proc_fee='".mysqli_real_escape_string($conn->_connectionID, $scriptolution_total_fee)."', scriptolution_proc_fees='".mysqli_real_escape_string($conn->_connectionID, $scriptolution_total_fees)."', scriptolution_totalwfees='".mysqli_real_escape_string($conn->_connectionID, $scriptolution_total_price)."' WHERE IID='".mysqli_real_escape_string($conn->_connectionID, $iid)."'"; 
	$executequery1=$conn->execute($query1);
	$scriptolutionaddtoorders = ", scriptolution_proc_fees2='".mysqli_real_escape_string($conn->_connectionID, $scriptolution_total_fees)."', scriptolution_totalwfees2='".mysqli_real_escape_string($conn->_connectionID, $scriptolution_total_price)."'";
	//$scriptolutionmamu = scriptolution_pdb("price", $id);
	$scriptolutionmamu = $scriptolutionponly;
	$scriptolutionjath = $scriptolutionmamu + $scriptolution_total_fee;
	$scriptolutionjath = number_format($scriptolutionjath, 2, '.', '');
	$scriptolutionaddtopayments = ", scriptolution_proc_fees3='".mysqli_real_escape_string($conn->_connectionID, $scriptolution_total_fee)."', scriptolution_totalwfees3='".mysqli_real_escape_string($conn->_connectionID, $scriptolutionjath)."'";
	//
	
	$query = "select funds, afunds, email from members where USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."'"; 
	$executequery=$conn->execute($query);
	$funds = $executequery->fields['funds'];
	STemplate::assign('funds',$funds);
	$afunds = $executequery->fields['afunds'];
	STemplate::assign('afunds',$afunds);
	$scriptolutionuemail = $executequery->fields['email']; 
	STemplate::assign('scriptolutionuemail',$scriptolutionuemail); 
	
	$scriptolutionencoded = hash('md5', $p[0]['IID'].$p[0]['PID'].$p[0]['USERID']); 
	STemplate::assign('scriptolutionencoded',$scriptolutionencoded); 
	
	if($_POST['subbal'] == "1")
	{
		$price = $scriptolution_total_price; //
		if($funds >= $price)
		{
			$query1 = "UPDATE members SET funds=funds-$price WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."'"; 
			$executequery1=$conn->execute($query1);
			
			if($multi > 1)
			{
				$eachprice = scriptolution_pdb("price", $id);
				for ($i=1; $i<=$multi; $i++)
				{
					$query = "INSERT INTO orders SET USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."', PID='".mysqli_real_escape_string($conn->_connectionID, $id)."', IID='".mysqli_real_escape_string($conn->_connectionID, $iid)."', time_added='".time()."', status='0', price='".mysqli_real_escape_string($conn->_connectionID, $eachprice)."' $scriptolutionaddtoorders"; //
					$executequery=$conn->execute($query);
					$order_id = mysqli_insert_id($conn->_connectionID);
					if($order_id > 0)
					{
						$query = "INSERT INTO payments SET USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."', OID='".mysqli_real_escape_string($conn->_connectionID, $order_id)."', IID='".mysqli_real_escape_string($conn->_connectionID, $iid)."', time='".time()."', price='".mysqli_real_escape_string($conn->_connectionID, $eachprice)."', t='1', fiverrscriptdotcom_balance='1' $scriptolutionaddtopayments"; //
						$executequery=$conn->execute($query);
						
						$query = "UPDATE posts SET rev=rev+$eachprice WHERE PID='".mysqli_real_escape_string($conn->_connectionID, $id)."'"; 
						$executequery=$conn->execute($query);		
						
						scriptolution_dotcom_fiverrscript_dotcom("scriptolution_buyer_requirements", $SCRIPTOLUTION_ID, $order_id);					
					}
				}
				header("Location:$config[baseurl]/thank_you?g=".$eid);exit;
			}
			else
			{
				$query = "INSERT INTO orders SET USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."', PID='".mysqli_real_escape_string($conn->_connectionID, $id)."', IID='".mysqli_real_escape_string($conn->_connectionID, $iid)."', time_added='".time()."', status='0', price='".mysqli_real_escape_string($conn->_connectionID, $scriptolutionponly)."' $scriptolutionaddtoorders"; //
				$executequery=$conn->execute($query);
				$order_id = mysqli_insert_id($conn->_connectionID);
				if($order_id > 0)
				{
					$query = "INSERT INTO payments SET USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."', OID='".mysqli_real_escape_string($conn->_connectionID, $order_id)."', IID='".mysqli_real_escape_string($conn->_connectionID, $iid)."', time='".time()."', price='".mysqli_real_escape_string($conn->_connectionID, $scriptolutionponly)."', t='1', fiverrscriptdotcom_balance='1' $scriptolutionaddtopayments"; //
					$executequery=$conn->execute($query);
					
					$query = "UPDATE posts SET rev=rev+$price WHERE PID='".mysqli_real_escape_string($conn->_connectionID, $id)."'"; 
					$executequery=$conn->execute($query);
					
					scriptolution_dotcom_fiverrscript_dotcom("scriptolution_buyer_requirements", $SCRIPTOLUTION_ID, $order_id);
				
					header("Location:$config[baseurl]/thank_you?g=".$eid);exit;
				}
			}
		}
	}
	elseif($_POST['scriptolution_mybal'] == "1")
	{
		$price = $scriptolution_total_price; //
		if($afunds >= $price)
		{
			$query1 = "UPDATE members SET afunds=afunds-$price , used=used+$price WHERE USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."'"; 
			$executequery1=$conn->execute($query1);
			
			if($multi > 1)
			{
				$eachprice = scriptolution_pdb("price", $id);
				for ($i=1; $i<=$multi; $i++)
				{
					$query = "INSERT INTO orders SET USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."', PID='".mysqli_real_escape_string($conn->_connectionID, $id)."', IID='".mysqli_real_escape_string($conn->_connectionID, $iid)."', time_added='".time()."', status='0', price='".mysqli_real_escape_string($conn->_connectionID, $eachprice)."' $scriptolutionaddtoorders"; //
					$executequery=$conn->execute($query);
					$order_id = mysqli_insert_id($conn->_connectionID);
					if($order_id > 0)
					{
						$query = "INSERT INTO payments SET USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."', OID='".mysqli_real_escape_string($conn->_connectionID, $order_id)."', IID='".mysqli_real_escape_string($conn->_connectionID, $iid)."', time='".time()."', price='".mysqli_real_escape_string($conn->_connectionID, $eachprice)."', t='1', fiverrscriptdotcom_available='1' $scriptolutionaddtopayments"; //
						$executequery=$conn->execute($query);
						
						$query = "UPDATE posts SET rev=rev+$eachprice WHERE PID='".mysqli_real_escape_string($conn->_connectionID, $id)."'"; 
						$executequery=$conn->execute($query);
						
						scriptolution_dotcom_fiverrscript_dotcom("scriptolution_buyer_requirements", $SCRIPTOLUTION_ID, $order_id);							
					}
				}
				header("Location:$config[baseurl]/thank_you?g=".$eid);exit;
			}
			else
			{
				$query = "INSERT INTO orders SET USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."', PID='".mysqli_real_escape_string($conn->_connectionID, $id)."', IID='".mysqli_real_escape_string($conn->_connectionID, $iid)."', time_added='".time()."', status='0', price='".mysqli_real_escape_string($conn->_connectionID, $price)."' $scriptolutionaddtoorders"; //
				$executequery=$conn->execute($query);
				$order_id = mysqli_insert_id($conn->_connectionID);
				if($order_id > 0)
				{
					$query = "INSERT INTO payments SET USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."', OID='".mysqli_real_escape_string($conn->_connectionID, $order_id)."', IID='".mysqli_real_escape_string($conn->_connectionID, $iid)."', time='".time()."', price='".mysqli_real_escape_string($conn->_connectionID, $price)."', t='1', fiverrscriptdotcom_available='1' $scriptolutionaddtopayments"; //
					$executequery=$conn->execute($query);
					
					$query = "UPDATE posts SET rev=rev+$price WHERE PID='".mysqli_real_escape_string($conn->_connectionID, $id)."'"; 
					$executequery=$conn->execute($query);
					
					scriptolution_dotcom_fiverrscript_dotcom("scriptolution_buyer_requirements", $SCRIPTOLUTION_ID, $order_id);
				
					header("Location:$config[baseurl]/thank_you?g=".$eid);exit;
				}
			}
		}
	}
	elseif($_REQUEST['scriptolutionstripe'] == "1") 
	{
		$stripetotalprice = ($scriptolution_total_price * 100);
		STemplate::assign('stripetotalprice',$stripetotalprice);
		
		$price = $scriptolution_total_price; //
		$checkscriptolutionencoded = scriptolution_dotcom_data($_REQUEST['scriptolutionencoded']);						

		require_once('include/stripe-php-3.6.0/init.php');				
		\Stripe\Stripe::setApiKey($config['scriptolutionstripesecret']);
		
		$token = scriptolution_dotcom_data($_REQUEST['token']);
		$scriptolutionprocessedstripe = "1";
		$scriptolutionstripeuserid = 0;

		try 
		{
			$customer = \Stripe\Customer::create(array(
			'email' => $scriptolutionuemail,
			'card' => $token
			));
			
			$scriptolutionstripeuserid = $customer->id;
			
			$charge = \Stripe\Charge::create(array(
			'customer' => $customer->id,
			'amount'   => $stripetotalprice,
			'currency' => $config['scriptolutionstripecurrency']
			));
		
		} 
		catch(Stripe_InvalidRequestError $e) 
		{
			$scriptolutionprocessedstripe = "0";
		}
		
		if($scriptolutionprocessedstripe == "0")
		{
			$error = $lang['611'];
		}
		elseif($price > 0 && isset($_GET['token']) && $token != "" && $scriptolutionencoded == $checkscriptolutionencoded && $scriptolutionprocessedstripe == "1")
		{
			
			if($multi > 1)
			{
				$eachprice = scriptolution_pdb("price", $id);
				for ($i=1; $i<=$multi; $i++)
				{
					$query = "INSERT INTO orders SET USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."', PID='".mysqli_real_escape_string($conn->_connectionID, $id)."', IID='".mysqli_real_escape_string($conn->_connectionID, $iid)."', time_added='".time()."', status='0', price='".mysqli_real_escape_string($conn->_connectionID, $eachprice)."' $scriptolutionaddtoorders"; //
					$executequery=$conn->execute($query);
					$order_id = mysqli_insert_id($conn->_connectionID);
					if($order_id > 0)
					{
						$query = "INSERT INTO payments SET USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."', OID='".mysqli_real_escape_string($conn->_connectionID, $order_id)."', IID='".mysqli_real_escape_string($conn->_connectionID, $iid)."', time='".time()."', price='".mysqli_real_escape_string($conn->_connectionID, $eachprice)."', t='1', fiverrscriptdotcom_stripe='1', fiverrscriptdotcom_stripe_user='".mysqli_real_escape_string($conn->_connectionID, $scriptolutionstripeuserid)."' $scriptolutionaddtopayments"; //
						$executequery=$conn->execute($query);
						
						$query = "UPDATE posts SET rev=rev+$eachprice WHERE PID='".mysqli_real_escape_string($conn->_connectionID, $id)."'"; 
						$executequery=$conn->execute($query);
						
						scriptolution_dotcom_fiverrscript_dotcom("scriptolution_buyer_requirements", $SCRIPTOLUTION_ID, $order_id);							
					}
				}
				header("Location:$config[baseurl]/thank_you?g=".$eid);exit;
			}
			else
			{
				$query = "INSERT INTO orders SET USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."', PID='".mysqli_real_escape_string($conn->_connectionID, $id)."', IID='".mysqli_real_escape_string($conn->_connectionID, $iid)."', time_added='".time()."', status='0', price='".mysqli_real_escape_string($conn->_connectionID, $price)."' $scriptolutionaddtoorders"; //
				$executequery=$conn->execute($query);
				$order_id = mysqli_insert_id($conn->_connectionID);
				if($order_id > 0)
				{
					$query = "INSERT INTO payments SET USERID='".mysqli_real_escape_string($conn->_connectionID, $SCRIPTOLUTION_ID)."', OID='".mysqli_real_escape_string($conn->_connectionID, $order_id)."', IID='".mysqli_real_escape_string($conn->_connectionID, $iid)."', time='".time()."', price='".mysqli_real_escape_string($conn->_connectionID, $price)."', t='1', fiverrscriptdotcom_stripe='1', fiverrscriptdotcom_stripe_user='".mysqli_real_escape_string($conn->_connectionID, $scriptolutionstripeuserid)."' $scriptolutionaddtopayments"; //
					$executequery=$conn->execute($query);
					
					$query = "UPDATE posts SET rev=rev+$price WHERE PID='".mysqli_real_escape_string($conn->_connectionID, $id)."'"; 
					$executequery=$conn->execute($query);
					
					scriptolution_dotcom_fiverrscript_dotcom("scriptolution_buyer_requirements", $SCRIPTOLUTION_ID, $order_id);
				
					header("Location:$config[baseurl]/thank_you?g=".$eid);exit;
				}
			}
		}

	}
}
else
{
	header("Location:$config[baseurl]/");exit;
}

//TEMPLATES BEGIN
STemplate::assign('message',$message);
STemplate::assign('error',$error);
STemplate::display('scriptolution_header.tpl');
STemplate::display($templateselect);
STemplate::display('scriptolution_footer_nobottom.tpl');
//TEMPLATES END
?>