<div class="middle" id="anchor-content">
    <div id="page:main-container">
        <div class="columns ">
            <div class="side-col" id="page:left">
            	<h3>Conversations</h3>
                <ul id="isoft" class="tabs">
                    <li >
                        <a href="conversations_manage.php" id="isoft_group_1" name="group_1" title="Manage Conversations" class="tab-item-link ">
                            <span>
                                <span class="changed" title=""></span>
                                <span class="error" title=""></span>
                                Manage Conversations
                            </span>
                        </a>
                        <div id="isoft_group_1_content" style="display:none;">
                            <div class="entry-edit">
                                <div class="entry-edit-head">
                                	<h4 class="icon-head head-edit-form fieldset-legend">Manage Conversations</h4>
                                	<div class="form-buttons">
                                	</div>
                                </div>
                                <div>
                                    <div id="customerGrid">
                                        <table cellspacing="0" class="actions">
                                            <tr>
                                                <td class="pager">
                                                Showing {if $total gt 0}{$beginning} - {$ending} of {/if}{$total} Conversations
                                                </td>
                                            	<td class="export a-right"></td>
                                                <td class="filter-actions a-right">
                                                <button id="id_ffba3971e132ae3d78c160244ea09b39" type="button" class="scalable " onclick="document.location.href='conversations_manage.php'" style=""><span>Reset Filter</span></button>
                                                <button id="id_56a0b03bf0b3be131176f3243cc289ff" type="button" class="scalable task" onclick="document.main_form.submit();" style=""><span>Search</span></button>
                                                </td>
                                            </tr>
                                        </table>
                                        <div class="grid">
                                            <div class="hor-scroll">
                                                <table cellspacing="0" class="data" id="customerGrid_table">
                                                    <col width="50" width="100px" />
                                                    <col width="150" />
                                                    <col />
                                                    <col width="200" />
                                                    <thead>
                                                        <tr class="headings">
                                                            <th ><span class="nobr"><a href="conversations_manage.php?page={$currentpage}&sortby=MID&sorthow={if $sortby eq "MID"}{if $sorthow eq "desc"}asc{else}desc{/if}{else}{$sorthow}{/if}{if $search eq "1"}&fromid={$fromid}&toid={$toid}&msgfrom={$msgfrom}&msgto={$msgto}&msg={$msg}{/if}" name="id" class="{if $sortby eq "MID"}sort-arrow-{if $sorthow eq "desc"}desc{else}asc{/if}{else}not-sort{/if}"><span class="sort-title">Message ID</span></a></span></th>
                                                            <th ><span class="nobr"><a href="conversations_manage.php?page={$currentpage}&sortby=msgfrom&sorthow={if $sortby eq "msgfrom"}{if $sorthow eq "desc"}asc{else}desc{/if}{else}{$sorthow}{/if}{if $search eq "1"}&fromid={$fromid}&toid={$toid}&msgfrom={$msgfrom}&msgto={$msgto}&msg={$msg}{/if}" name="msgfrom" class="{if $sortby eq "msgfrom"}sort-arrow-{if $sorthow eq "desc"}desc{else}asc{/if}{else}not-sort{/if}"><span class="sort-title">Sender</span></a></span></th>
                                                            <th ><span class="nobr"><a href="conversations_manage.php?page={$currentpage}&sortby=msgto&sorthow={if $sortby eq "msgto"}{if $sorthow eq "desc"}asc{else}desc{/if}{else}{$sorthow}{/if}{if $search eq "1"}&fromid={$fromid}&toid={$toid}&msgfrom={$msgfrom}&msgto={$msgto}&msg={$msg}{/if}" name="msgto" class="{if $sortby eq "msgto"}sort-arrow-{if $sorthow eq "desc"}desc{else}asc{/if}{else}not-sort{/if}"><span class="sort-title">Receiver</span></a></span></th>
                                                            <th ><span class="nobr"><a href="conversations_manage.php?page={$currentpage}&sortby=msg&sorthow={if $sortby eq "msg"}{if $sorthow eq "desc"}asc{else}desc{/if}{else}{$sorthow}{/if}{if $search eq "1"}&fromid={$fromid}&toid={$toid}&msgfrom={$msgfrom}&msgto={$msgto}&msg={$msg}{/if}" name="msg" class="{if $sortby eq "msg"}sort-arrow-{if $sorthow eq "desc"}desc{else}asc{/if}{else}not-sort{/if}"><span class="sort-title">Message</span></a></span></th>
                                                            <th class=" no-link last"><span class="nobr">Action</span></th>
                                                            </tr>
                                                            <tr class="filter">
                                                            <th >
                                                            <div class="range">
                                                            <div class="range-line">
                                                            <span class="label">From:</span>
                                                            <input type="text" name="fromid" id="fromid" value="{$fromid}" class="input-text no-changes"/>
                                                            </div>
                                                            <div class="range-line">
                                                            <span class="label">To : </span>
                                                            <input type="text" name="toid" id="toid" value="{$toid}" class="input-text no-changes"/>
                                                            </div>
                                                            </div>
                                                            </th>
                                                            <th ><input type="text" name="msgfrom" id="msgfrom" value="{$msgfrom|stripslashes}" class="input-text no-changes"/></th>
                                                            <th ><input type="text" name="msgto" id="msgto" value="{$msgto|stripslashes}" class="input-text no-changes"/></th>
                                                            <th ><input type="text" name="msg" id="msg" value="{$msg|stripslashes}" class="input-text no-changes"/></th>
                                                            <th class=" no-link last">
                                                            <div style="width: 100%;">&nbsp;</div>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        {section name=i loop=$results}
                                                        <tr id="" >
                                                            <td align="center">{$results[i].MID}</td>
                                                            <td class=" ">{$results[i].msgfrom|stripslashes|truncate:30:"...":true}</td>
                                                            <td class=" ">{$results[i].msgto|stripslashes|truncate:30:"...":true}</td>
                                                            <td class=" ">{$results[i].message|stripslashes|truncate:200:"...":true}</td>
                                                            <td class=" last"><a href="conversations_manage.php?page={$currentpage}&sortby={$sortby}&sorthow={$sorthow}{if $search eq "1"}&fromid={$fromid}&toid={$toid}&msgfrom={$msgfrom}&msgto={$msgto}&msg={$msg}{/if}&delete=1&DMID={$results[i].MID}">Delete Message</a></td>
                                                        </tr>
                                                        {/section}
                                                        <tr>
                                                        <td colspan="5">
                                                        {$pagelinks}
                                                        </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            <script type="text/javascript">
            isoftJsTabs = new varienTabs('isoft', 'main_form', 'isoft_group_1', []);
            </script>
            </div>
            <div class="main-col" id="content">
                <div class="main-col-inner">
                    <div id="messages">
                    {if $message ne "" OR $error ne ""}
                    {include file="administrator/show_message.tpl"}
                    {/if}
                    </div>
                
                    <div class="content-header">
                    	<h3 class="icon-head head-products">Conversations - Manage Conversations</h3>
                    </div>
                
                    <form action="conversations_manage.php" method="post" id="main_form" name="main_form" enctype="multipart/form-data">
                        <input type="hidden" id="submitform" name="submitform" value="1" >
                        <div style="display:none"></div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>