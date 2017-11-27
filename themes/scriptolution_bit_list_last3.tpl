						{section name=i loop=$posts}
                        {insert name=seo_clean_titles assign=title value=a title=$posts[i].gtitle}                        
                        <div class="newscriptolution {if $smarty.section.i.iteration is even}newscriptolutionnewcolor{/if}">
                            <div class="newscriptolutionimg">
                            	<a href="{$baseurl}/{$posts[i].seo|stripslashes}/{$posts[i].PID|stripslashes}/{$title}"><img src="{$purl}/t3/{$posts[i].p1}" alt="{$posts[i].gtitle|stripslashes}" width="162" height="100" />{if $posts[i].youtube ne ""}{include file="scriptolution_bit_yt_small.tpl"}{/if}</a>
                            	{if $posts[i].feat eq "1"}<span class="featured">{$lang526}</span>{/if}
                                {if $posts[i].toprated eq "1"}<span class="rated">{$lang525}</span>{/if}
                                {if $posts[i].youtube ne ""}{include file="scriptolution_bit_yt_small.tpl"}{/if}
                            </div>
                            <div class="newscriptolutiondetails width480">
                                <h3>{if $posts[i].days eq "0"}{include file='scriptolution_bit_instant.tpl'}{elseif $posts[i].days eq "1"}{include file='scriptolution_bit_express.tpl'}{/if}<a href="{$baseurl}/{$posts[i].seo|stripslashes}/{$posts[i].PID|stripslashes}/{$title}">{$lang62} {$posts[i].gtitle|stripslashes|mb_truncate:50:"...":'UTF-8'} {if $scriptolution_cur_pos eq "1"}{$lang589} {$posts[i].price|stripslashes}{$lang197}{else}{$lang63}{$posts[i].price|stripslashes}{/if}</a></h3>
                                <p>{$posts[i].gdesc|stripslashes|html_entity_decode:$smarty.const.ENT_QUOTES:'utf-8'|strip_tags|mb_truncate:85:"...":'UTF-8'} <a href="{$baseurl}/{$posts[i].seo|stripslashes}/{$posts[i].PID|stripslashes}/{$title}">{$lang105}</a></p>
                                <h5>{$lang414} <span class="scriptomembittitle"><a href="{$baseurl}/{insert name=get_seo_profile value=a username=$posts[i].username|stripslashes}">{$posts[i].username|stripslashes|truncate:40:"...":true}</a></span>&nbsp;<span class="country {$posts[i].country}" title="{insert name=country_code_to_country value=a assign=userc code=$posts[i].country}{$userc}"></span> <a href="{$baseurl}/{$posts[i].seo|stripslashes}/{$posts[i].PID|stripslashes}/{$title}" class="scriptolutionsorder"><div class="ascriptolutionbluebutton">{$lang107}</div></a></h5>
                            </div>
                            <div class="clear"></div>
                        </div>
                        {/section}