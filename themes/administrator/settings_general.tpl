		<div class="middle" id="anchor-content">
            <div id="page:main-container">
				<div class="columns ">
                
					<div class="side-col" id="page:left">
    					<h3>Settings</h3>
						
                        <ul id="isoft" class="tabs">
    						<li >
        						<a href="settings_general.php" id="isoft_group_1" name="group_1" title="Settings" class="tab-item-link ">
                                    <span>
                                        <span class="changed" title=""></span>
                                        <span class="error" title=""></span>
                                        General Settings
                                    </span>
        						</a>
                                
        						<div id="isoft_group_1_content" style="display:none;">
                                	<div class="entry-edit">
                                        <div class="entry-edit-head">
                                            <h4 class="icon-head head-edit-form fieldset-legend">General Settings</h4>
                                            <div class="form-buttons">

                                            </div>
                                    	</div>

                                        <fieldset id="group_fields4">
                                            <div class="hor-scroll">
                                                <table cellspacing="0" class="form-list">
                                                <tbody>
                                                    <tr class="hidden">
                                                        <td class="label"><label for="name">Website Name </label></td>
                                                        <td class="value">
                                                        	<input id="site_name" name="site_name" value="{$site_name}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[YOUR WEBSITE NAME]</td>
                                                            <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="name">Website Slogan </label></td>
                                                        <td class="value">
                                                        	<input id="site_slogan" name="site_slogan" value="{$site_slogan}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[YOUR WEBSITE SLOGAN]</td>
                                                            <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="status">Website E-Mail </label></td>
                                                        <td class="value">
                                                            <input id="site_email" name="site_email" value="{$site_email}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[WHERE E-MAILS ARE SENT FROM]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="scriptolution_mail_from_name">Website From E-Mail Name </label></td>
                                                        <td class="value">
                                                            <input id="scriptolution_mail_from_name" name="scriptolution_mail_from_name" value="{$scriptolution_mail_from_name}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[NAME WHERE E-MAILS ARE SENT FROM]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="status">Gigs Per Page </label></td>
                                                        <td class="value">
                                                            <input id="items_per_page" name="items_per_page" value="{$items_per_page}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[MAXIMUM GIGS TO LIST PER PAGE]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="items_per_page_new">Gigs Per Page New </label></td>
                                                        <td class="value">
                                                            <input id="items_per_page_new" name="items_per_page_new" value="{$items_per_page_new}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[MAXIMUM GIGS TO LIST PER PAGE ON NEW DESIGN SECTIONS]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="status">Approve Gigs </label></td>
                                                        <td class="value">
                                                            <select id="approve_stories" name="approve_stories" class=" required-entry required-entry select" type="select">
                                                            <option value="1" {if $approve_stories eq "1"}selected{/if}>Yes</option>
                											<option value="0" {if $approve_stories eq "0"}selected{/if}>No</option>
                                                            </select>
                                                        </td>
                                                        <td class="scope-label">[REQUIRE NEWLY POSTED GIGS TO BE APPROVED BEFORE BEING MADE PUBLIC]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="status">Approve Requests </label></td>
                                                        <td class="value">
                                                            <select id="approve_suggests" name="approve_suggests" class=" required-entry required-entry select" type="select">
                                                            <option value="1" {if $approve_suggests eq "1"}selected{/if}>Yes</option>
                											<option value="0" {if $approve_suggests eq "0"}selected{/if}>No</option>
                                                            </select>
                                                        </td>
                                                        <td class="scope-label">[REQUIRE NEWLY POSTED REQUESTS TO BE APPROVED BEFORE BEING MADE PUBLIC]</td>
                                                        <td><small></small></td>
                                                    </tr>                                               
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="status">Enable Facebook Connect </label></td>
                                                        <td class="value">
                                                            <select id="enable_fc" name="enable_fc" class=" required-entry required-entry select" type="select">
                                                            <option value="1" {if $enable_fc eq "1"}selected{/if}>Yes</option>
                											<option value="0" {if $enable_fc eq "0"}selected{/if}>No</option>
                                                            </select>
                                                        </td>
                                                        <td class="scope-label">[ALLOW USERS TO SIGN UP AND LOGIN USING THEIR FACEBOOK ACCOUNT]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="status">Facebook Application ID </label></td>
                                                        <td class="value">
                                                            <input id="FACEBOOK_APP_ID" name="FACEBOOK_APP_ID" value="{$FACEBOOK_APP_ID}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[FACEBOOK APPLICATION ID YOU GOT WHEN YOU CREATED YOUR FACEBOOK APPLICATION]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="status">Facebook Secret </label></td>
                                                        <td class="value">
                                                            <input id="FACEBOOK_SECRET" name="FACEBOOK_SECRET" value="{$FACEBOOK_SECRET}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[FACEBOOK APPLICATION SECRET YOU GOT WHEN YOU CREATED YOUR FACEBOOK APPLICATION]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="twitter">Twitter Username </label></td>
                                                        <td class="value">
                                                            <input id="twitter" name="twitter" value="{$twitter}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[YOUR TWITTER ACCOUNT USERNAME]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="short_urls">Enable Url Shortener </label></td>
                                                        <td class="value">
                                                            <select id="short_urls" name="short_urls" class=" required-entry required-entry select" type="select">
                                                            <option value="1" {if $short_urls eq "1"}selected{/if}>Yes</option>
                											<option value="0" {if $short_urls eq "0"}selected{/if}>No</option>
                                                            </select>
                                                        </td>
                                                        <td class="scope-label">[SHORTENS TWITTER SHARE URL'S]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="short_urls">Verified Only </label></td>
                                                        <td class="value">
                                                            <select id="vonly" name="vonly" class=" required-entry required-entry select" type="select">
                                                            <option value="1" {if $vonly eq "1"}selected{/if}>Yes</option>
                											<option value="0" {if $vonly eq "0"}selected{/if}>No</option>
                                                            </select>
                                                        </td>
                                                        <td class="scope-label">[ONLY ALLOW MEMBERS WITH VERIFIED EMAILS TO CREATE GIGS?]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="scriptolution_toprated_rating">Top Rated Seller Percentage </label></td>
                                                        <td class="value">
                                                            <input id="scriptolution_toprated_rating" name="scriptolution_toprated_rating" value="{$scriptolution_toprated_rating}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[THE OVERALL RATING PERCENTAGE A SELLER NEEDS TO HAVE IN ORDER TO BECOME TOP RATED]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="scriptolution_toprated_count">Top Rated Seller Ratings </label></td>
                                                        <td class="value">
                                                            <input id="scriptolution_toprated_count" name="scriptolution_toprated_count" value="{$scriptolution_toprated_count}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[THE NUMBER OF USER RATINGS A SELLER NEEDS TO HAVE IN ORDER TO BECOME TOP RATED]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    <tr class="hidden">
                                                        <td class="label"><label for="verify_pm">Verified Messages Only </label></td>
                                                        <td class="value">
                                                            <select id="verify_pm" name="verify_pm" class=" required-entry required-entry select" type="select">
                                                            <option value="1" {if $verify_pm eq "1"}selected{/if}>Yes</option>
                											<option value="0" {if $verify_pm eq "0"}selected{/if}>No</option>
                                                            </select>
                                                        </td>
                                                        <td class="scope-label">[ONLY ALLOW USERS WITH VERIFIED E-MAILS TO SEND CONVERSATION MESSAGES]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="def_country">Default Member Country </label></td>
                                                        <td class="value">
                                                            <select id="def_country" name="def_country" class="text">
                                                            <option  {if $def_country eq "AF"}selected{/if} value="AF">Afghanistan</option>
                                                            <option  {if $def_country eq "AX"}selected{/if} value="AX">Åland Islands</option>
                                                            <option  {if $def_country eq "AL"}selected{/if} value="AL">Albania</option>
                                                            <option  {if $def_country eq "DZ"}selected{/if} value="DZ">Algeria</option>
                                                            <option  {if $def_country eq "AS"}selected{/if} value="AS">American Samoa</option>
                                                            <option  {if $def_country eq "AD"}selected{/if} value="AD">Andorra</option>
                                                            <option  {if $def_country eq "AO"}selected{/if} value="AO">Angola</option>
                                                            <option  {if $def_country eq "AI"}selected{/if} value="AI">Anguilla</option>
                                                            <option  {if $def_country eq "AQ"}selected{/if} value="AQ">Antarctica</option>
                                                            <option  {if $def_country eq "AG"}selected{/if} value="AG">Antigua and Barbuda</option>
                                                            <option  {if $def_country eq "AR"}selected{/if} value="AR">Argentina</option>
                                                            <option  {if $def_country eq "AM"}selected{/if} value="AM">Armenia</option>
                                                            <option  {if $def_country eq "AW"}selected{/if} value="AW">Aruba</option>
                                                            <option  {if $def_country eq "AU"}selected{/if} value="AU">Australia</option>
                                                            <option  {if $def_country eq "AT"}selected{/if} value="AT">Austria</option>
                                                            <option  {if $def_country eq "AZ"}selected{/if} value="AZ">Azerbaijan</option>
                                                            <option  {if $def_country eq "BS"}selected{/if} value="BS">Bahamas</option>
                                                            <option  {if $def_country eq "BH"}selected{/if} value="BH">Bahrain</option>
                                                            <option  {if $def_country eq "BD"}selected{/if} value="BD">Bangladesh</option>
                                                            <option  {if $def_country eq "BB"}selected{/if} value="BB">Barbados</option>
                                                            <option  {if $def_country eq "BY"}selected{/if} value="BY">Belarus</option>
                                                            <option  {if $def_country eq "BE"}selected{/if} value="BE">Belgium</option>
                                                            <option  {if $def_country eq "BZ"}selected{/if} value="BZ">Belize</option>
                                                            <option  {if $def_country eq "BJ"}selected{/if} value="BJ">Benin</option>
                                                            <option  {if $def_country eq "BM"}selected{/if} value="BM">Bermuda</option>
                                                            <option  {if $def_country eq "BT"}selected{/if} value="BT">Bhutan</option>
                                                            <option  {if $def_country eq "BO"}selected{/if} value="BO">Bolivia</option>
                                                            <option  {if $def_country eq "BA"}selected{/if} value="BA">Bosnia and Herzegovina</option>
                                                            <option  {if $def_country eq "BW"}selected{/if} value="BW">Botswana</option>
                                                            <option  {if $def_country eq "BV"}selected{/if} value="BV">Bouvet Island</option>
                                                            <option  {if $def_country eq "BR"}selected{/if} value="BR">Brazil</option>
                                                            <option  {if $def_country eq "IO"}selected{/if} value="IO">British Indian Ocean Territory</option>
                                                            <option  {if $def_country eq "BN"}selected{/if} value="BN">Brunei Darussalam</option>
                                                            <option  {if $def_country eq "BG"}selected{/if} value="BG">Bulgaria</option>
                                                            <option  {if $def_country eq "BF"}selected{/if} value="BF">Burkina Faso</option>
                                                            <option  {if $def_country eq "BI"}selected{/if} value="BI">Burundi</option>
                                                            <option  {if $def_country eq "KH"}selected{/if} value="KH">Cambodia</option>
                                                            <option  {if $def_country eq "CM"}selected{/if} value="CM">Cameroon</option>
                                                            <option  {if $def_country eq "CA"}selected{/if} value="CA">Canada</option>
                                                            <option  {if $def_country eq "CV"}selected{/if} value="CV">Cape Verde</option>
                                                            <option  {if $def_country eq "KY"}selected{/if} value="KY">Cayman Islands</option>
                                                            <option  {if $def_country eq "CF"}selected{/if} value="CF">Central African Republic</option>
                                                            <option  {if $def_country eq "TD"}selected{/if} value="TD">Chad</option>
                                                            <option  {if $def_country eq "CL"}selected{/if} value="CL">Chile</option>
                                                            <option  {if $def_country eq "CN"}selected{/if} value="CN">China</option>
                                                            <option  {if $def_country eq "CX"}selected{/if} value="CX">Christmas Island</option>
                                                            <option  {if $def_country eq "CC"}selected{/if} value="CC">Cocos (Keeling) Islands</option>
                                                            <option  {if $def_country eq "CO"}selected{/if} value="CO">Colombia</option>
                                                            <option  {if $def_country eq "KM"}selected{/if} value="KM">Comoros</option>
                                                            <option  {if $def_country eq "CG"}selected{/if} value="CG">Congo</option>
                                                            <option  {if $def_country eq "CD"}selected{/if} value="CD">Congo, The Democratic Republic of The</option>
                                                            <option  {if $def_country eq "CK"}selected{/if} value="CK">Cook Islands</option>
                                                            <option  {if $def_country eq "CR"}selected{/if} value="CR">Costa Rica</option>
                                                            <option  {if $def_country eq "CI"}selected{/if} value="CI">Cote D'ivoire</option>
                                                            <option  {if $def_country eq "HR"}selected{/if} value="HR">Croatia</option>
                                                            <option  {if $def_country eq "CU"}selected{/if} value="CU">Cuba</option>
                                                            <option  {if $def_country eq "CY"}selected{/if} value="CY">Cyprus</option>
                                                            <option  {if $def_country eq "CZ"}selected{/if} value="CZ">Czech Republic</option>
                                                            <option  {if $def_country eq "DK"}selected{/if} value="DK">Denmark</option>
                                                            <option  {if $def_country eq "DJ"}selected{/if} value="DJ">Djibouti</option>
                                                            <option  {if $def_country eq "DM"}selected{/if} value="DM">Dominica</option>
                                                            <option  {if $def_country eq "DO"}selected{/if} value="DO">Dominican Republic</option>
                                                            <option  {if $def_country eq "EC"}selected{/if} value="EC">Ecuador</option>
                                                            <option  {if $def_country eq "EG"}selected{/if} value="EG">Egypt</option>
                                                            <option  {if $def_country eq "SV"}selected{/if} value="SV">El Salvador</option>
                                                            <option  {if $def_country eq "GQ"}selected{/if} value="GQ">Equatorial Guinea</option>
                                                            <option  {if $def_country eq "ER"}selected{/if} value="ER">Eritrea</option>
                                                            <option  {if $def_country eq "EE"}selected{/if} value="EE">Estonia</option>
                                                            <option  {if $def_country eq "ET"}selected{/if} value="ET">Ethiopia</option>
                                                            <option  {if $def_country eq "FK"}selected{/if} value="FK">Falkland Islands (Malvinas)</option>
                                                            <option  {if $def_country eq "FO"}selected{/if} value="FO">Faroe Islands</option>
                                                            <option  {if $def_country eq "FJ"}selected{/if} value="FJ">Fiji</option>
                                                            <option  {if $def_country eq "FI"}selected{/if} value="FI">Finland</option>
                                                            <option  {if $def_country eq "FR"}selected{/if} value="FR">France</option>
                                                            <option  {if $def_country eq "GR"}selected{/if} value="GF">French Guiana</option>
                                                            <option  {if $def_country eq "PF"}selected{/if} value="PF">French Polynesia</option>
                                                            <option  {if $def_country eq "TF"}selected{/if} value="TF">French Southern Territories</option>
                                                            <option  {if $def_country eq "GA"}selected{/if} value="GA">Gabon</option>
                                                            <option  {if $def_country eq "GM"}selected{/if} value="GM">Gambia</option>
                                                            <option  {if $def_country eq "GE"}selected{/if} value="GE">Georgia</option>
                                                            <option  {if $def_country eq "DE"}selected{/if} value="DE">Germany</option>
                                                            <option  {if $def_country eq "GH"}selected{/if} value="GH">Ghana</option>
                                                            <option  {if $def_country eq "GI"}selected{/if} value="GI">Gibraltar</option>
                                                            <option  {if $def_country eq "GR"}selected{/if} value="GR">Greece</option>
                                                            <option  {if $def_country eq "GL"}selected{/if} value="GL">Greenland</option>
                                                            <option  {if $def_country eq "GD"}selected{/if} value="GD">Grenada</option>
                                                            <option  {if $def_country eq "GP"}selected{/if} value="GP">Guadeloupe</option>
                                                            <option  {if $def_country eq "GU"}selected{/if} value="GU">Guam</option>
                                                            <option  {if $def_country eq "GT"}selected{/if} value="GT">Guatemala</option>
                                                            <option  {if $def_country eq "GG"}selected{/if} value="GG">Guernsey</option>
                                                            <option  {if $def_country eq "GN"}selected{/if} value="GN">Guinea</option>
                                                            <option  {if $def_country eq "GW"}selected{/if} value="GW">Guinea-bissau</option>
                                                            <option  {if $def_country eq "GY"}selected{/if} value="GY">Guyana</option>
                                                            <option  {if $def_country eq "HT"}selected{/if} value="HT">Haiti</option>
                                                            <option  {if $def_country eq "HM"}selected{/if} value="HM">Heard Island and Mcdonald Islands</option>
                                                            <option  {if $def_country eq "VA"}selected{/if} value="VA">Holy See (Vatican City State)</option>
                                                            <option  {if $def_country eq "HN"}selected{/if} value="HN">Honduras</option>
                                                            <option  {if $def_country eq "HK"}selected{/if} value="HK">Hong Kong</option>
                                                            <option  {if $def_country eq "HU"}selected{/if} value="HU">Hungary</option>
                                                            <option  {if $def_country eq "IS"}selected{/if} value="IS">Iceland</option>
                                                            <option  {if $def_country eq "IN"}selected{/if} value="IN">India</option>
                                                            <option  {if $def_country eq "ID"}selected{/if} value="ID">Indonesia</option>
                                                            <option  {if $def_country eq "IR"}selected{/if} value="IR">Iran, Islamic Republic of</option>
                                                            <option  {if $def_country eq "IQ"}selected{/if} value="IQ">Iraq</option>
                                                            <option  {if $def_country eq "IE"}selected{/if} value="IE">Ireland</option>
                                                            <option  {if $def_country eq "IM"}selected{/if} value="IM">Isle of Man</option>
                                                            <option  {if $def_country eq "IL"}selected{/if} value="IL">Israel</option>
                                                            <option  {if $def_country eq "IT"}selected{/if} value="IT">Italy</option>
                                                            <option  {if $def_country eq "JM"}selected{/if} value="JM">Jamaica</option>
                                                            <option  {if $def_country eq "JP"}selected{/if} value="JP">Japan</option>
                                                            <option  {if $def_country eq "JE"}selected{/if} value="JE">Jersey</option>
                                                            <option  {if $def_country eq "JO"}selected{/if} value="JO">Jordan</option>
                                                            <option  {if $def_country eq "KZ"}selected{/if} value="KZ">Kazakhstan</option>
                                                            <option  {if $def_country eq "KE"}selected{/if} value="KE">Kenya</option>
                                                            <option  {if $def_country eq "KI"}selected{/if} value="KI">Kiribati</option>
                                                            <option  {if $def_country eq "KP"}selected{/if} value="KP">Korea, Democratic People's Republic of</option>
                                                            <option  {if $def_country eq "KR"}selected{/if} value="KR">Korea, Republic of</option>
                                                            <option  {if $def_country eq "KW"}selected{/if} value="KW">Kuwait</option>
                                                            <option  {if $def_country eq "KG"}selected{/if} value="KG">Kyrgyzstan</option>
                                                            <option  {if $def_country eq "LA"}selected{/if} value="LA">Lao People's Democratic Republic</option>
                                                            <option  {if $def_country eq "LV"}selected{/if} value="LV">Latvia</option>
                                                            <option  {if $def_country eq "LB"}selected{/if} value="LB">Lebanon</option>
                                                            <option  {if $def_country eq "LS"}selected{/if} value="LS">Lesotho</option>
                                                            <option  {if $def_country eq "LR"}selected{/if} value="LR">Liberia</option>
                                                            <option  {if $def_country eq "LY"}selected{/if} value="LY">Libyan Arab Jamahiriya</option>
                                                            <option  {if $def_country eq "LI"}selected{/if} value="LI">Liechtenstein</option>
                                                            <option  {if $def_country eq "LT"}selected{/if} value="LT">Lithuania</option>
                                                            <option  {if $def_country eq "LU"}selected{/if} value="LU">Luxembourg</option>
                                                            <option  {if $def_country eq "MO"}selected{/if} value="MO">Macao</option>
                                                            <option  {if $def_country eq "MK"}selected{/if} value="MK">Macedonia, The Former Yugoslav Republic of</option>
                                                            <option  {if $def_country eq "MG"}selected{/if} value="MG">Madagascar</option>
                                                            <option  {if $def_country eq "MW"}selected{/if} value="MW">Malawi</option>
                                                            <option  {if $def_country eq "MY"}selected{/if} value="MY">Malaysia</option>
                                                            <option  {if $def_country eq "MV"}selected{/if} value="MV">Maldives</option>
                                                            <option  {if $def_country eq "ML"}selected{/if} value="ML">Mali</option>
                                                            <option  {if $def_country eq "MT"}selected{/if} value="MT">Malta</option>
                                                            <option  {if $def_country eq "MH"}selected{/if} value="MH">Marshall Islands</option>
                                                            <option  {if $def_country eq "MQ"}selected{/if} value="MQ">Martinique</option>
                                                            <option  {if $def_country eq "MR"}selected{/if} value="MR">Mauritania</option>
                                                            <option  {if $def_country eq "MU"}selected{/if} value="MU">Mauritius</option>
                                                            <option  {if $def_country eq "YT"}selected{/if} value="YT">Mayotte</option>
                                                            <option  {if $def_country eq "MX"}selected{/if} value="MX">Mexico</option>
                                                            <option  {if $def_country eq "FM"}selected{/if} value="FM">Micronesia, Federated States of</option>
                                                            <option  {if $def_country eq "MD"}selected{/if} value="MD">Moldova, Republic of</option>
                                                            <option  {if $def_country eq "MC"}selected{/if} value="MC">Monaco</option>
                                                            <option  {if $def_country eq "MN"}selected{/if} value="MN">Mongolia</option>
                                                            <option  {if $def_country eq "ME"}selected{/if} value="ME">Montenegro</option>
                                                            <option  {if $def_country eq "MS"}selected{/if} value="MS">Montserrat</option>
                                                            <option  {if $def_country eq "MA"}selected{/if} value="MA">Morocco</option>
                                                            <option  {if $def_country eq "MZ"}selected{/if} value="MZ">Mozambique</option>
                                                            <option  {if $def_country eq "MM"}selected{/if} value="MM">Myanmar</option>
                                                            <option  {if $def_country eq "NA"}selected{/if} value="NA">Namibia</option>
                                                            <option  {if $def_country eq "NR"}selected{/if} value="NR">Nauru</option>
                                                            <option  {if $def_country eq "NP"}selected{/if} value="NP">Nepal</option>
                                                            <option  {if $def_country eq "NL"}selected{/if} value="NL">Netherlands</option>
                                                            <option  {if $def_country eq "AN"}selected{/if} value="AN">Netherlands Antilles</option>
                                                            <option  {if $def_country eq "NC"}selected{/if} value="NC">New Caledonia</option>
                                                            <option  {if $def_country eq "NZ"}selected{/if} value="NZ">New Zealand</option>
                                                            <option  {if $def_country eq "NI"}selected{/if} value="NI">Nicaragua</option>
                                                            <option  {if $def_country eq "NE"}selected{/if} value="NE">Niger</option>
                                                            <option  {if $def_country eq "NG"}selected{/if} value="NG">Nigeria</option>
                                                            <option  {if $def_country eq "NU"}selected{/if} value="NU">Niue</option>
                                                            <option  {if $def_country eq "NF"}selected{/if} value="NF">Norfolk Island</option>
                                                            <option  {if $def_country eq "MP"}selected{/if} value="MP">Northern Mariana Islands</option>
                                                            <option  {if $def_country eq "NO"}selected{/if} value="NO">Norway</option>
                                                            <option  {if $def_country eq "OM"}selected{/if} value="OM">Oman</option>
                                                            <option  {if $def_country eq "PK"}selected{/if} value="PK">Pakistan</option>
                                                            <option  {if $def_country eq "PW"}selected{/if} value="PW">Palau</option>
                                                            <option  {if $def_country eq "PS"}selected{/if} value="PS">Palestinian Territory, Occupied</option>
                                                            <option  {if $def_country eq "PA"}selected{/if} value="PA">Panama</option>
                                                            <option  {if $def_country eq "PG"}selected{/if} value="PG">Papua New Guinea</option>
                                                            <option  {if $def_country eq "PY"}selected{/if} value="PY">Paraguay</option>
                                                            <option  {if $def_country eq "PE"}selected{/if} value="PE">Peru</option>
                                                            <option  {if $def_country eq "PH"}selected{/if} value="PH">Philippines</option>
                                                            <option  {if $def_country eq "PN"}selected{/if} value="PN">Pitcairn</option>
                                                            <option  {if $def_country eq "PL"}selected{/if} value="PL">Poland</option>
                                                            <option  {if $def_country eq "PT"}selected{/if} value="PT">Portugal</option>
                                                            <option  {if $def_country eq "PR"}selected{/if} value="PR">Puerto Rico</option>
                                                            <option  {if $def_country eq "QA"}selected{/if} value="QA">Qatar</option>
                                                            <option  {if $def_country eq "RE"}selected{/if} value="RE">Reunion</option>
                                                            <option  {if $def_country eq "RO"}selected{/if} value="RO">Romania</option>
                                                            <option  {if $def_country eq "RU"}selected{/if} value="RU">Russian Federation</option>
                                                            <option  {if $def_country eq "RW"}selected{/if} value="RW">Rwanda</option>
                                                            <option  {if $def_country eq "SH"}selected{/if} value="SH">Saint Helena</option>
                                                            <option  {if $def_country eq "KN"}selected{/if} value="KN">Saint Kitts and Nevis</option>
                                                            <option  {if $def_country eq "LC"}selected{/if} value="LC">Saint Lucia</option>
                                                            <option  {if $def_country eq "PM"}selected{/if} value="PM">Saint Pierre and Miquelon</option>
                                                            <option  {if $def_country eq "VC"}selected{/if} value="VC">Saint Vincent and The Grenadines</option>
                                                            <option  {if $def_country eq "WS"}selected{/if} value="WS">Samoa</option>
                                                            <option  {if $def_country eq "SM"}selected{/if} value="SM">San Marino</option>
                                                            <option  {if $def_country eq "ST"}selected{/if} value="ST">Sao Tome and Principe</option>
                                                            <option  {if $def_country eq "SA"}selected{/if} value="SA">Saudi Arabia</option>
                                                            <option  {if $def_country eq "SN"}selected{/if} value="SN">Senegal</option>
                                                            <option  {if $def_country eq "RS"}selected{/if} value="RS">Serbia</option>
                                                            <option  {if $def_country eq "SC"}selected{/if} value="SC">Seychelles</option>
                                                            <option  {if $def_country eq "SL"}selected{/if} value="SL">Sierra Leone</option>
                                                            <option  {if $def_country eq "SG"}selected{/if} value="SG">Singapore</option>
                                                            <option  {if $def_country eq "SK"}selected{/if} value="SK">Slovakia</option>
                                                            <option  {if $def_country eq "SI"}selected{/if} value="SI">Slovenia</option>
                                                            <option  {if $def_country eq "SB"}selected{/if} value="SB">Solomon Islands</option>
                                                            <option  {if $def_country eq "SO"}selected{/if} value="SO">Somalia</option>
                                                            <option  {if $def_country eq "ZA"}selected{/if} value="ZA">South Africa</option>
                                                            <option  {if $def_country eq "GS"}selected{/if} value="GS">South Georgia and The South Sandwich Islands</option>
                                                            <option  {if $def_country eq "ES"}selected{/if} value="ES">Spain</option>
                                                            <option  {if $def_country eq "LK"}selected{/if} value="LK">Sri Lanka</option>
                                                            <option  {if $def_country eq "SD"}selected{/if} value="SD">Sudan</option>
                                                            <option  {if $def_country eq "SR"}selected{/if} value="SR">Suriname</option>
                                                            <option  {if $def_country eq "SJ"}selected{/if} value="SJ">Svalbard and Jan Mayen</option>
                                                            <option  {if $def_country eq "SZ"}selected{/if} value="SZ">Swaziland</option>
                                                            <option  {if $def_country eq "SE"}selected{/if} value="SE">Sweden</option>
                                                            <option  {if $def_country eq "CH"}selected{/if} value="CH">Switzerland</option>
                                                            <option  {if $def_country eq "SY"}selected{/if} value="SY">Syrian Arab Republic</option>
                                                            <option  {if $def_country eq "TW"}selected{/if} value="TW">Taiwan, Province of China</option>
                                                            <option  {if $def_country eq "TJ"}selected{/if} value="TJ">Tajikistan</option>
                                                            <option  {if $def_country eq "TZ"}selected{/if} value="TZ">Tanzania, United Republic of</option>
                                                            <option  {if $def_country eq "TH"}selected{/if} value="TH">Thailand</option>
                                                            <option  {if $def_country eq "TL"}selected{/if} value="TL">Timor-leste</option>
                                                            <option  {if $def_country eq "TG"}selected{/if} value="TG">Togo</option>
                                                            <option  {if $def_country eq "TK"}selected{/if} value="TK">Tokelau</option>
                                                            <option  {if $def_country eq "TO"}selected{/if} value="TO">Tonga</option>
                                                            <option  {if $def_country eq "TT"}selected{/if} value="TT">Trinidad and Tobago</option>
                                                            <option  {if $def_country eq "TN"}selected{/if} value="TN">Tunisia</option>
                                                            <option  {if $def_country eq "TR"}selected{/if} value="TR">Turkey</option>
                                                            <option  {if $def_country eq "TM"}selected{/if} value="TM">Turkmenistan</option>
                                                            <option  {if $def_country eq "TC"}selected{/if} value="TC">Turks and Caicos Islands</option>
                                                            <option  {if $def_country eq "TV"}selected{/if} value="TV">Tuvalu</option>
                                                            <option  {if $def_country eq "UG"}selected{/if} value="UG">Uganda</option>
                                                            <option  {if $def_country eq "UA"}selected{/if} value="UA">Ukraine</option>
                                                            <option  {if $def_country eq "AE"}selected{/if} value="AE">United Arab Emirates</option>
                                                            <option  {if $def_country eq "GB"}selected{/if} value="GB">United Kingdom</option>
                                                            <option  {if $def_country eq "US"}selected{/if} value="US">United States</option>
                                                            <option  {if $def_country eq "UM"}selected{/if} value="UM">United States Minor Outlying Islands</option>
                                                            <option  {if $def_country eq "UY"}selected{/if} value="UY">Uruguay</option>
                                                            <option  {if $def_country eq "UZ"}selected{/if} value="UZ">Uzbekistan</option>
                                                            <option  {if $def_country eq "VA"}selected{/if} value="VU">Vanuatu</option>
                                                            <option  {if $def_country eq "VE"}selected{/if} value="VE">Venezuela</option>
                                                            <option  {if $def_country eq "VN"}selected{/if} value="VN">Viet Nam</option>
                                                            <option  {if $def_country eq "VG"}selected{/if} value="VG">Virgin Islands, British</option>
                                                            <option  {if $def_country eq "VI"}selected{/if} value="VI">Virgin Islands, U.S.</option>
                                                            <option  {if $def_country eq "WF"}selected{/if} value="WF">Wallis and Futuna</option>
                                                            <option  {if $def_country eq "EH"}selected{/if} value="EH">Western Sahara</option>
                                                            <option  {if $def_country eq "YE"}selected{/if} value="YE">Yemen</option>
                                                            <option  {if $def_country eq "ZM"}selected{/if} value="ZM">Zambia</option>
                                                            <option  {if $def_country eq "ZW"}selected{/if} value="ZW">Zimbabwe</option>
                                                            </select>
                                                        </td>
                                                        <td class="scope-label">[THE DEFAULT COUNTRY MEMBERS HAVE SET IN THEIR PROFILE FOR NEW SIGNUPS]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="scriptolution_proxy_block">Proxy Blocking (BETA) </label></td>
                                                        <td class="value">
                                                            <select id="scriptolution_proxy_block" name="scriptolution_proxy_block" class=" required-entry required-entry select" type="select">
                                                            <option value="1" {if $scriptolution_proxy_block eq "1"}selected{/if}>Yes</option>
                											<option value="0" {if $scriptolution_proxy_block eq "0"}selected{/if}>No</option>
                                                            </select>
                                                        </td>
                                                        <td class="scope-label">[BLOCK USERS CONNECTING FROM A PROXY SERVER?]</td>
                                                        <td><small></small></td>
                                                    </tr>                                                    
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="fiverrscript_dotcom_home_featcats">Show Homepage Featured Categories?</label></td>
                                                        <td class="value">
                                                            <select id="fiverrscript_dotcom_home_featcats" name="fiverrscript_dotcom_home_featcats" class=" required-entry required-entry select" type="select">
                                                            <option value="0" {if $fiverrscript_dotcom_home_featcats eq "0"}selected{/if}>No</option>
                                                            <option value="1" {if $fiverrscript_dotcom_home_featcats eq "1"}selected{/if}>Yes</option>
                                                            </select>
                                                        </td>
                                                        <td class="scope-label">[IF ENABLED THE "OUR FEATURED GIG CATEGORIES" SECTION ON THE HOMEPAGE WILL SHOW UP]</td>
                                                        <td><small></small></td>
                                                    </tr> 

                                                    <tr class="hidden">
                                                        <td class="label"><label for="scriptolution_notify_gigval">E-Mail Notification On Gig Validation</label></td>
                                                        <td class="value">
                                                            <select id="scriptolution_notify_gigval" name="scriptolution_notify_gigval" class=" required-entry required-entry select" type="select">
                                                            <option value="1" {if $scriptolution_notify_gigval eq "1"}selected{/if}>Yes</option>
                											<option value="0" {if $scriptolution_notify_gigval eq "0"}selected{/if}>No</option>
                                                            </select>
                                                        </td>
                                                        <td class="scope-label">[NOTIFY YOU VIA E-MAIL WHEN A NEW GIG IS CREATED THAT NEEDS APPROVAL]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="scriptolution_notify_gigval_email">Notification E-mail </label></td>
                                                        <td class="value">
                                                            <input id="scriptolution_notify_gigval_email" name="scriptolution_notify_gigval_email" value="{$scriptolution_notify_gigval_email}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[IF YOU SET THE ABOVE TO YES THIS IS WHERE THE E-MAIL WILL BE SENT TO]</td>
                                                        <td><small></small></td>
                                                    </tr>

                                                    <tr class="hidden">
                                                        <td class="label"><label for="enable_captcha">Enable Image Captcha? </label></td>
                                                        <td class="value">
                                                            <select id="enable_captcha" name="enable_captcha" class=" required-entry required-entry select" type="select">
                                                            <option value="0" {if $enable_captcha eq "0"}selected{/if}>No</option>
                                                            <option value="1" {if $enable_captcha eq "1"}selected{/if}>Yes - Scriptolution Captcha</option>
                                                            <option value="2" {if $enable_captcha eq "2"}selected{/if}>Yes - ReCAPTCHA</option>
                                                            <option value="4" {if $enable_captcha eq "4"}selected{/if}>Yes - Solve Media</option>
                                                            </select>
                                                        </td>
                                                        <td class="scope-label">[FORCE USERS TO VERIFY AN IMAGE WHEN REGISTERING?]</td>
                                                        <td><small></small></td>
                                                    </tr> 
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="recaptcha_pubkey">ReCAPTCHA Public Key </label></td>
                                                        <td class="value">
                                                            <input id="recaptcha_pubkey" name="recaptcha_pubkey" value="{$recaptcha_pubkey}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[YOU HAVE TO SIGN UP ON http://www.google.com/recaptcha TO GET A KEY]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="recaptcha_privkey">ReCAPTCHA Private Key </label></td>
                                                        <td class="value">
                                                            <input id="recaptcha_privkey" name="recaptcha_privkey" value="{$recaptcha_privkey}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[YOU HAVE TO SIGN UP ON http://www.google.com/recaptcha TO GET A KEY]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td colspan="4">
                                                            <br />
                                                            If you set "Enable Image Captcha" to "Yes - PlayThru (areyouahuman.com)" then you need to follow these steps to get it working:<br />
                                                            - Sign up here: http://portal.areyouahuman.com/signup/basic<br />
                                                            - For "Site Platform" Choose "PHP"<br />
                                                            - You will be given your "Publisher Key" and "Scoring Key", make a note of them.<br />
                                                            - Go to your dashboard: http://portal.areyouahuman.com/dashboard<br />
                                                            - Click on "Edit Site Options"<br />
                                                            - Set "Game Style" to "Embedded"<br />
                                                            - Click on "Update"<br />
                                                            <br />
                                                            - Open ayah_config.php from your server<br />
                                                            - Replace "your_publisher_key_goes_here" with your "Publisher Key" you noted above.<br />
                                                            - Replace "your_scoring_key_goes_here" with your "Scoring Key" you noted above.<br />
                                                            - Save the file and then upload it to your server overwriting the existing file.<br />
                                                            <br />
                                                        </td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="scriptolution_solve_c">Solve Media C-key</label></td>
                                                        <td class="value">
                                                            <input id="scriptolution_solve_c" name="scriptolution_solve_c" value="{$scriptolution_solve_c}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[YOU HAVE TO SIGN UP ON https://portal.solvemedia.com/portal/public/signup ]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    <tr class="hidden">
                                                        <td class="label"><label for="scriptolution_solve_v">Solve Media V-key</label></td>
                                                        <td class="value">
                                                            <input id="scriptolution_solve_v" name="scriptolution_solve_v" value="{$scriptolution_solve_v}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[YOU HAVE TO SIGN UP ON https://portal.solvemedia.com/portal/public/signup ]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    <tr class="hidden">
                                                        <td class="label"><label for="scriptolution_solve_h">Solve Media H-key</label></td>
                                                        <td class="value">
                                                            <input id="scriptolution_solve_h" name="scriptolution_solve_h" value="{$scriptolution_solve_h}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[YOU HAVE TO SIGN UP ON https://portal.solvemedia.com/portal/public/signup ]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="scriptolution_cur_pos">Currency Placement</label></td>
                                                        <td class="value">
                                                            <select id="scriptolution_cur_pos" name="scriptolution_cur_pos" class=" required-entry required-entry select" type="select">
                                                            <option value="1" {if $scriptolution_cur_pos eq "1"}selected{/if}>AFTER THE PRICE</option>
                											<option value="0" {if $scriptolution_cur_pos eq "0"}selected{/if}>BEFORE THE PRICE</option>
                                                            </select>
                                                        </td>
                                                        <td class="scope-label">[CHOOSE WHETHER THE CURRENCY APPEARS BEFORE OR AFTER THE PRICE ON THE MAIN WEBSITE]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td colspan="4">
                                                            <br />
                                                            HOW THE DIFFERENT LAUNCH MODES WORKS<br />
                                                            1. Launched: Anyone can access the full main website.<br />
                                                            2. Pre-Launch: Main website display a launching soon page for all users (except for a logged in administrator) where they can subscribe to be notified/invited.<br />
                                                            3. Private Beta: Main website displays a login page where invited users can signup then login to access the full main website, subscribe box displays for other users who want to be invited.<br />
                                                            <br />
                                                        </td>
                                                    </tr>
                                                    <tr class="hidden">
                                                        <td class="label"><label for="scriptolution_launch_mode">Launch Mode</label></td>
                                                        <td class="value">
                                                            <select id="scriptolution_launch_mode" name="scriptolution_launch_mode" class=" required-entry required-entry select" type="select">
                                                            <option value="2" {if $scriptolution_launch_mode eq "2"}selected{/if}>Pre-Launch</option>
                                                            <option value="1" {if $scriptolution_launch_mode eq "1"}selected{/if}>Private Beta</option>
                											<option value="0" {if $scriptolution_launch_mode eq "0"}selected{/if}>Launched</option>
                                                            </select>
                                                        </td>
                                                        <td class="scope-label">[SEE ABOVE FOR DESCRIPTION]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    <tr class="hidden">
                                                        <td class="label"><label for="enablescriptolutionlocations">Enable Location System </label></td>
                                                        <td class="value">
                                                            <select id="enablescriptolutionlocations" name="enablescriptolutionlocations" class=" required-entry required-entry select" type="select">
                                                            <option value="1" {if $enablescriptolutionlocations eq "1"}selected{/if}>Yes - ON</option>
                											<option value="0" {if $enablescriptolutionlocations eq "0"}selected{/if}>No - OFF</option>
                                                            </select>
                                                        </td>
                                                        <td class="scope-label">[TURN THE ENTIRE LOCATION SYSTEM ON/OFF]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    <tr class="hidden">
                                                        <td class="label"><label for="scriptolution_map_key">Google Maps API Key </label></td>
                                                        <td class="value">
                                                            <input id="scriptolution_map_key" name="scriptolution_map_key" value="{$scriptolution_map_key}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[YOU MUST HAVE A GOOGLE MAPS API KEY FOR THE AUTOCOMPLETE LOCATION TO WORK]</td>
                                                        <td><small></small></td>
                                                    </tr>                                                    
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="scriptolution_enable_processing_fee">Enable Processing Fee </label></td>
                                                        <td class="value">
                                                            <select id="scriptolution_enable_processing_fee" name="scriptolution_enable_processing_fee" class=" required-entry required-entry select" type="select">
                                                            <option value="1" {if $scriptolution_enable_processing_fee eq "1"}selected{/if}>Yes</option>
                											<option value="0" {if $scriptolution_enable_processing_fee eq "0"}selected{/if}>No</option>
                                                            </select>
                                                        </td>
                                                        <td class="scope-label">[CHARGE A SET FEE ON ALL GIG ORDERED, SO BUYER PAY THE GIG PRICE + THE PROCESSING FEE FOR EACH GIG ITEM PURCHASED]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    <tr class="hidden">
                                                        <td class="label"><label for="scriptolution_processing_fee">Processing Fee </label></td>
                                                        <td class="value">
                                                            <input id="scriptolution_processing_fee" name="scriptolution_processing_fee" value="{$scriptolution_processing_fee}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[THE PROCESSING FEE YOU WISH TO CHARGE, MUST BE IN THIS FORMAT: 1.00 - SO ENTERING 1.00 WOULD CHARGE A $1.00 PROCESSING FEE]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                    <tr class="hidden">
                                                        <td class="label"><label for="enable_scriptolutionminwd">Enable Minimum Withdrawal Limit </label></td>
                                                        <td class="value">
                                                            <select id="enable_scriptolutionminwd" name="enable_scriptolutionminwd" class=" required-entry required-entry select" type="select">
                                                            <option value="1" {if $enable_scriptolutionminwd eq "1"}selected{/if}>Yes</option>
                											<option value="0" {if $enable_scriptolutionminwd eq "0"}selected{/if}>No</option>
                                                            </select>
                                                        </td>
                                                        <td class="scope-label">[ONLY ALLOW USERS TO REQUEST A WITHDRAWAL IF THEIR AVAILABLE BALANCE IS OVER A SET LIMIT]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    <tr class="hidden">
                                                        <td class="label"><label for="scriptolutionminwd">Minimum Withdrawal Limit </label></td>
                                                        <td class="value">
                                                            <input id="scriptolutionminwd" name="scriptolutionminwd" value="{$scriptolutionminwd}" class=" required-entry required-entry input-text" type="text"/>
                                                        </td>
                                                        <td class="scope-label">[THE MINIMUM AVAILABLE BALANCE A USER MUST HAVE TO BE ABLE TO REQUEST A WITHDRAWAL, ENTERING 5 WOULD BE A $5.00 LIMIT]</td>
                                                        <td><small></small></td>
                                                    </tr>
                                                    
                                                </tbody>
                                                </table>
                                            </div>
                                        </fieldset>
									</div>
								</div>
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
                               <h3 class="icon-head head-products">Settings - General Settings</h3>
                               <p class="content-buttons form-buttons">
                                    <button  id="id_be616be1324d8ae4516f276d17d34b9c" type="button" class="scalable save" onclick="document.main_form.submit();" style=""><span>Save Changes</span></button>			
                                </p>
                            </div>
                            
                            <form action="settings_general.php" method="post" id="main_form" name="main_form" enctype="multipart/form-data">
                            	<input type="hidden" id="submitform" name="submitform" value="1" >
                            	<div style="display:none"></div>
                            </form>
						</div>
					</div>
				</div>

                        </div>
        </div>