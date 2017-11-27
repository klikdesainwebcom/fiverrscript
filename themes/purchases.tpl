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
					<h1>{$lang462}</h1>                    
					<div class="db-main-table">
						<table>
							<thead>
								<tr>
									<td style="text-align:left;">{$lang110}</td>
									<td>{$lang140}</td>
                                    <td>&nbsp;</td>
                                    <td>{$lang191}</td>
									<td>{$lang389}</td>
								</tr>
							</thead>
							<tbody>
                            {if $o|@count eq "0"}
                            <tr>
                                <td colspan="5">
                                {$lang464}
                                </td>
                            </tr>
                            {else}
                            	{section name=i loop=$o}
								<tr>
									<td class="status-star">
                                    	{insert name=get_time_to_days_ago value=a time=$o[i].time}
									</td>
                                    <td >#{$o[i].PID}</td> 
									<td class="ellipsis-wrap">
										<div class="ellipsis"> 
                                        	{$o[i].gtitle|stripslashes}
										</div>
									</td>
                                    <td class="status reversal" title="{$lang463}"><div>{$lang463}</div></td> 
                                    <td>{if $scriptolution_cur_pos eq "1"}{$o[i].price}{$lang197}{else}{$lang197}{$o[i].price}{/if}</td>
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
