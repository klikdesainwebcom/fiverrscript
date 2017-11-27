						{section name=i loop=$posts}
                        {insert name=seo_clean_titles assign=title value=a title=$posts[i].gtitle}
                        <div class="cusongsblock {if $smarty.section.i.iteration % 3 == 0}last{/if}">
                            <div class="songperson">
                            	<a href="{$baseurl}/{$posts[i].seo|stripslashes}/{$posts[i].PID|stripslashes}/{$title}"><img src="{$purl}/t3/{$posts[i].p1}" alt="{$posts[i].gtitle|stripslashes}" width="265" height="163" /></a>
                                {if $posts[i].feat eq "1"}<span class="featured">{$lang526}</span>{/if}
                                {if $posts[i].toprated eq "1"}<span class="rated">{$lang525}</span>{/if}
                                {if $posts[i].youtube ne ""}{include file="scriptolution_bit_yt_small.tpl"}{/if}
                            </div>
                            <div class="price">{if $scriptolution_cur_pos eq "1"}{$posts[i].price|stripslashes}{$lang197}{else}{$lang197}{$posts[i].price|stripslashes}{/if}</div>
                            <p>
                            	{if $posts[i].days eq "0"}{include file='scriptolution_bit_instant.tpl'}{elseif $posts[i].days eq "1"}{include file='scriptolution_bit_express.tpl'}{/if}
                            	<a href="{$baseurl}/{$posts[i].seo|stripslashes}/{$posts[i].PID|stripslashes}/{$title}">{$lang62} {$posts[i].gtitle|stripslashes|mb_truncate:90:"...":'UTF-8'} {if $scriptolution_cur_pos eq "1"}{$lang589} {$posts[i].price|stripslashes}{$lang197}{else}{$lang63}{$posts[i].price|stripslashes}{/if}</a>
                            </p>                            
                            {insert name=get_member_profilepicture assign=profilepicture value=var USERID=$posts[i].USERID}
                            <div class="userdata">
                                <div class="userimg"><a href="{$baseurl}/{insert name=get_seo_profile value=a username=$posts[i].username|stripslashes}"><img width="25px" height="25px" src="{$membersprofilepicurl}/thumbs/{$profilepicture}" alt="{$posts[i].username|stripslashes}" /></a></div>
                                <div class="username"><a href="{$baseurl}/{insert name=get_seo_profile value=a username=$posts[i].username|stripslashes}">{$posts[i].username|stripslashes|truncate:20:"...":true}</a></div>
                                <div class="otherdetails">
                                    <span class="usercount"></span>
                                    <ul>
                                    	{insert name=scriptolution_rating_stars assign=scriptolutionstars value=a scriptolutionuserid=$posts[i].USERID}{$scriptolutionstars}
                                    </ul>
                                    <span class="flag"><span class="country {$posts[i].country}" title="{insert name=country_code_to_country value=a assign=userc code=$posts[i].country}{$userc}"></span></span>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </div>
                        {/section}