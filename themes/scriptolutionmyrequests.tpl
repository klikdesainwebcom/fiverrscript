{include file="scriptolution_error7.tpl"}
<div class="bodybg scriptolutionpaddingtop15">
	<div class="whitebody scriptolutionpaddingtop30 gray">
		<div class="inner-wrapper">
			<div class="clear"></div>
			<div class="left-side">
				<div class="whiteBox twoHalfs padding15 scriptolutionshop">					
                    <h1>{$lang629}</h1>
					<div class="scriptolution-table myrequests">
						<table>
							<thead>
								<tr>
									<td style="text-align:left;">{$lang110}</td>
                                    <td style="text-align:left;">{$lang630}</td>
                                    <td>{$lang581}</td>
								</tr>
							</thead>
							<tbody>
                            {if $posts|@count eq "0"}
                            <tr>
                                <td colspan="3">
                                {$lang633}
                                </td>
                            </tr>
                            {else}
                            	{section name=i loop=$posts}
                                {insert name=seo_clean_titles assign=title value=a title=$posts[i].gtitle}
								<tr>
									<td class="status-star">
                                        <div class="scriptolutionviewrequest3">
                                        	{$posts[i].time_added|date_format}
                                        </div>
									</td>
									<td class="ellipsis-wrap">
										<div class="ellipsissuggest"> 
                                        	<div class="scriptolutionviewrequest1">
                                        		{$posts[i].scriptolutiondesc|stripslashes|mb_truncate:200:"...":'UTF-8'}
                                            </div>
                                            <div class="scriptolutionviewrequest2">
                                            	<span>{$lang623}: {$posts[i].scriptolutiondays} {$lang131}</span>
                                                <span>{$lang625}: {if $scriptolution_cur_pos ne "1"}{$lang197}{/if}{$posts[i].scriptolutionprice}{if $scriptolution_cur_pos eq "1"}{$lang197}{/if}</span>
                                            </div>
										</div>
									</td>
                                    <td class="actionstatus">
                                    	<a class="offersbuttonscriptolution" href="{$baseurl}/viewoffers?ID={$posts[i].REQUESTID}">{insert name=scriptolutionoffercnt value=a assign=socnt REQUESTID=$posts[i].REQUESTID}{$socnt} {if $socnt eq "1"}{$lang640}{else}{$lang631}{/if}</a>
                                        <div style="clear:both; padding-top:15px;"></div>
                                        <a class="newscriptolutionredbutton" href="{$baseurl}/myrequests?del=1&ID={$posts[i].REQUESTID}">{$lang185}</a>
                                    </td>
								</tr>
                                {if $smarty.section.i.last}
                                <tr>
                                    <td colspan="3">
                                       <div></div>
                                    </td>
                                </tr>
                                {else}
                                <tr>
                                    <td colspan="3" class="scriptolutiontdhrline">
                                        <hr class="scriptolutionlighthr" />
                                    </td>
                                </tr>
                                {/if}
                                {/section}
							{/if}
							</tbody>
						</table>
					</div>
					<div class="clear"></div>
                    <div align="center">
                        <div class="paging">
                            <div class="p1">
                                <ul>
                                    {$pagelinks}
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>				
				</div>
                
                
                
                
			</div>
			{include file='scriptolution_newside.tpl'}            	
		</div>    
	</div>
</div>