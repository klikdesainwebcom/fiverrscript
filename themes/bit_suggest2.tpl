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
                                	<h2 style="font-size:16px">{$lang117} {$posts[i].want|stripslashes|mb_truncate:200:"...":'UTF-8'}</h2>
                                    <p style="padding-top:5px;">
                                    	<form action="" method="post">
                                        <input type="hidden" name="sug" value="{$posts[i].WID}" />
                                        <input type="hidden" name="del" value="1" />
                                        <input type="submit" value="{$lang185}" />
                                        </form>
                                    </p>                                	
                            	</div>
                            </div>
                          </div>
                        </div>
                        {/section}