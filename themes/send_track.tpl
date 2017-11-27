								{insert name=last_delivery value=a assign=lasdel oid=$oid}
                                {section name=i loop=$m}
                                {insert name=get_member_profilepicture assign=profilepicture value=var USERID=$m[i].MSGFROM}
                                {if $m[i].action eq "mutual_cancellation_request"}
                                	{if $who eq "buyer"}
                                        {if $m[i].MSGFROM eq $smarty.session.USERID}                            
                                        <div class="db-main-table warning" id="message_{$m[i].MID}">
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <td colspan="2">
                                                            {$lang286}
                                                        </td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td class="leftitscriptolution width25">
                                                        <i style="color:#FBC137" class="fa fa-exclamation-circle fa-3x"></i> 
                                                    </td>
                                                    <td class="leftitscriptolution width75">                                
                                                        <div class="milestone action reqbox" title="{$lang293}"> 
                                                            <div class="status-label"></div> 
                                                            <div class="mutual-status underway">
                                                                <div class="padding5"></div>
                                                                <p>{$lang287}: {$m[i].message|stripslashes|nl2br}</p>
                                                                {if $m[i].cancel eq "0"}
                                                                <form name="abort{$m[i].MID}" method="post">
                                                                <input type="hidden" name="subabort" value="1">
                                                                <input type="hidden" name="AMID" value="{$m[i].MID}">
                                                                </form>
                                                                <div class="status-control">{$lang289}
                                                                <div style="clear:both; padding-bottom:10px;"></div>
                                                                <a class="ascriptolutionredbutton" style="color:#fff" href="#" onclick="document.abort{$m[i].MID}.submit()">{$lang290}</a>
                                                                <div style="clear:both; padding-bottom:10px;"></div>{$lang291}</div>
                                                                {/if}                                     
                                                            </div> 
                                                        </div>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        {else}  
                                        <div class="db-main-table warning" id="message_{$m[i].MID}">
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <td colspan="2">
                                                            {$lang288}
                                                        </td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td class="leftitscriptolution width25">
                                                        <i style="color:#FBC137" class="fa fa-exclamation-circle fa-3x"></i> 
                                                    </td>
                                                    <td class="leftitscriptolution width75">                                
                                                        <div class="milestone action reqbox" title="{$lang293}"> 
                                                            <div class="status-label"></div> 
                                                            <div class="mutual-status underway">
                                                                <div class="padding5"></div>
                                                                <p>{$lang287}: {$m[i].message|stripslashes|nl2br}</p>
                                                                {if $m[i].cancel eq "0"}
                                                                <form name="decline{$m[i].MID}" method="post">
                                                                <input type="hidden" name="subdecline" value="1">
                                                                <input type="hidden" name="DMID" value="{$m[i].MID}">
                                                                </form>
                                                                <form name="accept{$m[i].MID}" method="post">
                                                                <input type="hidden" name="subaccept" value="1">
                                                                <input type="hidden" name="AMID" value="{$m[i].MID}">
                                                                </form>
                                                                <div class="status-control">{$lang291}
                                                                <div style="clear:both; padding-bottom:10px;"></div>
                                                                <a class="ascriptolutionredbutton" style="color:#fff" href="#" onclick="document.decline{$m[i].MID}.submit()">{$lang296}</a> - <a class="ascriptolutiongreenbutton" style="color:#fff" href="#" onclick="document.accept{$m[i].MID}.submit()">{$lang301}</a></div>
                                                                {/if}                                        
                                                            </div> 
                                                        </div>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        {/if}
                                        {if $m[i].cancel eq "1"}
                                        <div class="db-main-table yellowbg" id="message_{$m[i].MID}">
                                            <table>
                                                <tbody>
                                                <tr>
                                                    <td class="leftitscriptolution width25">
                                                        <i style="color:#FBC137" class="fa fa-times fa-3x"></i> 
                                                    </td>
                                                    <td class="leftitscriptolution width75">                                
                                                        <div class="milestone warning" title="{$m[i].ctime|date_format}">
                                                          <div class="mutual-status duedate"><span><span>{if $m[i].CID eq $smarty.session.USERID}{$lang297}{else}{$lang298}{/if}</span></span></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        {elseif $m[i].cancel eq "2"}
                                        <div class="db-main-table redbg" id="message_{$m[i].MID}">
                                            <table>
                                                <tbody>
                                                <tr>
                                                    <td class="leftitscriptolution width25">
                                                        <i style="color:#FB3737" class="fa fa-times fa-3x"></i> 
                                                    </td>
                                                    <td class="leftitscriptolution width75">                                
                                                        <div class="milestone warning" title="{$m[i].ctime|date_format}">
                                                          <div class="mutual-status duedate"><span><span>{$lang303}</span></span></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        {/if}
                                    {elseif $who eq "owner"}
                                    	{if $m[i].MSGFROM eq $smarty.session.USERID}
                                        <div class="db-main-table warning" id="message_{$m[i].MID}">
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <td colspan="2">
                                                            {$lang286}
                                                        </td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td class="leftitscriptolution width25">
                                                        <i style="color:#FBC137" class="fa fa-exclamation-circle fa-3x"></i> 
                                                    </td>
                                                    <td class="leftitscriptolution width75">                                
                                                        <div class="milestone action reqbox" title="{$lang293}"> 
                                                            <div class="status-label"></div> 
                                                            <div class="mutual-status underway">
                                                                <div class="padding5"></div>
                                                                <p>{$lang287}: {$m[i].message|stripslashes|nl2br}</p>
                                                                {if $m[i].cancel eq "0"}
                                                                <form name="abort{$m[i].MID}" method="post">
                                                                <input type="hidden" name="subabort" value="1">
                                                                <input type="hidden" name="AMID" value="{$m[i].MID}">
                                                                </form>
                                                                <div class="status-control">{$lang289}
                                                                <div style="clear:both; padding-bottom:10px;"></div>
                                                                <a class="ascriptolutionredbutton" style="color:#fff" href="#" onclick="document.abort{$m[i].MID}.submit()">{$lang290}</a>
                                                                <div style="clear:both; padding-bottom:10px;"></div>{$lang291}</div>
                                                                {/if}                                     
                                                            </div> 
                                                        </div>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        {else}
                                        <div class="db-main-table warning" id="message_{$m[i].MID}">
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <td colspan="2">
                                                            {$lang294}
                                                        </td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td class="leftitscriptolution width25">
                                                        <i style="color:#FBC137" class="fa fa-exclamation-circle fa-3x"></i> 
                                                    </td>
                                                    <td class="leftitscriptolution width75">                                
                                                        <div class="milestone action reqbox" title="{$lang293}"> 
                                                            <div class="status-label"></div> 
                                                            <div class="mutual-status underway">
                                                                <div class="padding5"></div>
                                                                <p>{$lang287}: {$m[i].message|stripslashes|nl2br}</p>
                                                                {if $m[i].cancel eq "0"}
                                                                <form name="decline{$m[i].MID}" method="post">
                                                                <input type="hidden" name="subdecline" value="1">
                                                                <input type="hidden" name="DMID" value="{$m[i].MID}">
                                                                </form>
                                                                <form name="accept{$m[i].MID}" method="post">
                                                                <input type="hidden" name="subaccept" value="1">
                                                                <input type="hidden" name="AMID" value="{$m[i].MID}">
                                                                </form>
                                                                <div class="status-control">{$lang291}
                                                                <div style="clear:both; padding-bottom:10px;"></div>
                                                                <a class="ascriptolutionredbutton" style="color:#fff" href="#" onclick="document.decline{$m[i].MID}.submit()">{$lang296}</a> - <a class="ascriptolutiongreenbutton" style="color:#fff" href="#" onclick="document.accept{$m[i].MID}.submit()">{$lang301}</a></div>
                                                                {/if}                                        
                                                            </div> 
                                                        </div>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        {/if}
                                        {if $m[i].cancel eq "1"}
                                        <div class="db-main-table yellowbg" id="message_{$m[i].MID}">
                                            <table>
                                                <tbody>
                                                <tr>
                                                    <td class="leftitscriptolution width25">
                                                        <i style="color:#FBC137" class="fa fa-times fa-3x"></i> 
                                                    </td>
                                                    <td class="leftitscriptolution width75">                                
                                                        <div class="milestone warning" title="{$m[i].ctime|date_format}">
                                                          <div class="mutual-status duedate"><span><span>{if $m[i].CID eq $smarty.session.USERID}{$lang299}{else}{$lang300}{/if}</span></span></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        {elseif $m[i].cancel eq "2"}
                                        <div class="db-main-table redbg" id="message_{$m[i].MID}">
                                            <table>
                                                <tbody>
                                                <tr>
                                                    <td class="leftitscriptolution width25">
                                                        <i style="color:#FB3737" class="fa fa-times fa-3x"></i> 
                                                    </td>
                                                    <td class="leftitscriptolution width75">                                
                                                        <div class="milestone warning" title="{$m[i].ctime|date_format}">
                                                          <div class="mutual-status duedate"><span><span>{$lang302}</span></span></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        {/if}
                                    {/if}
                                {elseif $m[i].action eq "seller_cancellation"}
                                	{if $who eq "owner"}
                                    <div class="db-main-table redbg" id="message_{$m[i].MID}">
                                        <table>
                                            <tbody>
                                            <tr>
                                                <td class="leftitscriptolution width25">
                                                    <i style="color:#FB3737" class="fa fa-times fa-3x"></i> 
                                                </td>
                                                <td class="leftitscriptolution width75">                                
                                                    <div class="milestone cancel" title="{$m[i].ctime|date_format}">
                                                      <div class="status-label"></div>
                                                      <div class="mutual-status duedate"><span>{$lang305}<br />{$lang287}: {$m[i].message|stripslashes|nl2br}</span></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    {/if}
                                {elseif $m[i].action eq "rejection"}
                                	{if $who eq "buyer"}
                                    <div class="db-main-table redbg">
                                        <table>
                                            <tbody>
                                            <tr>
                                                <td class="leftitscriptolution width25">
                                                    <i style="color:#FB3737" class="fa fa-exclamation-triangle fa-3x"></i> 
                                                </td>
                                                <td class="leftitscriptolution width75">                                
                                                    <div class="milestone cancel" title="{$m[i].time|date_format}"> 
                                                      <div class="status-label"></div> 
                                                      <div class="mutual-status duedate"><span>{$lang321}:<br />{$m[i].message|stripslashes|nl2br}</span></div> 
                                                    </div> 
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    {else}
                                    <div class="db-main-table redbg">
                                        <table>
                                            <tbody>
                                            <tr>
                                                <td class="leftitscriptolution width25">
                                                    <i style="color:#FB3737" class="fa fa-exclamation-triangle fa-3x"></i> 
                                                </td>
                                                <td class="leftitscriptolution width75">                                
                                                    <div class="milestone cancel" title="{$m[i].time|date_format}"> 
                                                      <div class="status-label"></div> 
                                                      <div class="mutual-status duedate"><h3>{$lang323}</h3><span>{$lang324}:<br />{$m[i].message|stripslashes|nl2br}</span></div>
                                                    </div> 
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    {/if}
                                {elseif $m[i].action eq "delivery"}
                                	{if $who eq "buyer"}
                                     <div class="db-main-table deliverybox" id="message_{$m[i].MID}">
                                        <table>
                                            <tbody>
                                            <tr>
                                                <td class="leftitscriptolution width25">
                                                    <i style="color:#0ABA44" class="fa fa-check fa-4x"></i> 
                                                </td>
                                                <td class="leftitscriptolution width75">                                
                                                    <div class="milestone action reqbox"> 
                                                        <div class="status-label"></div> 
                                                        <div class="mutual-status underway">
                                                            <h3 style="font-size:36px">{$lang308}</h3>
                                                            <div class="padding5"></div>
                                                            <span><p>{$m[i].message|stripslashes|nl2br}</p></span>
                                                            {include file="track_files.tpl" scriptolutionfileinfo=$m[i]}
                                                        </div> 
                                                        {if $m[i].MID eq $lasdel AND $m[i].reject eq "0"}
                                                        <div class="delivery-footer" style="clear:both;"> 
                                                            <div class="padding5"></div><small>[{$lang307}]</small>                                               
                                                        </div> 
                                                        {/if}
                                                    </div>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    {else}
                                    <div class="db-main-table deliverybox" id="message_{$m[i].MID}">
                                    <table>
                                        <tbody>
                                        <tr>
                                            <td class="leftitscriptolution width25">
                                                <i style="color:#0ABA44" class="fa fa-check fa-4x"></i> 
                                            </td>
                                            <td class="leftitscriptolution width75">                                
                                                <div class="milestone action reqbox"> 
                                                    <div class="status-label"></div> 
                                                    <div class="mutual-status underway">
                                                        <h3 style="font-size:36px">{$lang306}</h3>
                                                        <div class="padding5"></div>
                                                        <span><p>{$m[i].message|stripslashes|nl2br}</p></span>
                                                        {include file="track_files.tpl" scriptolutionfileinfo=$m[i]}
                                                    </div> 
                                                    {if $m[i].MID eq $lasdel AND $m[i].reject eq "0"}
                                                    <div class="delivery-footer" style="clear:both;"> 
                                                        <div class="padding5"></div
                                                        ><small>[{$lang307}]</small>                                               
                                                    </div> 
                                                    {/if}
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                    {/if}
                                {else}
                                    <div class="db-main-table reqbox" id="message_{$m[i].MID}">
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
                                                    <div class="message-toolkit">
                                                      {$m[i].time|date_format}
                                                    </div>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    {if $m[i].start eq "1" AND $USERID eq $smarty.session.USERID}
                                    <div class="db-main-table started">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <td>
                                                        {$lang277}
                                                    </td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>                       
                                                    <i style="color:#00668C" class="fa fa-fighter-jet fa-3x"></i>          
                                                    <div class="milestone okay" title="{$lang277}"> 
                                                      <div class="status-label"></div> 
                                                      <div class="mutual-status underway"><h3>{$lang275}. {$lang277}</h3> 
                                                            <span>                                            
                                                                <span>{$lang276} <b>{insert name=get_deadline value=a assign=deadline days=$days time=$m[i].time}{$deadline}</b></span>                                  
                                                            </span> 
                                                        </div> 
                                                    </div>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    {/if}
                                {/if}
								{/section}
                                {if $who eq "buyer"}
                                    {insert name=fback value=a assign=fbvl oid=$oid}
                                    {if $lasdel GT "0" AND $fbvl eq "0"}
                                        {insert name=get_status value=a assign=stat oid=$oid}
                                        {if $stat ne "6"}
                                        <form action="{$baseurl}/track?id={$oid}" class="review_form" id="new_rating" method="post">
                                        <div class="db-main-table">
                                            <table>
                                                <tbody>
                                                <tr>
                                                    <td>   
                                                        <h3 style="font-size:30px">{$lang310}</h3>                             
                                                          <div class="post-order-rating"> 
                                                            <input checked="checked" class="good-review-button" id="rating_value_1" name="ratingvalue" type="radio" value="1" /><i style="color:#0ABA44" class="fa fa-thumbs-up fa-2x"></i>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <input class="bad-review-button" id="rating_value_0" name="ratingvalue" type="radio" value="0" /><i style="color:#F99F2A" class="fa fa-thumbs-down fa-2x"></i> 
                                                          </div> 
                                                          <br clear="both"/> 
                                                          <div class="share-experience"> 
                                                            <textarea cols="35" id="rating_comment" maxlength="300" name="ratingcomment" rows="5" title="{$lang311}" placeholder="{$lang311}"></textarea> 
                                                            <br clear="all"/> 
                                                          </div> 
                                                          <div style="clear:both; padding-bottom:10px;"></div>
                                                            <input type="submit" value="{$lang46}" class="scriptolutionbluebutton" style="color:#FFF;display: inline;"  />
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <input type="hidden" name="subrat" value="1" /> 
                                        </form>
                                        {/if}
                                    {/if}
                                {/if}