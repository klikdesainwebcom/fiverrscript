{if $error ne ""}
<div class='scriptolution_error'>
	<p>{$error}</p>
</div>
{/if}
{if $message ne ""}
<div class='scriptolution_success'>
    <p>{$message}</p>
</div>
{/if}
{if $snotice ne ""}
<div class='scriptolution_notice'>
    <p>{$snotice}</p>
</div>
{/if}
