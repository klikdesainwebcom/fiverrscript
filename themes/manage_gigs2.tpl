<script src="{$baseurl}/js/mainscriptolution.js" type="text/javascript"></script>
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
					<h1>{$lang153}</h1>
                    
                    <div class="table-title">
                    	<div class="left">
                        	<span class="label">{$lang186|upper}</span>
                        	<a href="#" class="select-all whiteBtn">{$lang187}</a>
                            <a href="#" class="select-none whiteBtn">{$lang188}</a>
                            <a href="#" class="select-suspended whiteBtn">{$lang189}</a>
                            <a href="#" class="select-active whiteBtn">{$lang190}</a>
                        </div>
                    	<div class="right">
                            <a class="btn-suspend ascriptolutionbluebutton" href="#">{$lang183|upper}</a>
                            <a class="btn-activate ascriptolutiongreenbutton" href="#">{$lang184|upper}</a>
                            <a href="#" class="btn-delete ascriptolutionredbutton"><span>{$lang185|upper}</span></a>
                        </div>
                    </div>
                            					
					<div class="db-main-table">
						<table>
							<thead>
								<tr>
									<td style="text-align:left;">{$lang585}</td>
								</tr>
							</thead>
							<tbody>
                            {if $posts|@count eq "0"}
                            <tr>
                                <td>
                                {$lang584}
                                </td>
                            </tr>
                            {else}
                            <tr>
                                <td style="text-align: left !important; white-space: normal !important;">
                                	<form action="{$baseurl}/manage_gigs" id="gigs_form" method="post">
                                    {section name=i loop=$posts}
                                    {insert name=seo_clean_titles assign=title value=a title=$posts[i].gtitle}                        
                                    <div class="newscriptolution {if $smarty.section.i.iteration is even}newscriptolutionnewcolor{/if}">
                                        <div class="newscriptolutionimg responsivescriptolutionimages">
                                            <a href="{$baseurl}/{$posts[i].seo|stripslashes}/{$posts[i].PID|stripslashes}/{$title}"><img src="{$purl}/t4/{$posts[i].p1}?{$smarty.now}" alt="{$posts[i].gtitle|stripslashes}" width="162" height="100" />{if $posts[i].youtube ne ""}{include file="scriptolution_bit_yt_small.tpl"}{/if}</a>
                                            {if $posts[i].feat eq "1"}<span class="featured">{$lang526}</span>{/if}
                                            <br />
                                            <a href="{$baseurl}/edit?id={$posts[i].PID}" class="btn-edit">[{$lang141}]</a>
                                            
                                            {if $posts[i].feat eq "0"}
                                            <div class="scriptolutionpaddingtop5"></div>
                                            <a href="{$baseurl}/feature?id={$posts[i].PID}" class="ascriptolutiongreenbutton" style="color:#FFF">{$lang465}</a>
                                            {/if}
                                            
                                        </div>
                                        <div class="newscriptolutiondetails width480 scriptolutionpaddingleft15">
                                            <h3>
                                            	{if $posts[i].active eq "1"}
                                                <input class="checkbox approved" id="gig_" name="gig[]" type="checkbox" value="{$posts[i].PID}" />
                                                {elseif $posts[i].active eq "2"}
                                                <input class="checkbox suspended" id="gig_" name="gig[]" type="checkbox" value="{$posts[i].PID}" />
                                                {elseif $posts[i].active eq "0"}
                                                <input class="checkbox inactive" id="gig_" name="gig[]" type="checkbox" value="{$posts[i].PID}" />
                                                {/if}
                                                <a href="{$baseurl}/{$posts[i].seo|stripslashes}/{$posts[i].PID|stripslashes}/{$title}">{$lang62} {$posts[i].gtitle|stripslashes|mb_truncate:50:"...":'UTF-8'} {if $scriptolution_cur_pos eq "1"}{$lang589} {$posts[i].price|stripslashes}{$lang197}{else}{$lang63}{$posts[i].price|stripslashes}{/if}</a></h3>
                                            <div>
                                            	{if $posts[i].active eq "1"}
                                                <div style="color:limegreen;">{$lang191}: {$lang192}</div>
                                                {elseif $posts[i].active eq "2"}
                                                <div style="color:orange;">{$lang191}: {$lang193}</div>
                                                {elseif $posts[i].active eq "0"}
                                                <div style="color:orange;">{$lang191}: {$lang194}</div>
                                                {elseif $posts[i].active eq "4"}
                                                <div style="color:orange;">{$lang191}: {$lang502}</div>
                                                {/if}
                                            </div>
                                            <h5><a href="{$baseurl}/manage_orders?status=in_progress">{$lang195}:</a><span class="open-orders">{insert name=active_orders value=a assign=ao PID=$posts[i].PID}{$ao}</span></h5>
                                            <h5><a href="{$baseurl}/manage_orders?status=in_progress">{$lang196}:</a>{insert name=done_orders value=a assign=co PID=$posts[i].PID}{$co}</h5>
                                            <h5>{$lang181}: {$posts[i].viewcount|stripslashes}</h5>
                                            <h5>{$lang198}: <span class="gains">{if $scriptolution_cur_pos eq "1"}{$posts[i].rev|stripslashes}{$lang197}{else}{$lang197}{$posts[i].rev|stripslashes}{/if}</span></h5>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                    {/section}
                                    <input type="hidden" name="subme" value="1" />
                                    </form>
                                </td>
                            </tr>
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