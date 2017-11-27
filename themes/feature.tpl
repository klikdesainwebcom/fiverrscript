{include file="scriptolution_error7.tpl"}
<form action="https://www.paypal.com/cgi-bin/webscr" method="post" id="paypal_form" name="paypal_form">
<input type="hidden" name="cmd" value="_xclick">
<input type="hidden" name="business" value="{$paypal_email}">
<input type="hidden" name="item_name" value="#{$p.PID|stripslashes} - {$lang455}">
<input type="hidden" name="item_number" value="{$p.PID|stripslashes}">
<input type="hidden" name="custom" value="{$smarty.session.USERID}">
<input type="hidden" name="amount" value="{$fprice|stripslashes}">
<input type="hidden" name="currency_code" value="{$currency}">
<input type="hidden" name="button_subtype" value="services">
<input type="hidden" name="no_note" value="1">
<input type="hidden" name="no_shipping" value="2">
<input type="hidden" name="rm" value="2">
<input type="hidden" name="return" value="{$baseurl}/feature_success?g={$eid}">
<input type="hidden" name="cancel_return" value="{$baseurl}/">
<input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHosted">
<input type="hidden" name="address_override" value="1">
<input type="hidden" name="notify_url" value="{$baseurl}/ipn_pf.php">
</form>    

<form action="" method="post" id="bal_form" name="bal_form">
<input type="hidden" name="subbal" value="1">
</form>               

<form method="post" action="https://secure.payza.com/checkout" id="alertpay_form" name="alertpay_form">
<input type="hidden" name="ap_merchant" value="{$alertpay_email}"/>
<input type="hidden" name="ap_purchasetype" value="service"/>
<input type="hidden" name="ap_itemname" value="{$lang455} #{$p.PID|stripslashes}"/>
<input type="hidden" name="ap_amount" value="{$fprice|stripslashes}"/>
<input type="hidden" name="ap_currency" value="{$alertpay_currency}"/>
<input type="hidden" name="ap_quantity" value="1"/>
<input type="hidden" name="ap_itemcode" value="{$smarty.session.USERID}"/>
<input type="hidden" name="ap_description" value="{$p.gtitle|stripslashes}"/>
<input type="hidden" name="ap_returnurl" value="{$baseurl}/feature_success?g={$eid}"/>
<input type="hidden" name="ap_cancelurl" value="{$baseurl}/"/>
<input type="hidden" name="apc_1" value="{$p.PID|stripslashes}"/>  
<input type="hidden" name="apc_2" value="featured"/>                        
</form>
                                
<div class="bodybg scriptolutionpaddingtop15">
	<div class="whitebody scriptolutionpaddingtop30 scriptolutionwidth842">
		<div class="inner-wrapper scriptolutionwidth842 scriptolutioneditpages">
			
            <div class="full-side scriptolutionwidth842">
            
				<div class="whiteBox twoHalfs padding0 noborder scriptolutionwidth800">
                    <div id="scriptolutionPostForm"> 
                        <form action="" id="new_gig" method="post">
                        
                            <h1><strong>{$lang455}</strong></h1>
                            <div class="scriptolutionclear"></div>
                            
                            {insert name=seo_clean_titles assign=title value=a title=$p.gtitle}
							
                            <div align="center" class="newfeaturegig">
                                <a href="{$baseurl}/{$p.seo|stripslashes}/{$p.PID|stripslashes}/{$title}"><img src="{$purl}/t3/{$p.p1}?{$smarty.now}" /></a>
                                <div class="scriptolutionclear"></div>
                                  
                                <a href="{$baseurl}/{$p.seo|stripslashes}/{$p.PID|stripslashes}/{$title}">{$lang62} {$p.gtitle|stripslashes} {if $scriptolution_cur_pos eq "1"}{$lang589} {$p.price|stripslashes}{$lang197}{else}{$lang63}{$p.price|stripslashes}{/if}</a>
                                <div class="scriptolutionclear"></div>
                            </div>
                               
                            <div style="padding:20px;">
                                {$p.gdesc|stripslashes|html_entity_decode}
                                <div class="scriptolutionclear"></div>
                            </div>
                            
                            <div align="center" class="newfeaturegig">      
                                 	<div class="scriptolutionfeaturegig">
                                   	{if $p.feat eq "1"}
                                        <h3>{$lang460}</h3>
                                        {else}
                                        <h3>{$lang457}</h3>
                                        <h3>{$lang436}: {if $scriptolution_cur_pos eq "1"}{$fprice}{$lang197}{else}{$lang197}{$fprice}{/if}</h3>
                                        <h3>{$lang456}: {$fdays} {$lang131}</h3>
                                        <div class="scriptolutionclear"></div>
                                        {if $enable_paypal eq "1"}
                                        <h2><a class="scriptolutionbluebutton" style="color:#FFF; font-weight:normal" href="#" onclick="document.paypal_form.submit();">{$lang411}</a></h2>   
                                        <div class="scriptolutionclear"></div>
                                        {/if}
                                        {if $enable_alertpay eq "1"}                          
                                        <h2><a class="scriptolutionbluebutton" style="color:#FFF; font-weight:normal" href="#" onclick="document.alertpay_form.submit();">{$lang447}</a></h2>
                                        <div class="scriptolutionclear"></div>
                                        {/if}
                                        {if $funds GTE $fprice}
                                        <h2><a class="scriptolutionbluebutton" style="color:#FFF; font-weight:normal" href="#" onclick="document.bal_form.submit();">{$lang412}</a></h2>
                                        <div class="scriptolutionclear"></div>
                                        {/if}
                                        {include file='feature_scriptolution_stripe.tpl'}
                                    {/if}
                                    </div>
                                    <div class="scriptolutionclear"></div>
                                  
                                  	<div class="scriptolutionclear"></div>
                                     <a href="{$baseurl}/{$p.seo|stripslashes}/{$p.PID|stripslashes}/{$title}" style="font-size:30px; text-decoration:none">{$lang458}</a>
                                     <div class="scriptolutionclear"></div>

							</div>

                        </form>   
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
        <div class="footerbg scriptolutionfooter842"></div>
    </div>
</div>