{include file="scriptolution_error7.tpl"}                                
<div class="bodybg scriptolutionpaddingtop15">
	<div class="whitebody scriptolutionpaddingtop30 scriptolutionwidth842">
		<div class="inner-wrapper scriptolutionwidth842">
			<div class="left-side scriptolutionwidth842">
				<div class="whiteBox twoHalfs padding0 noborder scriptolutionwidth800">
                    <div id="scriptolutionPostForm"> 
                        <form action="{$baseurl}/new" enctype="multipart/form-data" id="new_gig" method="post">
                        
                            <h1><strong>{$lang455}</strong></h1>
                            <div class="scriptolutionclear"></div>
                            
                            {insert name=seo_clean_titles assign=title value=a title=$p.gtitle}
							
                            <div align="center" class="newfeaturegig">
                                <a href="{$baseurl}/{$p.seo|stripslashes}/{$p.PID|stripslashes}/{$title}"><img src="{$purl}/t3/{$p.p1}?{$smarty.now}" /></a>
                                <div class="scriptolutionclear"></div>
                                  
                                <a href="{$baseurl}/{$p.seo|stripslashes}/{$p.PID|stripslashes}/{$title}">{$lang62} {$p.gtitle|stripslashes} {if $scriptolution_cur_pos eq "1"}{$lang589} {$p.price|stripslashes}{$lang197}{else}{$lang63}{$p.price|stripslashes}{/if}</a>
                                <div class="scriptolutionclear"></div>
                                      
                                {$p.gdesc|stripslashes|html_entity_decode}
                                <div class="scriptolutionclear"></div>
                                  
                                <a href="{$baseurl}/{$p.seo|stripslashes}/{$p.PID|stripslashes}/{$title}" style="font-size:30px; text-decoration:none">{$lang458}</a>
                                <div class="scriptolutionclear"></div>

							</div>

                        </form>   
                    </div>
					<div class="clear"></div>
				</div>
			</div>			
			<div class="clear"></div>
		</div>   
	</div>
</div>
<div id="scriptolutionnobottom">
    <div class="centerwrap footertop">
        <div class="footerbg scriptolutionfooter842"></div>
    </div>
</div>