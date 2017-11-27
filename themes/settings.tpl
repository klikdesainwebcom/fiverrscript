{include file="scriptolution_error7.tpl"}                                
<div class="bodybg scriptolutionpaddingtop15">
	<div class="whitebody scriptolutionpaddingtop30 scriptolutionwidth842">
		<div class="inner-wrapper scriptolutionwidth842 scriptolutioneditpages">
			<div class="left-side scriptolutionwidth842" style="margin-top: 10px !important;">
            	
				<div class="whiteBox twoHalfs padding0 noborder scriptolutionwidth800">
                    <div id="scriptolutionPostForm"> 
                        <form action="{$baseurl}/settings" enctype="multipart/form-data" method="post">

                            <div class="scriptolutionpadding20">
                            	<h1>{$lang31}</h1>
                                <div class="form-entry">
                                	{if $enable_levels eq "1"}
                                    <a href="{$baseurl}/levels" style="font-size:18px; color: #45b5dc;">{$lang499} {$p.level|stripslashes}</a>
                                    <div class="scriptolutionclear"></div>
                                    {/if}
                                    
                            		{$smarty.session.USERNAME|stripslashes}: {$lang160}: 
                                	<a style="color: #45b5dc;" href="{$baseurl}/{insert name=get_seo_profile value=a username=$smarty.session.USERNAME|stripslashes}">{$baseurl}/{insert name=get_seo_profile value=a username=$smarty.session.USERNAME|stripslashes}</a>
                                </div>
                                <div class="scriptolutionclear"></div>
                                
                                
                                
                                 <div class="form-entry">
                                  	<div class="column-l">
                                      <label class="editgigformtitle" for="fname">{$lang161}</label>
                                    </div>
                                    <div class="column-r">
                                    	<input class="text" id="fname" name="fname" size="30" type="text" value="{$p.fullname|stripslashes}" />
                                    </div>
                                  </div>
                              	  <div class="scriptolutionclear"></div>
                                  
                                  <div class="form-entry">
                                  	<div class="column-l">
                                      <label class="editgigformtitle" for="email">{$lang4}</label>
                                    </div>
                                    <div class="column-r">
                                    	<input class="text" id="email" name="email" size="30" type="text" value="{$p.email|stripslashes}" />
                                    	{if $smarty.session.VERIFIED eq "0"}<div style="clear:both"></div> <label>&nbsp;</label><a style="color: #45b5dc;" href="{$baseurl}/resendconfirmation.php">{$lang480}</a>{/if}
                                    </div>
                                  </div>
                              	  <div class="scriptolutionclear"></div>
                                  
                                  
                                  {if $enable_paypal eq "1"}
                                  <div class="form-entry">
                                  	<div class="column-l">
                                      <label class="editgigformtitle" for="paypal">{$lang162}</label>
                                    </div>
                                    <div class="column-r">
                                    	<input class="text" id="paypal" name="paypal" size="30" type="text" value="{$p.pemail|stripslashes}" />
                                    </div>
                                  </div>
                              	  <div class="scriptolutionclear"></div>
                                  {/if}
                                  {if $enable_alertpay eq "1"}
                                  <div class="form-entry">
                                  	<div class="column-l">
                                      <label class="editgigformtitle" for="alertpay">{$lang452}</label>
                                    </div>
                                    <div class="column-r">
                                    	<input class="text" id="alertpay" name="alertpay" size="30" type="text" value="{$p.aemail|stripslashes}" />
                                    </div>
                                  </div>
                              	  <div class="scriptolutionclear"></div>
                                  {/if}

                                <div class="form-entry">
                                    <div class="column-l">
                                      <label class="editgigformtitle" for="country">{$lang467}</label>
                                    </div>
                                    <div class="column-r">
                                      <select id="country" name="country" class="text">
                                    <option  {if $p.country eq "AF"}selected{/if} value="AF">Afghanistan</option>
                                    <option  {if $p.country eq "AX"}selected{/if} value="AX">Åland Islands</option>
                                    <option  {if $p.country eq "AL"}selected{/if} value="AL">Albania</option>
                                    <option  {if $p.country eq "DZ"}selected{/if} value="DZ">Algeria</option>
                                    <option  {if $p.country eq "AS"}selected{/if} value="AS">American Samoa</option>
                                    <option  {if $p.country eq "AD"}selected{/if} value="AD">Andorra</option>
                                    <option  {if $p.country eq "AO"}selected{/if} value="AO">Angola</option>
                                    <option  {if $p.country eq "AI"}selected{/if} value="AI">Anguilla</option>
                                    <option  {if $p.country eq "AQ"}selected{/if} value="AQ">Antarctica</option>
                                    <option  {if $p.country eq "AG"}selected{/if} value="AG">Antigua and Barbuda</option>
                                    <option  {if $p.country eq "AR"}selected{/if} value="AR">Argentina</option>
                                    <option  {if $p.country eq "AM"}selected{/if} value="AM">Armenia</option>
                                    <option  {if $p.country eq "AW"}selected{/if} value="AW">Aruba</option>
                                    <option  {if $p.country eq "AU"}selected{/if} value="AU">Australia</option>
                                    <option  {if $p.country eq "AT"}selected{/if} value="AT">Austria</option>
                                    <option  {if $p.country eq "AZ"}selected{/if} value="AZ">Azerbaijan</option>
                                    <option  {if $p.country eq "BS"}selected{/if} value="BS">Bahamas</option>
                                    <option  {if $p.country eq "BH"}selected{/if} value="BH">Bahrain</option>
                                    <option  {if $p.country eq "BD"}selected{/if} value="BD">Bangladesh</option>
                                    <option  {if $p.country eq "BB"}selected{/if} value="BB">Barbados</option>
                                    <option  {if $p.country eq "BY"}selected{/if} value="BY">Belarus</option>
                                    <option  {if $p.country eq "BE"}selected{/if} value="BE">Belgium</option>
                                    <option  {if $p.country eq "BZ"}selected{/if} value="BZ">Belize</option>
                                    <option  {if $p.country eq "BJ"}selected{/if} value="BJ">Benin</option>
                                    <option  {if $p.country eq "BM"}selected{/if} value="BM">Bermuda</option>
                                    <option  {if $p.country eq "BT"}selected{/if} value="BT">Bhutan</option>
                                    <option  {if $p.country eq "BO"}selected{/if} value="BO">Bolivia</option>
                                    <option  {if $p.country eq "BA"}selected{/if} value="BA">Bosnia and Herzegovina</option>
                                    <option  {if $p.country eq "BW"}selected{/if} value="BW">Botswana</option>
                                    <option  {if $p.country eq "BV"}selected{/if} value="BV">Bouvet Island</option>
                                    <option  {if $p.country eq "BR"}selected{/if} value="BR">Brazil</option>
                                    <option  {if $p.country eq "IO"}selected{/if} value="IO">British Indian Ocean Territory</option>
                                    <option  {if $p.country eq "BN"}selected{/if} value="BN">Brunei Darussalam</option>
                                    <option  {if $p.country eq "BG"}selected{/if} value="BG">Bulgaria</option>
                                    <option  {if $p.country eq "BF"}selected{/if} value="BF">Burkina Faso</option>
                                    <option  {if $p.country eq "BI"}selected{/if} value="BI">Burundi</option>
                                    <option  {if $p.country eq "KH"}selected{/if} value="KH">Cambodia</option>
                                    <option  {if $p.country eq "CM"}selected{/if} value="CM">Cameroon</option>
                                    <option  {if $p.country eq "CA"}selected{/if} value="CA">Canada</option>
                                    <option  {if $p.country eq "CV"}selected{/if} value="CV">Cape Verde</option>
                                    <option  {if $p.country eq "KY"}selected{/if} value="KY">Cayman Islands</option>
                                    <option  {if $p.country eq "CF"}selected{/if} value="CF">Central African Republic</option>
                                    <option  {if $p.country eq "TD"}selected{/if} value="TD">Chad</option>
                                    <option  {if $p.country eq "CL"}selected{/if} value="CL">Chile</option>
                                    <option  {if $p.country eq "CN"}selected{/if} value="CN">China</option>
                                    <option  {if $p.country eq "CX"}selected{/if} value="CX">Christmas Island</option>
                                    <option  {if $p.country eq "CC"}selected{/if} value="CC">Cocos (Keeling) Islands</option>
                                    <option  {if $p.country eq "CO"}selected{/if} value="CO">Colombia</option>
                                    <option  {if $p.country eq "KM"}selected{/if} value="KM">Comoros</option>
                                    <option  {if $p.country eq "CG"}selected{/if} value="CG">Congo</option>
                                    <option  {if $p.country eq "CD"}selected{/if} value="CD">Congo, The Democratic Republic of The</option>
                                    <option  {if $p.country eq "CK"}selected{/if} value="CK">Cook Islands</option>
                                    <option  {if $p.country eq "CR"}selected{/if} value="CR">Costa Rica</option>
                                    <option  {if $p.country eq "CI"}selected{/if} value="CI">Cote D'ivoire</option>
                                    <option  {if $p.country eq "HR"}selected{/if} value="HR">Croatia</option>
                                    <option  {if $p.country eq "CU"}selected{/if} value="CU">Cuba</option>
                                    <option  {if $p.country eq "CY"}selected{/if} value="CY">Cyprus</option>
                                    <option  {if $p.country eq "CZ"}selected{/if} value="CZ">Czech Republic</option>
                                    <option  {if $p.country eq "DK"}selected{/if} value="DK">Denmark</option>
                                    <option  {if $p.country eq "DJ"}selected{/if} value="DJ">Djibouti</option>
                                    <option  {if $p.country eq "DM"}selected{/if} value="DM">Dominica</option>
                                    <option  {if $p.country eq "DO"}selected{/if} value="DO">Dominican Republic</option>
                                    <option  {if $p.country eq "EC"}selected{/if} value="EC">Ecuador</option>
                                    <option  {if $p.country eq "EG"}selected{/if} value="EG">Egypt</option>
                                    <option  {if $p.country eq "SV"}selected{/if} value="SV">El Salvador</option>
                                    <option  {if $p.country eq "GQ"}selected{/if} value="GQ">Equatorial Guinea</option>
                                    <option  {if $p.country eq "ER"}selected{/if} value="ER">Eritrea</option>
                                    <option  {if $p.country eq "EE"}selected{/if} value="EE">Estonia</option>
                                    <option  {if $p.country eq "ET"}selected{/if} value="ET">Ethiopia</option>
                                    <option  {if $p.country eq "FK"}selected{/if} value="FK">Falkland Islands (Malvinas)</option>
                                    <option  {if $p.country eq "FO"}selected{/if} value="FO">Faroe Islands</option>
                                    <option  {if $p.country eq "FJ"}selected{/if} value="FJ">Fiji</option>
                                    <option  {if $p.country eq "FI"}selected{/if} value="FI">Finland</option>
                                    <option  {if $p.country eq "FR"}selected{/if} value="FR">France</option>
                                    <option  {if $p.country eq "GR"}selected{/if} value="GF">French Guiana</option>
                                    <option  {if $p.country eq "PF"}selected{/if} value="PF">French Polynesia</option>
                                    <option  {if $p.country eq "TF"}selected{/if} value="TF">French Southern Territories</option>
                                    <option  {if $p.country eq "GA"}selected{/if} value="GA">Gabon</option>
                                    <option  {if $p.country eq "GM"}selected{/if} value="GM">Gambia</option>
                                    <option  {if $p.country eq "GE"}selected{/if} value="GE">Georgia</option>
                                    <option  {if $p.country eq "DE"}selected{/if} value="DE">Germany</option>
                                    <option  {if $p.country eq "GH"}selected{/if} value="GH">Ghana</option>
                                    <option  {if $p.country eq "GI"}selected{/if} value="GI">Gibraltar</option>
                                    <option  {if $p.country eq "GR"}selected{/if} value="GR">Greece</option>
                                    <option  {if $p.country eq "GL"}selected{/if} value="GL">Greenland</option>
                                    <option  {if $p.country eq "GD"}selected{/if} value="GD">Grenada</option>
                                    <option  {if $p.country eq "GP"}selected{/if} value="GP">Guadeloupe</option>
                                    <option  {if $p.country eq "GU"}selected{/if} value="GU">Guam</option>
                                    <option  {if $p.country eq "GT"}selected{/if} value="GT">Guatemala</option>
                                    <option  {if $p.country eq "GG"}selected{/if} value="GG">Guernsey</option>
                                    <option  {if $p.country eq "GN"}selected{/if} value="GN">Guinea</option>
                                    <option  {if $p.country eq "GW"}selected{/if} value="GW">Guinea-bissau</option>
                                    <option  {if $p.country eq "GY"}selected{/if} value="GY">Guyana</option>
                                    <option  {if $p.country eq "HT"}selected{/if} value="HT">Haiti</option>
                                    <option  {if $p.country eq "HM"}selected{/if} value="HM">Heard Island and Mcdonald Islands</option>
                                    <option  {if $p.country eq "VA"}selected{/if} value="VA">Holy See (Vatican City State)</option>
                                    <option  {if $p.country eq "HN"}selected{/if} value="HN">Honduras</option>
                                    <option  {if $p.country eq "HK"}selected{/if} value="HK">Hong Kong</option>
                                    <option  {if $p.country eq "HU"}selected{/if} value="HU">Hungary</option>
                                    <option  {if $p.country eq "IS"}selected{/if} value="IS">Iceland</option>
                                    <option  {if $p.country eq "IN"}selected{/if} value="IN">India</option>
                                    <option  {if $p.country eq "ID"}selected{/if} value="ID">Indonesia</option>
                                    <option  {if $p.country eq "IR"}selected{/if} value="IR">Iran, Islamic Republic of</option>
                                    <option  {if $p.country eq "IQ"}selected{/if} value="IQ">Iraq</option>
                                    <option  {if $p.country eq "IE"}selected{/if} value="IE">Ireland</option>
                                    <option  {if $p.country eq "IM"}selected{/if} value="IM">Isle of Man</option>
                                    <option  {if $p.country eq "IL"}selected{/if} value="IL">Israel</option>
                                    <option  {if $p.country eq "IT"}selected{/if} value="IT">Italy</option>
                                    <option  {if $p.country eq "JM"}selected{/if} value="JM">Jamaica</option>
                                    <option  {if $p.country eq "JP"}selected{/if} value="JP">Japan</option>
                                    <option  {if $p.country eq "JE"}selected{/if} value="JE">Jersey</option>
                                    <option  {if $p.country eq "JO"}selected{/if} value="JO">Jordan</option>
                                    <option  {if $p.country eq "KZ"}selected{/if} value="KZ">Kazakhstan</option>
                                    <option  {if $p.country eq "KE"}selected{/if} value="KE">Kenya</option>
                                    <option  {if $p.country eq "KI"}selected{/if} value="KI">Kiribati</option>
                                    <option  {if $p.country eq "KP"}selected{/if} value="KP">Korea, Democratic People's Republic of</option>
                                    <option  {if $p.country eq "KR"}selected{/if} value="KR">Korea, Republic of</option>
                                    <option  {if $p.country eq "KW"}selected{/if} value="KW">Kuwait</option>
                                    <option  {if $p.country eq "KG"}selected{/if} value="KG">Kyrgyzstan</option>
                                    <option  {if $p.country eq "LA"}selected{/if} value="LA">Lao People's Democratic Republic</option>
                                    <option  {if $p.country eq "LV"}selected{/if} value="LV">Latvia</option>
                                    <option  {if $p.country eq "LB"}selected{/if} value="LB">Lebanon</option>
                                    <option  {if $p.country eq "LS"}selected{/if} value="LS">Lesotho</option>
                                    <option  {if $p.country eq "LR"}selected{/if} value="LR">Liberia</option>
                                    <option  {if $p.country eq "LY"}selected{/if} value="LY">Libyan Arab Jamahiriya</option>
                                    <option  {if $p.country eq "LI"}selected{/if} value="LI">Liechtenstein</option>
                                    <option  {if $p.country eq "LT"}selected{/if} value="LT">Lithuania</option>
                                    <option  {if $p.country eq "LU"}selected{/if} value="LU">Luxembourg</option>
                                    <option  {if $p.country eq "MO"}selected{/if} value="MO">Macao</option>
                                    <option  {if $p.country eq "MK"}selected{/if} value="MK">Macedonia, The Former Yugoslav Republic of</option>
                                    <option  {if $p.country eq "MG"}selected{/if} value="MG">Madagascar</option>
                                    <option  {if $p.country eq "MW"}selected{/if} value="MW">Malawi</option>
                                    <option  {if $p.country eq "MY"}selected{/if} value="MY">Malaysia</option>
                                    <option  {if $p.country eq "MV"}selected{/if} value="MV">Maldives</option>
                                    <option  {if $p.country eq "ML"}selected{/if} value="ML">Mali</option>
                                    <option  {if $p.country eq "MT"}selected{/if} value="MT">Malta</option>
                                    <option  {if $p.country eq "MH"}selected{/if} value="MH">Marshall Islands</option>
                                    <option  {if $p.country eq "MQ"}selected{/if} value="MQ">Martinique</option>
                                    <option  {if $p.country eq "MR"}selected{/if} value="MR">Mauritania</option>
                                    <option  {if $p.country eq "MU"}selected{/if} value="MU">Mauritius</option>
                                    <option  {if $p.country eq "YT"}selected{/if} value="YT">Mayotte</option>
                                    <option  {if $p.country eq "MX"}selected{/if} value="MX">Mexico</option>
                                    <option  {if $p.country eq "FM"}selected{/if} value="FM">Micronesia, Federated States of</option>
                                    <option  {if $p.country eq "MD"}selected{/if} value="MD">Moldova, Republic of</option>
                                    <option  {if $p.country eq "MC"}selected{/if} value="MC">Monaco</option>
                                    <option  {if $p.country eq "MN"}selected{/if} value="MN">Mongolia</option>
                                    <option  {if $p.country eq "ME"}selected{/if} value="ME">Montenegro</option>
                                    <option  {if $p.country eq "MS"}selected{/if} value="MS">Montserrat</option>
                                    <option  {if $p.country eq "MA"}selected{/if} value="MA">Morocco</option>
                                    <option  {if $p.country eq "MZ"}selected{/if} value="MZ">Mozambique</option>
                                    <option  {if $p.country eq "MM"}selected{/if} value="MM">Myanmar</option>
                                    <option  {if $p.country eq "NA"}selected{/if} value="NA">Namibia</option>
                                    <option  {if $p.country eq "NR"}selected{/if} value="NR">Nauru</option>
                                    <option  {if $p.country eq "NP"}selected{/if} value="NP">Nepal</option>
                                    <option  {if $p.country eq "NL"}selected{/if} value="NL">Netherlands</option>
                                    <option  {if $p.country eq "AN"}selected{/if} value="AN">Netherlands Antilles</option>
                                    <option  {if $p.country eq "NC"}selected{/if} value="NC">New Caledonia</option>
                                    <option  {if $p.country eq "NZ"}selected{/if} value="NZ">New Zealand</option>
                                    <option  {if $p.country eq "NI"}selected{/if} value="NI">Nicaragua</option>
                                    <option  {if $p.country eq "NE"}selected{/if} value="NE">Niger</option>
                                    <option  {if $p.country eq "NG"}selected{/if} value="NG">Nigeria</option>
                                    <option  {if $p.country eq "NU"}selected{/if} value="NU">Niue</option>
                                    <option  {if $p.country eq "NF"}selected{/if} value="NF">Norfolk Island</option>
                                    <option  {if $p.country eq "MP"}selected{/if} value="MP">Northern Mariana Islands</option>
                                    <option  {if $p.country eq "NO"}selected{/if} value="NO">Norway</option>
                                    <option  {if $p.country eq "OM"}selected{/if} value="OM">Oman</option>
                                    <option  {if $p.country eq "PK"}selected{/if} value="PK">Pakistan</option>
                                    <option  {if $p.country eq "PW"}selected{/if} value="PW">Palau</option>
                                    <option  {if $p.country eq "PS"}selected{/if} value="PS">Palestinian Territory, Occupied</option>
                                    <option  {if $p.country eq "PA"}selected{/if} value="PA">Panama</option>
                                    <option  {if $p.country eq "PG"}selected{/if} value="PG">Papua New Guinea</option>
                                    <option  {if $p.country eq "PY"}selected{/if} value="PY">Paraguay</option>
                                    <option  {if $p.country eq "PE"}selected{/if} value="PE">Peru</option>
                                    <option  {if $p.country eq "PH"}selected{/if} value="PH">Philippines</option>
                                    <option  {if $p.country eq "PN"}selected{/if} value="PN">Pitcairn</option>
                                    <option  {if $p.country eq "PL"}selected{/if} value="PL">Poland</option>
                                    <option  {if $p.country eq "PT"}selected{/if} value="PT">Portugal</option>
                                    <option  {if $p.country eq "PR"}selected{/if} value="PR">Puerto Rico</option>
                                    <option  {if $p.country eq "QA"}selected{/if} value="QA">Qatar</option>
                                    <option  {if $p.country eq "RE"}selected{/if} value="RE">Reunion</option>
                                    <option  {if $p.country eq "RO"}selected{/if} value="RO">Romania</option>
                                    <option  {if $p.country eq "RU"}selected{/if} value="RU">Russian Federation</option>
                                    <option  {if $p.country eq "RW"}selected{/if} value="RW">Rwanda</option>
                                    <option  {if $p.country eq "SH"}selected{/if} value="SH">Saint Helena</option>
                                    <option  {if $p.country eq "KN"}selected{/if} value="KN">Saint Kitts and Nevis</option>
                                    <option  {if $p.country eq "LC"}selected{/if} value="LC">Saint Lucia</option>
                                    <option  {if $p.country eq "PM"}selected{/if} value="PM">Saint Pierre and Miquelon</option>
                                    <option  {if $p.country eq "VC"}selected{/if} value="VC">Saint Vincent and The Grenadines</option>
                                    <option  {if $p.country eq "WS"}selected{/if} value="WS">Samoa</option>
                                    <option  {if $p.country eq "SM"}selected{/if} value="SM">San Marino</option>
                                    <option  {if $p.country eq "ST"}selected{/if} value="ST">Sao Tome and Principe</option>
                                    <option  {if $p.country eq "SA"}selected{/if} value="SA">Saudi Arabia</option>
                                    <option  {if $p.country eq "SN"}selected{/if} value="SN">Senegal</option>
                                    <option  {if $p.country eq "RS"}selected{/if} value="RS">Serbia</option>
                                    <option  {if $p.country eq "SC"}selected{/if} value="SC">Seychelles</option>
                                    <option  {if $p.country eq "SL"}selected{/if} value="SL">Sierra Leone</option>
                                    <option  {if $p.country eq "SG"}selected{/if} value="SG">Singapore</option>
                                    <option  {if $p.country eq "SK"}selected{/if} value="SK">Slovakia</option>
                                    <option  {if $p.country eq "SI"}selected{/if} value="SI">Slovenia</option>
                                    <option  {if $p.country eq "SB"}selected{/if} value="SB">Solomon Islands</option>
                                    <option  {if $p.country eq "SO"}selected{/if} value="SO">Somalia</option>
                                    <option  {if $p.country eq "ZA"}selected{/if} value="ZA">South Africa</option>
                                    <option  {if $p.country eq "GS"}selected{/if} value="GS">South Georgia and The South Sandwich Islands</option>
                                    <option  {if $p.country eq "ES"}selected{/if} value="ES">Spain</option>
                                    <option  {if $p.country eq "LK"}selected{/if} value="LK">Sri Lanka</option>
                                    <option  {if $p.country eq "SD"}selected{/if} value="SD">Sudan</option>
                                    <option  {if $p.country eq "SR"}selected{/if} value="SR">Suriname</option>
                                    <option  {if $p.country eq "SJ"}selected{/if} value="SJ">Svalbard and Jan Mayen</option>
                                    <option  {if $p.country eq "SZ"}selected{/if} value="SZ">Swaziland</option>
                                    <option  {if $p.country eq "SE"}selected{/if} value="SE">Sweden</option>
                                    <option  {if $p.country eq "CH"}selected{/if} value="CH">Switzerland</option>
                                    <option  {if $p.country eq "SY"}selected{/if} value="SY">Syrian Arab Republic</option>
                                    <option  {if $p.country eq "TW"}selected{/if} value="TW">Taiwan, Province of China</option>
                                    <option  {if $p.country eq "TJ"}selected{/if} value="TJ">Tajikistan</option>
                                    <option  {if $p.country eq "TZ"}selected{/if} value="TZ">Tanzania, United Republic of</option>
                                    <option  {if $p.country eq "TH"}selected{/if} value="TH">Thailand</option>
                                    <option  {if $p.country eq "TL"}selected{/if} value="TL">Timor-leste</option>
                                    <option  {if $p.country eq "TG"}selected{/if} value="TG">Togo</option>
                                    <option  {if $p.country eq "TK"}selected{/if} value="TK">Tokelau</option>
                                    <option  {if $p.country eq "TO"}selected{/if} value="TO">Tonga</option>
                                    <option  {if $p.country eq "TT"}selected{/if} value="TT">Trinidad and Tobago</option>
                                    <option  {if $p.country eq "TN"}selected{/if} value="TN">Tunisia</option>
                                    <option  {if $p.country eq "TR"}selected{/if} value="TR">Turkey</option>
                                    <option  {if $p.country eq "TM"}selected{/if} value="TM">Turkmenistan</option>
                                    <option  {if $p.country eq "TC"}selected{/if} value="TC">Turks and Caicos Islands</option>
                                    <option  {if $p.country eq "TV"}selected{/if} value="TV">Tuvalu</option>
                                    <option  {if $p.country eq "UG"}selected{/if} value="UG">Uganda</option>
                                    <option  {if $p.country eq "UA"}selected{/if} value="UA">Ukraine</option>
                                    <option  {if $p.country eq "AE"}selected{/if} value="AE">United Arab Emirates</option>
                                    <option  {if $p.country eq "GB"}selected{/if} value="GB">United Kingdom</option>
                                    <option  {if $p.country eq "US"}selected{/if} value="US">United States</option>
                                    <option  {if $p.country eq "UM"}selected{/if} value="UM">United States Minor Outlying Islands</option>
                                    <option  {if $p.country eq "UY"}selected{/if} value="UY">Uruguay</option>
                                    <option  {if $p.country eq "UZ"}selected{/if} value="UZ">Uzbekistan</option>
                                    <option  {if $p.country eq "VA"}selected{/if} value="VU">Vanuatu</option>
                                    <option  {if $p.country eq "VE"}selected{/if} value="VE">Venezuela</option>
                                    <option  {if $p.country eq "VN"}selected{/if} value="VN">Viet Nam</option>
                                    <option  {if $p.country eq "VG"}selected{/if} value="VG">Virgin Islands, British</option>
                                    <option  {if $p.country eq "VI"}selected{/if} value="VI">Virgin Islands, U.S.</option>
                                    <option  {if $p.country eq "WF"}selected{/if} value="WF">Wallis and Futuna</option>
                                    <option  {if $p.country eq "EH"}selected{/if} value="EH">Western Sahara</option>
                                    <option  {if $p.country eq "YE"}selected{/if} value="YE">Yemen</option>
                                    <option  {if $p.country eq "ZM"}selected{/if} value="ZM">Zambia</option>
                                    <option  {if $p.country eq "ZW"}selected{/if} value="ZW">Zimbabwe</option>
                                    </select>
                                    </div>
                                  </div>
                              	  <div class="scriptolutionclear"></div>

                                  <div class="form-entry">
                                    <div class="column-l">
                                      <label class="editgigformtitle" for="details">{$lang163}</label>
                                    </div>
                                    <div class="column-r">
                                      <textarea class="text" cols="74" id="details" name="details" rows="6">{$p.description|stripslashes}</textarea>
                                    </div>
                                  </div>
                              	  <div class="scriptolutionclear"></div>

                                  <div class="form-entry">
                                    <div class="column-l">
                                      <label class="editgigformtitle" for="scriptolutionuserslogan">{$lang592}</label>
                                    </div>
                                    <div class="column-r">
                                      <input class="text" id="scriptolutionuserslogan" name="scriptolutionuserslogan" size="30" type="text" value="{$p.scriptolutionuserslogan|stripslashes}" />
                                    </div>
                                  </div>
                                  <div class="scriptolutionclear"></div>
                                  
                                  {insert name=get_member_profilepicture assign=profilepicture value=var USERID=$smarty.session.USERID}
                                  <div class="form-entry">
                                  		<div class="column-l">
                                          <label class="editgigformtitle">{$lang164}</label>
                                          <br />
                                          <img src="{$membersprofilepicurl}/{$profilepicture}?{$smarty.now}" />
                                        </div>
                                        <div class="column-r">
                                          <div class="image-info">
                                            <input id="gphoto" name="gphoto" size="30" type="file" class="text" />
                                            <ul class="image-tip">
                                              <li>{$lang86}</li>
                                            </ul>
                                          </div>
                                        </div>
                                  </div>
                              	  <div class="scriptolutionclear"></div>                                
                              </div>

                            <div class="row form-entry scriptolutionpadding20" align="center">
                                <input type="submit" value="{$lang169}" class="scriptolutionbluebutton" />
                                <input type="hidden" name="subform" value="1" />
                                <input type="hidden" name="scriptolutiontoken" value="{$scriptolutiontoken}" />
                            </div>
                        </form>
                            
                            
                            
                            
                            <form action="{$baseurl}/settings" class="reset-form" id="edit_pass_{$smarty.session.USERID}" method="post">
                            <div class="scriptolutionpadding20">
                            	<h1>{$lang165}</h1>
                				<div class="scriptolutionclear"></div>
                                <div class="form-entry1">
                                    
                                </div>
                                
                                <div class="form-entry">
                                    <div class="column-l">
                                      <label class="editgigformtitle" for="pass">{$lang166}</label>
                                    </div>
                                    <div class="column-r">
                                      <input class="text" id="pass" name="pass" size="30" type="password" />
                                    </div>
                                  </div>
                                  <div class="scriptolutionclear"></div>
                                  
                                  <div class="form-entry">
                                    <div class="column-l">
                                      <label class="editgigformtitle" for="password">{$lang167}</label>
                                    </div>
                                    <div class="column-r">
                                      <input class="text" id="pass2" name="pass2" size="30" type="password" />
                                    </div>
                                  </div>
                                  <div class="scriptolutionclear"></div>
                                
                            </div>
                            <div class="row form-entry scriptolutionpadding20" align="center">
                                <input type="submit" value="{$lang168}" class="scriptolutionbluebutton" />
                            </div>
                            <input type="hidden" name="subpass" value="1" />
                            <input type="hidden" name="scriptolutiontoken" value="{$scriptolutiontoken}" />
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
 