						{section name=i loop=$posts}
                        {if $smarty.section.i.iteration eq "6"}
                        <div style="padding:5px;">
                        <center>
                        {insert name=get_advertisement AID=3}
                        </center>
                        </div>
                        {/if}
                        {insert name=seo_clean_titles assign=title value=a title=$posts[i].gtitle}
                        <div class="box">
                          <div class="c">
                            <div class="holder">                              
                                {if $posts[i].feat eq "1"}<span class="featured-label">featured</span>{/if}
                              	<div class="frame-img">
                                	<a href="{$baseurl}/{$posts[i].seo|stripslashes}/{$posts[i].PID|stripslashes}/{$title}"><img alt="{$posts[i].gtitle|stripslashes}" src="{$purl}/t2/{$posts[i].p1}?{$smarty.now}" /></a>
                              	</div>
                              	<div class="frame">
                                	<h2>{if $posts[i].days eq "0"}{include file='bit_instant.tpl'}{elseif $posts[i].days eq "1"}{include file='bit_express.tpl'}{/if}<a href="{$baseurl}/{$posts[i].seo|stripslashes}/{$posts[i].PID|stripslashes}/{$title}">{$lang62} {$posts[i].gtitle|stripslashes|mb_truncate:50:"...":'UTF-8'} {if $scriptolution_cur_pos eq "1"}{$lang589} {$posts[i].price|stripslashes}{$lang197}{else}{$lang63}{$posts[i].price|stripslashes}{/if}</a></h2>
                                	<p>{$posts[i].gdesc|stripslashes|mb_truncate:140:"...":'UTF-8'}<span>&nbsp;({$lang414} <a href="{$baseurl}/{insert name=get_seo_profile value=a username=$posts[i].username|stripslashes}">{$posts[i].username|stripslashes|truncate:10:"...":true}</a>&nbsp;<span class="country {$posts[i].country}" title="{insert name=country_code_to_country value=a assign=userc code=$posts[i].country}{$userc}"></span>)</span></p>
	                                <ul class="control">  
                                    	<li>
                                        	<a href="{$baseurl}/{$posts[i].seo|stripslashes}/{$posts[i].PID|stripslashes}/{$title}">{$lang105}</a>
                                      	</li>                                		
                                       	{if $short_urls eq "1"}
                                        {insert name=get_short_url value=a assign=takento PID=$posts[i].PID seo=$posts[i].seo short=$posts[i].short title=$title}
                                       	<li style="width:30px;">
                                        	<g:plusone size="medium" count="false" href="{$takento}"></g:plusone>
                                      	</li>
                                        <li class="share">
                                            <a href="http://twitter.com/share" class="twitter-share-button" data-url="{$takento}" data-via="{$twitter}" data-text="{$lang62} {$posts[i].gtitle|stripslashes} {if $scriptolution_cur_pos eq "1"}{$lang589} {$posts[i].price|stripslashes}{$lang197}{else}{$lang63}{$posts[i].price|stripslashes}{/if}" data-count="none">Tweet</a>
                                            <script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
                                            <a href="#" onclick="openCenteredWindow('http://www.facebook.com/sharer.php?u={$baseurl}/{$posts[i].seo|stripslashes}/{$posts[i].PID|stripslashes}/{$title|replace:"'":""}');"><img alt="Btn-facebook" src="{$imageurl}/btn-facebook.png" /></a>
                                        {else}
                                        <li style="width:30px;">
                                        	<g:plusone size="medium" count="false" href="{$baseurl}/{$posts[i].seo|stripslashes|replace:' ':'+'}/{$posts[i].PID|stripslashes}/{$title}"></g:plusone>
                                      	</li>
                                        <li class="share">
                                            <a href="http://twitter.com/share" class="twitter-share-button" data-url="{$baseurl}/{$posts[i].seo|stripslashes|replace:' ':'+'}/{$posts[i].PID|stripslashes}/{$title}" data-via="{$twitter}" data-text="{$lang62} {$posts[i].gtitle|stripslashes} {if $scriptolution_cur_pos eq "1"}{$lang589} {$posts[i].price|stripslashes}{$lang197}{else}{$lang63}{$posts[i].price|stripslashes}{/if}" data-count="none">Tweet</a>
											<script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
                                            <a href="#" onclick="openCenteredWindow('http://www.facebook.com/sharer.php?u={$baseurl}/{$posts[i].seo|stripslashes}/{$posts[i].PID|stripslashes}/{$title|replace:"'":""}');"><img alt="Btn-facebook" src="{$imageurl}/btn-facebook.png" /></a>
                                  		</li>
                                        {/if}
                                	</ul>
                                	<div class="quick-order">
	                                    {if $posts[i].toprated eq "1"}
                                    	<div class="topRatedBadge">
                                            <img alt="{$lang468}" src="{$imageurl}/topratedscriptolution.png" />
                                              {$lang468}
                                        </div>
                                        {/if}
                                        <a class="login-link" {if $smarty.session.USERID ne ""}href="{$baseurl}/{$posts[i].seo|stripslashes}/{$posts[i].PID|stripslashes}/{$title}"{else}href="{$baseurl}/login?r={insert name=get_redirect value=a assign=rurl PID=$posts[i].PID seo=$posts[i].seo gtitle=$title}{$rurl|stripslashes}"{/if}>{$lang107}</a>                                 
                                	</div>
                            	</div>
                            </div>
                          </div>
                        </div>
                        {/section}