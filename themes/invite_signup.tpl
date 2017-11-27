{literal}
<style>
.whiteBox h4 {
    float: left;
    width: 100%;
    font-size: 18px;
    font-family: 'latobold', sans-serif;
    color: #424242;
    margin-bottom: 15px;
}
.launchfooter p {
    font-family: 'latoregular';
    font-size: 14px;
    color: #A39E9E;
    text-align: center;
    padding-top: 24px;
}
.launchfooter p a{color:#38b0d9;}
.launchfooter p a:hover{color:#666;}
#scriptolutionForm label {
    color: #38b0d9 !important;
}
</style>
{/literal}
    {include file="scriptolution_error7.tpl"}
    <div class="bodybg scriptolutionpaddingtop15 scriptolutionloginpage">
        <div class="whitebody scriptolutionpaddingtop30 scriptolutionwidth482">
            <div class="inner-wrapper scriptolutionwidth442">
                <div class="left-side scriptolutionwidth442">
                    <div class="whiteBox twoHalfs padding15 scriptolutionwidth400">
                        <h1>{$lang1}</h1>
                        <div id="scriptolutionForm">
                            <form action="{$baseurl}/invite_signup.php?c={$c}" method="post">  
                                <div class="form-entry">
                                    <label>{$lang4}</label>
                                    <input class="text" id="user_email" name="user_email" size="30" type="text" value="{$user_email|stripslashes}" />
                                </div>
                                <div class="form-entry">
                                    <label>{$lang5}</label>
                                    <input class="text username" id="user_username" maxlength="15" name="user_username" size="15" type="text" value="{$user_username|stripslashes}" />
                                    <div id="status" class="username-validation"></div>
                                </div>
                                <div class="form-entry">
                                    <label class="style3">{$lang6}</label>
                                    <input class="text style1" id="user_password" name="user_password" size="30" type="password" value="{$user_password|stripslashes}" />
                                </div>
                                {if $enable_captcha eq "3"}
                                <div class="form-entry">
                                    <label class="style3">{$lang7}</label>
                                    {$scriptolutiongetplaythru}
                                </div>
                                {elseif $enable_captcha eq "4"}
                                <div class="form-entry">
                                    <label class="style3">{$lang7}</label>
                                    {$scriptolutionsolvemedia}
                                </div>
                                {elseif $enable_captcha eq "2"}
                                <script src='https://www.google.com/recaptcha/api.js'></script>
                                <div class="form-entry">
                                    <label class="style3">{$lang7}</label>
                                    <div class="g-recaptcha" data-sitekey="{$recaptcha_pubkey}"></div>
                                </div>
                                {/if}
                                {if $enable_captcha eq "1"}
                                <div class="form-entry">
                                    <label class="style3">{$lang7}</label><br />
                                    <img src="{$baseurl}/include/captcha.php" style="border: 0px; margin:0px; padding:0px" id="cimg" />
                                    <input class="text style2" id="captcha" name="user_captcha_solution" size="30" type="text" />
                                </div>
                                {/if}
                                
                                <div class="form-entry">
                                    <input type="submit" value="{$lang46}" class="scriptolutionbluebutton" />
                                    <input type="hidden" name="jsub" id="jsub" value="1" />
                                    <div class="remember">
                                        <input class="checkbox" id="user_terms_of_use" name="user_terms_of_use" type="checkbox" value="1" {if $user_terms_of_use eq "1"}checked="checked"{/if} />
                                       {$lang8}
                                    </div>
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
            <div class="footerbg scriptolutionfooter482"></div>
        </div>
    </div>