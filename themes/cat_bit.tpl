		<div class="customsongs" {if $scats|@count GT "0"}{else}style="padding: 25px 17px 0;"{/if}>
            <h3><a href="{$baseurl}/categories">{$lang187}</a>{if $parentname ne "" AND $parentseo ne ""}<a href="{$baseurl}/categories/{$parentseo|stripslashes}">{$parentname|stripslashes}</a>{/if}{$cname|stripslashes}</h3>
            {if $scats|@count GT "0"}
            <div class="songlinks">
                <ul>
                	{section name=y loop=$scats}
                    <li><a href="{$baseurl}/categories/{$scats[y].seo|stripslashes}">{$scats[y].name|stripslashes}</a></li>
                    {/section}
                </ul>
                <div class="clear"></div>
            </div>
            {/if}
        </div>