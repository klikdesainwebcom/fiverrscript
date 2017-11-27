		<div class="middle" id="anchor-content">
            <div id="page:main-container">
				<div class="columns ">
                
					<div class="side-col" id="page:left">
    					<h3>Referrals</h3>
						
                        <ul id="isoft" class="tabs">                        	
                            
    						<li >
        						<a href="referrals_manage.php" id="isoft_group_1" name="group_1" title="Manage Referrals" class="tab-item-link ">
                                    <span>
                                        <span class="changed" title=""></span>
                                        <span class="error" title=""></span>
                                        Manage Referrals
                                    </span>
        						</a>
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                <div id="isoft_group_1_content" style="display:none;">
                                	<div class="entry-edit">
                                        <div class="entry-edit-head">
                                            <h4 class="icon-head head-edit-form fieldset-legend">Referrals</h4>
                                            <div class="form-buttons">

                                            </div>
                                    	</div>

                                        <div>
        			<div id="customerGrid">
        				<table cellspacing="0" class="actions">
        				<tr>
                    		<td class="pager">
                            	Showing {if $total gt 0}{$beginning} - {$ending} of {/if}{$total} Referrals
                    		</td>
                			<td class="export a-right"></td>
            				<td class="filter-actions a-right">
                            	<button  id="id_ffba3971e132ae3d78c160244ea09b39" type="button" class="scalable " onclick="document.location.href='referrals_manage.php'" style=""><span>Reset Filter</span></button>
            					<button  id="id_56a0b03bf0b3be131176f3243cc289ff" type="button" class="scalable task" onclick="document.main_form.submit();" style=""><span>Search</span></button>        
                            </td>
        				</tr>
    					</table>
                        
                        <div class="grid">
							<div class="hor-scroll">
								<table cellspacing="0" class="data" id="customerGrid_table">
                                <col  width="50"  width="100px"  />
                                <col   />
                                <col   />
                                <col   />
                                <col   />
                                <col   />
                                <col   />
                                <col  width="215"  />
	    	    	        	<thead>
	            	                <tr class="headings">
                                        <th ><span class="nobr"><a href="referrals_manage.php?page={$currentpage}&sortby=RID&sorthow={if $sortby eq "RID"}{if $sorthow eq "desc"}asc{else}desc{/if}{else}{$sorthow}{/if}{if $search eq "1"}&fromid={$fromid}&toid={$toid}&username={$username}&refd={$refd}&ip={$ip}{/if}" name="id" class="{if $sortby eq "RID"}sort-arrow-{if $sorthow eq "desc"}desc{else}asc{/if}{else}not-sort{/if}"><span class="sort-title">ID</span></a></span></th>
                                        <th ><span class="nobr"><a href="referrals_manage.php?page={$currentpage}&sortby=username&sorthow={if $sortby eq "username"}{if $sorthow eq "desc"}asc{else}desc{/if}{else}{$sorthow}{/if}{if $search eq "1"}&fromid={$fromid}&toid={$toid}&username={$username}&refd={$refd}&ip={$ip}{/if}" name="username" class="{if $sortby eq "username"}sort-arrow-{if $sorthow eq "desc"}desc{else}asc{/if}{else}not-sort{/if}"><span class="sort-title">Username</span></a></span></th>
                                        <th ><span class="nobr"><a href="referrals_manage.php?page={$currentpage}&sortby=refd&sorthow={if $sortby eq "refd"}{if $sorthow eq "desc"}asc{else}desc{/if}{else}{$sorthow}{/if}{if $search eq "1"}&fromid={$fromid}&toid={$toid}&username={$username}&refd={$refd}&ip={$ip}{/if}" name="refd" class="{if $sortby eq "refd"}sort-arrow-{if $sorthow eq "desc"}desc{else}asc{/if}{else}not-sort{/if}"><span class="sort-title">Referred</span></a></span></th>
                                        <th ><span class="nobr"><a href="referrals_manage.php?page={$currentpage}&sortby=money&sorthow={if $sortby eq "money"}{if $sorthow eq "desc"}asc{else}desc{/if}{else}{$sorthow}{/if}{if $search eq "1"}&fromid={$fromid}&toid={$toid}&username={$username}&refd={$refd}&ip={$ip}{/if}" name="money" class="{if $sortby eq "money"}sort-arrow-{if $sorthow eq "desc"}desc{else}asc{/if}{else}not-sort{/if}"><span class="sort-title">Money</span></a></span></th>
                                        <th ><span class="nobr"><a href="referrals_manage.php?page={$currentpage}&sortby=time_added&sorthow={if $sortby eq "time_added"}{if $sorthow eq "desc"}asc{else}desc{/if}{else}{$sorthow}{/if}{if $search eq "1"}&fromid={$fromid}&toid={$toid}&username={$username}&refd={$refd}&ip={$ip}{/if}" name="time_added" class="{if $sortby eq "time_added"}sort-arrow-{if $sorthow eq "desc"}desc{else}asc{/if}{else}not-sort{/if}"><span class="sort-title">Date</span></a></span></th>
                                        <th ><span class="nobr"><a href="referrals_manage.php?page={$currentpage}&sortby=ip&sorthow={if $sortby eq "ip"}{if $sorthow eq "desc"}asc{else}desc{/if}{else}{$sorthow}{/if}{if $search eq "1"}&fromid={$fromid}&toid={$toid}&username={$username}&refd={$refd}&ip={$ip}{/if}" name="ip" class="{if $sortby eq "ip"}sort-arrow-{if $sorthow eq "desc"}desc{else}asc{/if}{else}not-sort{/if}"><span class="sort-title">IP</span></a></span></th>
                                        <th ><span class="nobr"><a href="referrals_manage.php?page={$currentpage}&sortby=status&sorthow={if $sortby eq "status"}{if $sorthow eq "desc"}asc{else}desc{/if}{else}{$sorthow}{/if}{if $search eq "1"}&fromid={$fromid}&toid={$toid}&username={$username}&refd={$refd}&ip={$ip}{/if}" name="status" class="{if $sortby eq "status"}sort-arrow-{if $sorthow eq "desc"}desc{else}asc{/if}{else}not-sort{/if}"><span class="sort-title">Status</span></a></span></th>
                                        <th  class=" no-link last"><span class="nobr">Action</span></th>
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
                                        <th ><input type="text" name="username" id="username" value="{$username|stripslashes}" class="input-text no-changes"/></th>
                                        <th ><input type="text" name="refd" id="refd" value="{$refd|stripslashes}" class="input-text no-changes"/></th>
                                        <th ></th>
                                        <th ></th>
                                        <th ><input type="text" name="ip" id="ip" value="{$ip|stripslashes}" class="input-text no-changes"/></th>
                                        <th ></th>
                                        <th  class=" no-link last">
                                            <div style="width: 100%;">&nbsp;</div>
                                        </th>
	                	            </tr>
	            	        	</thead>
	    	    	    		<tbody>
                                	{section name=i loop=$results}
                                    <tr id="" >
                                        <td align="center">{$results[i].RID}</td>
                                        <td class=" ">{$results[i].username|stripslashes}</td>
                                        <td class=" ">{$results[i].refd|stripslashes}</td>
                                        <td class=" ">{$lang197}{if $results[i].status|stripslashes eq "2"}0{else}{$results[i].money|stripslashes}{/if}</td>
                                        <td class=" ">{$results[i].time_added|date_format}</td>
                                        <td class=" ">{$results[i].ip|stripslashes}</td>
                                        <td class=" ">{if $results[i].status|stripslashes eq "0"}{$lang194}{elseif $results[i].status|stripslashes eq "1"}{$lang202}{elseif $results[i].status|stripslashes eq "2"}{$lang517}{/if}</td>
                                        <td class=" last">
                                            <a href="referrals_manage.php?page={$currentpage}&sortby={$sortby}&sorthow={$sorthow}{if $search eq "1"}&fromid={$fromid}&toid={$toid}&username={$username}&refd={$refd}&ip={$ip}{/if}&delete=1&RID={$results[i].RID}">Delete</a>
                                        </td>
                                	</tr>
                                    {/section}
                                    <tr>
                                    	<td colspan="8">
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
                            
                            <li >
                                <a href="referrals_validate.php" id="isoft_group_2" name="group_2" title="Validate Referrals" class="tab-item-link">
                                	<span>
                                    	<span class="changed" title=""></span>
                                        <span class="error" title=""></span>
                                        Validate Referrals
                                    </span>
                                </a>
                                <div id="isoft_group_2_content" style="display:none;"></div>
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
                               <h3 class="icon-head head-products">Referrals - Manage Referrals</h3>
                            </div>
                            
                            <form action="referrals_manage.php" method="post" id="main_form" name="main_form" enctype="multipart/form-data">
                            	<input type="hidden" id="submitform" name="submitform" value="1" >
                            	<div style="display:none"></div>
                            </form>
						</div>
					</div>
				</div>

                        </div>
        </div>