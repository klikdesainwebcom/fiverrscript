<script src="{$baseurl}/js/jquery.qtip-1.0.0-rc3.js" type="text/javascript"></script> 
<script src="{$baseurl}/js/jquery.corner.js" type="text/javascript"></script> 
<script src="{$baseurl}/js/indexes.js" type="text/javascript"></script> 
{include file="scriptolution_error7.tpl"}
<div class="bodybg scriptolutionpaddingtop15">
	<div class="whitebody scriptolutionpaddingtop30 gray">
		<div class="inner-wrapper">
			<div class="clear"></div>
			<div class="left-side">
				<div class="whiteBox twoHalfs padding15 scriptolutionshop">
					<h1>{$lang512}</h1>
                    <h4>{$lang546} {if $scriptolution_cur_pos eq "1"}{$ref_price}{$lang197}{else}{$lang197}{$ref_price}{/if} {$lang547}.</h4>
					<div class="whiteBox inside" style="margin-bottom: 10px !important;">
                        {$lang545}: {$baseurl}/signup?ref={$smarty.session.USERID|stripslashes}
					</div>
                    
                    <h4 style="color:#F00">{$lang548}: {$lang549}.</h4>
                    
					<div class="db-main-table">
						<table>
							<thead>
								<tr>
									<td colspan="2" style="text-align:left;">{$lang110}</td>
									<td>{$lang36}</td>
                                    <td>{$lang191}</td>
									<td>{$lang389}</td>
								</tr>
							</thead>
							<tbody>
                            {if $o|@count eq "0"}
                            <tr>
                                <td colspan="5">
                                {$lang516}
                                </td>
                            </tr>
                            {else}
                            	{section name=i loop=$o}
								<tr>
									<td class="status-star">
                                    	{insert name=get_time_to_days_ago value=a time=$o[i].time_added}
									</td>
									<td class="ellipsis-wrap">
										<div class="ellipsis"> 
                                        	<a href="{$baseurl}/track?id={$o[i].OID}">{$o[i].gtitle|stripslashes}</a>
										</div>
									</td>
									<td>{$o[i].username|stripslashes}</td>

                                    {if $o[i].status eq "0"}
                                    <td class="status completed" title="{$lang194}"><div>{$lang194}</div></td> 
                                    {elseif $o[i].status eq "1"}
                                    <td class="status reversal" title="{$lang202}"><div>{$lang202}</div></td>
                                    {elseif $o[i].status eq "2"}
                                    <td class="status dispute" title="{$lang517}"><div>{$lang517}</div></td>
                                    {else}
                                    <td class="status reversal" title=""><div>&nbsp;</div></td>
                                    {/if}
                                    
                                    <td>{if $scriptolution_cur_pos eq "1"}{if $o[i].status eq "2"}0{else}{$o[i].money}{/if}{$lang197}{else}{$lang197}{if $o[i].status eq "2"}0{else}{$o[i].money}{/if}{/if}</td>
                                      
								</tr>
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