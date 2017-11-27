{include file="scriptolution_error7.tpl"} 
<link href="{$baseurl}/css/scriptolution_dir.css" media="screen" rel="stylesheet" type="text/css" />                            
<div class="bodybg scriptolutionpaddingtop15">
	<div class="whitebody scriptolutionpaddingtop30 scriptolutionwidth842 gray">
		<div class="inner-wrapper scriptolutionwidth842">
			<div class="left-side scriptolutionwidth842">
				<div class="whiteBox twoHalfs padding0 scriptolutionwidth800">                    
                    <div id="scriptolutionOrderingForm" class="scriptolutionpadding20"> 
                        <h1><strong>{$lang520}</strong></h1>
                        
                        
                        
                        <div class="category-tree" style="display:table;"> 
                            <div class="row" style="display:table-row;width:33%;">               
                                {insert name=get_categories assign=c}
                                {section name=i loop=$c}
                                <div class="category" style="display:table-cell;">
                                    <h2><a href="{$baseurl}/categories/{$c[i].seo|stripslashes}">{$c[i].name|stripslashes}</a></h2>
                                    {if $c[i].CATID ne "0"}
                                        <ul>
                                            {insert name=get_subcategories assign=scats parent=$c[i].CATID}
                                            {section name=j loop=$scats}
                                            <li><a href="{$baseurl}/categories/{$scats[j].seo|stripslashes}">{$scats[j].name|stripslashes}</a></li>
                                            {/section}
                                        </ul>
                                    {/if}
                                </div>
                                {if $smarty.section.i.iteration mod 3 eq "0"}
                                </div>
                                <div class="row" style="display:table-row;width:33%;">
                                {/if}
                                {/section}
                            </div>
                        </div>
                          
                          
                          
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
        <div class="footerbg gray scriptolutionfooter842"></div>
    </div>
</div>