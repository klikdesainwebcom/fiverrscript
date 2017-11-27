					{literal}                  
                    <script type="text/javascript">
					$(document).ready(function(){
					  $("#photo1").click(function(){
						var img = new Image();
						$(img).load(function () {
							$('#big-image').hide();
							$('#big-image').attr('src', '{/literal}{$purl}/t/{$p.p1}?{$smarty.now}{literal}');	
							$('#big-image').fadeIn();
						}).error(function() {
						}).attr('src', '{/literal}{$purl}/t/{$p.p1}?{$smarty.now}{literal}');
					  });
					  {/literal}
					  {if $p.p2 ne ""}
					  {literal}
					  $("#photo2").click(function(){
						var img = new Image();
						$(img).load(function () {
							$('#big-image').hide();
							$('#big-image').attr('src', '{/literal}{$purl}/t/{$p.p2}?{$smarty.now}{literal}');	
							$('#big-image').fadeIn();
						}).error(function() {
						}).attr('src', '{/literal}{$purl}/t/{$p.p2}?{$smarty.now}{literal}');
					  });
					  {/literal}
					  {/if}
					  {if $p.p2 ne ""}
					  {literal}
					  $("#photo3").click(function(){
						var img = new Image();
						$(img).load(function () {
							$('#big-image').hide();
							$('#big-image').attr('src', '{/literal}{$purl}/t/{$p.p3}?{$smarty.now}{literal}');	
							$('#big-image').fadeIn();
						}).error(function() {
						}).attr('src', '{/literal}{$purl}/t/{$p.p3}?{$smarty.now}{literal}');
					  });
					  {/literal}
					  {/if}
					  {literal}
					});
					$(document).ready( function() {
					 $('.mydesc').linkify();
						$(".mydesc a").each(function() {
							$(this).attr("target", "_blank");
						});
					});
					</script>
                    {/literal}