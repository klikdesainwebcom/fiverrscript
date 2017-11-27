{include file="scriptolution_error7.tpl"}
<div class="bodybg scriptolutionpaddingtop15">
	<div class="whitebody scriptolutionpaddingtop30 gray">
		<div class="inner-wrapper">
			<div class="clear"></div>
			<div class="left-side">
				<div class="whiteBox twoHalfs padding15 scriptolutionshop">
					<h1>{$lang641} ({$offers|@count} {if $offers|@count eq "1"}{$lang640}{else}{$lang631}{/if})</h1>
                    
                    <div class="clear"></div>
                    {section name=i loop=$scriptolutionz}
                    <div class="myreqinfo">
                    	<h2>{$lang642}</h2>
                    	<div class="myreqinfopp">
                        	{$scriptolutionz[i].scriptolutiondesc|stripslashes}
                        </div>
                        <div class="myreqinfodls">
                        	<span>{$lang623}: {$scriptolutionz[i].scriptolutiondays} {$lang131}</span>
                            <span>{$lang625}: {if $scriptolution_cur_pos ne "1"}{$lang197}{/if}{$scriptolutionz[i].scriptolutionprice}{if $scriptolution_cur_pos eq "1"}{$lang197}{/if}</span>
                        </div>
                    </div>
                    {/section}
                    <div class="clear"></div>
                                                					
					<div class="db-main-table myrequests">
                    	{if $offers|@count gt "0"}
						<table>
							<tbody>
                            {section name=i loop=$offers}
                                {insert name=seo_clean_titles assign=title value=a title=$offers[i].gtitle}
                                {insert name=scriptolutionseo assign=scriptolutionoseo value=a CATID=$offers[i].category}
								<tr>
									<td class="status-star">
                                        <div class="scriptolutionviewoffer1">
                                        	<a href="{$baseurl}/{$scriptolutionoseo|stripslashes}/{$offers[i].PID|stripslashes}/{$title}"><img src="{$purl}/t4/{$offers[i].p1}" alt="{$offers[i].gtitle|stripslashes}" width="162" height="100" /></a>
                                            <br />
                                            <a href="{$baseurl}/{insert name=get_seo_profile value=a username=$offers[i].username|stripslashes}">{$offers[i].username|stripslashes}</a>
                                        </div>
									</td>
									<td class="ellipsis-wrap vatop">
										<div class="ellipsissuggest"> 
                                        	<div class="scriptolutionviewoffer2">
                                            	{if $scriptolution_cur_pos eq "1"}{$offers[i].price|stripslashes}{$lang197}{else}{$lang197}{$offers[i].price|stripslashes}{/if}
                                            </div>
                                            <div class="scriptolutionviewoffer3">                                                
                                        		<a href="{$baseurl}/{$scriptolutionoseo|stripslashes}/{$offers[i].PID|stripslashes}/{$title}">{$offers[i].gtitle|stripslashes}</a>
                                            </div>
                                            <div class="scriptolutionviewoffer3">    
                                        		"{$offers[i].scriptolutionmsg|stripslashes}"
                                            </div>
                                            <div class="scriptolutionviewoffer4">    
                                        		{$lang623}: {if $offers[i].days eq "0"}{$langi0}{else}{$offers[i].days|stripslashes} {$lang131}{/if}
                                            </div>
										</div>
									</td>
								</tr>
                                
                                <tr>
                                    <td class="scriptolutiontopborder0" colspan="2">
                                    	<a class="sendascriptolutionoffer" href="{$baseurl}/{$scriptolutionoseo|stripslashes}/{$offers[i].PID|stripslashes}/{$title}">{$lang107}</a>
                                    </td>
								</tr>
                                
                                {/section}
							</tbody>
						</table>
                        {/if}
					</div>
					<div class="clear"></div>	
				</div>
                
                
			</div>
			{include file='scriptolution_newside.tpl'}
		</div>    
	</div>
</div>