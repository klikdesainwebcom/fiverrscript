		{if $fiverrscript_dotcom_home_featcats eq "1"}
		<link href="{$baseurl}/css/scriptolution_feat_cats.css" media="screen" rel="stylesheet" type="text/css" />
        <div class="scriptolutionsmain1" style="padding-top:20px;">        	
            <div class="scriptolution-h-header">{$lang551}</div>
            <div class="scriptolution-s-small">{$lang552}</div>
        </div>
        <div class="scriptolutionsmain2" style="top:20px;"> 
            <div style="clear:both;"></div>
            {insert name=get_scriptolution_featcats value=a assign=scriptolutionfeatcs}
        	{section name=i loop=$scriptolutionfeatcs}
            <div class="scriptolutionsblock {if $smarty.section.i.iteration % 3 == 0}last{/if}">
                <div class="songperson">
                    <a href="{$baseurl}/categories/{$scriptolutionfeatcs[i].seo|stripslashes}?s=p"><img {if $scriptolutionfeatcs[i].scriptolution_catimage eq "scriptolution_default_category.jpg"}src="{$imageurl}/scriptolution_default_category.jpg"{else}src="{$scriptolutioncaturl}/{$scriptolutionfeatcs[i].scriptolution_catimage}?{$smarty.now}"{/if} alt="{$scriptolutionfeatcs[i].name|stripslashes}" width="335" height="170" /></a>
                </div>
                <p>
                    <a href="{$baseurl}/categories/{$scriptolutionfeatcs[i].seo|stripslashes}?s=p">{$scriptolutionfeatcs[i].name|stripslashes|mb_truncate:60:"...":'UTF-8'|upper}</a>                    
                </p>
                <a href="{$baseurl}/categories/{$scriptolutionfeatcs[i].seo|stripslashes}?s=p">
                <ul class="scriptolution-t-tags" style="padding-top:5px;">
                	{if $scriptolutionfeatcs[i].scriptolution_cattag1 ne ""}<li>{$scriptolutionfeatcs[i].scriptolution_cattag1|stripslashes}</li>{/if}
                    {if $scriptolutionfeatcs[i].scriptolution_cattag2 ne ""}<li>{$scriptolutionfeatcs[i].scriptolution_cattag2|stripslashes}</li>{/if}
                    {if $scriptolutionfeatcs[i].scriptolution_cattag3 ne ""}<li>{$scriptolutionfeatcs[i].scriptolution_cattag3|stripslashes}</li>{/if}
                </ul>
                </a>
            </div>
            {/section}
        </div>
        <div style="clear:both;"></div>
		{/if}