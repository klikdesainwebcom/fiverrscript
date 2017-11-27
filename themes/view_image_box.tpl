<ul id="carousel">
	{if $p.youtube ne ""}{include file='view_vjs.tpl'}{/if}
    <li class="carouselItem">
        <div class="carouselImage"><img src="{$purl}/t3/{$p.p1}?{$smarty.now}" width="678" height="458" /></div>
    </li>
    {if $p.p2 ne ""}
    <li class="carouselItem">
        <div class="carouselImage"><img src="{$purl}/t3/{$p.p2}?{$smarty.now}" width="678" height="458" /></div>
    </li>
    {/if}
    {if $p.p3 ne ""}
    <li class="carouselItem">
        <div class="carouselImage"><img src="{$purl}/t3/{$p.p3}?{$smarty.now}" width="678" height="458" /></div>
    </li>
    {/if}
</ul>
