<script src="{$baseurl}/js/jquery.qtip-1.0.0-rc3.js" type="text/javascript"></script> 
<script src="{$baseurl}/js/jquery.corner.js" type="text/javascript"></script>
<script src="{$baseurl}/js/mainscriptolution.js" type="text/javascript"></script>  
{include file="scriptolution_error7.tpl"}
{literal}
<style>
.unread-message{
	background: #fe0;
}
.table-title a.whiteBtnselected {
  display: inline-block;
  padding: 6px 8px;
  border-radius: 5px;
  border: 1px solid #EFECEC;
  background: #0CF;
  margin-left: 5px;
  font-size: 12px;
  color: #fff;
}
#conversations_quick_navigation{
	padding: 5px 10px 5px 10px;
  font-size: 16px;
}
</style>
{/literal}
<div class="bodybg scriptolutionpaddingtop15">
	<div class="whitebody scriptolutionpaddingtop30 gray">
		<div class="inner-wrapper">
			<div class="clear"></div>
			<div class="left-side">
				<div class="whiteBox twoHalfs padding15 scriptolutionshop">
					<h1>{$lang226}</h1>
                    <h4>{$lang227}</h4>
                    
                    <div class="table-title">
                    	<div class="left">
                        	<a href="{$baseurl}/inbox?o={$o}&a={$a}" class=" whiteBtn{if $s eq "all" OR $s eq ""}selected{/if}">{$lang187}</a>
                            <a href="{$baseurl}/inbox?s=unread&o={$o}&a={$a}" class=" whiteBtn{if $s eq "unread"}selected{/if}">{$lang228}</a>
                            <a href="{$baseurl}/inbox?s=archived&o={$o}&a={$a}" class=" whiteBtn{if $s eq "archived"}selected{/if}">{$lang229}</a>
                        </div>
                    	<div class="right">
                            <select id="conversations_quick_navigation">
                            	{if $u GT "0"}
                                <option value="o={$o}&a={$a}&s={$s}">{$lang230}</option>
                                {section name=i loop=$m}
                                <option style="font-weight: bold;" value="o={$o}&a={$a}&s={$s}&u={$m[i].USERID|stripslashes}" selected="selected">{$m[i].username|stripslashes}</option>
                                {/section}
                                {else}
                            	<option>{$lang230}</option>
                                {section name=i loop=$m}
                                <option style="font-weight: bold;" value="o={$o}&a={$a}&s={$s}&u={$m[i].USERID|stripslashes}">{$m[i].username|stripslashes}</option>
                                {/section}
                                {/if}
                            </select>
                        </div>
                    </div>
                       					
					<div class="db-main-table">
						<table>
							<thead>
								<tr>
									<td style="text-align:left;">
                                    	<a href="{$baseurl}/inbox?o=name&s={$s}{if $a eq "1"}&a=0{else}&a=1{/if}" {if $o eq "name"}class="{if $a eq "1"}descending{else}ascending{/if}"{/if}>{if $o eq "name"}{if $a eq "1"}&#9650;{else}&#9660;{/if}{/if}&nbsp;{$lang231}</a>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
									<td>
                                    	<a href="{$baseurl}/inbox?o=time&s={$s}{if $a eq "1"}&a=0{else}&a=1{/if}" {if $o eq "time"}class="{if $a eq "1"}descending{else}ascending{/if}"{/if}>{if $o eq "time"}{if $a eq "1"}&#9650;{else}&#9660;{/if}{/if}&nbsp;{$lang232}</a>
                                    </td>
								</tr>
							</thead>
							<tbody>
                            {if $m|@count eq "0"}
                            <tr>
                                <td colspan="4">
                                {$lang234}
                                </td>
                            </tr>
                            {else}
                            	{section name=i loop=$m}
                                {if $s eq "all"}
                                    	{assign var="show" value=1}
                                        {section name=j loop=$arc}
                                        {if $arc[j].AID eq $m[i].USERID}
                                        {assign var="show" value=0}
                                        {/if}
                                        {/section}
                                        {insert name=last_unread value=a assign=lur uid=$m[i].USERID}
                                        {if $show eq "1" OR $lur eq "1"}
                                        <tr>
                                            <td class="status-star">
                                                <a href="{$baseurl}/{insert name=get_seo_convo value=a assign=cvseo username=$m[i].username|stripslashes}{$cvseo}">{$m[i].username|stripslashes}</a>
                                            </td>
                                            <td class="ellipsis-wrap">
                                            	<div class="ellipsis"> 
                                                <a href="{$baseurl}/{insert name=get_seo_convo value=a assign=cvseo username=$m[i].username|stripslashes}{$cvseo}">{insert name=last_email value=a assign=lem uid=$m[i].USERID}{$lem|stripslashes|truncate:50:"...":true}</a>
                                                </div>
                                            </td>
                                            <td>
                                                {if $lur eq "1"}<div class="unread-message" title="New message!"><span>{$lang233}</span></div>{/if}
                                            </td>
                                            <td>{insert name=get_time_to_days_ago value=a time=$m[i].time}</td>                          
                                        </tr>
                                		{/if}
                                    
                                {elseif $s eq "unread"}
                                		{section name=i loop=$m}
                                        {assign var="show" value=1}
                                        {section name=j loop=$arc}
                                        {if $arc[j].AID eq $m[i].USERID}
                                        {assign var="show" value=0}
                                        {/if}
                                        {/section}
                                        {insert name=last_unread value=a assign=lur uid=$m[i].USERID}
                                        {if $show eq "1" AND $lur eq "1"}
                                    	<tr>
                                            <td class="status-star">
                                                <a href="{$baseurl}/{insert name=get_seo_convo value=a assign=cvseo username=$m[i].username|stripslashes}{$cvseo}">{$m[i].username|stripslashes}</a>
                                            </td>
                                            <td class="ellipsis-wrap">
                                            	<div class="ellipsis"> 
                                                <a href="{$baseurl}/{insert name=get_seo_convo value=a assign=cvseo username=$m[i].username|stripslashes}{$cvseo}">{insert name=last_email value=a assign=lem uid=$m[i].USERID}{$lem|stripslashes|truncate:50:"...":true}</a>
                                                </div>
                                            </td>
                                            <td>
                                                {if $lur eq "1"}<div class="unread-message" title="New message!"><span>{$lang233}</span></div>{/if}
                                            </td>
                                            <td>{insert name=get_time_to_days_ago value=a time=$m[i].time}</td>                          
                                        </tr>
                                        {/if}
                                    	{/section}
                                {elseif $s eq "archived"}
                                		{section name=i loop=$m}
                                        {assign var="show" value=0}
                                        {section name=j loop=$arc}
                                        {if $arc[j].AID eq $m[i].USERID}
                                        {assign var="show" value=1}
                                        {/if}
                                        {/section}
                                        {insert name=last_unread value=a assign=lur uid=$m[i].USERID}
                                        {if $show eq "1" AND $lur eq "0"}
                                        <tr>
                                            <td class="status-star">
                                                <a href="{$baseurl}/{insert name=get_seo_convo value=a assign=cvseo username=$m[i].username|stripslashes}{$cvseo}">{$m[i].username|stripslashes}</a>
                                            </td>
                                            <td class="ellipsis-wrap">
                                            	<div class="ellipsis"> 
                                                <a href="{$baseurl}/{insert name=get_seo_convo value=a assign=cvseo username=$m[i].username|stripslashes}{$cvseo}">{insert name=last_email value=a assign=lem uid=$m[i].USERID}{$lem|stripslashes|truncate:50:"...":true}</a>
                                                </div>
                                            </td>
                                            <td>
                                                {if $lur eq "1"}<div class="unread-message" title="New message!"><span>{$lang233}</span></div>{/if}
                                            </td>
                                            <td>{insert name=get_time_to_days_ago value=a time=$m[i].time}</td>                          
                                        </tr>
                                        {/if}
                                    	{/section}
                                {/if}
                                {/section}
 
							{/if}
							</tbody>
						</table>
					</div>
					<div class="clear"></div>	
				</div>
                
                
			</div>
			{include file='scriptolution_newside.tpl'}
		</div>    
	</div>
</div>