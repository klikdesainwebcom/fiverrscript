<div class="right-side">
    <div class="sidebarBlock">
        <h3>{$lang577|upper}</h3>
        <ul>
            <li><a href="{$baseurl}/new" class="greenBtn"><span>{$lang55}</span></a></li>
            <li><a href="{$baseurl}/newrequest" class="greenBtn"><span>{$lang621}</span></a></li>
            {include file='scriptolution_newside_co.tpl'}
        </ul>
    </div>
    {if $smarty.session.USERID GT "0"}
    <div class="sidebarBlock">
        <h2>{$lang158|upper}</h2>
        <ul>
        	<li><a href="{$baseurl}/myrequests">{$lang629}</a></li>
            <li><a href="{$baseurl}/orders">{$lang157}</a></li>
            <li><a href="{$baseurl}/balance">{$lang159}</a></li>
        </ul>
    </div>
    <div class="sidebarBlock">
        <h3>{$lang156|upper}</h3>
        <ul>
            <li><a href="{$baseurl}/manage_gigs">{$lang153}</a></li>
            <li><a href="{$baseurl}/manage_orders">{$lang154}</a></li>
            <li><a href="{$baseurl}/balance?tab=sales">{$lang155}</a></li>
            <li><a href="{$baseurl}/purchases">{$lang461}</a></li>
            {include file='scriptolution_co_side_bit.tpl'}
            <li><a href="{$baseurl}/requests">{$lang632}</a></li>
        </ul>
    </div>
    {/if}
    <div class="sidebarBlock noBorder">
        <h3>{$lang29|upper}</h3>
        <ul>
            {if $enable_ref eq "1"}<li><a href="{$baseurl}/myreferrals">{$lang512}</a></li>{/if}
            <li><a href="{$baseurl}/bookmarks">{$lang30}</a></li>
            <li><a href="{$baseurl}/settings">{$lang31}</a></li>
        </ul>
    </div>	
</div>