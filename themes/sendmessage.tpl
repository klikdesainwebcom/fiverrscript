
                            {literal}
                            <script type="text/javascript">
							$(document).ready( function() {
								$('.milestone').corner("5px");
								$('.spam_message').click(function() {
								  $.post($(this).attr('href'), null, null, "script");
								  return false;
								  });
							})
							</script>
                            {/literal}
                    		{section name=i loop=$m}
                            {if $m[i].unread eq "1"}
                            {if $smarty.session.USERID eq $m[i].MSGTO}
                            {insert name=mark_read value=a mid=$m[i].MID}
                            {/if}
                            {/if}
                            {insert name=get_member_profilepicture assign=profilepicture value=var USERID=$m[i].MSGFROM}
                            <div class="db-main-table {if $m[i].mfrom ne $smarty.session.USERNAME}yellowbg{/if}" id="message_{$m[i].MID}">
                                <table>
                                    <tbody>
                                    <tr>
                                        <td class="leftitscriptolution width25">
                                            <a href="{$baseurl}/{insert name=get_seo_profile value=a username=$m[i].mfrom|stripslashes}" title="{$m[i].mfrom|stripslashes}"><img alt="{$m[i].mfrom|stripslashes}" src="{$membersprofilepicurl}/thumbs/{$profilepicture}?{$smarty.now}" class="scriptolutionuimage" /></a>
                                        </td>
                                        <td class="leftitscriptolution width75">                                
                                            <div class="milestone action reqbox" title="{$lang293}"> 
                                                <div class="status-label"></div> 
                                                <div class="mutual-status underway">
                                                    <h3>{$m[i].mfrom|stripslashes}</h3>
                                                    <div class="padding5"></div>
                                                    <span><p>{$m[i].message|stripslashes|nl2br}</p></span>
                                                    {include file="track_files.tpl" scriptolutionfileinfo=$m[i]}
                                                </div> 
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                          	{/section} 
                            {if $notice ne ""}
                            <div class='scriptolution_error'>
                                <p>{$notice}</p>
                            </div>
                           	<div style="clear:both; padding-bottom:20px;"></div>
                            {/if}