{include file="scriptolution_error7.tpl"}
<script src="{$baseurl}/js/mainscriptolution.js" type="text/javascript"></script>
                                
<div class="bodybg scriptolutionpaddingtop15">
	<div class="whitebody scriptolutionpaddingtop30 scriptolutionwidth842">
		<div class="inner-wrapper scriptolutionwidth842 scriptolutioneditpages">
			<div class="full-side scriptolutionwidth842">
				<div class="whiteBox twoHalfs padding0 noborder scriptolutionwidth800">
                    <div id="scriptolutionPostForm"> 
                        <form action="{$baseurl}/sendoffer?REQID={$REQID}" id="new_gig" method="post">
                        	<h1>{$lang634}</h1>
                            <div style="clear:both"></div>
                            <div class="reminderdesc">"{$scriptolutiondesc}"</div>
                            <div style="clear:both"></div>
                            
                            <div class="whiteBox">
                            	<div class="iscriptolution">
                                    <div class="scriptolution-irequest-holder">
                                        <div class="scriptolutiontxt"><label class="editgigformtitle" for="gig_jobs">{$lang636}</label> </div>
                                        <div class="scriptolutionf">
                                        	  <select class="requesttext2" name="gjobscriptolution">
                                              <option value="0">{$lang67}</option>
                                              {insert name=scriptolution_activejobs assign=c}
                                              {section name=i loop=$c}
                                                <option value="{$c[i].PID|stripslashes}" {if $gjobscriptolution eq $c[i].PID}selected="selected"{/if}>{$c[i].gtitle|stripslashes|truncate:50:"...":true}</option>
                                              {/section}
                                              </select>
                                        </div>
                                        <div style="clear:both; padding-top:5px;"></div>
                                    </div>
                                </div>
                                <div class="scriptolutionclear"></div>
                                
                                <div class="iscriptolution">
                                    <div class="scriptolution-irequest-holder">
                                        <div class="scriptolutiontxt"><label class="editgigformtitle" for="gig_category">{$lang439}</label></div>
                                        <div class="scriptolutionf">
                                        	<textarea class="requesttext" cols="74" id="gig_description" maxlength="450" name="gdesc" rows="6">{$gdesc|stripslashes}</textarea>
                                        </div>
                                        <div style="clear:both; padding-top:5px;"></div>
                                    </div>
                                </div>
                                <div class="scriptolutionclear"></div>
                                
                                
                                
                                
                                
                            </div>
                            <div style="clear:both"></div>                    
                            <div class="scriptolutionclear"></div>                            

                            <div class="row form-entry scriptolutionpadding20" align="center">
                                <input type="submit" value="{$lang635}" class="scriptolutionbluebutton" />
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