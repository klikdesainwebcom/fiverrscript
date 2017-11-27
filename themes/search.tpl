{include file="scriptolution_error7.tpl"}
<div class="bodybg topspace">
	<div class="tagcloud">
        <h2>{$lang124}</h2>
        <h3>"{$tag|stripslashes}"</h3>
    </div>
	<div class="inshadow">
		<div class="whitebox">
        	
            <div class="cusongtitle">
                <h3>{$lang109}:</h3>
                <p>
                    {if $s eq "d" OR $s eq ""}
                    <a href="{$baseurl}/search?s=dz&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}{$scriptolutionlocstring}" class="active">{$lang110}</a> 
                    {else}
                    <a href="{$baseurl}/search?s=d&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}{$scriptolutionlocstring}" {if $s eq "d" OR $s eq "dz" OR $s eq ""}class="active"{/if}>{$lang110}</a> 
                    {/if}
                    {if $s eq "p"}
                    <a href="{$baseurl}/search?s=pz&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}{$scriptolutionlocstring}" class="active">{$lang111}</a> 
                    {else}
                    <a href="{$baseurl}/search?s=p&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}{$scriptolutionlocstring}" {if $s eq "p" OR $s eq "pz"}class="active"{/if}>{$lang111}</a> 
                    {/if}
                    {if $s eq "r"}
                    <a href="{$baseurl}/search?s=rz&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}{$scriptolutionlocstring}" class="active">{$lang112}</a>
                    {else}
                    <a href="{$baseurl}/search?s=r&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}{$scriptolutionlocstring}" {if $s eq "r" OR $s eq "rz"}class="active"{/if}>{$lang112}</a>
                    {/if} 
                    {if $s eq "c"}
                    <a href="{$baseurl}/search?s=cz&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}{$scriptolutionlocstring}" class="active">{$lang436}</a> 
                    {else}
                    <a href="{$baseurl}/search?s=c&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}{$scriptolutionlocstring}" {if $s eq "c" OR $s eq "cz"}class="active"{/if}>{$lang436}</a> 
                    {/if}
                    {if $s eq "e"}
                    <a href="{$baseurl}/search?s=ez&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}{$scriptolutionlocstring}" class="active">{$lang494}</a> 
                    {else}
                    <a href="{$baseurl}/search?s=e&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}{$scriptolutionlocstring}" {if $s eq "e" OR $s eq "ez"}class="active"{/if}>{$lang494}</a> 
                    {/if}
                    {if $price_mode eq "3"}
                    <script language="JavaScript" type="text/JavaScript"> 
                    function Scriptolution_jumpMenu(targ,selObj,restore){
                      eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'"); 
                      if (restore) selObj.selectedIndex=0; 
                    } 
                    </script> 
                    &nbsp;&nbsp;&nbsp;
                    {insert name=get_packs value=a assign=packs}
                    <select onChange="Scriptolution_jumpMenu('parent',this,0)" class="dropnewscriptolution">
                    <option value="{$baseurl}">{$lang495}</option>
                    {section name=p loop=$packs}
                    <option value="{$baseurl}/search?s=o&p={$packs[p].pprice|stripslashes}&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}{$scriptolutionlocstring}" {if $p eq $packs[p].pprice|stripslashes}selected="selected"{/if}>{if $scriptolution_cur_pos eq "1"}{$packs[p].pprice|stripslashes}{$lang197}{else}{$lang197}{$packs[p].pprice|stripslashes}{/if}</option>
                    {/section}
                    </select>
                    {/if}             
                </p>
                <div class="topright">
                    {if $sdisplay eq "list"}
                    <a href="{$baseurl}/search?query={$tag}&search_in={$search_in}&c={$c}&page={$currentpage}{$adds}"><img src="{$imageurl}/leftbox_hover.png" /></a>
                    <a href="{$baseurl}/search?query={$tag}&search_in={$search_in}&c={$c}&page={$currentpage}{$adds}&sdisplay=list"><img src="{$imageurl}/rightbox.png" /></a>
                    {else}
                    <a href="{$baseurl}/search?query={$tag}&search_in={$search_in}&c={$c}&page={$currentpage}{$adds}"><img src="{$imageurl}/leftbox.png" /></a>
                    <a href="{$baseurl}/search?query={$tag}&search_in={$search_in}&c={$c}&page={$currentpage}{$adds}&sdisplay=list"><img src="{$imageurl}/rightbox_hover.png" /></a>
                    {/if}
                </div>
                <div class="clear"></div>
            </div>

            <div class="songslist">
                <div class="cuscriptolutionongtitle">
                    <p>
                        {if $s eq "d" OR $s eq ""}
                        <a href="{$baseurl}/search?s=dz&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}{$scriptolutionlocstring}" class="active">{$lang110}</a> 
                        {else}
                        <a href="{$baseurl}/search?s=d&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}{$scriptolutionlocstring}" {if $s eq "d" OR $s eq "dz" OR $s eq ""}class="active"{/if}>{$lang110}</a> 
                        {/if}
                        {if $s eq "p"}
                        <a href="{$baseurl}/search?s=pz&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}{$scriptolutionlocstring}" class="active">{$lang111}</a> 
                        {else}
                        <a href="{$baseurl}/search?s=p&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}{$scriptolutionlocstring}" {if $s eq "p" OR $s eq "pz"}class="active"{/if}>{$lang111}</a> 
                        {/if}
                        {if $s eq "r"}
                        <a href="{$baseurl}/search?s=rz&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}{$scriptolutionlocstring}" class="active">{$lang112}</a>
                        {else}
                        <a href="{$baseurl}/search?s=r&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}{$scriptolutionlocstring}" {if $s eq "r" OR $s eq "rz"}class="active"{/if}>{$lang112}</a>
                        {/if} 
                    </p>
                    <p>
                        {if $s eq "c"}
                        <a href="{$baseurl}/search?s=cz&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}{$scriptolutionlocstring}" class="active">{$lang436}</a> 
                        {else}
                        <a href="{$baseurl}/search?s=c&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}{$scriptolutionlocstring}" {if $s eq "c" OR $s eq "cz"}class="active"{/if}>{$lang436}</a> 
                        {/if}
                        {if $s eq "e"}
                        <a href="{$baseurl}/search?s=ez&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}{$scriptolutionlocstring}" class="active">{$lang494}</a> 
                        {else}
                        <a href="{$baseurl}/search?s=e&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}{$scriptolutionlocstring}" {if $s eq "e" OR $s eq "ez"}class="active"{/if}>{$lang494}</a> 
                        {/if}
                        {if $price_mode eq "3"}
                        <script language="JavaScript" type="text/JavaScript"> 
                        function Scriptolution_jumpMenu(targ,selObj,restore){
                          eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'"); 
                          if (restore) selObj.selectedIndex=0; 
                        } 
                        </script> 
                        &nbsp;&nbsp;&nbsp;
                        {insert name=get_packs value=a assign=packs}
                        <select onChange="Scriptolution_jumpMenu('parent',this,0)" class="dropnewscriptolution">
                        <option value="{$baseurl}">{$lang495}</option>
                        {section name=p loop=$packs}
                        <option value="{$baseurl}/search?s=o&p={$packs[p].pprice|stripslashes}&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}{$scriptolutionlocstring}" {if $p eq $packs[p].pprice|stripslashes}selected="selected"{/if}>{if $scriptolution_cur_pos eq "1"}{$packs[p].pprice|stripslashes}{$lang197}{else}{$lang197}{$packs[p].pprice|stripslashes}{/if}</option>
                        {/section}
                        </select>
                        {/if}             
                    </p>
                    <div class="clear"></div>
                </div>
                <div class="cusongslist">
                    {if $sdisplay eq "list"}
                    {include file="scriptolution_bit_list_last3.tpl"}
                    <div style="padding-bottom:10px;"></div> 
                    {else}
                    {include file="scriptolution_bit_last3.tpl"}                
                    {/if}
                    <div class="clear"></div>
                </div>
                <div align="center">
                    <div class="paging">
                        <div class="p1">
                            <ul>
                                {$pagelinks}
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            	<div class="rss-link"><a href="{$baseurl}/rss">{$lang108}</a></div>
            	<div class="clear" style="padding-bottom:20px;"></div>
            </div>
            <div class="leftbar">
                <div class="allmusic">
                <h3>{$lang66}</h3>
                    <ul>              
                    	<li><a href="{$baseurl}/search?query={$tag}&search_in=scriptolution_all{$adds}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}{$scriptolutionlocstring}">{if $cname eq $c[i].name}<font color="#689c2c">{$lang522}</font>{else}{$lang522}{/if}</a></li>          
                        {insert name=get_categories assign=scriptolutionc}
                        {section name=i loop=$scriptolutionc}
                        <li><a href="{$baseurl}/search?query={$tag}&search_in=scriptolution_category&c={$scriptolutionc[i].CATID}{$adds}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}{$scriptolutionlocstring}">{if $cname eq $scriptolutionc[i].name}<font color="#689c2c">{$scriptolutionc[i].name|stripslashes}</font>{else}{$scriptolutionc[i].name|stripslashes}{/if}</a></li>
                        {insert name=get_subcategories assign=subcat value=var parent=$scriptolutionc[i].CATID}
                        {if $subcat|@count GT "0"}
                            {section name=sc loop=$subcat}
                            <li><a href="{$baseurl}/search?query={$tag}&search_in=scriptolution_category&c={$subcat[sc].CATID}{$adds}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}{$scriptolutionlocstring}">- {if $cname eq $subcat[sc].name}<font color="#689c2c">{$subcat[sc].name|stripslashes}</font>{else}{$subcat[sc].name|stripslashes}{/if}</a></li>
                            {/section}
                        {/if}
                        {/section}
                    </ul>
                </div>
                
                {if $enablescriptolutionlocations eq "1"}
                <div class="border"></div>
                <div class="options">
                    <h3>{$lang617}</h3>
                    <div class="thescriptolutionlocation">
                    <form method="get" action="{$baseurl}/search?s={$s}&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}">
                    <input type="text" id="scriptolutionjoblocation" name="scriptolutionlocation" class="scriptolutionlocatio" value="{$scriptolutionlocation}" />
                    <input type="submit"  class="scriptolutionapplylocation"value="{$lang620}" />
                    <input type="hidden" name="s" value="{$s}" />
                    <input type="hidden" name="query" value="{$tag}" />
                    <input type="hidden" name="search_in" value="{$search_in}" />
                    <input type="hidden" name="c" value="{$c}" />
                    <input type="hidden" name="sdeliverytime" value="{$sdeliverytime}" />
                    <input type="hidden" name="stoprated" value="{$stoprated}" />
                    {if $sdisplay eq "list"}
                    <input type="hidden" name="sdisplay" value="list" />
                    {/if}
                    </form>
                    </div>
                </div>
                {/if}
                
                
                <div class="border"></div>
                <div class="options">
                    <h3>{$lang560}</h3>
                    <label><input name="scriptolutiondeliverytime" type="radio" value="1" {if $sdeliverytime eq "1"}checked="checked"{/if} onchange="window.location.href = '{$baseurl}/search?s={$s}&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime=1&stoprated={$stoprated}{$scriptolutionlocstring}'" /> {$lang561}</label>
                    <label><input name="scriptolutiondeliverytime" type="radio" value="3" {if $sdeliverytime eq "3"}checked="checked"{/if} onchange="window.location.href = '{$baseurl}/search?s={$s}&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime=3&stoprated={$stoprated}{$scriptolutionlocstring}'" /> {$lang562}</label>
                    <label><input name="scriptolutiondeliverytime" type="radio" value="5" {if $sdeliverytime eq "5"}checked="checked"{/if} onchange="window.location.href = '{$baseurl}/search?s={$s}&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime=5&stoprated={$stoprated}{$scriptolutionlocstring}'" /> {$lang563}</label>
                    <label><input name="scriptolutiondeliverytime" type="radio" value="7" {if $sdeliverytime eq "7"}checked="checked"{/if} onchange="window.location.href = '{$baseurl}/search?s={$s}&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime=7&stoprated={$stoprated}{$scriptolutionlocstring}'" /> {$lang564}</label>
                    <label><input name="scriptolutiondeliverytime" type="radio" value="0" {if $sdeliverytime eq "0"}checked="checked"{/if} onchange="window.location.href = '{$baseurl}/search?s={$s}&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&stoprated={$stoprated}{$scriptolutionlocstring}'" /> {$lang565}</label>
                </div>
                <div class="border"></div>
                <div class="options">
                    <h3>{$lang156}</h3>
                    {if $stoprated eq "1"}
                    <label><input name="scriptolutiontoprated" type="checkbox" value="1" {if $stoprated eq "1"}checked="checked"{/if} onchange="window.location.href = '{$baseurl}/search?s={$s}&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}{$scriptolutionlocstring}'" /> {$lang566}</label>
                    {else}
                    <label><input name="scriptolutiontoprated" type="checkbox" value="1" {if $stoprated eq "1"}checked="checked"{/if} onchange="window.location.href = '{$baseurl}/search?s={$s}&query={$tag}&search_in={$search_in}&c={$c}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated=1{$scriptolutionlocstring}'" /> {$lang566}</label>
                    {/if}
                </div>
                
                
                
                <div class="border"></div>
                <center>{insert name=get_advertisement AID=2}</center>
            </div>
    		<div class="clear"></div>	
		</div>
	</div>
</div>

{if $enablescriptolutionlocations eq "1"}
{include file="scriptolutionmaps.tpl"}
{/if}