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
                        <form action="{$baseurl}/new" enctype="multipart/form-data" id="new_gig" method="post">
                        
                            <div class="postgigtop scriptolutionpadding20">
                                <div class="form-entry1">
                                    <div class="spartone">{$lang62}</div>
                                    <div class="sparttwo">
                                        <div class="spartthree">
                                        <input class="texta" id="gig_title" maxlength="200" name="gtitle" type="text" value="{$gtitle|stripslashes}" />
                                        </div>
                                        <div class="spartfour">
                                            {if $price_mode eq "0" OR $price_mode eq "2"}
                                            <div style="padding-top:5px;">
                                            {if $scriptolution_cur_pos eq "1"}{$lang589} {$price}{$lang197}{else}{$lang63}{$price}{/if}
                                            </div>
                                            {elseif $price_mode eq "1"}
                                            {if $scriptolution_cur_pos eq "1"}{$lang589} <input class="textb" id="gprice" maxlength="3" name="gprice" size="3" type="text" value="{$gprice|stripslashes}" />{$lang197}{else}{$lang63}<input class="textb" id="gprice" maxlength="3" name="gprice" size="3" type="text" value="{$gprice|stripslashes}" />{/if}
                                            {elseif $price_mode eq "3"}{insert name=get_packs value=a assign=packs}
                                            {if $scriptolution_cur_pos eq "1"}<select name="gprice" id="gprice" class="textb">{section name=p loop=$packs}<option value="{$packs[p].ID|stripslashes}" {if $PACID eq $packs[p].ID|stripslashes}selected="selected"{/if}>{$packs[p].pprice|stripslashes}</option>{/section}</select>{$lang197}{else}{$lang197}<select name="gprice" id="gprice" class="textb">{section name=p loop=$packs}<option value="{$packs[p].ID|stripslashes}" {if $PACID eq $packs[p].ID|stripslashes}selected="selected"{/if}>{$packs[p].pprice|stripslashes}</option>{/section}</select>{/if}
                                            {/if}
                                        </div>
                                    </div>
                                </div>
                                {if $price_mode eq "0" OR $price_mode eq "2"}
                                <div style="clear:both"></div>
                                {/if}
                                <div class="form-entry" align="center">
                                    <p class="max-chars-top">{$lang64}: <span class="gigtitlemax">200</span> ({$lang65}: <span class="gigtitleused">0</span>)</p>
                                </div>
                            </div>
                            <div class="scriptolutionclear"></div>

                            <div class="postgigbottom scriptolutionpadding20">
                                <div class="form-entry">
                                    <div class="column-l">
                                      <label class="editgigformtitle" for="gig_category">{$lang66}</label>
                                    </div>
                                    <div class="column-r">
                                      <select class="text" id="gig_category_id" name="gcat"><option value="0">{$lang67}</option>
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
                              
                                  <div class="form-entry">
                                    <div class="column-l">
                                      <label class="editgigformtitle" for="gig_description">{$lang69}</label>
                                      <p class="tip-text-static">{$lang70}</p>
                                      <p class="tip-text">{$lang71}<br/><br/>{$lang72}</p>
                                    </div>
                                    <div class="column-r">
                                      <textarea class="text" cols="74" id="gig_description" maxlength="450" name="gdesc" rows="6">{$gdesc|stripslashes}</textarea>
                                    </div>
                                  </div>
                              	  <div class="scriptolutionclear"></div>
                                  
                                  <div class="form-entry">
                                  	<div class="column-l">
                                      <label class="editgigformtitle new-badge" for="gig_order_requirement">{$lang73}</label><br/>
                                      <p class="tip-text-static">{$lang74}</p>
                                      <p class="tip-text">{$lang75}</p>
                                    </div>
                                    <div class="column-r">
                                        <textarea class="text" cols="74" id="gig_order_requirement_attributes_body" maxlength="450" name="ginst" rows="10">{$ginst|stripslashes}</textarea>
                                    </div>
                                  </div>
                              	  <div class="scriptolutionclear"></div>
                                  
                                  <div class="form-entry">
                                  	<div class="column-l">
                                      <label class="editgigformtitle" for="gig_tags">{$lang76}</label>
                                      <p class="tip-text-static">{$lang77}</p>
                                      <p class="tip-text">{$lang78}</p>
                                    </div>
                                    <div class="column-r">
                                      <textarea class="text" id="gig_tag_list" maxlength="100" name="gtags" rows="2">{$gtags|stripslashes}</textarea>
                                    </div>
                                  </div>
                              	  <div class="scriptolutionclear"></div>
                                  
                                  {if $enablescriptolutionlocations eq "1"}
                                  <div class="form-entry">
                                  	<div class="column-l">
                                      <label class="editgigformtitle" for="scriptolutionjoblocation">{$lang617}</label>
                                    </div>
                                    <div class="column-r">
                                      <input class="text" id="scriptolutionjoblocation" name="scriptolutionjoblocation" type="text" value="{$scriptolutionjoblocation|stripslashes}" onFocus="geolocate()" />
                                      {$lang618}: <input name="scriptolutioncity" class="textread scriptolutionauto" id="locality" disabled="true" readonly value="{$scriptolutioncity|stripslashes}"></input>
                                      {$lang619}: <input name="scriptolutionstate" class="textread scriptolutionauto" id="administrative_area_level_1" disabled="true" readonly value="{$scriptolutionstate|stripslashes}"></input>
                                      {$lang467}: <input name="scriptolutioncountry" class="textread scriptolutionauto" id="country" disabled="true" readonly value="{$scriptolutioncountry|stripslashes}"></input>
                                    </div>
                                  </div>
                              	  <div class="scriptolutionclear"></div>
                                  {/if}
                                  
                                  {include file='new_instant.tpl'}
                                  <div class="scriptolutionclear"></div>
                                  
                                  <div class="form-entry">
                                  		<div class="column-l">
                                          <label class="editgigformtitle">{$lang81}</label>
                                        </div>
                                        <div class="column-r">
                                          <div class="image-info">
                                            <input class="text" id="gig_photo" name="gphoto" size="20" type="file" />
                                            <ul class="image-tip">
                                              <li>{$lang82}</li>
                                              <li>{$lang83}</li>
                                              <li>{$lang84}</li>
                                              <li>{$lang85}</li>
                                              <li>{$lang86}</li>
                                            </ul>
                                          </div>
                                        </div>
                                  </div>
                              	  <div class="scriptolutionclear"></div>

                                <div class="additional-materials">
                                    <input type="button" name="more-photos" value="{$lang87} / {$lang88}" class="scriptolutiongreenbutton" id="toggle-additional-visuals" />
                                    <div id="additional-visuals" style="display:none">
                                        <div class="form-entry">
                                        <div class="row">
                                        <div class="column-l">
                                          <div class="image-box">
                                              <img alt="no image" src="{$imageurl}/no_image.jpg?" />
                                          </div>
                                        </div>
                                        <div class="column-r">
                                          <div class="image-info">
                                            <input class="browsefile" id="gig_photo2" name="gphoto2" size="20" type="file" />
                                            <p>{$lang86}</p>
                                          </div>
                                        </div>
                                        </div>
                                        </div>
                                        <div class="scriptolutionclear"></div>                                            
                                        <div class="form-entry">
                                          <div class="row">
                                            <div class="column-l">
                                              <div class="image-box">
                                                  <img alt="no image" src="{$imageurl}/no_image.jpg?" />
                                              </div>
                                            </div>
                                            <div class="column-r">
                                              <div class="image-info">
                                                <input class="browsefile" id="gig_photo3" name="gphoto3" size="20" type="file" />
                                                <p>{$lang86}</p>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                        <div class="scriptolutionclear"></div>
                                        <div class="form-entry">
                                        <div id="youtube" class="row">
                                        <div class="column-l">
                                          <label class="editgigformtitle" for="gig_youtube_url">{$lang89}</label><br/>({$lang90})
                                        </div>
                                        <div class="column-r">
                                          <input class="text" id="gig_youtube_url" name="gyoutube" size="30" type="text" value="{$gyoutube|stripslashes}" />
                                        </div>
                                        </div>
                                        </div>
                                        <div class="scriptolutionclear"></div>
                                    </div>
                                </div>
                                  {include file='new_js.tpl'}
                                  {include file='new_multiples.tpl'}
                                  {include file='new_extras.tpl'}
                                  {include file='new_ship.tpl'}
                              </div>

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
<script src="{$baseurl}/trumbowyg/trumbowyg.min.js"></script>
<link rel="stylesheet" href="{$baseurl}/trumbowyg/ui/trumbowyg.min.css">
<script src="{$baseurl}/trumbowyg/plugins/colors/trumbowyg.colors.min.js"></script>
<link rel="stylesheet" href="{$baseurl}/trumbowyg/plugins/colors/ui/trumbowyg.colors.min.css">
{literal}
<script type="text/javascript">                        
  $(document).ready(function(){
	sQuery('#gig_description').trumbowyg({
		fullscreenable: false,
		closable: false,
		btns: ['bold', '|', 'italic', '|', 'foreColor', '|', 'backColor', '|', 'orderedList']
	});
  });
</script>
{/literal}

{if $enablescriptolutionlocations eq "1"}
{include file="scriptolutionmaps.tpl"}
{/if}