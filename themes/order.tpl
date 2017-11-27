{include file="scriptolution_error7.tpl"}  
{if $enable_paypal eq "1" AND $enable_alertpay eq "0" AND $funds LT $scriptolution_total_price AND $afunds LT $scriptolution_total_price AND $scriptolutionstripeenable eq "0"}
{literal}
<script type="text/javascript"> 
$(document).ready( function() {
    $('#paypal_form').submit();
});
</script>
{/literal}
{elseif $enable_paypal eq "0" AND $enable_alertpay eq "1" AND $funds LT $scriptolution_total_price AND $afunds LT $scriptolution_total_price AND $scriptolutionstripeenable eq "0"}
{literal}
<script type="text/javascript"> 
$(document).ready( function() {
    $('#alertpay_form').submit();
});
</script>
{/literal}
{/if}  
<form action="https://www.paypal.com/cgi-bin/webscr" method="post" id="paypal_form" name="paypal_form">
<input type="hidden" name="cmd" value="_xclick">
<input type="hidden" name="business" value="{$paypal_email}">
<input type="hidden" name="item_name" value="#{$p.PID|stripslashes} - {$p.gtitle|stripslashes}">
<input type="hidden" name="item_number" value="{$p.IID|stripslashes}">
<input type="hidden" name="custom" value="{$smarty.session.USERID}">
<input type="hidden" name="amount" value="{$scriptolution_total_price|stripslashes}">
<input type="hidden" name="currency_code" value="{$currency}">
<input type="hidden" name="button_subtype" value="services">
<input type="hidden" name="no_note" value="1">
<input type="hidden" name="no_shipping" value="2">
<input type="hidden" name="rm" value="2">
<input type="hidden" name="return" value="{$baseurl}/thank_you?g={$eid}">
<input type="hidden" name="cancel_return" value="{$baseurl}/">
<input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHosted">
<input type="hidden" name="address_override" value="1">
<input type="hidden" name="notify_url" value="{$baseurl}/ipn_res.php">
</form>

<form action="" method="post" id="bal_form" name="bal_form">
<input type="hidden" name="subbal" value="1">
</form>                    

<form method="post" action="https://secure.payza.com/checkout" id="alertpay_form" name="alertpay_form">
<input type="hidden" name="ap_merchant" value="{$alertpay_email}"/>
<input type="hidden" name="ap_purchasetype" value="service"/>
<input type="hidden" name="ap_itemname" value="#{$p.PID|stripslashes}"/>
<input type="hidden" name="ap_amount" value="{$scriptolution_total_price|stripslashes}"/>
<input type="hidden" name="ap_currency" value="{$alertpay_currency}"/>
<input type="hidden" name="ap_quantity" value="1"/>
<input type="hidden" name="ap_itemcode" value="{$smarty.session.USERID}"/>
<input type="hidden" name="ap_description" value="{$p.gtitle|stripslashes}"/>
<input type="hidden" name="ap_returnurl" value="{$baseurl}/thank_you?g={$eid}"/>
<input type="hidden" name="ap_cancelurl" value="{$baseurl}/"/>
<input type="hidden" name="apc_1" value="{$p.IID|stripslashes}"/>                        
</form>

<form action="" method="post" id="scriptolution_mybal_form" name="scriptolution_mybal_form">
<input type="hidden" name="scriptolution_mybal" value="1">
</form>                              
<div class="bodybg scriptolutionpaddingtop15 scriptolutionopages">
	<div class="whitebody scriptolutionpaddingtop30 scriptolutionwidth842 gray">
		<div class="inner-wrapper scriptolutionwidth842">
			<div class="left-side scriptolutionwidth842">
				<div class="whiteBox twoHalfs padding0 scriptolutionwidth800">
                    
                    <div id="scriptolutionOrderingForm" class="scriptolutionpadding20"> 
                    
                    	<h1><strong>{$lang550}</strong></h1>
                        {if $enable_paypal eq "1"}<h2><a style="text-decoration:none" href="#" onclick="document.paypal_form.submit();">{$lang411}</a></h2><br />{/if}
                        {if $enable_alertpay eq "1"}<h2><a style="text-decoration:none" href="#" onclick="document.alertpay_form.submit();">{$lang447}</a></h2><br />{/if}
                        {if $funds gte $scriptolution_total_price}<h2><a style="text-decoration:none" href="#" onclick="document.bal_form.submit();">{$lang412}</a></h2><br />{/if}
                        {if $afunds gte $scriptolution_total_price}<h2><a style="text-decoration:none" href="#" onclick="document.scriptolution_mybal_form.submit();">{$lang518}</a></h2><br />{/if}
                        {include file='order_scriptolution_localbank.tpl'}
                        {include file='order_scriptolution_stripe.tpl'}
                        <br />
                        
                        {if $scriptolution_enable_processing_fee eq "1"}
                        <h3>{$lang436}: {if $scriptolution_cur_pos eq "1"}{$scriptolution1price}{$lang197}{else}{$lang197}{$scriptolution1price}{/if}</h3>
                        <h3>{$lang652}: {if $scriptolution_cur_pos eq "1"}{$scriptolution_total_fees}{$lang197}{else}{$lang197}{$scriptolution_total_fees}{/if}</h3>                        
                        <h2>{$lang489}: {if $scriptolution_cur_pos eq "1"}{$scriptolution_total_price}{$lang197}{else}{$lang197}{$scriptolution_total_price}{/if}</h2>
                        {else}
                        <h2>{$lang489}: {if $scriptolution_cur_pos eq "1"}{$scriptolution1price}{$lang197}{else}{$lang197}{$scriptolution1price}{/if}</h2>
                        {/if}
                        
                    </div>

					<div class="clear"></div>
				</div>
			</div>			
			<div class="clear"></div>
		</div>   
	</div>
</div>
<div id="scriptolutionnobottom">
    <div class="centerwrap footertop">
        <div class="footerbg gray scriptolutionfooter842"></div>
    </div>
</div>