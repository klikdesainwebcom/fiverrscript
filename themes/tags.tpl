<div class="bodybg topspace">
    <div class="ScriptolutionNoBox">
    	<div class="customsongs" style="padding: 25px 0 0;">
            <h3>{$tag|stripslashes}</h3>
        </div>
    </div>
    <div class="tagcloud" style="background:url({$scriptolutioncaturl}/{$scriptolution_bigimage}) no-repeat;">
        <h2>{$cname|stripslashes}</h2>
        <ul>
        	{section name=i loop=$tags max=10}
            {if $tags[i] != "" AND $tags[i] !=$tag}<li><a href="{$baseurl}/tags/{$cid}/{$tags[i]|stripslashes}" class="tag">&nbsp;{$tags[i]|stripslashes}&nbsp;</a></li>{/if}
            {/section}
        </ul>
    </div>
	<div class="inshadow">
		<div class="whitebox">
            <div class="leftbar">
                <div class="allmusic">
                    <h3>{$lang524}</h3>
                    <ul>                        
                        {insert name=get_categories assign=c}
                        {section name=i loop=$c}
                        <li><a href="{$baseurl}/tags/{$c[i].seo|stripslashes}/{$tag|stripslashes}">{if $cid eq $c[i].name}<font color="#689c2c">{$c[i].name|stripslashes}</font>{else}{$c[i].name|stripslashes}{/if}</a></li>
                        {insert name=get_subcategories assign=subcat value=var parent=$c[i].CATID}
                        {if $subcat|@count GT "0"}
                            {section name=sc loop=$subcat}
                            <li><a href="{$baseurl}/tags/{$subcat[sc].seo|stripslashes}/{$tag|stripslashes}">- {if $cid eq $subcat[sc].name}<font color="#689c2c">{$subcat[sc].name|stripslashes}</font>{else}{$subcat[sc].name|stripslashes}{/if}</a></li>
                            {/section}
                        {/if}
                        {/section}
                    </ul>
                </div>
                <div class="border"></div>
                <center>{insert name=get_advertisement AID=2}</center>
            </div>
            <div class="songslist">
                <div style="padding-bottom:15px;"></div>
                <div class="cusongtitle">
                	<h3>{$lang109}:</h3>
                    <p>
                        {if $s eq "d" OR $s eq ""}
                        <a href="{$baseurl}/tags/{$cid}/{$tag|stripslashes}?s=dz{if $sdisplay eq "list"}&sdisplay=list{/if}" class="active">{$lang110}</a> 
                        {else}
                        <a href="{$baseurl}/tags/{$cid}/{$tag|stripslashes}?s=d{if $sdisplay eq "list"}&sdisplay=list{/if}" {if $s eq "d" OR $s eq "dz" OR $s eq ""}class="active"{/if}>{$lang110}</a> 
                        {/if}
                        {if $s eq "p"}
                        <a href="{$baseurl}/tags/{$cid}/{$tag|stripslashes}?s=pz{if $sdisplay eq "list"}&sdisplay=list{/if}" class="active">{$lang111}</a> 
                        {else}
                        <a href="{$baseurl}/tags/{$cid}/{$tag|stripslashes}?s=p{if $sdisplay eq "list"}&sdisplay=list{/if}" {if $s eq "p" OR $s eq "pz"}class="active"{/if}>{$lang111}</a> 
                        {/if}
                        {if $s eq "r"}
                        <a href="{$baseurl}/tags/{$cid}/{$tag|stripslashes}?s=rz{if $sdisplay eq "list"}&sdisplay=list{/if}" class="active">{$lang112}</a>
                        {else}
                        <a href="{$baseurl}/tags/{$cid}/{$tag|stripslashes}?s=r{if $sdisplay eq "list"}&sdisplay=list{/if}" {if $s eq "r" OR $s eq "rz"}class="active"{/if}>{$lang112}</a>
                        {/if} 
                        {if $s eq "c"}
                        <a href="{$baseurl}/tags/{$cid}/{$tag|stripslashes}?s=cz{if $sdisplay eq "list"}&sdisplay=list{/if}" class="active">{$lang436}</a> 
                        {else}
                        <a href="{$baseurl}/tags/{$cid}/{$tag|stripslashes}?s=c{if $sdisplay eq "list"}&sdisplay=list{/if}" {if $s eq "c" OR $s eq "cz"}class="active"{/if}>{$lang436}</a> 
                        {/if}
                        {if $s eq "e"}
                        <a href="{$baseurl}/tags/{$cid}/{$tag|stripslashes}?s=ez{if $sdisplay eq "list"}&sdisplay=list{/if}" class="active">{$lang494}</a> 
                        {else}
                        <a href="{$baseurl}/tags/{$cid}/{$tag|stripslashes}?s=e{if $sdisplay eq "list"}&sdisplay=list{/if}" {if $s eq "e" OR $s eq "ez"}class="active"{/if}>{$lang494}</a> 
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
                        <select onChange="Scriptolution_jumpMenu('parent',this,0)" style="font-size:16px; margin-top:2px; margin-left:2px;">
                        <option value="{$baseurl}">{$lang495}</option>
                        {section name=p loop=$packs}
                        <option value="{$baseurl}/tags/{$cid}/{$tag|stripslashes}?s=o&p={$packs[p].pprice|stripslashes}{if $sdisplay eq "list"}&sdisplay=list{/if}" {if $p eq $packs[p].pprice|stripslashes}selected="selected"{/if}>{$lang197}{$packs[p].pprice|stripslashes}</option>
                        {/section}
                        </select>
                        {/if}             
                    </p>
                    <div class="topright">
                        {if $sdisplay eq "list"}
                        <a href="{$baseurl}/tags/{$cid}/{$tag|stripslashes}?page={$currentpage}{$adds}"><img src="{$imageurl}/leftbox_hover.png" /></a>
                        <a href="{$baseurl}/tags/{$cid}/{$tag|stripslashes}?page={$currentpage}{$adds}&sdisplay=list"><img src="{$imageurl}/rightbox.png" /></a>
                        {else}
                        <a href="{$baseurl}/tags/{$cid}/{$tag|stripslashes}?page={$currentpage}{$adds}"><img src="{$imageurl}/leftbox.png" /></a>
                        <a href="{$baseurl}/tags/{$cid}/{$tag|stripslashes}?page={$currentpage}{$adds}&sdisplay=list"><img src="{$imageurl}/rightbox_hover.png" /></a>
                        {/if}
                    </div>
                    <div class="clear"></div>
                </div>
                {include file="scriptolution_error.tpl"}
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
            	<div class="rss-link"><a href="{$baseurl}/rss}">{$lang108}</a></div>
            	<div class="clear" style="padding-bottom:20px;"></div>
            </div>
    		<div class="clear"></div>	
		</div>
	</div>
</div>