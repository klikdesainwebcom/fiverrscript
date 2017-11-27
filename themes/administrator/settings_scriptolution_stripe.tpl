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
        						<a href="settings_scriptolution_stripe.php" id="isoft_group_1" name="group_1" title="Stripe Settings" class="tab-item-link ">
                                    <span>
                                        <span class="changed" title=""></span>
                                        <span class="error" title=""></span>
                                        Stripe Settings
                                    </span>
        						</a>
                                
        						<div id="isoft_group_1_content" style="display:none;">
                                	<div class="entry-edit">
                                        <div class="entry-edit-head">
                                            <h4 class="icon-head head-edit-form fieldset-legend">Stripe Settings</h4>
                                            <div class="form-buttons">

                                            </div>
                                    	</div>

                                        <fieldset id="group_fields4">
                                            <div class="hor-scroll">
                                                <table cellspacing="0" class="form-list">
                                                <tbody>                    
                                                	<tr class="hidden">
                                                        <td class="label"><label for="scriptolutionstripeenable">Enable Stripe </label></td>
                                                        <td class="value">
                                                            <select id="scriptolutionstripeenable" name="scriptolutionstripeenable" class=" required-entry required-entry select" type="select">
                                                            <option value="1" {if $scriptolutionstripeenable eq "1"}selected{/if}>Yes</option>
                											<option value="0" {if $scriptolutionstripeenable eq "0"}selected{/if}>No</option>
                                                            </select>
                                                        </td>
                                                        <td class="scope-label">[ALLOW BUYERS TO PAY USING STRIPE]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="scriptolutionstripesecret">Stripe Secret Key </label></td>
                                                        <td class="value">
                                                            <input id="scriptolutionstripesecret" name="scriptolutionstripesecret" value="{$scriptolutionstripesecret}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[YOUR SECRET KEY STRIPE ASSIGNED YOU]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="scriptolutionstripepublishable">Stripe publishable Key </label></td>
                                                        <td class="value">
                                                            <input id="scriptolutionstripepublishable" name="scriptolutionstripepublishable" value="{$scriptolutionstripepublishable}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[YOUR PUBLISHABLE KEY STRIPE ASSIGNED YOU]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="scriptolutionstripecurrency">Currency </label></td>
                                                        <td class="value">
                                                            <select id="scriptolutionstripecurrency" name="scriptolutionstripecurrency" class=" required-entry required-entry select" type="select">
                                                            <option value="USD" {if $scriptolutionstripecurrency eq "USD"}selected{/if}>United States Dollar (USD)</option>
                                                            <option value="CAD" {if $scriptolutionstripecurrency eq "CAD"}selected{/if}>Canadian Dollar (CAD)</option>
                                                            <option value="GBP" {if $scriptolutionstripecurrency eq "GBP"}selected{/if}>British Pound (GBP)</option>
                                                            <option value="EUR" {if $scriptolutionstripecurrency eq "EUR"}selected{/if}>Euro (EUR)</option>
                                                            <option value="ALL" {if $scriptolutionstripecurrency eq "ALL"}selected{/if}>Albanian Lek (ALL)</option>
                											<option value="ANG" {if $scriptolutionstripecurrency eq "ANG"}selected{/if}>Netherlands Antillean Gulden (ANG)</option>
                                                            <option value="ARS" {if $scriptolutionstripecurrency eq "ARS"}selected{/if}>Argentine Peso (ARS)</option>
                                                            <option value="AUD" {if $scriptolutionstripecurrency eq "AUD"}selected{/if}>Australian Dollar (AUD)</option>
                                                            <option value="AWG" {if $scriptolutionstripecurrency eq "AWG"}selected{/if}>Aruban Florin (AWG)</option>
                											<option value="BBD" {if $scriptolutionstripecurrency eq "BBD"}selected{/if}>Barbadian Dollar (BBD)</option>
                                                            <option value="BDT" {if $scriptolutionstripecurrency eq "BDT"}selected{/if}>Bangladeshi Taka (BDT)</option>
                                                            <option value="BIF" {if $scriptolutionstripecurrency eq "BIF"}selected{/if}>Burundian Franc (BIF)</option>
                                                            <option value="BMD" {if $scriptolutionstripecurrency eq "BMD"}selected{/if}>Bermudian Dollar (BMD)</option>
                                                            <option value="BND" {if $scriptolutionstripecurrency eq "BND"}selected{/if}>Brunei Dollar (BND)</option>
                                                            <option value="BOB" {if $scriptolutionstripecurrency eq "BOB"}selected{/if}>Bolivian Boliviano (BOB)</option>
                                                            <option value="BRL" {if $scriptolutionstripecurrency eq "BRL"}selected{/if}>Brazilian Real (BRL)</option>
                                                            <option value="BSD" {if $scriptolutionstripecurrency eq "BSD"}selected{/if}>Bahamian Dollar (BSD)</option>
                                                            <option value="BWP" {if $scriptolutionstripecurrency eq "BWP"}selected{/if}>Botswana Pula (BWP)</option>
                                                            <option value="BZD" {if $scriptolutionstripecurrency eq "BZD"}selected{/if}>Belize Dollar (BZD)</option>
                                                            <option value="CHF" {if $scriptolutionstripecurrency eq "CHF"}selected{/if}>Swiss Franc (CHF)</option>
                                                            <option value="CLP" {if $scriptolutionstripecurrency eq "CLP"}selected{/if}>Chilean Peso (CLP)</option>
                                                            <option value="CNY" {if $scriptolutionstripecurrency eq "CNY"}selected{/if}>Chinese Renminbi Yuan (CNY)</option>
                                                            <option value="COP" {if $scriptolutionstripecurrency eq "COP"}selected{/if}>Colombian Peso (COP)</option>
                                                            <option value="CRC" {if $scriptolutionstripecurrency eq "CRC"}selected{/if}>Costa Rican Colón (CRC)</option>
                                                            <option value="CVE" {if $scriptolutionstripecurrency eq "CVE"}selected{/if}>Cape Verdean Escudo (CVE)</option>
                                                            <option value="CZK" {if $scriptolutionstripecurrency eq "CZK"}selected{/if}>Czech Koruna (CZK)</option>
                                                            <option value="DJF" {if $scriptolutionstripecurrency eq "DJF"}selected{/if}>Djiboutian Franc (DJF)</option>
                                                            <option value="DKK" {if $scriptolutionstripecurrency eq "DKK"}selected{/if}>Danish Krone (DKK)</option>
                                                            <option value="DOP" {if $scriptolutionstripecurrency eq "DOP"}selected{/if}>Dominican Peso (DOP)</option>
                                                            <option value="DZD" {if $scriptolutionstripecurrency eq "DZD"}selected{/if}>Algerian Dinar (DZD)</option>
                                                            <option value="EGP" {if $scriptolutionstripecurrency eq "EGP"}selected{/if}>Egyptian Pound (EGP)</option>
                                                            <option value="ETB" {if $scriptolutionstripecurrency eq "ETB"}selected{/if}>Ethiopian Birr (ETB)</option>
                                                            <option value="FJD" {if $scriptolutionstripecurrency eq "FJD"}selected{/if}>Fijian Dollar (FJD)</option>
                                                            <option value="FKP" {if $scriptolutionstripecurrency eq "FKP"}selected{/if}>Falkland Islands Pound (FKP)</option>
                                                            <option value="GIP" {if $scriptolutionstripecurrency eq "GIP"}selected{/if}>Gibraltar Pound (GIP)</option>
                                                            <option value="GMD" {if $scriptolutionstripecurrency eq "GMD"}selected{/if}>Gambian Dalasi (GMD)</option>
                                                            <option value="GNF" {if $scriptolutionstripecurrency eq "GNF"}selected{/if}>Guinean Franc (GNF)</option>
                                                            <option value="GTQ" {if $scriptolutionstripecurrency eq "GTQ"}selected{/if}>Guatemalan Quetzal (GTQ)</option>
                                                            <option value="GYD" {if $scriptolutionstripecurrency eq "GYD"}selected{/if}>Guyanese Dollar (GYD)</option>
                                                            <option value="HKD" {if $scriptolutionstripecurrency eq "HKD"}selected{/if}>Hong Kong Dollar (HKD)</option>
                                                            <option value="HNL" {if $scriptolutionstripecurrency eq "HNL"}selected{/if}>Honduran Lempira (HNL)</option>
                                                            <option value="HRK" {if $scriptolutionstripecurrency eq "HRK"}selected{/if}>Croatian Kuna (HRK)</option>
                                                            <option value="HTG" {if $scriptolutionstripecurrency eq "HTG"}selected{/if}>Haitian Gourde (HTG)</option>
                                                            <option value="HUF" {if $scriptolutionstripecurrency eq "HUF"}selected{/if}>Hungarian Forint (HUF)</option>
                                                            <option value="IDR" {if $scriptolutionstripecurrency eq "IDR"}selected{/if}>Indonesian Rupiah (IDR)</option>
                                                            <option value="ILS" {if $scriptolutionstripecurrency eq "ILS"}selected{/if}>Israeli New Sheqel (ILS)</option>
                                                            <option value="INR" {if $scriptolutionstripecurrency eq "INR"}selected{/if}>Indian Rupee (INR)</option>
                                                            <option value="ISK" {if $scriptolutionstripecurrency eq "ISK"}selected{/if}>Icelandic Króna (ISK)</option>
                                                            <option value="JMD" {if $scriptolutionstripecurrency eq "JMD"}selected{/if}>Jamaican Dollar (JMD)</option>
                                                            <option value="JPY" {if $scriptolutionstripecurrency eq "JPY"}selected{/if}>Japanese Yen (JPY)</option>
                                                            <option value="KES" {if $scriptolutionstripecurrency eq "KES"}selected{/if}>Kenyan Shilling (KES)</option>
                                                            <option value="KHR" {if $scriptolutionstripecurrency eq "KHR"}selected{/if}>Cambodian Riel (KHR)</option>
                                                            <option value="KMF" {if $scriptolutionstripecurrency eq "KMF"}selected{/if}>Comorian Franc (KMF)</option>
                                                            <option value="KRW" {if $scriptolutionstripecurrency eq "KRW"}selected{/if}>South Korean Won (KRW)</option>
                                                            <option value="KYD" {if $scriptolutionstripecurrency eq "KYD"}selected{/if}>Cayman Islands Dollar (KYD)</option>
                                                            <option value="KZT" {if $scriptolutionstripecurrency eq "KZT"}selected{/if}>Kazakhstani Tenge (KZT)</option>
                                                            <option value="LAK" {if $scriptolutionstripecurrency eq "LAK"}selected{/if}>Lao Kip (LAK)</option>
                                                            <option value="LBP" {if $scriptolutionstripecurrency eq "LBP"}selected{/if}>Lebanese Pound (LBP)</option>
                                                            <option value="LKR" {if $scriptolutionstripecurrency eq "LKR"}selected{/if}>Sri Lankan Rupee (LKR)</option>
                                                            <option value="LRD" {if $scriptolutionstripecurrency eq "LRD"}selected{/if}>Liberian Dollar (LRD)</option>
                                                            <option value="MAD" {if $scriptolutionstripecurrency eq "MAD"}selected{/if}>Moroccan Dirham (MAD)</option>
                                                            <option value="MDL" {if $scriptolutionstripecurrency eq "MDL"}selected{/if}>Moldovan Leu (MDL)</option>
                                                            <option value="MNT" {if $scriptolutionstripecurrency eq "MNT"}selected{/if}>Mongolian Tögrög (MNT)</option>
                                                            <option value="MOP" {if $scriptolutionstripecurrency eq "MOP"}selected{/if}>Macanese Pataca (MOP)</option>
                                                            <option value="MRO" {if $scriptolutionstripecurrency eq "MRO"}selected{/if}>Mauritanian Ouguiya (MRO)</option>
                                                            <option value="MUR" {if $scriptolutionstripecurrency eq "MUR"}selected{/if}>Mauritian Rupee (MUR)</option>
                                                            <option value="MVR" {if $scriptolutionstripecurrency eq "MVR"}selected{/if}>Maldivian Rufiyaa (MVR)</option>
                                                            <option value="MWK" {if $scriptolutionstripecurrency eq "MWK"}selected{/if}>Malawian Kwacha (MWK)</option>
                                                            <option value="MXN" {if $scriptolutionstripecurrency eq "MXN"}selected{/if}>Mexican Peso (MXN)</option>
                                                            <option value="MYR" {if $scriptolutionstripecurrency eq "MYR"}selected{/if}>Malaysian Ringgit (MYR)</option>
                                                            <option value="NAD" {if $scriptolutionstripecurrency eq "NAD"}selected{/if}>Namibian Dollar (NAD)</option>
                                                            <option value="NGN" {if $scriptolutionstripecurrency eq "NGN"}selected{/if}>Nigerian Naira (NGN)</option>
                                                            <option value="NIO" {if $scriptolutionstripecurrency eq "NIO"}selected{/if}>Nicaraguan Córdoba (NIO)</option>
                                                            <option value="NOK" {if $scriptolutionstripecurrency eq "NOK"}selected{/if}>Norwegian Krone (NOK)</option>
                                                            <option value="NPR" {if $scriptolutionstripecurrency eq "NPR"}selected{/if}>Nepalese Rupee (NPR)</option>
                                                            <option value="NZD" {if $scriptolutionstripecurrency eq "NZD"}selected{/if}>New Zealand Dollar (NZD)</option>
                                                            <option value="PAB" {if $scriptolutionstripecurrency eq "PAB"}selected{/if}>Panamanian Balboa (PAB)</option>
                                                            <option value="PEN" {if $scriptolutionstripecurrency eq "PEN"}selected{/if}>Peruvian Nuevo Sol (PEN)</option>
                                                            <option value="PGK" {if $scriptolutionstripecurrency eq "PGK"}selected{/if}>Papua New Guinean Kina (PGK)</option>
                                                            <option value="PHP" {if $scriptolutionstripecurrency eq "PHP"}selected{/if}>Philippine Peso (PHP)</option>
                                                            <option value="PKR" {if $scriptolutionstripecurrency eq "PKR"}selected{/if}>Pakistani Rupee (PKR)</option>
                                                            <option value="PLN" {if $scriptolutionstripecurrency eq "PLN"}selected{/if}>Polish Złoty (PLN)</option>
                                                            <option value="PYG" {if $scriptolutionstripecurrency eq "PYG"}selected{/if}>Paraguayan Guaraní (PYG)</option>
                                                            <option value="QAR" {if $scriptolutionstripecurrency eq "QAR"}selected{/if}>Qatari Riyal (QAR)</option>
                                                            <option value="RUB" {if $scriptolutionstripecurrency eq "RUB"}selected{/if}>Russian Ruble (RUB)</option>
                                                            <option value="SAR" {if $scriptolutionstripecurrency eq "SAR"}selected{/if}>Saudi Riyal (SAR)</option>
                                                            <option value="SBD" {if $scriptolutionstripecurrency eq "SBD"}selected{/if}>Solomon Islands Dollar (SBD)</option>
                                                            <option value="SCR" {if $scriptolutionstripecurrency eq "SCR"}selected{/if}>Seychellois Rupee (SCR)</option>
                                                            <option value="SEK" {if $scriptolutionstripecurrency eq "SEK"}selected{/if}>Swedish Krona (SEK)</option>
                                                            <option value="SGD" {if $scriptolutionstripecurrency eq "SGD"}selected{/if}>Singapore Dollar (SGD)</option>
                                                            <option value="SHP" {if $scriptolutionstripecurrency eq "SHP"}selected{/if}>Saint Helenian Pound (SHP)</option>
                                                            <option value="SLL" {if $scriptolutionstripecurrency eq "SLL"}selected{/if}>Sierra Leonean Leone (SLL)</option>
                                                            <option value="SOS" {if $scriptolutionstripecurrency eq "SOS"}selected{/if}>Somali Shilling (SOS)</option>
                                                            <option value="STD" {if $scriptolutionstripecurrency eq "STD"}selected{/if}>São Tomé and Príncipe Dobra (STD)</option>
                                                            <option value="SVC" {if $scriptolutionstripecurrency eq "SVC"}selected{/if}>Salvadoran Colón (SVC)</option>
                                                            <option value="SZL" {if $scriptolutionstripecurrency eq "SZL"}selected{/if}>Swazi Lilangeni (SZL)</option>
                                                            <option value="THB" {if $scriptolutionstripecurrency eq "THB"}selected{/if}>Thai Baht (THB)</option>
                                                            <option value="TOP" {if $scriptolutionstripecurrency eq "TOP"}selected{/if}>Tongan Paʻanga (TOP)</option>
                                                            <option value="TTD" {if $scriptolutionstripecurrency eq "TTD"}selected{/if}>Trinidad and Tobago Dollar (TTD)</option>
                                                            <option value="TWD" {if $scriptolutionstripecurrency eq "TWD"}selected{/if}>New Taiwan Dollar (TWD)</option>
                                                            <option value="TZS" {if $scriptolutionstripecurrency eq "TZS"}selected{/if}>Tanzanian Shilling (TZS)</option>
                                                            <option value="UAH" {if $scriptolutionstripecurrency eq "UAH"}selected{/if}>Ukrainian Hryvnia (UAH)</option>
                                                            <option value="AED" {if $scriptolutionstripecurrency eq "AED"}selected{/if}>United Arab Emirates Dirham (AED)</option>
                                                            <option value="UGX" {if $scriptolutionstripecurrency eq "UGX"}selected{/if}>Ugandan Shilling (UGX)</option>
                                                            <option value="UYU" {if $scriptolutionstripecurrency eq "UYU"}selected{/if}>Uruguayan Peso (UYU)</option>
                                                            <option value="UZS" {if $scriptolutionstripecurrency eq "UZS"}selected{/if}>Uzbekistani Som (UZS)</option>
                                                            <option value="VND" {if $scriptolutionstripecurrency eq "VND"}selected{/if}>Vietnamese Đồng (VND)</option>
                                                            <option value="VUV" {if $scriptolutionstripecurrency eq "VUV"}selected{/if}>Vanuatu Vatu (VUV)</option>
                                                            <option value="WST" {if $scriptolutionstripecurrency eq "WST"}selected{/if}>Samoan Tala (WST)</option>
                                                            <option value="XAF" {if $scriptolutionstripecurrency eq "XAF"}selected{/if}>Central African Cfa Franc (XAF)</option>
                                                            <option value="XOF" {if $scriptolutionstripecurrency eq "XOF"}selected{/if}>West African Cfa Franc (XOF)</option>
                                                            <option value="XPF" {if $scriptolutionstripecurrency eq "XPF"}selected{/if}>Cfp Franc (XPF)</option>
                                                            <option value="YER" {if $scriptolutionstripecurrency eq "YER"}selected{/if}>Yemeni Rial (YER)</option>
                                                            <option value="ZAR" {if $scriptolutionstripecurrency eq "ZAR"}selected{/if}>South African Rand (ZAR)</option>
                                                            </select>
                                                        </td>
                                                        <td class="scope-label">[CURRENCY USED FOR STRIPE PAYMENTS]</td>
                                                        <td><small></small></td>
                                                    </tr> 

                                                    <tr class="hidden">
                                                        <td class="label"><label for="status"> </label></td>
                                                        <td class="value" colspan="3">
<b>IMPORTANT INFORMATION ABOUT THE CURRENCY</b><br /><br />
According to the stripe documentation: Bank accounts must be located in the country where their currency is based–for example, USD banks accounts must be based in the United States, SEK bank accounts must be based in Sweden, etc.–though there are a few exceptions.<br /><br />

You can read more here:<br />
<a href="https://support.stripe.com/questions/which-currencies-does-stripe-support" target="_blank">https://support.stripe.com/questions/which-currencies-does-stripe-support</a>
<br /><br />

So ensure you do not choose a currency they do not allow you to use.


                                                        </td>
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
                               <h3 class="icon-head head-products">Settings - Stripe Settings</h3>
                               <p class="content-buttons form-buttons">
                                    <button  id="id_be616be1324d8ae4516f276d17d34b9c" type="button" class="scalable save" onclick="document.main_form.submit();" style=""><span>Save Changes</span></button>			
                                </p>
                            </div>
                            
                            <form action="settings_scriptolution_stripe.php" method="post" id="main_form" name="main_form" enctype="multipart/form-data">
                            	<input type="hidden" id="submitform" name="submitform" value="1" >
                            	<div style="display:none"></div>
                            </form>
						</div>
					</div>
				</div>

                        </div>
        </div>