{include file="scriptolution_error7.tpl"}
<div class="bodybg scriptolutionpaddingtop15 scriptolutionloginpage">
	<div class="whitebody scriptolutionpaddingtop30 scriptolutionwidth482">
		<div class="inner-wrapper scriptolutionwidth442">
			<div class="left-side scriptolutionwidth442">
				<div class="whiteBox twoHalfs padding15 scriptolutionwidth400">
					<h1>{$lang40}</h1>
                    <div id="scriptolutionForm">
                        <form action="{$baseurl}/login" method="post">  
                            <div class="form-entry">
                                <label for="l_username">{$lang36}</label>
                                <input class="text" id="l_username" maxlength="16" name="l_username" size="16" tabindex="1" type="text" value="{$user_username}" />
                            </div>
                            <div class="form-entry">
                                <div class="form-label">
                                    <label for="l_password">{$lang37}</label>
                                    <span> <a href="{$baseurl}/forgotpassword" style="text-decoration:none">{$lang39}</a></span>
                                </div>
                                <input class="text" id="l_password" name="l_password" size="30" tabindex="2" type="password" />
                            </div>
                            <div class="row">
                                <input type="submit" value="{$lang2}" class="scriptolutionbluebutton" />
                                <input type="hidden" name="jlog" id="jlog" value="1" />
                                <div class="remember">
                                    <input class="checkbox" id="l_remember_me" name="l_remember_me" type="checkbox" value="1" />
                                    <label for="l_remember_me">{$lang38}</label>
                                </div>
                            </div>
                            <input type="hidden" name="r" value="{$r|stripslashes}" />
                        </form>   
                    </div>
					<div class="clear"></div>
				</div>
			</div>			
			<div class="clear"></div>
            <div id="scriptolutionFormLinks">
                <div class="scriptolutionloginsignuplink">
                    <a href="{$baseurl}/signup{if $r ne ""}?r={$r|stripslashes}{/if}">{$lang48} {$lang49}</a>
                </div>
            </div>
		</div>   
	</div>
</div>
<div id="scriptolutionnobottom">
    <div class="centerwrap footertop">
        <div class="footerbg scriptolutionfooter482"></div>
    </div>
</div>
{if $enable_fc eq "1"}
<div class="social-wrap" align="center">
    <a href="https://www.facebook.com/dialog/permissions.request?app_id={$FACEBOOK_APP_ID}&display=page&next={$baseurl}/&response_type=code&fbconnect=1&perms=email"><span>{$lang469}</span></a>
</div>
{/if}