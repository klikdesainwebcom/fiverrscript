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
					<h1>{$lang154}</h1>
                    <h4>{$lang199}</h4>
					<div class="whiteBox inside">
						<div class="block inside">
							<span class="number"><a href="{$baseurl}/manage_orders?s=active&b={$b}&a={$a}">{$countd}</a></span>
							<span class="descr">{$lang200}</span>
						</div>
						<div class="block inside">
							<span class="number"><a href="{$baseurl}/manage_orders?s=delivered&b={$b}&a={$a}">{$countc}</a></span>
							<span class="descr">{$lang201}</span>
						</div>
						<div class="block inside">
							<span class="number"><a href="{$baseurl}/manage_orders?s=completed&b={$b}&a={$a}">{$countb}</a></span>
							<span class="descr">{$lang202}</span>
						</div>
						<div class="block inside last">
							<span class="number"><a href="{$baseurl}/manage_orders?s=cancelled&b={$b}&a={$a}">{$counta}</a></span>
							<span class="descr">{$lang203}</span>
						</div>
					</div>
					<div class="db-main-table">
						<table>
							<thead>
								<tr>
									<td colspan="2" style="text-align:left;"><a href="{$baseurl}/manage_orders?s={$s}&b=id&a={if $a eq "asc"}desc{else}asc{/if}">{$lang140}</a></td>
									<td><a href="{$baseurl}/manage_orders?s={$s}&b=date&a={if $a eq "asc"}desc{else}asc{/if}">{$lang360}</a></td>
									<td><a href="{$baseurl}/manage_orders?s={$s}&b=status&a={if $a eq "asc"}desc{else}asc{/if}">{$lang191}</a></td>
								</tr>
							</thead>
							<tbody>
                            {if $o|@count eq "0"}
                            <tr>
                                <td colspan="4">
                                {$lang204}
                                </td>
                            </tr>
                            {else}
                            	{section name=i loop=$o}
								<tr>
									<td class="status-star">
                                    	<a href="{$baseurl}/track?id={$o[i].OID}">#{$o[i].OID}</a>
									</td>
									<td class="ellipsis-wrap">
										<div class="ellipsis"> 
                                        	<a href="{$baseurl}/track?id={$o[i].OID}">{$o[i].gtitle|stripslashes}</a>
										</div>
									</td>
									<td>{insert name=get_time_to_days_ago value=a time=$o[i].time_added}</td>
                                    {if $o[i].status eq "1"}
                                        {insert name=late value=a assign=late time=$o[i].stime days=$o[i].days}
                                        {if $late eq "1"}
                                        <td class="status late_delivery" title="{$lang375}"><div>{$lang363}</div></td>
                                        {else}
                                        <td class="status in_progress" title="{$lang376}"><div>{$lang365}</div></td>
                                        {/if}
                                    {elseif $o[i].status eq "2"}
                                    <td class="status buyer_cancelled" title="{$lang367}"><div>{$lang203}</div></td>
                                    {elseif $o[i].status eq "3"}
                                    <td class="status seller_cancelled" title="{$lang377}"><div>{$lang378}</div></td>
                                    {elseif $o[i].status eq "4"}
                                    <td class="status delivered" title="{$lang370}"><div>{$lang201}</div></td>
                                    {elseif $o[i].status eq "5"}
                                    <td class="status completed" title="{$lang371}"><div>{$lang202}</div></td>
                                    {elseif $o[i].status eq "6"}
                                        {insert name=late value=a assign=late time=$o[i].stime days=$o[i].days}
                                        {if $late eq "1"}
                                        <td class="status late_delivery" title="{$lang375}"><div>{$lang363}</div></td>
                                        {else}
                                        <td class="status dispute" title="{$lang372}"><div>{$lang320}</div></td>
                                        {/if}
                                    {elseif $o[i].status eq "7"}
                                    <td class="status buyer_cancelled" title="{$lang374}"><div>{$lang373}</div></td>
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