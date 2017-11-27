{include file="scriptolution_error7.tpl"}
<div class="bodybg scriptolutionpaddingtop15">
	<div class="whitebody scriptolutionpaddingtop30 gray">
		<div class="inner-wrapper">
			<div class="clear"></div>
			<div class="left-side">
				<div class="whiteBox twoHalfs padding15 scriptolutionshop">
					<h1>{$lang544}</h1>
                    <div class="clear"></div>
                    <div class="scriptolutionpaddingbottom10"></div>
					<div class="db-main-table eeescriptolution">
                        <div id="allscriptolutionNotifBox" class="allscriptolutionNotifBox">                        
                            {if $posts|@count eq "0"}
                            <div id="scriptolutionNotifBox_none">
                              {$lang543}
                            </div>
                            {else}
                            {section name=i loop=$posts}
                            {if $posts[i].scriptolution_type eq "scriptolution_buyer_requirements"}
                            <div class="scriptolution-notification-all-view">
                            <a {if $posts[i].scriptolution_unread eq "1"}style="font-weight:bold"{/if} href="{$baseurl}/track?id={$posts[i].scriptolution_OID}">&middot; {$lang531} ({$lang140} #{$posts[i].scriptolution_OID})</a>
                            </div>
                            {elseif $posts[i].scriptolution_type eq "fiverrscript_dotcom_neworder"}
                            <div class="scriptolution-notification-all-view">
                            <a {if $posts[i].scriptolution_unread eq "1"}style="font-weight:bold"{/if} href="{$baseurl}/track?id={$posts[i].scriptolution_OID}">&middot; {$lang532} ({$lang140} #{$posts[i].scriptolution_OID})</a>
                            </div>
                            {elseif $posts[i].scriptolution_type eq "fiverrscript_dotcom_orderupdate"}
                            <div class="scriptolution-notification-all-view">
                            <a {if $posts[i].scriptolution_unread eq "1"}style="font-weight:bold"{/if} href="{$baseurl}/track?id={$posts[i].scriptolution_OID}">&middot; {$lang533} ({$lang140} #{$posts[i].scriptolution_OID})</a>
                            </div>
                            {elseif $posts[i].scriptolution_type eq "fiverrscript_dotcom_orderdelivered"}
                            <div class="scriptolution-notification-all-view">
                            <a {if $posts[i].scriptolution_unread eq "1"}style="font-weight:bold"{/if} href="{$baseurl}/track?id={$posts[i].scriptolution_OID}">&middot; {$lang534} ({$lang140} #{$posts[i].scriptolution_OID})</a>
                            </div>
                            {elseif $posts[i].scriptolution_type eq "fiverrscript_dotcom_orderdeliveryreject"}
                            <div class="scriptolution-notification-all-view">
                            <a {if $posts[i].scriptolution_unread eq "1"}style="font-weight:bold"{/if} href="{$baseurl}/track?id={$posts[i].scriptolution_OID}">&middot; {$lang535} ({$lang140} #{$posts[i].scriptolution_OID})</a>
                            </div>
                            {elseif $posts[i].scriptolution_type eq "fiverrscript_dotcom_orderfeedback"}
                            <div class="scriptolution-notification-all-view">
                            <a {if $posts[i].scriptolution_unread eq "1"}style="font-weight:bold"{/if} href="{$baseurl}/track?id={$posts[i].scriptolution_OID}">&middot; {$lang536} ({$lang140} #{$posts[i].scriptolution_OID})</a>
                            </div>
                            {elseif $posts[i].scriptolution_type eq "mutual_cancellation_request"}
                            <div class="scriptolution-notification-all-view">
                            <a {if $posts[i].scriptolution_unread eq "1"}style="font-weight:bold"{/if} href="{$baseurl}/track?id={$posts[i].scriptolution_OID}">&middot; {$lang537} ({$lang140} #{$posts[i].scriptolution_OID})</a>
                            </div>
                            {elseif $posts[i].scriptolution_type eq "seller_cancellation"}
                            <div class="scriptolution-notification-all-view">
                            <a {if $posts[i].scriptolution_unread eq "1"}style="font-weight:bold"{/if} href="{$baseurl}/track?id={$posts[i].scriptolution_OID}">&middot; {$lang538} ({$lang140} #{$posts[i].scriptolution_OID})</a>
                            </div>
                            {elseif $posts[i].scriptolution_type eq "scriptolution_abort_cancellation"}
                            <div class="scriptolution-notification-all-view">
                            <a {if $posts[i].scriptolution_unread eq "1"}style="font-weight:bold"{/if} href="{$baseurl}/track?id={$posts[i].scriptolution_OID}">&middot; {$lang539} ({$lang140} #{$posts[i].scriptolution_OID})</a>
                            </div>
                            {elseif $posts[i].scriptolution_type eq "scriptolution_accept_cancellation"}
                            <div class="scriptolution-notification-all-view">
                            <a {if $posts[i].scriptolution_unread eq "1"}style="font-weight:bold"{/if} href="{$baseurl}/track?id={$posts[i].scriptolution_OID}">&middot; {$lang540} ({$lang140} #{$posts[i].scriptolution_OID})</a>
                            </div>
                            {elseif $posts[i].scriptolution_type eq "scriptolution_reject_cancellation"}
                            <div class="scriptolution-notification-all-view">
                            <a {if $posts[i].scriptolution_unread eq "1"}style="font-weight:bold"{/if} href="{$baseurl}/track?id={$posts[i].scriptolution_OID}">&middot; {$lang541} ({$lang140} #{$posts[i].scriptolution_OID})</a>
                            </div>
                            {/if}
                            {/section}
                            {/if}
        				</div> 
					</div>
					<div class="clear"></div>	
                    
                    <div align="center">
                        <div class="paging">
                            <div class="p1">
                                <ul>
                                    {$pagelinks}
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    			
				</div>
                
			</div>
			{include file='scriptolution_newside.tpl'}            	
		</div>    
	</div>
</div>