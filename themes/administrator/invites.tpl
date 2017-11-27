		<div class="middle" id="anchor-content">
            <div id="page:main-container">
				<div class="columns ">
                
					<div class="side-col" id="page:left">
    					<h3>Launch</h3>
						
                        <ul id="isoft" class="tabs">
    						<li >
        						<a href="invites.php" id="isoft_group_1" name="group_1" title="Requested Invites" class="tab-item-link ">
                                    <span>
                                        <span class="changed" title=""></span>
                                        <span class="error" title=""></span>
                                        Requested Invites
                                    </span>
        						</a>
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                <div id="isoft_group_1_content" style="display:none;">
                                	<div class="entry-edit" style="width:800px">
                                    	
                                        <div class="entry-edit-head">
                                            <h4 class="icon-head head-edit-form fieldset-legend">Requested Invites</h4>
                                            <div class="form-buttons">

                                            </div>
                                    	</div>

                                        <div>
        			<div id="customerGrid">
        				<table cellspacing="0" class="actions">
        				<tr>
                    		<td class="pager">
                            	Showing {if $total gt 0}{$beginning} - {$ending} of {/if}{$total} Requested Invites
                    		</td>
                			<td class="export a-right"></td>
            				<td class="filter-actions a-right">
                            	<button type="button" class="scalable " onclick="document.location.href='invites.php?invite=everyone'" style=""><span>Invite Everyone!</span></button>
                            	<button  id="id_ffba3971e132ae3d78c160244ea09b39" type="button" class="scalable " onclick="document.location.href='invites.php'" style=""><span>Reset Filter</span></button>
            					<button  id="id_56a0b03bf0b3be131176f3243cc289ff" type="button" class="scalable task" onclick="document.main_form.submit();" style=""><span>Search</span></button>        
                            </td>
        				</tr>
    					</table>
                        
                        <div class="grid">
							<div class="hor-scroll">
								<table cellspacing="0" class="data" id="customerGrid_table">
                                <col  />
                                <col  width="125"  />
	    	    	        	<thead>
	            	                <tr class="headings">
                                        <th ><span class="nobr"><a href="invites.php?page={$currentpage}&sortby=scriptolutionemail&sorthow={if $sortby eq "scriptolutionemail"}{if $sorthow eq "desc"}asc{else}desc{/if}{else}{$sorthow}{/if}{if $search eq "1"}&scriptolutionemail={$scriptolutionemail}{/if}" name="scriptolutionemails" class="{if $sortby eq "scriptolutionemail"}sort-arrow-{if $sorthow eq "desc"}desc{else}asc{/if}{else}not-sort{/if}"><span class="sort-title">E-Mail Address</span></a></span></th>
                                        <th  class=" no-link last"><span class="nobr">Action</span></th>
	                	            </tr>
	            	            	<tr class="filter">
                                        <th ><input type="text" name="scriptolutionemail" id="scriptolutionemail" value="{$scriptolutionemail|stripslashes}" class="input-text no-changes"/></th>
                                        <th  class=" no-link last">
                                            <div style="width: 100%;">&nbsp;</div>
                                        </th>
	                	            </tr>
	            	        	</thead>
	    	    	    		<tbody>
                                	{section name=i loop=$results}
                                    <tr id="" >
                                        <td class=" a-right ">{$results[i].scriptolutionemail|stripslashes}</td>
                                        <td class=" last"><a href="invites.php?page={$currentpage}&sortby={$sortby}&sorthow={$sorthow}{if $search eq "1"}&scriptolutionemail={$scriptolutionemail}{/if}&delete=1&DIP={$results[i].LID}">Delete</a> | <a href="invites.php?page={$currentpage}&sortby={$sortby}&sorthow={$sorthow}{if $search eq "1"}&scriptolutionemail={$scriptolutionemail}{/if}&go=1&DIP={$results[i].LID}">Invite</a></td>
                                	</tr>
                                    {/section}
                                    <tr>
                                    	<td colspan="2">
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
                               <h3 class="icon-head head-products">Launch - Requested Invites</h3>
                            </div>
                            
                            <form action="invites.php" method="post" id="main_form" name="main_form" enctype="multipart/form-data">
                            	<input type="hidden" id="submitform" name="submitform" value="1" >
                            	<div style="display:none"></div>
                            </form>
						</div>
					</div>
				</div>

                        </div>
        </div>