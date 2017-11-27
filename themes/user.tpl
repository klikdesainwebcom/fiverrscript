<link rel="stylesheet" href="{$cssurl}/scriptolution_style_v7_user.css">
<div class="userbanner">
    <div class="centerwrap relative">
        <div class="scriptolutionbannerpic">
        	<div class="profile-image">
                {insert name=get_member_profilepicture assign=profilepicture value=var USERID=$USERID}
                <img alt="{$uname|stripslashes}" src="{$membersprofilepicurl}/{$profilepicture}" />
            </div>
        </div>
    	<div class="userbannertext">
        	<h3>{$uname|stripslashes}</h3>
            <h2>{$scriptolutionuserslogan|stripslashes}</h2>
            <div class="find-userrating">                
                {insert name=scriptolution_userrating_stars_big assign=scriptolutionstars value=a scriptolutionpid=$USERID}{$scriptolutionstars}
                <div class="clear"></div>
            </div>            
            <div class="scriptolutioncon">
                {if $smarty.session.USERID GT "0"}
                {if $smarty.session.USERID ne $USERID}
                <a class="agreenbutton" href="{$baseurl}/{insert name=get_seo_convo value=a assign=cvseo username=$uname|stripslashes}{$cvseo}">{$lang400}</a>
                {/if}
                {else}
                <a class="agreenbutton" href="{$baseurl}/{insert name=get_seo_convo value=a assign=cvseo username=$uname|stripslashes}{$cvseo}">{$lang400}</a>                                              
                {/if}
             </div>
        </div>
    </div>
</div>
<div class="clear"></div> 
<div class="usertopnavbg">
	<div class="scriptolutionmidlineinfo">
    	<p><i class="fa fa-globe"></i> {$lang467}: {insert name=country_code_to_country value=a assign=usercc code=$ucountry}{$usercc}</p>
        <p class="splinfo"><i class="fa fa-clock-o"></i> {$lang399}: {$addtime|date_format}</p>
    </div>
</div>
<div class="clear"></div> 
<div class="bodybg">
	<div class="bodyshadow scriptolutionpbg">
        <div class="whitebody">

        	<div class="scriptolutionproright">
            	
                <div class="coolscriptolution scriptolutionpart">
                	<h1>{$lang401} {$uname|stripslashes}</h1>
                </div>
                
                <div class="cusongs" style="padding-top:10px;">
                    <div class="cusongslist">
                        {include file="scriptolution_bit_last3.tpl"}                
                        <div class="clear"></div>
                    </div>
                </div>
                
                <div class="coolscriptolution scriptolutionpart adspottoobig">
                    <center>
                    {insert name=get_advertisement AID=1}
                    </center>
                </div>

                <div class="coolscriptolution">
                	<div class="scriptolutionpart">
	                	<h1>{$lang591} {$uname|stripslashes}</h1>
                    </div>
                    <div class="clear"></div> 
                    <div class="randborder"></div>
                    <div>
                        <div class="scriptolutionuserreviews">
                            {section name=i loop=$f}
                            {insert name=seo_clean_titles assign=title value=a title=$f[i].gtitle}
                            <a href="{$baseurl}/user/{$f[i].username|stripslashes}">
                                <div class="review-image">
                                    {insert name=get_member_profilepicture assign=profilepicture value=var USERID=$f[i].USERID}
                                    <img alt="{$f[i].username|stripslashes}" src="{$membersprofilepicurl}/thumbs/{$profilepicture}?{$smarty.now}" />
                                </div>
                                <div class="reviewinfo">
                                    {$f[i].comment|stripslashes}
                                    <br />
                                    <div class="usercolorit">{$f[i].username|stripslashes}</div>
                                </div>
                            </a>
                            <div class="clear"></div> 
                        	<div class="randborder"></div>
                            {/section}
                        </div>
                        
                        
                    </div>
                </div>
            </div>
        	
            <div class="scriptolutionproleft">
            	<div class="coolscriptolution">
                    <div class="scriptolutionpart">
                        <h1>{$lang69}</h1>
                        <div class="scriptolutionpaddingbottom20"></div>
                        <p>{$desc|stripslashes|nl2br}</p>
                    </div>
                    <div class="clear"></div> 
                    {if $enable_levels eq "1" AND $price_mode eq "3"}
                    <div class="randborder"></div>
                    <div class="scriptolutionpart">
                        <h1>{$lang499}</h1>
                        <div class="scriptolutionpaddingbottom10"></div>
                        <p><i class="fa fa-level-up"></i> {$level|stripslashes}</p>
                    </div>
                    <div class="clear"></div>
                    {/if} 
                    {if $toprated eq "1"}
                    <div class="randborder"></div>
                    <div class="scriptolutionpart">
                        <h1>{$lang468}</h1>
                        <div class="scriptolutionpaddingbottom10"></div>
                        <p><img alt="{$lang468}" src="{$imageurl}/topratedscriptolution.png" /></p>
                    </div>
                    <div class="clear"></div>
                    {/if}
                </div>
                <div class="coolscriptolution scriptolutionpart">
                    <center>
                    {insert name=get_advertisement AID=5}
                    </center>
                </div>
            </div>

            <div class="clear"></div>
        </div>
    </div>
</div>