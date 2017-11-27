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
                                <a href="settings_paypal.php" id="isoft_group_6" name="group_6" title="PayPal Settings" class="tab-item-link">
                                	<span>
                                    	<span class="changed" title=""></span>
                                        <span class="error" title=""></span>
                                        PayPal Settings
                                    </span>
                                </a>
                                <div id="isoft_group_6_content" style="display:none;"></div>
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
        						<a href="settings_alertpay.php" id="isoft_group_1" name="group_1" title="Payza Settings" class="tab-item-link ">
                                    <span>
                                        <span class="changed" title=""></span>
                                        <span class="error" title=""></span>
                                        Payza Settings
                                    </span>
        						</a>
                                
        						<div id="isoft_group_1_content" style="display:none;">
                                	<div class="entry-edit">
                                        <div class="entry-edit-head">
                                            <h4 class="icon-head head-edit-form fieldset-legend">Payza Settings</h4>
                                            <div class="form-buttons">

                                            </div>
                                    	</div>

                                        <fieldset id="group_fields4">
                                            <div class="hor-scroll">
                                                <table cellspacing="0" class="form-list">
                                                <tbody>                    
                                                	<tr class="hidden">
                                                        <td class="label"><label for="status">Enable Payza </label></td>
                                                        <td class="value">
                                                            <select id="enable_alertpay" name="enable_alertpay" class=" required-entry required-entry select" type="select">
                                                            <option value="1" {if $enable_alertpay eq "1"}selected{/if}>Yes</option>
                											<option value="0" {if $enable_alertpay eq "0"}selected{/if}>No</option>
                                                            </select>
                                                        </td>
                                                        <td class="scope-label">[ALLOW BUYERS TO PAY USING PAYZA]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="status">Payza E-Mail </label></td>
                                                        <td class="value">
                                                            <input id="alertpay_email" name="alertpay_email" value="{$alertpay_email}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[E-MAIL ADDRESS PAYZA PAYMENTS ARE SENT TO]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="status">Payza Security Code </label></td>
                                                        <td class="value">
                                                            <input id="ap_code" name="ap_code" value="{$ap_code}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[SECURITY CODE GIVEN TO YOU BY PAYZA WHEN YOU SETUP THE IPN (SEE BOTTOM OF PAGE)]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="status">Currency </label></td>
                                                        <td class="value">
                                                            <select id="alertpay_currency" name="alertpay_currency" class=" required-entry required-entry select" type="select">
                                                            <option value="USD" {if $alertpay_currency eq "USD"}selected{/if}>U.S. Dollars (USD)</option>
                											<option value="CAD" {if $alertpay_currency eq "CAD"}selected{/if}>Canadian Dollars (CAD)</option>
                                                            <option value="EUR" {if $alertpay_currency eq "EUR"}selected{/if}>Euros (EUR)</option>
                											<option value="GBP" {if $alertpay_currency eq "GBP"}selected{/if}>Pounds Sterling (GBP)</option>
                                                            <option value="AUD" {if $alertpay_currency eq "AUD"}selected{/if}>Australian Dollars (AUD)</option>
                                                            <option value="NZD" {if $alertpay_currency eq "NZD"}selected{/if}>New Zealand Dollar (NZD)</option>
                                                            <option value="CHF" {if $alertpay_currency eq "CHF"}selected{/if}>Swiss Franc (CHF)</option>
                                                            <option value="HKD" {if $alertpay_currency eq "HKD"}selected{/if}>Hong Kong Dollar (HKD)</option>
                                                            <option value="SGD" {if $alertpay_currency eq "SGD"}selected{/if}>Singapore Dollar (SGD)</option>
                                                            <option value="SEK" {if $alertpay_currency eq "SEK"}selected{/if}>Swedish Krona (SEK)</option>
                                                            <option value="DKK" {if $alertpay_currency eq "DKK"}selected{/if}>Danish Krone (DKK)</option>
                                                            <option value="PLN" {if $alertpay_currency eq "PLN"}selected{/if}>Polish Zloty (PLN)</option>
                                                            <option value="NOK" {if $alertpay_currency eq "NOK"}selected{/if}>Norwegian Krone (NOK)</option>
                                                            <option value="HUF" {if $alertpay_currency eq "HUF"}selected{/if}>Hungarian Forint (HUF)</option>
                                                            <option value="CZK" {if $alertpay_currency eq "CZK"}selected{/if}>Czech Koruna (CZK)</option>
                                                            <option value="MYR" {if $alertpay_currency eq "MYR"}selected{/if}>Malaysian Ringgits (MYR)</option>
                                                            <option value="BGN" {if $alertpay_currency eq "BGN"}selected{/if}>Bulgarian Lev (BGN)</option>
                                                            <option value="EEK" {if $alertpay_currency eq "EEK"}selected{/if}>Estonia Kroon (EEK)</option>
                                                            <option value="LTL" {if $alertpay_currency eq "LTL"}selected{/if}>Lithuanian Litas (LTL)</option>
                                                            <option value="MKD" {if $alertpay_currency eq "MKD"}selected{/if}>Macedonian Denar (MKD)</option>
                                                            <option value="RON" {if $alertpay_currency eq "RON"}selected{/if}>Romanian New Leu (RON)</option>
                                                            <option value="ZAR" {if $alertpay_currency eq "ZAR"}selected{/if}>South African Rand (ZAR)</option>
                                                            </select>

                                                        </td>
                                                        <td class="scope-label">[CURRENCY USED FOR PAYZA PAYMENTS]</td>
                                                        <td><small></small></td>
                                                    </tr> 
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="status">How To Setup Payza </label></td>
                                                        <td class="value">
<b>Setting up IPN on your Account</b><br /><br />
1. Login to your Payza account.<br /><br />

2. Click on "My Payza Account".<br /><br />

3. Click on "IPN Advanced Integration".<br /><br />

4. Click on "IPN Setup".<br /><br />

5. Enter your Transaction PIN and click on "Access".<br /><br />

6. Enter the information:<br />
For IPN Status, select "Enabled".<br /><br />

For Alert URL, enter http://www.yourdomain.com/ipn_ap.php<br />
** Ensure you replace www.yourdomain.com with your actual domain name where you have the script installed.<br /><br />

Generate a security code if necessary and record it.<br /><br />

7. Click on "Update".

                                                        </td>
                                                        <td class="scope-label"></td>
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
                               <h3 class="icon-head head-products">Settings - Payza Settings</h3>
                               <p class="content-buttons form-buttons">
                                    <button  id="id_be616be1324d8ae4516f276d17d34b9c" type="button" class="scalable save" onclick="document.main_form.submit();" style=""><span>Save Changes</span></button>			
                                </p>
                            </div>
                            
                            <form action="settings_alertpay.php" method="post" id="main_form" name="main_form" enctype="multipart/form-data">
                            	<input type="hidden" id="submitform" name="submitform" value="1" >
                            	<div style="display:none"></div>
                            </form>
						</div>
					</div>
				</div>

                        </div>
        </div>