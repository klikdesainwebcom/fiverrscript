									{literal}<style>.multipleoption{font-size:20px!important;padding:0;margin:0}.showmultiple{background:white;color:#464646;margin-top:20px;width:94%;padding:10px!important}#multiplemore{display:none}.multipleping-selection-form{margin-top:5px!important;background:white}.multipleping-settings{font-size:16px;letter-spacing:-0.04em;line-height:30px}</style>{/literal}
                                      <div class="row showmultiple">
                                        <p class="multipleoption">
                                            <input id="multipleme" name="multipleme" onclick="scriptolutiontoggle('multiplemore', 'multipleme')" type="checkbox" value="1" /> 
                                        {$lang483}
                                        </p>
                                        <div id="multiplemore">
                                            <div id="multipleping" class="multipleping-selection-form">
												<div class="multipleping-settings">
													{$lang484}  
                                                    <select id="multiplemax" name="multiplemax" class="textthree">
                                                    {section name=i start=2 loop=26}
                                                    <option value="{$smarty.section.i.index}" {if $multiplemax eq $smarty.section.i.index}selected{/if}>{$smarty.section.i.index}</option>
                                                    {/section}
                                                    </select>
												</div>
											</div>
                                        </div>
                                    </div>