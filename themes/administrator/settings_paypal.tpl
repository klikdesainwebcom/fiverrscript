		<div class="middle" id="anchor-content">
            <div id="page:main-container">
				<div class="columns ">
                
					<div class="side-col" id="page:left">
    					<h3>Settings</h3>
						
                        <ul id="isoft" class="tabs">
    						<li >
        						<a href="settings_general.php" id="isoft_group_2" name="group_2" title="General Settings" class="tab-item-link ">
                                    <span>
                                        <span class="changed" title=""></span>
                                        <span class="error" title=""></span>
                                        General Settings
                                    </span>
        						</a>
                                <div id="isoft_group_2_content" style="display:none;"></div>
    						</li>
                            
                            <li >
                                <a href="settings_meta.php" id="isoft_group_9" name="group_9" title="Meta Settings" class="tab-item-link">
                                	<span>
                                    	<span class="changed" title=""></span>
                                        <span class="error" title=""></span>
                                        Meta Settings
                                    </span>
                                </a>
                                <div id="isoft_group_9_content" style="display:none;"></div>
                            </li>
                            
                            <li >
                                <a href="settings_static.php" id="isoft_group_11" name="group_11" title="Static Pages" class="tab-item-link">
                                	<span>
                                    	<span class="changed" title=""></span>
                                        <span class="error" title=""></span>
                                        Static Pages
                                    </span>
                                </a>
                                <div id="isoft_group_11_content" style="display:none;"></div>
                            </li>
                            
                            <li >
                                <a href="settings_payment.php" id="isoft_group_12" name="group_12" title="Payment Settings" class="tab-item-link">
                                	<span>
                                    	<span class="changed" title=""></span>
                                        <span class="error" title=""></span>
                                        Payment Settings
                                    </span>
                                </a>
                                <div id="isoft_group_12_content" style="display:none;"></div>
                            </li>                            
                            
                            <li >
                                <a href="settings_packs.php" id="isoft_group_5" name="group_5" title="Payment Packs" class="tab-item-link">
                                	<span>
                                    	<span class="changed" title=""></span>
                                        <span class="error" title=""></span>
                                        Payment Packs
                                    </span>
                                </a>
                                <div id="isoft_group_5_content" style="display:none;"></div>
                            </li>
                            
                            <li >
                                <a href="settings_levels.php" id="isoft_group_20" name="group_20" title="Job Levels Settings" class="tab-item-link">
                                	<span>
                                    	<span class="changed" title=""></span>
                                        <span class="error" title=""></span>
                                        Job Levels Settings
                                    </span>
                                </a>
                                <div id="isoft_group_20_content" style="display:none;"></div>
                            </li>
                            
                            <li >
        						<a href="settings_paypal.php" id="isoft_group_1" name="group_1" title="PayPal Settings" class="tab-item-link ">
                                    <span>
                                        <span class="changed" title=""></span>
                                        <span class="error" title=""></span>
                                        PayPal Settings
                                    </span>
        						</a>
                                
        						<div id="isoft_group_1_content" style="display:none;">
                                	<div class="entry-edit">
                                        <div class="entry-edit-head">
                                            <h4 class="icon-head head-edit-form fieldset-legend">PayPal Settings</h4>
                                            <div class="form-buttons">

                                            </div>
                                    	</div>

                                        <fieldset id="group_fields4">
                                            <div class="hor-scroll">
                                                <table cellspacing="0" class="form-list">
                                                <tbody>                    
                                                	<tr class="hidden">
                                                        <td class="label"><label for="status">Enable PayPal </label></td>
                                                        <td class="value">
                                                            <select id="enable_paypal" name="enable_paypal" class=" required-entry required-entry select" type="select">
                                                            <option value="1" {if $enable_paypal eq "1"}selected{/if}>Yes</option>
                											<option value="0" {if $enable_paypal eq "0"}selected{/if}>No</option>
                                                            </select>
                                                        </td>
                                                        <td class="scope-label">[ALLOW BUYERS TO PAY USING PAYPAL]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="status">Paypal E-Mail </label></td>
                                                        <td class="value">
                                                            <input id="paypal_email" name="paypal_email" value="{$paypal_email}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[E-MAIL ADDRESS PAYPAL PAYMENTS ARE SENT TO]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="status">Notify E-Mail </label></td>
                                                        <td class="value">
                                                            <input id="notify_email" name="notify_email" value="{$notify_email}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[E-MAIL ADDRESS PAYPAL NOTIFICATIONS ARE SENT TO]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="status">Currency </label></td>
                                                        <td class="value">
                                                            <select id="currency" name="currency" class=" required-entry required-entry select" type="select">
                                                            <option value="USD" {if $currency eq "USD"}selected{/if}>U.S. Dollars (USD)</option>
                											<option value="CAD" {if $currency eq "CAD"}selected{/if}>Canadian Dollars (CAD)</option>
                                                            <option value="EUR" {if $currency eq "EUR"}selected{/if}>Euros (EUR)</option>
                											<option value="GBP" {if $currency eq "GBP"}selected{/if}>Pounds Sterling (GBP)</option>
                                                            <option value="JPY" {if $currency eq "JPY"}selected{/if}>Yen (JPY)</option>
                                                            <option value="AUD" {if $currency eq "AUD"}selected{/if}>Australian Dollars (AUD)</option>
                                                            <option value="NZD" {if $currency eq "NZD"}selected{/if}>New Zealand Dollar (NZD)</option>
                                                            <option value="CHF" {if $currency eq "CHF"}selected{/if}>Swiss Franc (CHF)</option>
                                                            <option value="HKD" {if $currency eq "HKD"}selected{/if}>Hong Kong Dollar (HKD)</option>
                                                            <option value="SGD" {if $currency eq "SGD"}selected{/if}>Singapore Dollar (SGD)</option>
                                                            <option value="SEK" {if $currency eq "SEK"}selected{/if}>Swedish Krona (SEK)</option>
                                                            <option value="DKK" {if $currency eq "DKK"}selected{/if}>Danish Krone (DKK)</option>
                                                            <option value="PLN" {if $currency eq "PLN"}selected{/if}>Polish Zloty (PLN)</option>
                                                            <option value="NOK" {if $currency eq "NOK"}selected{/if}>Norwegian Krone (NOK)</option>
                                                            <option value="HUF" {if $currency eq "HUF"}selected{/if}>Hungarian Forint (HUF)</option>
                                                            <option value="CZK" {if $currency eq "CZK"}selected{/if}>Czech Koruna (CZK)</option>
                                                            <option value="ILS" {if $currency eq "ILS"}selected{/if}>Israeli Shekel (ILS)</option>
                                                            <option value="MXN" {if $currency eq "MXN"}selected{/if}>Mexican Peso (MXN)</option>
                                                            <option value="BRL" {if $currency eq "BRL"}selected{/if}>Brazilian Real (BRL)</option>
                                                            <option value="MYR" {if $currency eq "MYR"}selected{/if}>Malaysian Ringgits (MYR)</option>
                                                            <option value="PHP" {if $currency eq "PHP"}selected{/if}>Philippine Pesos (PHP)</option>
                                                            <option value="TWD" {if $currency eq "TWD"}selected{/if}>Taiwan New Dollars (TWD)</option>
                                                            <option value="THB" {if $currency eq "THB"}selected{/if}>Thai Baht (THB)</option>
                                                            <option value="TRY" {if $currency eq "TRY"}selected{/if}>Turkish Lira (TRY)</option>
                                                            </select>
                                                        </td>
                                                        <td class="scope-label">[CURRENCY USED FOR PAYPAL PAYMENTS]</td>
                                                        <td><small></small></td>
                                                    </tr> 
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="scriptolution_paypal_confirm">Check For Verified IPN </label></td>
                                                        <td class="value">
                                                            <select id="scriptolution_paypal_confirm" name="scriptolution_paypal_confirm" class=" required-entry required-entry select" type="select">
                                                            <option value="1" {if $scriptolution_paypal_confirm eq "1"}selected{/if}>Yes</option>
                											<option value="0" {if $scriptolution_paypal_confirm eq "0"}selected{/if}>No</option>
                                                            </select>
                                                        </td>
                                                        <td class="scope-label">[CHECK FOR VERIFIED IPN MESSAGES, IF SET TO YES AND DOES NOT RECEIVE VERIFIED ORDERS WILL NOT BE CREATED AFTER PAYMENT]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                                                                   
                                                    
                                                </tbody>
                                                </table>
                                            </div>
                                            <input type="hidden" name="scriptolutiontoken" value="{$scriptolutiontoken}" />
                                        </fieldset>
									</div>
								</div>
    						</li>
                            
                            <li >
                                <a href="settings_scriptolution_stripe.php" id="isoft_group_9" name="group_9" title="Stripe Settings" class="tab-item-link">
                                	<span>
                                    	<span class="changed" title=""></span>
                                        <span class="error" title=""></span>
                                        Stripe Settings
                                    </span>
                                </a>
                                <div id="isoft_group_9_content" style="display:none;"></div>
                            </li>
                            
                            <li >
                                <a href="settings_alertpay.php" id="isoft_group_7" name="group_7" title="Payza Settings" class="tab-item-link">
                                	<span>
                                    	<span class="changed" title=""></span>
                                        <span class="error" title=""></span>
                                        Payza Settings
                                    </span>
                                </a>
                                <div id="isoft_group_7_content" style="display:none;"></div>
                            </li>
                            {include file="administrator/settings_scriptolution1.tpl"}
                            <li >
                                <a href="settings_referrals.php" id="isoft_group_8" name="group_8" title="Referral Settings" class="tab-item-link">
                                	<span>
                                    	<span class="changed" title=""></span>
                                        <span class="error" title=""></span>
                                        Referral Settings
                                    </span>
                                </a>
                                <div id="isoft_group_8_content" style="display:none;"></div>
                            </li>
    
						</ul>
                        
						<script type="text/javascript">
                            isoftJsTabs = new varienTabs('isoft', 'main_form', 'isoft_group_1', []);
                        </script>
                        
					</div>
                    
					<div class="main-col" id="content">
						<div class="main-col-inner">
							<div id="messages">
                            {if $message ne "" OR $error ne ""}
                            	{include file="administrator/show_message.tpl"}
                            {/if}
                            </div>

                            <div class="content-header">
                               <h3 class="icon-head head-products">Settings - PayPal Settings</h3>
                               <p class="content-buttons form-buttons">
                                    <button  id="id_be616be1324d8ae4516f276d17d34b9c" type="button" class="scalable save" onclick="document.main_form.submit();" style=""><span>Save Changes</span></button>			
                                </p>
                            </div>
                            
                            <form action="settings_paypal.php" method="post" id="main_form" name="main_form" enctype="multipart/form-data">
                            	<input type="hidden" id="submitform" name="submitform" value="1" >
                            	<div style="display:none"></div>
                            </form>
						</div>
					</div>
				</div>

                        </div>
        </div>