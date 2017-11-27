<script src="{$baseurl}/js/jquery.tools.min.js" type="text/javascript"></script>
<script src="{$baseurl}/js/jquery.uploadify.v2.1.0.min.js" type="text/javascript"></script>
<script src="{$baseurl}/js/swfobject.js" type="text/javascript"></script>
<script src="{$baseurl}/js/jquery.scrollTo-min.js" type="text/javascript"></script> 
<script src="{$baseurl}/js/jquery.corner.js" type="text/javascript"></script> 
<script src="{$baseurl}/js/jquery.qtip-1.0.0-rc3.js" type="text/javascript"></script> 
<script src="{$baseurl}/js/jquery.hint.js" type="text/javascript"></script> 
<script src="{$baseurl}/js/conversations.php" type="text/javascript"></script>
<link href="{$baseurl}/css/scriptolutionconvos.css" media="screen" rel="stylesheet" type="text/css" />
{literal}
<style>
.message-toolkit {
	clear:both;
	float:right;
	font-size:12px;	
}
.related-gig a {
    color: #fff !important;
}
</style>
{/literal}
{include file="scriptolution_error7.tpl"}            
<div id="action-bar" class="mp-box action-bar-orders">
	<div class="box-row">
		<div class="action-steps cf">
			<div class="step">
                <div class="order-meta"> 
                    <h5>
                    <b>
                    {$lang235} <a href="{$baseurl}/{insert name=get_seo_profile value=a username=$u.username|stripslashes}">{$u.username|stripslashes}</a>
                    </b>
                    </h5>
                </div>
			</div>
		</div>
	</div>
</div>            
<div class="bodybg scriptolutionpaddingtop15">
	<div class="whitebody scriptolutionpaddingtop30 gray">
		<div class="inner-wrapper">
			<div class="clear"></div>
			<div class="left-side">
				<div class="whiteBox twoHalfs padding15 scriptolutionshop">					
                    {if $m|@count GT "0"}
                      <h3 class="meta-details"> 
                        <form action="{$baseurl}/inbox" method="post" name="arform" id="arform">                               
                        <input type="hidden" name="auid" value="{$u.USERID}"  />
                        <input type="hidden" name="subarc" value="1"  />
                        </form>
                        <a href="#" onclick="document.arform.submit()">{$lang236}</a> 
                      </h3>
                      <div>
                      {$lang237} {$m[0].time|date_format} 
                        &bull;
                        <span id="conversation_update_info">
                          {$lang238} <b>{math assign="t1" equation="x-1" x=$m|@count}{$m[$t1].mfrom|stripslashes}</b>
                        </span >                                   
                      </div>
                      <div style="padding-bottom:10px; clear:both"></div>
                      {/if}          
                    <div id="msgresults">
                        {insert name=last_delivery value=a assign=lasdel oid=$o.OID}
                        {section name=i loop=$m}
                        {if $m[i].unread eq "1"}
                        {if $smarty.session.USERID eq $m[i].MSGTO}
                        {insert name=mark_read value=a mid=$m[i].MID}
                        {/if}
                        {/if}
                        {insert name=get_member_profilepicture assign=profilepicture value=var USERID=$m[i].MSGFROM}
                            <div class="db-main-table {if $m[i].mfrom ne $smarty.session.USERNAME}yellowbg{/if}" id="message_{$m[i].MID}">
                                <table>
                                    <tbody>
                                    <tr>
                                        <td class="leftitscriptolution width25">
                                            <a href="{$baseurl}/{insert name=get_seo_profile value=a username=$m[i].mfrom|stripslashes}" title="{$m[i].mfrom|stripslashes}"><img alt="{$m[i].mfrom|stripslashes}" src="{$membersprofilepicurl}/thumbs/{$profilepicture}?{$smarty.now}" class="scriptolutionuimage" /></a>
                                        </td>
                                        <td class="leftitscriptolution width75">                                
                                            <div class="milestone action reqbox" title="{$lang293}"> 
                                                <div class="status-label"></div> 
                                                <div class="mutual-status underway">
                                                    {if $m[i].PID GT "0"}
                                                    {insert name=gig_details value=a assign=gml pid=$m[i].PID}
                                                    {section name=z loop=$gml}
                                                    {insert name=seo_clean_titles assign=ztitle value=a title=$gml[z].gtitle}
                                                    <div class='scriptolution_notice'>                                            
                                                        <p class="related-gig">
                                                          <span>{$lang239} "<a href="{$baseurl}/{$gml[z].seo|stripslashes}/{$gml[z].PID|stripslashes}/{$ztitle}">{$lang62} {$gml[z].gtitle|stripslashes} {$lang63}{$gml[z].price|stripslashes}</a>"</span>
                                                        </p>
                                                    </div>
                                                    {/section}
                                                    {/if}
                                                    <h3>{$m[i].mfrom|stripslashes}</h3>
                                                    <div class="padding5"></div>
                                                    <span><p>{$m[i].message|stripslashes|nl2br}</p></span>
                                                    {include file="track_files.tpl" scriptolutionfileinfo=$m[i]}
                                                </div> 
                                            </div>
                                            
                                            <div class="message-toolkit">
                                              <a href="{$baseurl}/spam?id={$m[i].MID}" class="spam_message">{$lang245}<span id="spam_message{$m[i].MID}">&nbsp;{$lang246}</span></a>
                                              <br />
                                              {$m[i].time|date_format}
                                            </div> 
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        {/section}
                    </div>
                    {include file="conversation_bit.tpl"}
					<div class="clear"></div>				
				</div>
			</div>
            
            <div class="right-side">
				<center>
                {insert name=get_advertisement AID=2}
                </center>	
			</div>
                        
		</div>    
	</div>
</div>