{if $smarty.session.USERID ne ""}
<div id="scriptolution-notifications-popup" style="display:none">
    <div id="scriptolutionNotifBox" class="scriptolutionNotifBox">
      <div id="scriptolutionNotifBox_top" class="scriptolutionNotifBox_sprite"></div>
      <div id="scriptolutionNotifBox_content">
        {insert name=get_scriptolution_notifications value=a assign=fiverrscript_dotcom_notification USERID=$smarty.session.USERID}      
        {if $fiverrscript_dotcom_notification|@count eq "0"}
        <div id="scriptolutionNotifBox_none">
          {$lang543}
        </div>
        {else}
		{section name=i loop=$fiverrscript_dotcom_notification}
        {if $fiverrscript_dotcom_notification[i].scriptolution_type eq "scriptolution_buyer_requirements"}
        <hr class="style-six" />
        <div style="padding:10px;">
        <a {if $fiverrscript_dotcom_notification[i].scriptolution_unread eq "1"}style="font-weight:bold"{/if} href="{$baseurl}/track?id={$fiverrscript_dotcom_notification[i].scriptolution_OID}">{$lang531} ({$lang140} #{$fiverrscript_dotcom_notification[i].scriptolution_OID})</a>
        </div>
        {elseif $fiverrscript_dotcom_notification[i].scriptolution_type eq "fiverrscript_dotcom_neworder"}
        <hr class="style-six" />
        <div style="padding:10px;">
        <a {if $fiverrscript_dotcom_notification[i].scriptolution_unread eq "1"}style="font-weight:bold"{/if} href="{$baseurl}/track?id={$fiverrscript_dotcom_notification[i].scriptolution_OID}">{$lang532} ({$lang140} #{$fiverrscript_dotcom_notification[i].scriptolution_OID})</a>
        </div>
        {elseif $fiverrscript_dotcom_notification[i].scriptolution_type eq "fiverrscript_dotcom_orderupdate"}
        <hr class="style-six" />
        <div style="padding:10px;">
        <a {if $fiverrscript_dotcom_notification[i].scriptolution_unread eq "1"}style="font-weight:bold"{/if} href="{$baseurl}/track?id={$fiverrscript_dotcom_notification[i].scriptolution_OID}">{$lang533} ({$lang140} #{$fiverrscript_dotcom_notification[i].scriptolution_OID})</a>
        </div>
        {elseif $fiverrscript_dotcom_notification[i].scriptolution_type eq "fiverrscript_dotcom_orderdelivered"}
        <hr class="style-six" />
        <div style="padding:10px;">
        <a {if $fiverrscript_dotcom_notification[i].scriptolution_unread eq "1"}style="font-weight:bold"{/if} href="{$baseurl}/track?id={$fiverrscript_dotcom_notification[i].scriptolution_OID}">{$lang534} ({$lang140} #{$fiverrscript_dotcom_notification[i].scriptolution_OID})</a>
        </div>
        {elseif $fiverrscript_dotcom_notification[i].scriptolution_type eq "fiverrscript_dotcom_orderdeliveryreject"}
        <hr class="style-six" />
        <div style="padding:10px;">
        <a {if $fiverrscript_dotcom_notification[i].scriptolution_unread eq "1"}style="font-weight:bold"{/if} href="{$baseurl}/track?id={$fiverrscript_dotcom_notification[i].scriptolution_OID}">{$lang535} ({$lang140} #{$fiverrscript_dotcom_notification[i].scriptolution_OID})</a>
        </div>
        {elseif $fiverrscript_dotcom_notification[i].scriptolution_type eq "fiverrscript_dotcom_orderfeedback"}
        <hr class="style-six" />
        <div style="padding:10px;">
        <a {if $fiverrscript_dotcom_notification[i].scriptolution_unread eq "1"}style="font-weight:bold"{/if} href="{$baseurl}/track?id={$fiverrscript_dotcom_notification[i].scriptolution_OID}">{$lang536} ({$lang140} #{$fiverrscript_dotcom_notification[i].scriptolution_OID})</a>
        </div>
        {elseif $fiverrscript_dotcom_notification[i].scriptolution_type eq "mutual_cancellation_request"}
        <hr class="style-six" />
        <div style="padding:10px;">
        <a {if $fiverrscript_dotcom_notification[i].scriptolution_unread eq "1"}style="font-weight:bold"{/if} href="{$baseurl}/track?id={$fiverrscript_dotcom_notification[i].scriptolution_OID}">{$lang537} ({$lang140} #{$fiverrscript_dotcom_notification[i].scriptolution_OID})</a>
        </div>
        {elseif $fiverrscript_dotcom_notification[i].scriptolution_type eq "seller_cancellation"}
        <hr class="style-six" />
        <div style="padding:10px;">
        <a {if $fiverrscript_dotcom_notification[i].scriptolution_unread eq "1"}style="font-weight:bold"{/if} href="{$baseurl}/track?id={$fiverrscript_dotcom_notification[i].scriptolution_OID}">{$lang538} ({$lang140} #{$fiverrscript_dotcom_notification[i].scriptolution_OID})</a>
        </div>
        {elseif $fiverrscript_dotcom_notification[i].scriptolution_type eq "scriptolution_abort_cancellation"}
        <hr class="style-six" />
        <div style="padding:10px;">
        <a {if $fiverrscript_dotcom_notification[i].scriptolution_unread eq "1"}style="font-weight:bold"{/if} href="{$baseurl}/track?id={$fiverrscript_dotcom_notification[i].scriptolution_OID}">{$lang539} ({$lang140} #{$fiverrscript_dotcom_notification[i].scriptolution_OID})</a>
        </div>
        {elseif $fiverrscript_dotcom_notification[i].scriptolution_type eq "scriptolution_accept_cancellation"}
        <hr class="style-six" />
        <div style="padding:10px;">
        <a {if $fiverrscript_dotcom_notification[i].scriptolution_unread eq "1"}style="font-weight:bold"{/if} href="{$baseurl}/track?id={$fiverrscript_dotcom_notification[i].scriptolution_OID}">{$lang540} ({$lang140} #{$fiverrscript_dotcom_notification[i].scriptolution_OID})</a>
        </div>
        {elseif $fiverrscript_dotcom_notification[i].scriptolution_type eq "scriptolution_reject_cancellation"}
        <hr class="style-six" />
        <div style="padding:10px;">
        <a {if $fiverrscript_dotcom_notification[i].scriptolution_unread eq "1"}style="font-weight:bold"{/if} href="{$baseurl}/track?id={$fiverrscript_dotcom_notification[i].scriptolution_OID}">{$lang541} ({$lang140} #{$fiverrscript_dotcom_notification[i].scriptolution_OID})</a>
        </div>
        {/if}
        {/section}
        <hr class="style-six" />
        <div id="scriptolutionNotifBox_middle">
          <a href="{$baseurl}/notifications">{$lang542}</a>
        </div>
        {/if}
      </div>
      <div id="scriptolutionNotifBox_bottom" class="scriptolutionNotifBox_sprite"></div>
    </div>
</div>
{/if}