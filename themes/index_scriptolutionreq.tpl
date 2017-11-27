        <div class="whiteBox homescriptolutionreq">
            <h1>{$lang632}</h1>
            <div class="scriptolution-table myrequests">
                <table>
                    <thead>
                        <tr>
                            <td style="text-align:left;">{$lang158}</td>
                            <td style="text-align:left;">{$lang630}</td>
                            <td class="scriptolutionmhide" style="text-align:left;">{$lang631}</td>
                            <td class="scriptolutionmhide" style="text-align:left;">{$lang623}</td>
                            <td class="scriptolutionmhide">{$lang625}</td>
                        </tr>
                    </thead>
                    <tbody>
                    {insert name=afewscriptolutionrequests value=a assign=newscriptolutions}
                    {if $newscriptolutions|@count eq "0"}
                    <tr>
                        <td colspan="5">
                        {$lang633}
                        <div class="scriptolutionpaddingbottom10"></div>
                        <a href="{$baseurl}/newrequest" class="sendascriptolutionoffer">{$lang621}</a>
                        </td>
                    </tr>
                    {else}
                        {section name=i loop=$newscriptolutions}
                        {insert name=seo_clean_titles assign=title value=a title=$newscriptolutions[i].gtitle}
                        <tr>
                            <td class="status-star">
                                <div class="scriptolutionviewrequest3">
                                    <a href="{$baseurl}/{insert name=get_seo_profile value=a username=$newscriptolutions[i].username|stripslashes}">{$newscriptolutions[i].username|stripslashes|truncate:15:"...":true}</a>
                                </div>
                            </td>
                            <td class="ellipsis-wrap">
                                <div class="ellipsissuggest"> 
                                    <div class="scriptolutionviewrequest1">
                                        {$newscriptolutions[i].scriptolutiondesc|stripslashes}
                                    </div>
                                </div>
                            </td>
                            <td class="scriptolutionmhide">
                                <div class="offersbuttonscriptolutionnopointer" href="">{insert name=scriptolutionoffercnt value=a assign=socnt REQUESTID=$newscriptolutions[i].REQUESTID}{$socnt} {if $socnt eq "1"}{$lang640}{else}{$lang631}{/if}</div>
                            </td>
                            <td class="scriptolutionmhide">
                                {$newscriptolutions[i].scriptolutiondays} {$lang131}
                            </td>
                            <td class="scriptolutionmhide">
                                {if $scriptolution_cur_pos ne "1"}{$lang197}{/if}{$newscriptolutions[i].scriptolutionprice}{if $scriptolution_cur_pos eq "1"}{$lang197}{/if}
                            </td>
                        </tr>
                        <tr>
                            <td class="scriptolutionmunhide">
                                <div class="offersbuttonscriptolutionnopointer">{$socnt} {if $socnt eq "1"}{$lang640}{else}{$lang631}{/if}</div>
                            </td>
                            <td class="scriptolutionmunhide">
                                {$newscriptolutions[i].scriptolutiondays} {$lang131}
                                <span style="margin-right:30px;"></span>
                                {if $scriptolution_cur_pos ne "1"}{$lang197}{/if}{$newscriptolutions[i].scriptolutionprice}{if $scriptolution_cur_pos eq "1"}{$lang197}{/if}
                            </td>
                        </tr>
                        <tr>
                            <td class="scriptolutiontopborder0" colspan="2">
                                <a class="sendascriptolutionoffer" href="{$baseurl}/sendoffer?REQID={$newscriptolutions[i].REQUESTID}">{$lang634}</a>
                            </td>
                        </tr>
                        {if $smarty.section.i.last}
                        <tr>
                            <td colspan="5">
                               <div></div>
                            </td>
                        </tr>
                        {else}
                        <tr>
                            <td colspan="5" class="scriptolutiontdhrline">
                                <hr class="scriptolutionlighthr" />
                            </td>
                        </tr>
                        {/if}
                        {/section}
                    {/if}
                    </tbody>
                </table>
            </div>
            
            <div align="center">
                <a href="{$baseurl}/requests" class="scriptolutionbignewbutton">{$lang649}</a>
            </div>
                
        </div>
        <div class="clear"></div>            