{include file="scriptolution_error7.tpl"}
<div class="bodybg topspace">
	<div class="tagcloud">
        <h2>{$cname|stripslashes}</h2>
        <h3>{$scriptolutioncdetails|stripslashes}</h3>
    </div>
	<div class="inshadow">
		<div class="whitebox">
        	
            {include file="cat_scriptolution_responsive.tpl"}            
            <div class="cusongtitle">
                <h3>{$lang109}:</h3>
                <p>
                    {if $s eq "d" OR $s eq ""}
                    <a href="{$baseurl}/categories/{$cid}?s=dz{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}" class="active">{$lang110}</a> 
                    {else}
                    <a href="{$baseurl}/categories/{$cid}?s=d{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}" {if $s eq "d" OR $s eq "dz" OR $s eq ""}class="active"{/if}>{$lang110}</a> 
                    {/if}
                    {if $s eq "p"}
                    <a href="{$baseurl}/categories/{$cid}?s=pz{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}" class="active">{$lang111}</a> 
                    {else}
                    <a href="{$baseurl}/categories/{$cid}?s=p{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}" {if $s eq "p" OR $s eq "pz"}class="active"{/if}>{$lang111}</a> 
                    {/if}
                    {if $s eq "r"}
                    <a href="{$baseurl}/categories/{$cid}?s=rz{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}" class="active">{$lang112}</a>
                    {else}
                    <a href="{$baseurl}/categories/{$cid}?s=r{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}" {if $s eq "r" OR $s eq "rz"}class="active"{/if}>{$lang112}</a>
                    {/if} 
                    {if $s eq "c"}
                    <a href="{$baseurl}/categories/{$cid}?s=cz{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}" class="active">{$lang436}</a> 
                    {else}
                    <a href="{$baseurl}/categories/{$cid}?s=c{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}" {if $s eq "c" OR $s eq "cz"}class="active"{/if}>{$lang436}</a> 
                    {/if}
                    {if $s eq "e"}
                    <a href="{$baseurl}/categories/{$cid}?s=ez{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}" class="active">{$lang494}</a> 
                    {else}
                    <a href="{$baseurl}/categories/{$cid}?s=e{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}" {if $s eq "e" OR $s eq "ez"}class="active"{/if}>{$lang494}</a> 
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
                    <option value="{$baseurl}/categories/{$cid}?s=o&p={$packs[p].pprice|stripslashes}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}" {if $p eq $packs[p].pprice|stripslashes}selected="selected"{/if}>{if $scriptolution_cur_pos eq "1"}{$packs[p].pprice|stripslashes}{$lang197}{else}{$lang197}{$packs[p].pprice|stripslashes}{/if}</option>
                    {/section}
                    </select>
                    {/if}             
                </p>
                <div class="topright">
                    {if $sdisplay eq "list"}
                    <a href="{$baseurl}/categories/{$cid}?page={$currentpage}{$adds}"><img src="{$imageurl}/leftbox_hover.png" /></a>
                    <a href="{$baseurl}/categories/{$cid}?page={$currentpage}{$adds}&sdisplay=list"><img src="{$imageurl}/rightbox.png" /></a>
                    {else}
                    <a href="{$baseurl}/categories/{$cid}?page={$currentpage}{$adds}"><img src="{$imageurl}/leftbox.png" /></a>
                    <a href="{$baseurl}/categories/{$cid}?page={$currentpage}{$adds}&sdisplay=list"><img src="{$imageurl}/rightbox_hover.png" /></a>
                    {/if}
                </div>
                <div class="clear"></div>
            </div>
                
            <div class="songslist">
                <div class="cuscriptolutionongtitle">
                    <p>
                        {if $s eq "d" OR $s eq ""}
                        <a href="{$baseurl}/categories/{$cid}?s=dz{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}" class="active">{$lang110}</a> 
                        {else}
                        <a href="{$baseurl}/categories/{$cid}?s=d{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}" {if $s eq "d" OR $s eq "dz" OR $s eq ""}class="active"{/if}>{$lang110}</a> 
                        {/if}
                        {if $s eq "p"}
                        <a href="{$baseurl}/categories/{$cid}?s=pz{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}" class="active">{$lang111}</a> 
                        {else}
                        <a href="{$baseurl}/categories/{$cid}?s=p{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}" {if $s eq "p" OR $s eq "pz"}class="active"{/if}>{$lang111}</a> 
                        {/if}
                        {if $s eq "r"}
                        <a href="{$baseurl}/categories/{$cid}?s=rz{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}" class="active">{$lang112}</a>
                        {else}
                        <a href="{$baseurl}/categories/{$cid}?s=r{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}" {if $s eq "r" OR $s eq "rz"}class="active"{/if}>{$lang112}</a>
                        {/if} 
                    </p>
                    <p>
                        {if $s eq "c"}
                        <a href="{$baseurl}/categories/{$cid}?s=cz{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}" class="active">{$lang436}</a> 
                        {else}
                        <a href="{$baseurl}/categories/{$cid}?s=c{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}" {if $s eq "c" OR $s eq "cz"}class="active"{/if}>{$lang436}</a> 
                        {/if}
                        {if $s eq "e"}
                        <a href="{$baseurl}/categories/{$cid}?s=ez{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}" class="active">{$lang494}</a> 
                        {else}
                        <a href="{$baseurl}/categories/{$cid}?s=e{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}" {if $s eq "e" OR $s eq "ez"}class="active"{/if}>{$lang494}</a> 
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
                        <option value="{$baseurl}/categories/{$cid}?s=o&p={$packs[p].pprice|stripslashes}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated={$stoprated}" {if $p eq $packs[p].pprice|stripslashes}selected="selected"{/if}>{if $scriptolution_cur_pos eq "1"}{$packs[p].pprice|stripslashes}{$lang197}{else}{$lang197}{$packs[p].pprice|stripslashes}{/if}</option>
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
            	<div class="rss-link"><a href="{$baseurl}/rss?c={$catselect}">{$lang108}</a></div>
            	<div class="clear" style="padding-bottom:20px;"></div>
            </div>
            
            <div class="leftbar">
                <div class="allmusic">
                    <h3>{$lang66}</h3>
                    <ul id="scriptolutiondontshowcats" class="scriptolutionhide">                        
                        {insert name=get_categories assign=c}
                        {section name=i loop=$c}
                        <li><a href="{$baseurl}/categories/{$c[i].seo|stripslashes}">{if $cname eq $c[i].name}<font color="#689c2c">{$c[i].name|stripslashes}</font>{else}{$c[i].name|stripslashes}{/if}</a></li>
                        {insert name=get_subcategories assign=subcat value=var parent=$c[i].CATID}
                        {if $subcat|@count GT "0"}
                            {section name=sc loop=$subcat}
                            <li><a href="{$baseurl}/categories/{$subcat[sc].seo|stripslashes}">- {if $cname eq $subcat[sc].name}<font color="#689c2c">{$subcat[sc].name|stripslashes}</font>{else}{$subcat[sc].name|stripslashes}{/if}</a></li>
                            {/section}
                        {/if}
                        {/section}
                        <div class="showmorebtn"><a href="javascript:void(0)" onclick="scriptolution_newhide('scriptolutiondontshowcats');scriptolution_newshow('scriptolutionshowcats');">{$lang558}</a></div>
                    </ul>
                    <ul id="scriptolutionshowcats">
                    	<li><a href="{$baseurl}/categories/{$cseo|stripslashes}"><font color="#689c2c">{$cname|stripslashes}</font></a></li>
                        <div class="showmorebtn"><a href="javascript:void(0)" onclick="scriptolution_newhide('scriptolutionshowcats');scriptolution_newshow('scriptolutiondontshowcats');">{$lang559}</a></div>
                    </ul>
                </div>
                <div class="border"></div>
                <div class="options">
                    <h3>{$lang560}</h3>
                    <label><input name="scriptolutiondeliverytime" type="radio" value="1" {if $sdeliverytime eq "1"}checked="checked"{/if} onchange="window.location.href = '{$baseurl}/categories/{$cid}?s={$s}&p={$p}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime=1&stoprated={$stoprated}'" /> {$lang561}</label>
                    <label><input name="scriptolutiondeliverytime" type="radio" value="3" {if $sdeliverytime eq "3"}checked="checked"{/if} onchange="window.location.href = '{$baseurl}/categories/{$cid}?s={$s}&p={$p}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime=3&stoprated={$stoprated}'" /> {$lang562}</label>
                    <label><input name="scriptolutiondeliverytime" type="radio" value="5" {if $sdeliverytime eq "5"}checked="checked"{/if} onchange="window.location.href = '{$baseurl}/categories/{$cid}?s={$s}&p={$p}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime=5&stoprated={$stoprated}'" /> {$lang563}</label>
                    <label><input name="scriptolutiondeliverytime" type="radio" value="7" {if $sdeliverytime eq "7"}checked="checked"{/if} onchange="window.location.href = '{$baseurl}/categories/{$cid}?s={$s}&p={$p}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime=7&stoprated={$stoprated}'" /> {$lang564}</label>
                    <label><input name="scriptolutiondeliverytime" type="radio" value="0" {if $sdeliverytime eq "0"}checked="checked"{/if} onchange="window.location.href = '{$baseurl}/categories/{$cid}?s={$s}&p={$p}{if $sdisplay eq "list"}&sdisplay=list{/if}&stoprated={$stoprated}'" /> {$lang565}</label>
                </div>
                <div class="border"></div>
                <div class="options">
                    <h3>{$lang156}</h3>
                    {if $stoprated eq "1"}
                    <label><input name="scriptolutiontoprated" type="checkbox" value="1" {if $stoprated eq "1"}checked="checked"{/if} onchange="window.location.href = '{$baseurl}/categories/{$cid}?s={$s}&p={$p}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}'" /> {$lang566}</label>
                    {else}
                    <label><input name="scriptolutiontoprated" type="checkbox" value="1" {if $stoprated eq "1"}checked="checked"{/if} onchange="window.location.href = '{$baseurl}/categories/{$cid}?s={$s}&p={$p}{if $sdisplay eq "list"}&sdisplay=list{/if}&sdeliverytime={$sdeliverytime}&stoprated=1'" /> {$lang566}</label>
                    {/if}
                </div>
                <div class="border"></div>
                <center>{insert name=get_advertisement AID=2}</center>
            </div>
            
    		<div class="clear"></div>	
		</div>
	</div>
</div>