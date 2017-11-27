{include file="scriptolution_error7.tpl"}
{literal}
<script type="text/javascript">                        
  $(document).ready(function(){
	$("#toggle-additional-visuals").click(function(){
	  $("#additional-visuals").toggle('slow');
	  $('html, body').animate({
		scrollTop: $("#additional-visuals").offset().top
	  }, 200);
	});
	$('textarea').focus(function() { $(this).parent().parent().find('p.tip-text').css('visibility','visible') });
	$('textarea').blur(function() { $(this).parent().parent().find('p.tip-text').css('visibility','hidden') });
  });
</script>
{/literal}

<script src="{$baseurl}/js/mainscriptolution.js" type="text/javascript"></script>
                                
<div class="bodybg scriptolutionpaddingtop15">
	<div class="whitebody scriptolutionpaddingtop30 scriptolutionwidth842">
		<div class="inner-wrapper scriptolutionwidth842 scriptolutioneditpages">
			<div class="full-side scriptolutionwidth842">
				<div class="whiteBox twoHalfs padding0 noborder scriptolutionwidth800">
                    <div id="scriptolutionPostForm"> 
                        <form action="{$baseurl}/newrequest" id="new_gig" method="post">
                        	<h1>{$lang621}</h1>
                            <div style="clear:both"></div>
                            
                            <div class="whiteBox">
                                <div class="iscriptolution">
                                    <div class="scriptolution-irequest-holder">
                                        <div class="scriptolutiontxt">{$lang622} </div>
                                        <div class="scriptolutionf">
                                        	<textarea class="requesttext" cols="74" id="gig_description" maxlength="450" name="gdesc" rows="6">{$gdesc|stripslashes}</textarea>
                                        </div>
                                        <div style="clear:both; padding-top:5px;"></div>
                                    </div>
                                </div>
                                <div class="scriptolutionclear"></div>
                                
                                <div class="scriptolutionotherrequestinfo">
                                	<div class="form-entry">
                                        <div class="column-l">
                                          <label class="editgigformtitle" for="gig_category">{$lang66}</label>
                                        </div>
                                        <div class="column-r">
                                          <select class="requesttext2" id="gig_category_id" name="gcat"><option value="0">{$lang67}</option>
                                          {insert name=get_categories assign=c}
                                          {section name=i loop=$c}
                                            <option value="{$c[i].CATID|stripslashes}" {if $gcat eq $c[i].CATID}selected="selected"{/if}>{$c[i].name|stripslashes}</option>
                                            {if $c[i].CATID ne "0"}
                                                {insert name=get_subcategories assign=scats parent=$c[i].CATID}
                                                {section name=j loop=$scats}
                                                <option value="{$scats[j].CATID}" {if $gcat eq $scats[j].CATID}selected="selected"{/if}>- {$scats[j].name|stripslashes}</option>
                                                {/section}
                                            {/if}
                                          {/section}
                                          </select>
                                        </div>
                                    </div>
                                    <div class="scriptolutionclear"></div>
                                    
                                    <div class="estimate">
                                        <div class="column-l">
                                          <label class="editgigformtitle">{$lang625}</label>
                                        </div>
                                        <div class="column-r">
                                          {if $scriptolution_cur_pos ne "1"}<span class="spartfour">{$lang197}</span>{/if}<input class="textb" name="gprice" size="5" type="text" value="{$gprice|stripslashes}" />{if $scriptolution_cur_pos eq "1"}<span class="spartfour">{$lang197}</span>{/if}
                                        </div>
                                    </div>
                                    <div class="scriptolutionclear"></div>
                                    
                                    <div class="estimate">
                                        <div class="column-l">
                                          <label class="editgigformtitle">{$lang623}</label>
                                        </div>
                                        <div class="column-r">
                                          <input class="textb" name="gdays" size="2" type="text" value="{$gdays|stripslashes}" />&nbsp;<span class="spartfour">{$lang131}</span>
                                          <div class="daysdetails">{$lang624}</div>
                                        </div>
                                    </div>
                                    <div class="scriptolutionclear"></div>                                    
                                    
                              </div>
                                
                                
                                
                            </div>
                            <div style="clear:both"></div>                    
                            <div class="scriptolutionclear"></div>                            

                            <div class="row form-entry scriptolutionpadding20" align="center">
                                <input type="submit" value="{$lang46}" class="scriptolutionbluebutton" />
                                <input type="hidden" name="subform" value="1" />
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