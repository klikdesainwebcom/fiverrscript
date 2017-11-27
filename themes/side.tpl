				<link href="{$baseurl}/css/scriptolution_side.css" media="screen" rel="stylesheet" type="text/css" />  				
				<div class="sidebar">
                    <div class="side-nav">
                    	{include file='lang.tpl'}
                      <div class="t"></div>
                      <div class="c">
                        <form action="{$baseurl}/search" id="search_form" method="get">      
                        	<div class="search">
                            	<input class="text swap-value-small-search" id="query" name="query" type="text" value="" />
                            	<input type="image" src="{$imageurl}/btn-go02.gif" alt="Go" class="button" />
                          	</div>
                        </form>
                        <ul>
                          <li ><strong><a href="{$baseurl}/" style="color:green;">{$lang115}</a></strong></li>                          
                          {insert name=get_categories assign=c}
                          {section name=i loop=$c}
                            <li {if $catselect eq $c[i].CATID}class="active"{/if} id="scriptolution-main-menu-{$c[i].CATID}"><a href="{$baseurl}/categories/{$c[i].seo|stripslashes}">{$c[i].name|stripslashes}</a></li>
                            {insert name=get_subcategories assign=subcat value=var parent=$c[i].CATID}
                            {if $subcat|@count GT "0"}
                            {literal}
                            <script type="text/javascript">
                            $(document).ready(function()
                            {
                                $("#scriptolution-main-menu-{/literal}{$c[i].CATID}{literal}").mouseover(function() { $("#scriptolution-sub-{/literal}{$c[i].CATID}{literal}").css('visibility','visible'); });
                                $("#scriptolution-main-menu-{/literal}{$c[i].CATID}{literal}").mouseout(function() { $("#scriptolution-sub-{/literal}{$c[i].CATID}{literal}").css('visibility','hidden'); });
                                $("#scriptolution-sub-{/literal}{$c[i].CATID}{literal}").mouseover(function() { $("#scriptolution-sub-{/literal}{$c[i].CATID}{literal}").css('visibility','visible'); });
                                $("#scriptolution-sub-{/literal}{$c[i].CATID}{literal}").mouseout(function() { $("#scriptolution-sub-{/literal}{$c[i].CATID}{literal}").css('visibility','hidden'); });
                            });
                            </script>
                            {/literal}                 
                            <div class="subcat-menu" id="scriptolution-sub-{$c[i].CATID}" style="visibility:hidden;">    
                                <div class="subcat-menu-title"><a href="{$baseurl}/categories/{$c[i].seo|stripslashes}">{$c[i].name|stripslashes}</a></div>
                                <div class="subcat-menu-subtitle">{$c[i].details|stripslashes}</div>
                                <div class="sub-cat-popup-wrapper">
                                    <div class="sub-cat-menu">
                                        <ul class="sub_categories_list">
                                        	{section name=sc loop=$subcat}
                                            <li class="sub_category_item"><a href="{$baseurl}/categories/{$subcat[sc].seo|stripslashes}">{$subcat[sc].name|stripslashes}</a></li>
                                            {/section}
                                        </ul>
                                    </div>
                                </div>
                                
                                <div class="inner-cat-search">
                                    <form action="{$baseurl}/search" method="get">				
                                        <div class="row">
                                            <div class="search-in">{$lang503} {$c[i].name|stripslashes}</div>
                                            <div>
                                                <input class="text" name="query" type="text" />
                                                <input type="hidden" name="c" value="{$c[i].CATID}" />
                                                <input type="submit" value="{$lang114}" />
                                            </div>
                                        </div>
                                    </form>		
                                </div>
                            </div>
                            {/if}
                            {/section}
                        </ul> 
                        
                        
                        <div class="spacer"></div>
                                        <div class="bottom-cat">
                                          <div class="sep-border"></div>
                                          <div></div>
                                          <ul>
                                            <li class="link-li full-cat-dir"><a href="{$baseurl}/categories">{$lang519}</a></li>
                                          </ul>
                                        </div>
                                        
                                        
                                                               
                      </div>
                      <div class="b">&nbsp;</div>
                    </div>
                    
                    <div style="padding-bottom:10px;"></div>
	
                    <div class="suggest">
                      <div class="c">
                        {if $smarty.session.USERID eq ""}
                        <form action="{$baseurl}/login" method="post"> 
                        {else}
                        <form action="{$baseurl}/suggested" id="suggest_form" method="post">                        
                        {/if}                       
                        <div class="suggest-form">
                          <h3 style="margin-bottom:4px;">{$lang116}</h3>
                          <label>{$lang117}</label>
                          <textarea class="suggestion-box" cols="20" id="suggestion_content" maxlength="80" name="sugcontent" rows="3"></textarea>
                          <br clear="both"/>
                            <div class="suggest-category-select">
                                <div class="in">{$lang119}</div>
                                <div class="category">
                                  <select id="suggestion_category_id" name="sugcat">
                                  {section name=i loop=$c}
                                  <li ><a href="{$baseurl}/categories/{$c[i].seo|stripslashes}">{$c[i].name|stripslashes}</a></li>
                                  <option value="{$c[i].CATID|stripslashes}">{$c[i].name|stripslashes}</option>
                                  {/section}
                                  </select>
                                </div>
                            </div>
                          <div class="errors-for-suggestions"></div> 
                          {if $smarty.session.USERID eq ""}
                          <input type="submit" value="{$lang118}" style="padding-left:5px;padding-right:5px;padding-top:3px;padding-bottom:3px;float:right;" />
                          {else}
                          <input type="submit" value="{$lang118}" class="button" style="padding-left:5px;padding-right:5px;padding-top:3px;padding-bottom:3px;float:right;" />  
                          {/if}
                          <div class="suggest-progress-indicator-icon-message">{$lang120}</div>                      
                          <input type="hidden" name="sugsub" value="1" />
                        </div>
                        </form>
                        <div class="recent-suggestions">
                          <ul>
                          	{insert name=get_wants value=var assign=wants}
                            {section name=i loop=$wants}
                            <li><span class="user-wants"> <a href="{$baseurl}/{insert name=get_seo_profile value=a username=$wants[i].username|stripslashes}">{$wants[i].username|stripslashes}</a> {$lang122}:</span><br/>{$wants[i].want|stripslashes}
                                <br/>                                
                            </li>
                            {/section}
                          </ul>
                          <center><a href="{$baseurl}/suggested" style="text-decoration:none; font-weight:bold;">{$lang501}</a></center>
                        </div>
                    
                      </div>
                      <div class="b">&nbsp;</div>
                      
                    <div style="padding-top:10px;">
                    <center>
                    {insert name=get_advertisement AID=2}
                    </center>
                    </div>
                    </div>
				</div>