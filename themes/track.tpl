<script src="{$baseurl}/js/jquery.tools.min.js" type="text/javascript"></script>
<script src="{$baseurl}/js/jquery.uploadify.v2.1.0.min.js" type="text/javascript"></script>
<script src="{$baseurl}/js/swfobject.js" type="text/javascript"></script>
<script src="{$baseurl}/js/jquery.scrollTo-min.js" type="text/javascript"></script> 
<script src="{$baseurl}/js/jquery.corner.js" type="text/javascript"></script> 
<script src="{$baseurl}/js/jquery.qtip-1.0.0-rc3.js" type="text/javascript"></script> 
<script src="{$baseurl}/js/jquery.hint.js" type="text/javascript"></script> 
<script src="{$baseurl}/js/orders.php" type="text/javascript"></script>
<link href="{$baseurl}/css/scriptolutionorders.css" media="screen" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
{literal}
<style>
.message-toolkit {
	clear:both;
	float:right;
	font-size:12px;	
}
</style>
{/literal}
{include file="scriptolution_error7.tpl"}            
<div id="action-bar" class="mp-box action-bar-orders scriptolutiontrackingpage">
	<div class="box-row">
		<div class="action-steps cf">
        	<div class="step-end">
                <h5>
                <b>
                {if $o.status eq "0"}
                {$lang278}
                {elseif $o.status eq "1"}
                {$lang279}
                {elseif $o.status eq "2" OR $o.status eq "3" OR $o.status eq "7"} 
                {$lang203}
                {elseif $o.status eq "4"}
                {$lang201}
                {elseif $o.status eq "5"}
                {$lang202}
                {elseif $o.status eq "6"}
                {$lang320}
                {/if}
                </b>
                </h5>
            </div>
                                
			<div class="step">

                <div class="order-meta"> 
                    {if $o.status eq "0"}
                    <h3 class="flag"><span class="status waiting-for-reqs" title="{$lang278}">{$lang140} #{$o.OID}: {$lang278}</span></h3> 
                    {elseif $o.status eq "1"}
                    <h3 class="flag"><span class="status in-progress" title="{$lang279}">{$lang140} #{$o.OID}: {$lang279}</span></h3>
                    {elseif $o.status eq "2" OR $o.status eq "3" OR $o.status eq "7"} 
                    <h3 class="flag"><span class="status order-cancelled" title="{$lang203}">{$lang140} #{$o.OID}: {$lang203}</span></h3>
                    {elseif $o.status eq "4"}
                    <h3 class="flag"><span class="status order-delivered" title="{$lang201}">{$lang140} #{$o.OID}: {$lang201}</span></h3>
                    {elseif $o.status eq "5"}
                    <h3 class="flag"><span class="status order-completed" title="{$lang202}">{$lang140} #{$o.OID}: {$lang202}</span></h3>
                    {elseif $o.status eq "6"}
                    <h3 class="flag"><span class="status order-rejected" title="{$lang321}">{$lang140} #{$o.OID}: {$lang320}</span></h3>
                    {/if}
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
                    <div class="order-image" style="display: table-cell;"> 
                        <img src="{$purl}/t2/{$o.p1}?{$smarty.now}" /> 
                    </div>
                    <div style="display: table-cell; padding-left:15px;">    
						<h1><a href="{$baseurl}/{insert name=get_seo_profile value=a username=$o.username|stripslashes}">{$o.username|stripslashes}</a> {$lang262} {insert name=seo_clean_titles assign=title value=a title=$o.gtitle}<a href="{$baseurl}/{$o.seo|stripslashes}/{$o.PID|stripslashes}/{$title}">{$o.gtitle|stripslashes}</a> {if $scriptolution_cur_pos eq "1"}{$lang589} {$o.price|stripslashes}{$lang197}{else}{$lang63}{$o.price|stripslashes}{/if}</h1> 
                    </div>
                    <div style="clear:both; padding-bottom:5px;"></div>
                    <h4>
                    	<a href="{$baseurl}/{insert name=get_seo_convo value=a assign=cvseo username=$o.username|stripslashes}">{$lang235} {$o.username|stripslashes}</a>
                    	
                    </h4>
                    <div style="clear:both;"></div>
                    <div class="whiteBox inside" align="center">
						{$lang263} <a href="{$baseurl}/{insert name=get_seo_profile value=a username=$o.username|stripslashes}">{$o.username|stripslashes}</a> on {$o.time_added|date_format:"%A, %B %e %Y"} {$lang265} {$o.time_added|date_format:"%I:%M %p"}
					</div>
					<div class="db-main-table okay">
						<table>
                        	<thead>
								<tr>
									<td>
                                    	{$lang292}
                                    </td>
								</tr>
							</thead>
							<tbody>
                            <tr>
                                <td>  
                                    <i style="color:#51DD86" class="fa fa-check-square-o fa-2x"></i>                              
                                    <div class="milestone okay" title="{$lang292}"> 
                                      <div class="status-label"></div> 
                                      <div class="mutual-status">
                                        <span>{$lang266}</span> 
                                      </div> 
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="db-main-table reqbox">
						<table>
                        	<thead>
								<tr>
									<td>
                                    	{$lang293}
                                    </td>
								</tr>
							</thead>
							<tbody>
                            <tr>
                                <td>                                
                                    <div class="milestone action reqbox" title="{$lang293}"> 
                                        <div class="status-label"></div> 
                                        <div class="mutual-status underway">
                                            <h3>{$o.username|stripslashes} {$lang270}</h3>
                                            {include file='track_ship.tpl'}
                                            <span><p>{$o.ginst|stripslashes}</p></span>
                                            {include file='track_extras.tpl'}
                                        </div> 
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="msgresults">
                        {insert name=last_delivery value=a assign=lasdel oid=$o.OID}
                        {section name=i loop=$m}
                        {insert name=get_member_profilepicture assign=profilepicture value=var USERID=$m[i].MSGFROM}
                        {if $m[i].action eq "mutual_cancellation_request"}
                            {if $m[i].MSGFROM eq $smarty.session.USERID}                            
                            <div class="db-main-table warning" id="message_{$m[i].MID}">
                                <table>
                                	<thead>
                                        <tr>
                                            <td colspan="2">
                                                {$lang286}
                                            </td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="leftitscriptolution width25">
                                            <i style="color:#FBC137" class="fa fa-exclamation-circle fa-3x"></i> 
                                        </td>
                                        <td class="leftitscriptolution width75">                                
                                            <div class="milestone action reqbox" title="{$lang293}"> 
                                                <div class="status-label"></div> 
                                                <div class="mutual-status underway">
                                                    <div class="padding5"></div>
                                                    <p>{$lang287}: {$m[i].message|stripslashes|nl2br}</p>
                                                    {if $m[i].cancel eq "0"}
                                                    <form name="abort{$m[i].MID}" method="post">
                                                    <input type="hidden" name="subabort" value="1">
                                                    <input type="hidden" name="AMID" value="{$m[i].MID}">
                                                    </form>
                                                    <div class="status-control">{$lang289}
                                                    <div style="clear:both; padding-bottom:10px;"></div>
                                                    <a class="ascriptolutionredbutton" style="color:#fff" href="#" onclick="document.abort{$m[i].MID}.submit()">{$lang290}</a>
                                                    <div style="clear:both; padding-bottom:10px;"></div>{$lang291}</div>
                                                    {/if}                                     
                                                </div> 
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            {else}  
                            <div class="db-main-table warning" id="message_{$m[i].MID}">
                                <table>
                                	<thead>
                                        <tr>
                                            <td colspan="2">
                                                {$lang288}
                                            </td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="leftitscriptolution width25">
                                            <i style="color:#FBC137" class="fa fa-exclamation-circle fa-3x"></i> 
                                        </td>
                                        <td class="leftitscriptolution width75">                                
                                            <div class="milestone action reqbox" title="{$lang293}"> 
                                                <div class="status-label"></div> 
                                                <div class="mutual-status underway">
                                                    <div class="padding5"></div>
                                                    <p>{$lang287}: {$m[i].message|stripslashes|nl2br}</p>
                                                    {if $m[i].cancel eq "0"}
                                                    <form name="decline{$m[i].MID}" method="post">
                                                    <input type="hidden" name="subdecline" value="1">
                                                    <input type="hidden" name="DMID" value="{$m[i].MID}">
                                                    </form>
                                                    <form name="accept{$m[i].MID}" method="post">
                                                    <input type="hidden" name="subaccept" value="1">
                                                    <input type="hidden" name="AMID" value="{$m[i].MID}">
                                                    </form>
                                                    <div class="status-control">{$lang291}
                                                    <div style="clear:both; padding-bottom:10px;"></div>
                                                    <a class="ascriptolutionredbutton" style="color:#fff" href="#" onclick="document.decline{$m[i].MID}.submit()">{$lang296}</a> - <a class="ascriptolutiongreenbutton" style="color:#fff" href="#" onclick="document.accept{$m[i].MID}.submit()">{$lang301}</a></div>
                                                    {/if}                                        
                                                </div> 
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            {/if}
                            {if $m[i].cancel eq "1"}
                            <div class="db-main-table yellowbg" id="message_{$m[i].MID}">
                                <table>
                                    <tbody>
                                    <tr>
                                        <td class="leftitscriptolution width25">
                                            <i style="color:#FBC137" class="fa fa-times fa-3x"></i> 
                                        </td>
                                        <td class="leftitscriptolution width75">                                
                                            <div class="milestone warning" title="{$m[i].ctime|date_format}">
                                              <div class="mutual-status duedate"><span><span>{if $m[i].CID eq $smarty.session.USERID}{$lang297}{else}{$lang298}{/if}</span></span></div>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            {elseif $m[i].cancel eq "2"}
                            <div class="db-main-table redbg" id="message_{$m[i].MID}">
                                <table>
                                    <tbody>
                                    <tr>
                                        <td class="leftitscriptolution width25">
                                            <i style="color:#FB3737" class="fa fa-times fa-3x"></i> 
                                        </td>
                                        <td class="leftitscriptolution width75">                                
                                            <div class="milestone warning" title="{$m[i].ctime|date_format}">
                                              <div class="mutual-status duedate"><span><span>{$lang303}</span></span></div>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            {/if}
                        {elseif $m[i].action eq "seller_cancellation"}
                        <div class="db-main-table redbg" id="message_{$m[i].MID}">
                            <table>
                                <tbody>
                                <tr>
                                    <td class="leftitscriptolution width25">
                                        <i style="color:#FB3737" class="fa fa-times fa-3x"></i> 
                                    </td>
                                    <td class="leftitscriptolution width75">                                
                                        <div class="milestone cancel" title="{$m[i].ctime|date_format}">
                                          <div class="status-label"></div>
                                          <div class="mutual-status duedate"><span>{$lang304}<br />{$lang287}: {$m[i].message|stripslashes|nl2br}</span></div>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        {elseif $m[i].action eq "rejection"}
                        <div class="db-main-table redbg">
                            <table>
                                <tbody>
                                <tr>
                                    <td class="leftitscriptolution width25">
                                        <i style="color:#FB3737" class="fa fa-exclamation-triangle fa-3x"></i> 
                                    </td>
                                    <td class="leftitscriptolution width75">                                
                                        <div class="milestone cancel" title="{$m[i].time|date_format}"> 
                                          <div class="status-label"></div> 
                                          <div class="mutual-status duedate"><span>{$lang321}:<br />{$m[i].message|stripslashes|nl2br}</span></div> 
                                        </div> 
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        {elseif $m[i].action eq "delivery"}
                        <div class="db-main-table deliverybox" id="message_{$m[i].MID}">
                            <table>
                                <tbody>
                                <tr>
                                    <td class="leftitscriptolution width25">
										<i style="color:#0ABA44" class="fa fa-check fa-4x"></i> 
                                    </td>
                                    <td class="leftitscriptolution width75">                                
                                        <div class="milestone action reqbox"> 
                                            <div class="status-label"></div> 
                                            <div class="mutual-status underway">
                                                <h3 style="font-size:36px">{$lang308}</h3>
                                                <div class="padding5"></div>
                                                <span><p>{$m[i].message|stripslashes|nl2br}</p></span>
                                                {include file="track_files.tpl" scriptolutionfileinfo=$m[i]}
                                            </div> 
                                            {if $m[i].MID eq $lasdel AND $m[i].reject eq "0"}
                                            <div class="delivery-footer" style="clear:both;"> 
                                            	<div class="padding5"></div
                                                ><small>[{if $o.status eq "5"}{$lang319} {$o.cltime|date_format}{elseif $o.status ne "2" AND $o.status ne "7" AND $o.status ne "3"}{$lang307}{/if}]</small>                                               
                                            </div> 
                                            {/if}
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        {else}
                            <div class="db-main-table reqbox" id="message_{$m[i].MID}">
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
                                                    <h3>{$m[i].mfrom|stripslashes}</h3>
                                                    <div class="padding5"></div>
                                                    <span><p>{$m[i].message|stripslashes|nl2br}</p></span>
                                                    {include file="track_files.tpl" scriptolutionfileinfo=$m[i]}
                                                </div> 
                                            </div>
                                            <div class="message-toolkit">
                                              {$m[i].time|date_format}
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            {if $m[i].start eq "1"}
                            <div class="db-main-table started">
                                <table>
                                    <thead>
                                        <tr>
                                            <td>
                                                {$lang277}
                                            </td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>                       
                                        	<i style="color:#00668C" class="fa fa-fighter-jet fa-3x"></i>          
                                            <div class="milestone okay" title="{$lang277}"> 
                                              <div class="status-label"></div> 
                                              <div class="mutual-status underway"><h3>{$lang275}. {$lang277}</h3> 
                                                    <span>                                            
                                                        <span>{$lang276} <b>{insert name=get_deadline value=a assign=deadline days=$o.days time=$o.stime}{$deadline}</b></span>                                  
                                                    </span> 
                                                </div> 
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            {/if}  
                        {/if}
                        {/section}
                        {insert name=fback value=a assign=fbvl oid=$o.OID}
                        {if $lasdel GT "0" AND $fbvl eq "0"}
                        {if $o.status ne "6" AND $o.status ne "2" AND $o.status ne "7" AND $o.status ne "3"}
                        <form action="{$baseurl}/track?id={$o.OID}" class="review_form" id="new_rating" method="post">
                        <div class="db-main-table">
                            <table>
                                <tbody>
                                <tr>
                                    <td>   
                                    	<h3 style="font-size:30px">{$lang310}</h3>                             
                                          <div class="post-order-rating"> 
                                            <input checked="checked" class="good-review-button" id="rating_value_1" name="ratingvalue" type="radio" value="1" /><i style="color:#0ABA44" class="fa fa-thumbs-up fa-2x"></i>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <input class="bad-review-button" id="rating_value_0" name="ratingvalue" type="radio" value="0" /><i style="color:#F99F2A" class="fa fa-thumbs-down fa-2x"></i> 
                                          </div> 
                                          <br clear="both"/> 
                                          <div class="share-experience"> 
                                            <textarea cols="35" id="rating_comment" maxlength="300" name="ratingcomment" rows="5" title="{$lang311}" placeholder="{$lang311}"></textarea> 
                                            <br clear="all"/> 
                                          </div> 
                                          <div style="clear:both; padding-bottom:10px;"></div>
                                            <input type="submit" value="{$lang46}" class="scriptolutionbluebutton" style="color:#FFF;display: inline;"  />
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <input type="hidden" name="subrat" value="1" /> 
                        </form>
                        {/if}
                        {/if}
                        {if $fbvl eq "1"}
                        <div class="db-main-table yellowbg">
                            <table>
                                <tbody>
                                <tr>
                                    <td class="leftitscriptolution width25">
                                        <i style="color:#FBC137" class="fa fa-lightbulb-o fa-3x"></i> 
                                    </td>
                                    <td class="leftitscriptolution width75">                                
                                        <div class="milestone thumb-down"> 
                                          <div class="status-label"></div> 
                                          <div class="mutual-status complete-rating"> 
                                                <h3>{$lang313}</h3> 
                                            </div> 
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        {/if}
                        {if $o.status eq "5"}
                        <div class="db-main-table okay">
                            <table>
                                <thead>
                                    <tr>
                                        <td colspan="2">
                                            {$lang314}
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                <tr>
                                	<td class="leftitscriptolution width25">
                                        <i style="color:#0ABA44" class="fa fa-check-square-o fa-4x"></i>
                                    </td>
                                    <td>  
                                        <div class="complete-order-link">{$lang315} <a href="{$baseurl}/{insert name=get_seo_convo value=a assign=cvseo username=$o.username|stripslashes}">{$lang317}</a></div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        {elseif $o.status eq "7"}
                        <div class="db-main-table redbg">
                            <table>
                                <tbody>
                                <tr>
                                    <td class="leftitscriptolution width25">
                                        <i style="color:#FB3737" class="fa fa-times fa-3x"></i> 
                                    </td>
                                    <td class="leftitscriptolution width75">                                
                                        <div class="milestone cancel" title="{$lang359}">
                                          <div class="status-label"></div>
                                          <div class="mutual-status duedate"><span>{$lang359}</span></div>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>                        
                        {/if}
                    </div>
                    {if $o.status eq "1" OR $o.status eq "4" OR $o.status eq "6"}
                    {include file="track_bit2.tpl"}
                    {elseif $o.status eq "0"}
                    {include file="track_bit.tpl"}
                    {/if}
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