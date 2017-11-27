{include file="scriptolution_error7.tpl"}
<div class="bodybg scriptolutionpaddingtop15">
	<div class="whitebody scriptolutionpaddingtop30 newgray">
		<div class="inner-wrapper">
			<div class="clear"></div>
			<div class="scriptolution-no-side">
				<div class="whiteBox padding15 scriptolutionshop">
                	<div id="scriptolution_dotcom_shop">					
                    <h1>{$lang632}</h1>
                    </div>
                    <script language="JavaScript" type="text/JavaScript"> 
					function Scriptolution_dotcom_jumpMenu(targ,selObj,restore){
					  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'"); 
					  if (restore) selObj.selectedIndex=0; 
					} 
					</script>
                    <div class="scripto_lution_rcatwrapper">
                      <select onChange="Scriptolution_dotcom_jumpMenu('parent',this,0)" class="text" id="scriptolution_req_cat" name="scriptolution_req_cat">
                      <option value="{$baseurl}/requests">{$lang66}</option>
                      {insert name=get_categories assign=c}
                      {section name=i loop=$c}
                        <option value="{$baseurl}/requests?c={$c[i].CATID|stripslashes}" {if $scriptolution_req_cat eq $c[i].CATID}selected="selected"{/if}>{$c[i].name|stripslashes}</option>
                        {if $c[i].CATID ne "0"}
                            {insert name=get_subcategories assign=scats parent=$c[i].CATID}
                            {section name=j loop=$scats}
                            <option value="{$baseurl}/requests?c={$scats[j].CATID}" {if $scriptolution_req_cat eq $scats[j].CATID}selected="selected"{/if}>- {$scats[j].name|stripslashes}</option>
                            {/section}
                        {/if}
                      {/section}
                      </select>
                    </div>                                    
					<div class="scriptolution-table myrequests">
						<table>
							<thead>
								<tr>
									<td style="text-align:left;">{$lang158}</td>
                                    <td style="text-align:left;">{$lang630}</td>
                                    <td class="scriptolutionmhide" style="text-align:left;">{$lang631}</td>
                                    <td class="scriptolutionmhide" style="text-align:left;">{$lang623}</td>
                                    <td class="scriptolutionmhide">{$lang625}</td>
								</tr>
							</thead>
							<tbody>
                            {if $posts|@count eq "0"}
                            <tr>
                                <td colspan="5">
                                {$lang633}
                                <div class="scriptolutionpaddingbottom10"></div>
                                <a href="{$baseurl}/newrequest" class="sendascriptolutionoffer">{$lang621}</a>
                                </td>
                            </tr>
                            {else}
                            	{section name=i loop=$posts}
                                {insert name=seo_clean_titles assign=title value=a title=$posts[i].gtitle}
								<tr>
									<td class="status-star">
                                        <div class="scriptolutionviewrequest3">
                                        	<a href="{$baseurl}/{insert name=get_seo_profile value=a username=$posts[i].username|stripslashes}">{$posts[i].username|stripslashes|truncate:15:"...":true}</a>
                                        </div>
									</td>
									<td class="ellipsis-wrap">
										<div class="ellipsissuggest"> 
                                        	<div class="scriptolutionviewrequest1">
                                        		{$posts[i].scriptolutiondesc|stripslashes}
                                            </div>
										</div>
									</td>
                                    <td class="scriptolutionmhide">
                                    	<div class="offersbuttonscriptolutionnopointer" href="">{insert name=scriptolutionoffercnt value=a assign=socnt REQUESTID=$posts[i].REQUESTID}{$socnt} {if $socnt eq "1"}{$lang640}{else}{$lang631}{/if}</div>
                                    </td>
                                    <td class="scriptolutionmhide">
                                    	{$posts[i].scriptolutiondays} {$lang131}
                                    </td>
                                    <td class="scriptolutionmhide">
                                    	{if $scriptolution_cur_pos ne "1"}{$lang197}{/if}{$posts[i].scriptolutionprice}{if $scriptolution_cur_pos eq "1"}{$lang197}{/if}
                                    </td>
								</tr>
                                <tr>
                                    <td class="scriptolutionmunhide">
                                    	<div class="offersbuttonscriptolutionnopointer">{$socnt} {if $socnt eq "1"}{$lang640}{else}{$lang631}{/if}</div>
                                    </td>
                                    <td class="scriptolutionmunhide">
                                    	{$posts[i].scriptolutiondays} {$lang131}
                                    	<span style="margin-right:30px;"></span>
                                    	{if $scriptolution_cur_pos ne "1"}{$lang197}{/if}{$posts[i].scriptolutionprice}{if $scriptolution_cur_pos eq "1"}{$lang197}{/if}
                                    </td>
								</tr>
                                <tr>
                                    <td class="scriptolutiontopborder0" colspan="2">
                                    	<a class="sendascriptolutionoffer" href="{$baseurl}/sendoffer?REQID={$posts[i].REQUESTID}">{$lang634}</a>
                                    </td>
								</tr>
                                {if $smarty.section.i.last}
                                <tr>
                                    <td colspan="5">
                                       <div></div>
                                    </td>
                                </tr>
                                {else}
                                <tr>
                                    <td colspan="5" class="scriptolutiontdhrline">
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
		</div>    
	</div>
</div>