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
                    <h1>{$lang208}</h1>
                    <h4>{$lang206}</h4>
                    
                    
                    {insert name=wdreq value=a assign=wreqnt}       
                    {if $afunds ne "0"}
                    {if $wreqnt eq "0"}
                    <form name="wdfrm" id="wdfrm" method="post" style="padding:0; margin:0">
                    <input type="hidden" name="wdfunds" value="1" />
                    </form>
                    <form name="wdfrm2" id="wdfrm2" method="post" style="padding:0; margin:0">
                    <input type="hidden" name="wdfunds2" value="1" />
                    </form>
                    {/if}
                    {/if}
                    {literal}
					<script language="javascript" type="text/javascript">
                    function toggle(obj) {
                        var el = document.getElementById(obj);
                        if ( el.style.display != 'none' ) {
                            $('#' + obj).slideUp();
                        }
                        else {
                            $('#' + obj).slideDown();
                        }
                    }
                    </script>
                    <style>
                    .info2{border:1px solid #DCDCCA;background:#DCDCCA;border-bottom:1px solid #CCCCBA!important;color:#5C5C5A;font-weight:bold;text-shadow:none;margin:0 0 10px;padding:10px 10px 10px 13px;}
                    .info2{border:1px solid #E4ECEE;background:#E4ECEE;color:#577;font-weight:bold;text-shadow:#eff 1px 1px;border-bottom:1px solid #D4DCDE!important;margin:0 0 10px;}
                    .info2{overflow:hidden;margin:0!important;padding:5px 5px 5px 13px;}
                    .info2 span.right{float:right;background:#008dcd;border:1px solid #bcc;padding:4px 6px;}
                    .info2 span.right a{text-decoration:none;text-shadow:none;color:#fff;}
                    .info2 span.right:hover a{color:#008dcd;}
                    .info2 span.right:hover{background:#fff;border:1px solid #008dcd;padding:4px 6px;}
                    .info2 span.right2{float:right;background:#390;border:1px solid #bcc;padding:4px 6px;margin-left:5px;}
                    .info2 span.right2 a{text-decoration:none;text-shadow:none;color:#fff;}
                    .info2 span.right2:hover a{color:#390;}
                    .info2 span.right2:hover{background:#fff;border:1px solid #390;padding:4px 6px;}
                    .info2 span.right em{font-style:normal;}
                    .info2 span.right.disabled{background:#fafafa;border:1px solid #dadada;cursor:text!important;padding:4px 6px;}
                    .info2 span.right.disabled a{cursor:text!important;color:#aaa;}
                    .info2 span.right.disabled:hover{border:1px solid #dadada!important;}										
					.scriptolutionshop .whiteBox.inside .block.inside {
					  width: 293px !important;
					}
					.block.inside .number {
					  font-size: 50px !important;
					}
					.whiteBox.inside {
					  margin-bottom: -6px !important;
					}
					.block .biggdescr {
					  float: left;
					  width: 100%;
					  text-align: center;
					  font-size: 16px;
					  color: #049bcf;
					}
					.info{color:#5C5C5A;font-weight:bold;text-shadow:none;margin:0 0 10px;padding:10px 10px 10px 13px; width:220px;float: right;}
                    .info{color:#577;font-weight:bold;text-shadow:#eff 1px 1px;margin:0 0 10px;}
                    .info{overflow:hidden;margin:0!important;padding:5px 5px 5px 13px;}
                    .info span.right{float:right;background:#008dcd;border:1px solid #bcc;padding:4px 6px;}
                    .info span.right a{text-decoration:none;text-shadow:none;color:#fff;}
                    .info span.right:hover a{color:#008dcd;}
                    .info span.right:hover{background:#fff;border:1px solid #008dcd;padding:4px 6px;}
                    .info span.right2{float:right;background:#390;border:1px solid #bcc;padding:4px 6px;margin-left:5px;}
                    .info span.right2 a{text-decoration:none;text-shadow:none;color:#fff;}
                    .info span.right2:hover a{color:#390;}
                    .info span.right2:hover{background:#fff;border:1px solid #390;padding:4px 6px;}
                    .info span.right em{font-style:normal;}
                    .info span.right.disabled{background:#fafafa;border:1px solid #dadada;cursor:text!important;padding:4px 6px;}
                    .info span.right.disabled a{cursor:text!important;color:#aaa;}
                    .info span.right.disabled:hover{border:1px solid #dadada!important;}
					@media only screen and (max-width: 1000px) {
						.scriptolutionshop .whiteBox.inside .block.inside {
						  width: 100% !important;
						    border-right: 0px !important;
						}
					}
                    </style>
                    {/literal}
                    
                    <div class="info">                            
                    <span class="{if $afunds eq "0" OR $wreqnt GT "0"}disabled{/if} right"><strong><a href="#" {if $afunds ne "0"}onclick="toggle('wdsection');"{/if}>{if $wreqnt GT "0"}{$lang396}{else}{$lang212}{/if}</a></strong></span>
                    </div>
                    
                    <div class="info2" id="wdsection" style="display:none; clear:both">   
                    	{if $enable_scriptolutionminwd eq "1"}
                        	{if $scriptolutionminwd gt $afunds}
                            	{$lang653} {if $scriptolution_cur_pos eq "1"}{$scriptolutionminwd}{$lang197}{else}{$lang197}{$scriptolutionminwd}{/if}
                            {else}
                            	{if $enable_alertpay eq "1"}
                                <span class="{if $afunds eq "0" OR $wreqnt GT "0"}disabled{/if} right2"><strong><a href="#" {if $afunds ne "0"}onclick="document.wdfrm2.submit();"{/if}>{if $wreqnt GT "0"}{$lang396}{else}{$lang451}{/if}</a></strong></span>
                                {/if}
                                {if $enable_paypal eq "1"}
                                <span class="{if $afunds eq "0" OR $wreqnt GT "0"}disabled{/if} right"><strong><a href="#" {if $afunds ne "0"}onclick="document.wdfrm.submit();"{/if}>{if $wreqnt GT "0"}{$lang396}{else}{$lang450}{/if}</a></strong></span>
                                {/if}
                            {/if}
                        {else}                         
                            {if $enable_alertpay eq "1"}
                            <span class="{if $afunds eq "0" OR $wreqnt GT "0"}disabled{/if} right2"><strong><a href="#" {if $afunds ne "0"}onclick="document.wdfrm2.submit();"{/if}>{if $wreqnt GT "0"}{$lang396}{else}{$lang451}{/if}</a></strong></span>
                            {/if}
                            {if $enable_paypal eq "1"}
                            <span class="{if $afunds eq "0" OR $wreqnt GT "0"}disabled{/if} right"><strong><a href="#" {if $afunds ne "0"}onclick="document.wdfrm.submit();"{/if}>{if $wreqnt GT "0"}{$lang396}{else}{$lang450}{/if}</a></strong></span>
                            {/if}
                        {/if}
                    </div>
                        
                                         
					<div class="whiteBox inside">
						<div class="block inside">
							<span class="number">{if $scriptolution_cur_pos eq "1"}{$afunds}{$lang197}{else}{$lang197}{$afunds}{/if}</span>
							<span class="biggdescr">{$lang213}</span>
                            <span class="descr">{$lang214}</span>
						</div>
						<div class="block inside">
							<span class="number">{if $scriptolution_cur_pos eq "1"}{$app}{$lang197}{else}{$lang197}{$app}{/if}</span>
							<span class="biggdescr">{$lang194}</span>
                            <span class="descr">{$lang394}</span>
						</div>
						<div class="block inside last">
							<span class="number">{if $scriptolution_cur_pos eq "1"}{$clr}{$lang197}{else}{$lang197}{$clr}{/if}</span>
							<span class="biggdescr">{$lang215}</span>
                            <span class="descr">{$lang216}</span>
						</div>
					</div>
                    
                    <div class="whiteBox inside">
						<div class="block inside">
							<span class="number">{if $scriptolution_cur_pos eq "1"}{$upcoming}{$lang197}{else}{$lang197}{$upcoming}{/if}</span>
							<span class="biggdescr">{$lang217}</span>
                            <span class="descr">{$lang218}</span>
						</div>
						<div class="block inside">
							<span class="number">{if $scriptolution_cur_pos eq "1"}{$withdrawn}{$lang197}{else}{$lang197}{$withdrawn}{/if}</span>
							<span class="biggdescr">{$lang219}</span>
                            <span class="descr">{$lang220}</span>
						</div>
						<div class="block inside last">
							<span class="number">{if $scriptolution_cur_pos eq "1"}{$used}{$lang197}{else}{$lang197}{$used}{/if}</span>
							<span class="biggdescr">{$lang221}</span>
                            <span class="descr">{$lang222}</span>
						</div>
					</div>
                    
                    <div style="padding-bottom: 15px;clear: both;"></div>
                    
                    <div class="whiteBox inside">
						<div style="font-size: 18px; color: #208305;">{$lang207} {if $scriptolution_cur_pos eq "1"}{$overall}{$lang197}{else}{$lang197}{$overall}{/if}</b></div>
					</div>
                    
                    <div style="padding-bottom: 15px;clear: both;"></div>
                    
                    
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
                            {if $p|@count eq "0"}
                            <tr>
                                <td colspan="5">
                                {$lang209}
                                </td>
                            </tr>
                            {else}
                            	{section name=i loop=$p}
                                {if $p[i].IID GT "0"}
                                {insert name=get_ctp value=a assign=myctp IID=$p[i].IID}
                                {insert name=get_yprice value=a assign=yprice p=$p[i].price c=$myctp}
                                {else}
                                {insert name=get_yprice value=a assign=yprice p=$p[i].price c=$p[i].ctp}
                                {/if}
                                {insert name=get_gtitle value=a assign=gtitle oid=$p[i].OID}
								<tr>
									<td class="status-star">
                                    	{insert name=get_time_to_days_ago value=a time=$p[i].time}
									</td>
                                    <td>
                                    	{if $gtitle eq ""}#{$p[i].OID}{else}<a href="{$baseurl}/track?id={$p[i].OID}">#{$p[i].OID}</a>{/if}
                                    </td>
									<td class="ellipsis-wrap">
										<div class="ellipsis"> 
                                        	{if $gtitle eq ""}{$lang384}{else}{$gtitle|stripslashes}{/if}
										</div>
									</td>
									{if $p[i].status eq "5"}
                                        {insert name=get_days_withdraw value=a assign=wd t=$p[i].cltime}
                                        {if $wd GT "0"}
                                        <td class="status clearing &nbsp;<u>{$wd}</u>" title="{$wd} {$lang391}"><div>{$lang392} &nbsp;<u>{$wd}</u></div></td>
                                        <td class="gross last" width="5px"><div>{if $scriptolution_cur_pos eq "1"}{$yprice}{$lang197}{else}{$lang197}{$yprice}{/if}</div></td>
                                        {else}
                                            {if $p[i].wd eq "1"}
                                            <td class="status withdrawn" title="{$lang397}"><div>{$lang397}</div></td>
                                            {else}
                                            <td class="status cleared" title="{$lang393}"><div>{$lang393}</div></td>
                                            {/if}
                                            <td class="gross last" width="5px"><div>{if $scriptolution_cur_pos eq "1"}{$yprice}{$lang197}{else}{$lang197}{$yprice}{/if}</div></td>
                                        {/if}
                                    {elseif $p[i].status eq "2" OR $p[i].status eq "3" OR $p[i].status eq "7"}
                                    <td class="status cancelled" title="{$lang390}"><div>{$lang203}</div></td>
                                    <td class="gross last" width="5px"><div>{if $scriptolution_cur_pos eq "1"}0{$lang197}{else}{$lang197}0{/if}</div></td>
                                    {elseif $p[i].status eq "4"}
                                    <td class="status completed" title="{$lang140}"><div>{$lang201}</div></td>
                                    <td class="gross last" width="5px"><div>{if $scriptolution_cur_pos eq "1"}{$yprice}{$lang197}{else}{$lang197}{$yprice}{/if}</div></td>
                                    {else}
                                    <td class="status withdrawal" title="{$lang362}"><div>{$lang362}</div></td>
                                    <td class="gross last" width="5px"><div>{if $scriptolution_cur_pos eq "1"}{$yprice}{$lang197}{else}{$lang197}{$yprice}{/if}</div></td>
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
       