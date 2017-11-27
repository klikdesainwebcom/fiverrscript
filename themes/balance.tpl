<script src="{$baseurl}/js/jquery.qtip-1.0.0-rc3.js" type="text/javascript"></script> 
<script src="{$baseurl}/js/jquery.corner.js" type="text/javascript"></script> 
<script src="{$baseurl}/js/balance.js" type="text/javascript"></script>
{include file="scriptolution_error7.tpl"}
<div class="bodybg scriptolutionpaddingtop15">
	<div class="whitebody scriptolutionpaddingtop30 gray">
		<div class="inner-wrapper">
			<div class="clear"></div>
			<div class="left-side">
				<div class="whiteBox twoHalfs padding15 scriptolutionshop">
                    <h1>{$lang33}</h1>
                    <h4>{$lang206}</h4>
                    
                    <div class="whiteBox inside" style="margin-bottom: 15px;">
						<div style="font-size: 20px; font-family: 'latobold', sans-serif; color: #444444;">{$lang205}: {if $scriptolution_cur_pos eq "1"}{$funds}{$lang197}{else}{$lang197}{$funds}{/if}</div>
					</div>					
                    
					<div class="db-main-table">
						<table>
							<thead>
								<tr>
									<td style="text-align:left;">{$lang110}</td>
									<td>{$lang140}</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
									<td>{$lang389}</td>
								</tr>
							</thead>
							<tbody>
                            {if $o|@count eq "0"}
                            <tr>
                                <td colspan="5">
                                {$lang210} <a href="{$baseurl}/">{$lang211}</a>
                                </td>
                            </tr>
                            {else}
                            	{section name=i loop=$o}
                                {insert name=get_gtitle value=a assign=gtitle oid=$o[i].OID}
								<tr>
									<td class="status-star">
                                    	{insert name=get_time_to_days_ago value=a time=$o[i].time}
									</td>
                                    <td>
                                    	{if $gtitle eq ""}#{$o[i].OID}{else}<a href="{$baseurl}/track?id={$o[i].OID}">#{$o[i].OID}</a>{/if}
                                    </td>
									<td class="ellipsis-wrap">
										<div class="ellipsis"> 
                                        	{if $gtitle eq ""}{$lang384}{else}{$gtitle|stripslashes}{/if}
										</div>
									</td>
									{if $o[i].t eq "1"}
                                    <td class="status payment" title="{$lang385}: {if $scriptolution_cur_pos eq "1"}{$o[i].price}{$lang197}{else}{$lang197}{$o[i].price}{/if}"><div>{$lang387}</div></td>
                                    {else}
                                    <td class="status reversal" title="{$lang386}: {if $scriptolution_cur_pos eq "1"}{$o[i].price}{$lang197}{else}{$lang197}{$o[i].price}{/if}"><div>{$lang388}</div></td> 
                                    {/if}
                                    {if $scriptolution_enable_processing_fee eq "1"}
                                    	{if $o[i].scriptolution_totalwfees3 ne "0.00"}
                                        <td>{if $scriptolution_cur_pos eq "1"}{$o[i].scriptolution_totalwfees3}{$lang197}{else}{$lang197}{$o[i].scriptolution_totalwfees3}{/if}</td> 
                                        {else}
                                        <td>{if $scriptolution_cur_pos eq "1"}{$o[i].price}{$lang197}{else}{$lang197}{$o[i].price}{/if}</td> 
                                        {/if}
                                    {else}
                                    <td>{if $scriptolution_cur_pos eq "1"}{$o[i].price}{$lang197}{else}{$lang197}{$o[i].price}{/if}</td>                          
                                    {/if}
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
       