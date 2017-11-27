{if $p.price2 GT "0"}
{include file='view_order_bit_ship.tpl'}
{elseif $p.scriptolutionhasextras eq "1"}
{include file='view_order_bit_extras.tpl'}
{else}
{include file='view_order_bit.tpl'}
{/if}