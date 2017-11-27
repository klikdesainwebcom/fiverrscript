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
                {if $o.status eq "1"}
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
                    {if $o.status eq "1"}
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
						<h1>{$lang62} {insert name=seo_clean_titles assign=title value=a title=$o.gtitle}<a href="{$baseurl}/{$o.seo|stripslashes}/{$o.PID|stripslashes}/{$title}">{$o.gtitle|stripslashes}</a> {if $scriptolution_cur_pos eq "1"}{$lang589} {$o.price|stripslashes}{$lang197}{else}{$lang63}{$o.price|stripslashes}{/if}</h1> 
                    </div>
                    <div style="clear:both; padding-bottom:5px;"></div>
                    <h4>
                    	<a href="{$baseurl}/{insert name=get_seo_convo value=a assign=cvseo username=$o.buyer|stripslashes}">{$lang235} {$o.buyer|stripslashes}</a>
                    	
                    </h4>
                    <div style="clear:both;"></div>
                    <div class="whiteBox inside" align="center">
						{$lang264} <a href="{$baseurl}/{insert name=get_seo_profile value=a username=$o.buyer|stripslashes}">{$o.buyer|stripslashes}</a> on {$o.time_added|date_format:"%A, %B %e %Y"} {$lang265} {$o.time_added|date_format:"%I:%M %p"}
					</div>
					<div class="db-main-table okay">
						<table>
                        	<thead>
								<tr>
									<td>
                                    	{$lang295}
                                    </td>
								</tr>
							</thead>
							<tbody>
                            <tr>
                                <td>          
                                	<i style="color:#00668C" class="fa fa-fighter-jet fa-3x"></i>                       
                                    <div class="milestone okay" title="{$lang295}"> 
                                      <div class="status-label"></div> 
                                      <div class="mutual-status">
                                        <span>{$lang267}<br /><b>{$lang269}</b>: {insert name=get_deadline value=a assign=deadline days=$o.days time=$o.stime}{$deadline} {if $o.status ne "5"}{insert name=countdown value=a assign=cdown days=$o.days time=$o.stime}{$cdown}{/if}</span>
                                      </div> 
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    {if $o.status ne "0"}
                    <div class="db-main-table okay">
						<table>
                        	<thead>
								<tr>
									<td>
                                    	{$lang271}
                                    </td>
								</tr>
							</thead>
							<tbody>
                            <tr>
                                <td>  
                                	<i style="color:#51DD86" class="fa fa-check-square-o fa-2x"></i>                             
                                    <div class="milestone okay reqbox" title="{$o.stime|date_format}">
                                      <div class="status-label"></div>
                                      <div class="mutual-status underway">
                                        <span>{$lang272} <a class="showInstructions" href="#">{$lang273}</a> 
                                        {include file='track_ship2.tpl'}
                                        {include file='track_extras2.tpl'}
                                        </span>
                                        <span class="instructions" style="display:none;"><p>{$o.ginst|stripslashes}</p></span>
                                      </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                   	{/if}			
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
                                                {$lang294}
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
                                              <div class="mutual-status duedate"><span><span>{if $m[i].CID eq $smarty.session.USERID}{$lang299}{else}{$lang300}{/if}</span></span></div>
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
                                              <div class="mutual-status duedate"><span><span>{$lang302}</span></span></div>
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
                                          <div class="mutual-status duedate"><span>{$lang305}<br />{$lang287}: {$m[i].message|stripslashes|nl2br}</span></div>
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
                                          <div class="mutual-status duedate"><h3>{$lang323}</h3><span>{$lang324}:<br />{$m[i].message|stripslashes|nl2br}</span></div>
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
                                                <h3 style="font-size:36px">{$lang306}</h3>
                                                <div class="padding5"></div>
                                                <span><p>{$m[i].message|stripslashes|nl2br}</p></span>
                                                {include file="track_files.tpl" scriptolutionfileinfo=$m[i]}
                                            </div> 
                                            {if $m[i].MID eq $lasdel AND $m[i].reject eq "0"}
                                            <div class="delivery-footer" style="clear:both;"> 
                                            	<div class="padding5"></div
                                                ><small>[{if $o.status eq "5"}{$lang319} {$o.cltime|date_format}{else}{$lang307}{/if}]</small>                                               
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
                        {/if}
                        {/section}
                        {insert name=fback2 value=a assign=fbvl oid=$o.OID sid=$o.USERID}
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
                                                <h3>{$o.buyer|stripslashes} {$lang318}</h3> 
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
                                        <div class="complete-order-link">{$lang315} <a href="{$baseurl}/{insert name=get_seo_convo value=a assign=cvseo username=$o.buyer|stripslashes}">{$lang316}</a></div>
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
                  	{include file="track2_bit.tpl"}					 
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