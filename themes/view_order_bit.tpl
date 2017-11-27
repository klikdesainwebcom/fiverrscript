{if $smarty.session.USERID eq $p.USERID}   
<a href="{$baseurl}/edit?id={$p.PID}" class="hugeGreenBtn hoverMe">{$lang141|upper}</a>
{elseif $smarty.session.USERID GT "0"}
<a onclick="document.ordermulti.submit();" href="#" class="hugeGreenBtn hoverMe">{$lang107|upper}</a>
{else}
<a href="{$baseurl}/login?r={insert name=get_redirect value=a assign=rurl PID=$p.PID seo=$p.seo gtitle=$title}{$rurl|stripslashes}" class="hugeGreenBtn hoverMe">{$lang107|upper}</a>
{/if}

{if $smarty.session.USERID GT "0"}
    {if $p.scriptolution_add_multiple GT "0"}
        {if $smarty.session.USERID ne $p.USERID} 
        <div class="order-extras"> 
            <form name="ordermulti" id="ordermulti" action="{$baseurl}/ordering.php" method="post">
            <span class="quantity">
                {$lang575}:
                <select class="customDropdown" id="multi" name="multi">
                    {section name=i start=1 loop=$p.scriptolution_add_multiple+1}
                    <option value="{$smarty.section.i.index}">{$smarty.section.i.index}</option>
                    {/section}
                </select>
            </span>
            <input type="hidden" name="id" value="{$p.PID}" />
            </form>
        </div>
        {/if}
    {else}
    <form name="ordermulti" id="ordermulti" action="{$baseurl}/ordering.php" method="post">
    <input type="hidden" name="id" value="{$p.PID}" />
    </form>
    {/if}
{/if}

