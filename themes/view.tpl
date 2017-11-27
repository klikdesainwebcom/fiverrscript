<link type="text/css" rel="stylesheet" href="{$baseurl}/js/bxslider/jquery.bxslider.css" />
<script src="{$baseurl}/js/jquery.customSelect.js"></script>
<script src="{$baseurl}/js/bxslider/jquery.bxslider.js"></script>
{literal}
<script>
	$(document).ready(function(){
		sQuery('#carousel').bxSlider();
		sQuery('.scriptolutionpopup').click(function(event) {
			var width  = 575,
				height = 450,
				left   = (sQuery(window).width()  - width)  / 2,
				top    = (sQuery(window).height() - height) / 2,
				url    = this.href,
				opts   = 'status=1' +
						 ',width='  + width  +
						 ',height=' + height +
						 ',top='    + top    +
						 ',left='   + left;
			window.open(url, 'scriptolutionwindow', opts);
			return false;
		  });
	});
</script>
{/literal}
{include file="scriptolution_error7.tpl"}
{insert name=seo_clean_titles assign=title value=a title=$p.gtitle}
<div class="bodybg scriptolutionpaddingtop15 scriptolutionvbg">
	<div class="whitebody scriptolutionpaddingtop15 scriptolution1010 scriptolutionvbg">
		<div class="inner-wrapper scriptolutionwrapper scriptolution970">
			<div class="contentArea scriptolution720">
            	<div class="fsScriptolution">
                    <h1>{$lang62} {$p.gtitle|stripslashes} {if $scriptolution_cur_pos eq "1"}{$lang589} {$p.price|stripslashes}{$lang197}{else}{$lang63}{$p.price|stripslashes}{/if}</h1>
                    {if $enablescriptolutionlocations eq "1"}{if $p.scriptolutionjoblocation ne ""}
                    <div class="gig-scriptolutionlocation"><i class="fa fa-map-marker"></i> {$p.scriptolutionjoblocation|stripslashes}</div>
                    {/if}{/if}
                    <div class="gig-meta">{$lang360|upper} {$p.time_added|date_format:"%A %B %e %Y"|upper}, {$lang119|upper} <a href="{$baseurl}/categories/{$p.seo|stripslashes}">{$p.name|stripslashes|upper}</a></div>
                    <div class="gig-social">
                        <div class="left">
                            <ul class="social">
                                {insert name=get_short_url value=a assign=takento PID=$p.PID seo=$p.seo short=$posts[i].short title=$title}
                                <li><a href="https://www.facebook.com/dialog/feed?app_id={$FACEBOOK_APP_ID}&display=popup&link={$baseurl}/{$p.seo|stripslashes|replace:' ':'+'}/{$p.PID|stripslashes}/{$title}&picture={$purl}/t/{$p.p1}&name={$lang62} {$p.gtitle|stripslashes} {if $scriptolution_cur_pos eq "1"}{$lang589} {$p.price|stripslashes}{$lang197}{else}{$lang63}{$p.price|stripslashes}{/if}&description={$lang62} {$p.gtitle|stripslashes} {if $scriptolution_cur_pos eq "1"}{$lang589} {$p.price|stripslashes}{$lang197}{else}{$lang63}{$p.price|stripslashes}{/if}&redirect_uri={$baseurl}/{$p.seo|stripslashes|replace:' ':'+'}/{$p.PID|stripslashes}/{$title}" class="facebook scriptolutionpopup"><span class="hide">Facebook</span></a></li>
                                <li><a href="https://twitter.com/share?url={$baseurl}/{$p.seo|stripslashes|replace:' ':'+'}/{$p.PID|stripslashes}/{$title}&amp;text={$lang62} {$p.gtitle|stripslashes} {if $scriptolution_cur_pos eq "1"}{$lang589} {$p.price|stripslashes}{$lang197}{else}{$lang63}{$p.price|stripslashes}{/if}" class="twitter scriptolutionpopup"><span class="hide">Twitter</span></a></li>
                                <li><a href="https://pinterest.com/pin/create/button/?url={$baseurl}/{$p.seo|stripslashes}/{$p.PID|stripslashes}/{$title}&media={$purl}/t2/{$p.p1}&description={$lang62} {$p.gtitle|stripslashes} {if $scriptolution_cur_pos eq "1"}{$lang589} {$p.price|stripslashes}{$lang197}{else}{$lang63}{$p.price|stripslashes}{/if}" class="pinterest scriptolutionpopup"><span class="hide">Pinterest</span></a></li>
                                <li><a href="mailto:?subject={$lang62} {$p.gtitle|stripslashes} {if $scriptolution_cur_pos eq "1"}{$lang589} {$p.price|stripslashes}{$lang197}{else}{$lang63}{$p.price|stripslashes}{/if}&amp;body={$baseurl}/{$p.seo|stripslashes}/{$p.PID|stripslashes}/{$title}" class="scriptolutionemail"><span class="hide">E-Mail</span></a></li>
                                <li><g:plusone size="medium" count="false" href="{$takento}"></g:plusone></li>
                                <li>
                                    <a class="addthis_button" addthis:url="{$baseurl}/{$p.seo|stripslashes}/{$p.PID|stripslashes}/{$title}" addthis:title="{$lang62} {$p.gtitle|stripslashes} {if $scriptolution_cur_pos eq "1"}{$lang589} {$p.price|stripslashes}{$lang197}{else}{$lang63}{$p.price|stripslashes}{/if}" href="https://www.addthis.com/bookmark.php?v=250&amp;pub="><img src="https://s7.addthis.com/static/btn/sm-share-en.gif" width="83" height="16" alt="Bookmark and Share"></a>
                                    {literal}
                                    <script type="text/javascript">
                                    var addthis_config = {
                                        services_exclude: 'email, facebook, twitter, print'
                                    }
                                    </script>
                                    <script type="text/javascript" src="https://s7.addthis.com/js/250/addthis_widget.js#pub="></script>
                                    {/literal}
                                </li>
                            </ul>
                        </div>
                        {if $smarty.session.USERID ne ""}                     
                        {literal}
                        <script language="javascript" type="text/javascript">
                        sQuery(document).ready(function() {
                            sQuery('#scriptolution_heart_{/literal}{$p.PID}{literal}').click(function() {
                                sQuery.post('{/literal}{$baseurl}/bookmark?id={$p.PID|stripslashes}&do=add{literal}', sQuery(this).serialize(),function(data){
                                    sQuery('#sbookmark1').hide();
                                    sQuery('#sbookmark2').show();
                                });
                                return false;
                            });
                            
                            sQuery('#scriptolution_unheart_{/literal}{$p.PID}{literal}').click(function() {
                                sQuery.post('{/literal}{$baseurl}/bookmark?id={$p.PID|stripslashes}&do=rem{literal}', sQuery(this).serialize(),function(data){
                                    sQuery('#sbookmark2').hide();
                                    sQuery('#sbookmark1').show();
                                });
                                return false;
                            });
                        });
                        </script>
                        {/literal}
                        {insert name=like_cnt value=var assign=liked pid=$p.PID}
                        <div class="right">
                            <dl id="bookmark" class="dropdown cleanStyle">
                                <dt id="sbookmark1" {if $liked eq "1"}style="display:none;"{/if}><a class="tooltip" title="{$lang574}" href="javascript(void);" id="scriptolution_heart_{$p.PID}"><span><i class="icon-red-heart"></i></span></a></dt>
                                <dt id="sbookmark2" {if $liked ne "1"}style="display:none;"{/if}><a class="tooltip" title="{$lang574}" href="javascript(void);" id="scriptolution_unheart_{$p.PID}"><span><i class="icon-white-heart"></i></span></a></dt>
                            </dl>
                        </div>
                        {else}
                        <div class="right scriptolutionbookmark">
                            <a class="tooltip" title="{$lang574}" href="{$baseurl}/login"><span><i class="icon-white-heart"></i></span></a>
                        </div>
                        {/if}
                    </div>
                    <div class="clear"></div>
                    {include file='view_image_box.tpl'}
                </div>                
                
                <div class="ftScriptolution">
                	<div class="clscriptolution scriptolutionpart">
                        {$lang654}
                    </div>
                	<div class="fsScriptolution">
                        <div class="gig-description" {if $rtl ne "1"}align="left"{/if}>
                            <p {if $rtl eq "1"}class="scriptolutionrtl"{else}align="left"{/if} style="overflow: hidden;">
                            	{$p.gdesc|stripslashes|html_entity_decode:$smarty.const.ENT_QUOTES:'utf-8'}
                            	<div class="clear"></div>{if $p.youtube ne ""}{include file='view_yt.tpl'}{/if}<div class="clear"></div>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="scriptolutionpaddingbottom30"></div>
                
                {include file='view_extra.tpl'} 
                <div id="scriptolutionbarnreviews">
                
                    <div class="scriptolutionbar">
                        <div class="whiteBox inside">
                            <div class="block inside">
                                <span class="number">{$grat}</span>
                                <span class="descr">{$lang476}</span>
                            </div>
                            <div class="block inside">
                                <span class="number">{$brat}</span>
                                <span class="descr">{$lang477}</span>
                            </div>
                            <div class="block inside last">
                                <span class="number">{$ftot}</span>
                                <span class="descr">{$lang478}</span>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>                                
                	{include file='scriptolution_bit_related.tpl'}
                </div>
			</div>
			
			<div class="sidebarArea scriptolution290">
            	<div class="fsScriptolution">
                    {include file='scriptolution_order_selection.tpl'}
                    <div class="clear"></div>				
                    <ul class="gig-details">
                        <li class="gig-rating">
                            {insert name=scriptolution_rating_stars_big assign=scriptolutionstars value=a scriptolutionpid=$p.PID}{$scriptolutionstars}
                        </li>
                        <li>
                            <span class="rating-positive">
                                {if $f|@count eq "0"}{$lang471}{else}{insert name=get_rating value=a assign=percent b=$brat g=$grat}{$percent}&#37;{/if}
                                <span class="label">{$lang568|upper}</span>
                            </span>
                            <span class="rating-middle">
                                {$lang414}
                            </span>
                            <span class="rating-votes">
                                {$scriptolutiontotalvotes}
                                <span class="label">{$lang569|upper}</span>
                            </span>
                        </li>
                        {if $p.days eq "0"}
                        {include file='view_instant.tpl'}
                        {else}
                        <li>
                            <i class="icon-clock"></i>
                            <span class="big">{$p.days|stripslashes}</span>
                            <span class="small">{$lang131|upper}<br/>{$lang474|upper}</span>
                        </li>
                        {/if}
                        <li>
                            <i class="icon-queue"></i>
                            <span class="big">{$quecount}</span>
                            <span class="small">{$lang475|upper}<br/>{$lang473|upper}</span>
                        </li>
                        <li class="small">{$lang576|upper}</li>
                    </ul>
                    <div class="clear"></div>
                </div>
                
                <div class="scriptolutionpaddingbottom30"></div>                
				<div class="clear"></div>	
                
                
                <div class="fsScriptolution">			
                    <div class="profile-info">
                        {insert name=get_member_profilepicture assign=profilepicture value=var USERID=$p.USERID}
                        <div class="scriptolutioncenter">
                        	<img src="{$membersprofilepicurl}/{$profilepicture}" width="100px" height="100px" />
                        </div>
                        <div class="user-info">
                            <h3><a href="{$baseurl}/{insert name=get_seo_profile value=a username=$p.username|stripslashes}">{$p.username|stripslashes}</a></h3>
                            <h4>
                                {$lang573|upper}: {insert name=country_code_to_country value=a assign=userc code=$p.country}{$userc|upper}
                                <br/>
                                {$lang572|upper}: {$p.addtime|date_format:"%B %e %Y"|upper}
                                <span class="countryflag"><span class="country {$p.country}"></span></span>
                            </h4>
                        </div>
                        {insert name=get_percent value=a assign=mpercent userid=$p.USERID}
                        <div style="clear:both; padding-top:15px;"></div>
                        <div class="user-level">
                            {if $enable_levels eq "1"}
                                {if $p.level eq "1"}
                                <img src="{$imageurl}/scriptolution_level1.png" />
                                {elseif $p.level eq "2"}
                                <img src="{$imageurl}/scriptolution_level2.png" />
                                {elseif $p.level eq "3"}
                                <img src="{$imageurl}/scriptolution_level3.png" />
                                {/if}
                            {/if}
                            <span class="big">{if $mpercent ne ""}{$mpercent}&#37;{else}{$lang471}{/if}</span>
                            <span class="small">{$lang570|upper}<br/>{$lang571|upper}</span>
                        </div>
                    </div>
					<div class="clear"></div>
                </div>
                <div class="elscriptolution scriptolution000">
                    {if $smarty.session.USERID ne $p.USERID}
                    {if $smarty.session.USERID GT "0"}
                    <a class="scriptolutioncme" href="{$baseurl}/{insert name=get_seo_convo value=a assign=cvseo username=$p.username|stripslashes}{$cvseo}?id={$p.PID}">{$lang655}</a>
                    {else}
                    <a class="scriptolutioncme" href="{$baseurl}/login?r={insert name=get_redirect2 value=a assign=rurl2 uname=$p.username pid=$p.PID}{$rurl2|stripslashes}">{$lang655}</a>
                    {/if}
                    {/if}
                </div>
                <div class="clear"></div>
                
                <div class="scriptolutionpaddingbottom30"></div> 
                
                <div class="fsScriptolution">
                    <div class="relatedTopics">
                        <h3>{$lang76}</h3>
                        <ul class="tags">
                            {section name=i loop=$tags}
                            <li><a href="{$baseurl}/tags/{$p.seo|stripslashes}/{$tags[i]|stripslashes}">{$tags[i]|stripslashes}</a></li>
                            {/section}
                        </ul>
                        <div class="clear"></div>
                    </div>
                    <div class="clear"></div>
                </div>	
                <div class="clear"></div>
                
                <div class="scriptolutionpaddingbottom30"></div>
                
                <div class="fsScriptolution">			
                    <div class="sidebarAds">
                        <center>{insert name=get_advertisement AID=5}</center>
                    </div>
                    <div class="clear"></div>
                </div>
			</div>

            <div id="scriptolutionbarnreviewsmobile">
            	<div class="contentArea">
                	<div>
                        <div class="scriptolutionbar">
                            <div class="whiteBox inside">
                                <div class="block inside">
                                    <span class="number">{$grat}</span>
                                    <span class="descr">{$lang476}</span>
                                </div>
                                <div class="block inside">
                                    <span class="number">{$brat}</span>
                                    <span class="descr">{$lang477}</span>
                                </div>
                                <div class="block inside last">
                                    <span class="number">{$ftot}</span>
                                    <span class="descr">{$lang478}</span>
                                </div>
                            </div>
                        </div>
                        <div class="clear"></div>
                        {include file='scriptolution_bit_related.tpl'}
                    </div>
                </div>
            </div>
		
			<div class="clear"></div>
			<div class="more-user-gigs">
				<h3>{$lang137} {$p.username|stripslashes}</h3>
				{section name=i loop=$u}
				<div class="user-gig {if $smarty.section.i.iteration % 5 == 0}last{/if}">
					<div class="gig-thumb">
						<a href="{$baseurl}/{$u[i].seo|stripslashes}/{$u[i].PID|stripslashes}/{$utitle}"><img src="{$purl}/t/{$u[i].p1}" width="180" height="112" /></a>
					</div>
					<span class="user-gig-excerpt"><a href="{$baseurl}/{$u[i].seo|stripslashes}/{$u[i].PID|stripslashes}/{$utitle}">{$lang62} {$u[i].gtitle|stripslashes} {if $scriptolution_cur_pos eq "1"}{$lang589} {$u[i].price|stripslashes}{$lang197}{else}{$lang63}{$u[i].price|stripslashes}{/if}</a></span>
                    <br />
                    <span class="user-cat"><a href="{$baseurl}/categories/{$u[i].seo|stripslashes}">{$u[i].name|stripslashes}</a></span>
				</div>
				{/section}				
			</div>
		</div>    
	</div>
</div>