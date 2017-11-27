{if $smarty.session.USERID ne ""}
{literal}
<script>
$(document).click(function(e){
	if(e.target.id != 'scriptolution-master'){
   if($(e.target).closest('#scriptolution-notifications-popup').length != 0) return false;
   $('#scriptolution-notifications-popup').hide();
	}
});
$("#scriptolution-notifications-popup").click(function(e){
  e.stopPropagation();
});
</script>
{/literal}
<link href="{$baseurl}/css/scriptolution_notifications.css" media="screen" rel="stylesheet" type="text/css" />  
{/if}