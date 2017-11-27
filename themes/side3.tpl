				<link href="{$baseurl}/css/scriptolution_side.css" media="screen" rel="stylesheet" type="text/css" />
                <div class="sidebar">
                    <div class="side-nav">
                    	{include file='lang.tpl'}
                      <div class="t"></div>
                      <div class="c">
                        <form action="{$baseurl}/search" id="search_form" method="get">      
                        	<div class="search">
                            	<input class="text swap-value-small-search" id="query" name="query" type="text" value="" />
                            	<input type="image" src="{$imageurl}/btn-go02.gif" alt="Go" class="button" />
                          	</div>
                        </form>
                        <ul>
                          <li ><strong><a href="{$baseurl}/" style="color:green;">{$lang115}</a></strong></li>                          
                          {insert name=get_categories assign=c}
                          {section name=i loop=$c}
                            <li {if $catselect eq $c[i].CATID}class="active"{/if} id="scriptolution-main-menu-{$c[i].CATID}"><a href="{$baseurl}/categories/{$c[i].seo|stripslashes}">{$c[i].name|stripslashes}</a></li>
                            {insert name=get_subcategories assign=subcat value=var parent=$c[i].CATID}
                            {if $subcat|@count GT "0"}
                            {literal}
                            <script type="text/javascript">
                            $(document).ready(function()
                            {
                                $("#scriptolution-main-menu-{/literal}{$c[i].CATID}{literal}").mouseover(function() { $("#scriptolution-sub-{/literal}{$c[i].CATID}{literal}").css('visibility','visible'); });
                                $("#scriptolution-main-menu-{/literal}{$c[i].CATID}{literal}").mouseout(function() { $("#scriptolution-sub-{/literal}{$c[i].CATID}{literal}").css('visibility','hidden'); });
                                $("#scriptolution-sub-{/literal}{$c[i].CATID}{literal}").mouseover(function() { $("#scriptolution-sub-{/literal}{$c[i].CATID}{literal}").css('visibility','visible'); });
                                $("#scriptolution-sub-{/literal}{$c[i].CATID}{literal}").mouseout(function() { $("#scriptolution-sub-{/literal}{$c[i].CATID}{literal}").css('visibility','hidden'); });
                            });
                            </script>
                            {/literal}                 
                            <div class="subcat-menu" id="scriptolution-sub-{$c[i].CATID}" style="visibility:hidden;">    
                                <div class="subcat-menu-title"><a href="{$baseurl}/categories/{$c[i].seo|stripslashes}">{$c[i].name|stripslashes}</a></div>
                                <div class="subcat-menu-subtitle">{$c[i].details|stripslashes}</div>
                                <div class="sub-cat-popup-wrapper">
                                    <div class="sub-cat-menu">
                                        <ul class="sub_categories_list">
                                        	{section name=sc loop=$subcat}
                                            <li class="sub_category_item"><a href="{$baseurl}/categories/{$subcat[sc].seo|stripslashes}">{$subcat[sc].name|stripslashes}</a></li>
                                            {/section}
                                        </ul>
                                    </div>
                                </div>
                                
                                <div class="inner-cat-search">
                                    <form action="{$baseurl}/search" method="get">				
                                        <div class="row">
                                            <div class="search-in">{$lang503} {$c[i].name|stripslashes}</div>
                                            <div>
                                                <input class="text" name="query" type="text" />
                                                <input type="hidden" name="c" value="{$c[i].CATID}" />
                                                <input type="submit" value="{$lang114}" />
                                            </div>
                                        </div>
                                    </form>		
                                </div>
                            </div>
                            {/if}
                            {/section}
                        </ul>                        
                      </div>
                      <div class="b">&nbsp;</div>
                    </div>
                    
                    <div style="padding-bottom:10px;"></div>
                    
				</div>