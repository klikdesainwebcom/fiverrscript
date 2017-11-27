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
                              	<div class="frame">
                                
                                	<h2 style="font-size:16px; line-height: 18px"><a href="{$baseurl}/{insert name=get_seo_profile value=a username=$posts[i].username|stripslashes}">{$posts[i].username|stripslashes|truncate:15:"...":true}</a>:&nbsp;<span class="scriptolution_will">{$lang117}:</span></h2>
                                    
                                    <div class="scriptolution_want">{$posts[i].want|stripslashes|mb_truncate:200:"...":'UTF-8'}</div>
                                    
                                    {if $smarty.session.USERID ne $posts[i].USERID}
                                    {if $smarty.session.USERID GT "0"}
                                    <p style="padding-top:5px;">
                                    	<a style="text-decoration:none; font-size:14px" href="{$baseurl}/{insert name=get_seo_convo value=a assign=cvseo username=$posts[i].username|stripslashes}{$cvseo}">{$lang400} {$posts[i].username|stripslashes|truncate:10:"...":true}</a>&nbsp;<span class="country {$posts[i].country}" style="margin-bottom:4px;"></span>
                                    </p>
                                    {else}
                                	<p style="padding-top:5px;">
                                    	<a style="text-decoration:none;  font-size:14px" href="{$baseurl}/login">{$lang400} {$posts[i].username|stripslashes|truncate:10:"...":true}</a>&nbsp;<span class="country {$posts[i].country}" style="margin-bottom:4px;"></span>
                                    </p>
                                    {/if}
                                    {else}
                                    <p style="padding-top:5px;">
                                    	<form action="" method="post">
                                        <input type="hidden" name="sug" value="{$posts[i].WID}" />
                                        <input type="hidden" name="del" value="1" />
                                        <input type="submit" value="{$lang185}" />
                                        </form>
                                    </p>
                                    {/if}
                                	
                            	</div>
                            </div>
                          </div>
                        </div>
                        {/section}