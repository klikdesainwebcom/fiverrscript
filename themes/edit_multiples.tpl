									{if $g.scriptolution_add_multiple GT "0"}
                                    {literal}<style>.multipleoption{font-size:16px!important;padding:0;margin:0}.showmultiple{background:white;color:#464646;margin-top:20px;width:94%;padding:10px!important}.multipleping-selection-form{margin-top:5px!important;background:white}.multipleping-settings{font-size:16px;letter-spacing:-0.04em;line-height:30px}</style>{/literal}
                                      <div class="row showmultiple">
                                        <div>
                                            <div id="multipleping" class="multipleping-selection-form">
												<div class="multipleping-settings">
													{$lang484}  
                                                    <select id="multiplemax" name="multiplemax">
                                                    {section name=i start=1 loop=26}
                                                    <option value="{$smarty.section.i.index}" {if $g.scriptolution_add_multiple eq $smarty.section.i.index}selected{/if}>{$smarty.section.i.index}</option>
                                                    {/section}
                                                    </select>
												</div>
											</div>
                                        </div>
                                    </div>
                                    {/if}