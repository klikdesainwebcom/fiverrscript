<div style="clear:both !important"></div>
<form action="{$baseurl}/send_track" class="nonajaxy" id="new_message" method="post">
<input type="hidden" name="submg" value="1" />
<input type="hidden" name="msgto" value="{$o.owner}" />
<input type="hidden" name="oid" value="{$o.OID}" />
<input type="hidden" name="who" value="buyer" />
<div class="content-text">
    <div class="whitelinks">
        <div style="float:left">
        <a class="scriptolutiondmessageme achtung message_toggler" id="cancel-order-lin" href="#">{$lang325}</a>
        </div> 
    	<div style="float:right"><a class="scriptolutionprobs achtung problems_toggler" id="cancel-order-link" href="#">{$lang326}</a></div> 
    </div> 
	<div style="clear:both !important;"></div>
    <div style="margin-top:3px !important;"></div>              
    <div style="clear:both !important;"></div>  
    <div class="conv-write">
        <div id="gotProbs" class="content-text">
            <div class="toolbox seller-order"> 
                <div id="problems_box" style="display:none;"> 
                    <div class="boxes"> 
                        {if $lasdel GT "0" AND $o.status ne "6"}
                        <div class="box rejection first reject_toggler"> 
                            <h3><input type="radio" class="radio_button" id="radio_reject" name="{$lang345}" value="{$lang345}" /> <span>{$lang344}</span></h3> 
                            <p>{$lang346}</p> 
                        </div> 
                        {else}
                        <div class="box rejection first disabled"> 
                            <h3><input type="radio" class="radio_button" id="radio_reject" name="{$lang345}" value="{$lang345}" disabled="disabled" /> <span>{$lang344}</span></h3> 
                            <p>{$lang346}</p> 
                        </div> 
                        {/if}
                        <div class="box mutual-cancel mid mutual_toggler mutual_toggler_buyer "> 
                            <h3><input type="radio" class="radio_button" id="radio_mutual" name="{$lang330}" value="{$lang330}"    /> <span>{$lang347}</span></h3> 
                            <p>{$lang348}</p> 
                            </div> 
                            <div class="box notice last support_toggler"> 
                            <h3><input type="radio" class="radio_button" id="radio_support" name="{$lang334}" value="{$lang334}"/> <span>{$lang335}</span></h3> 
                            <p>{$lang336}</p> 
                        </div> 
                    </div> 
                </div> 
            </div> 
            <div class="support-message" style="display:none">
            	<div style="clear:both !important"></div> 
                <h4 class="faq">{$lang337}</h4> 
                <div style="clear:both !important"></div>
                <ul class="faq" style="padding: 10px;"> 
                    <ul class="qa"> 
                        <li style="font-weight:bold">{$lang349}</li> 
                        <li class="a">{$lang350}</li> 
                        <br />
                        <li style="font-weight:bold">{$lang351}</li> 
                        <li class="a">{$lang352}</li> 
                    </ul> 
                </ul> 
            </div> 
            <div style="clear:both !important"></div>
        </div>
        <div id="message_form_wrapper">
        	<header class="cf">
                <label class="js-message-label" style="color:#049BCF">{$lang439}</label>
            </header>
        	<div class="msg-error"><p id="message_validation_error"></p></div>
            <div class="write-wrap">
                <div class="write-row cf">
                    <textarea maxlength="1200" class="no-min-len" cols="75" id="message_body" name="message_body" rows="3"></textarea>
                    <input id="message_message_format" name="message_message_format" type="hidden" /> 
                </div>
                <div class="message-form-control">
                    <div class="write-controls cf">
                        <div class="send-button"> 
                            <div class="icn-submit"><input class="btn-standard btn-send-message send-small" name="commit" value="{$lang46}" type="submit"></div>
                            <div class="progress-indicator-icon-message" style="display:none"> 
                                <span class="sending">{$lang120}</span> 
                            </div>
                        </div>
                         <!--
                        <div class="attach-files">
                            <div class="attach-inner">
                                <div id="toggle-attach">
                                    <input id="message_message_attachment_id" name="message_message_attachment_id" type="hidden" />
                                    <input id="fileInput" name="fileInput" type="file" />                                             
                                </div>
                            </div>
                            <small class="attach-limit"></small>
                        </div>
                        -->
                    </div>
                </div>  
            </div>
            <div style="padding:10px;">
                <div class="files-added"> 
                    <span id="attached_file_name"></span> <b class="remove_attachment" style="cursor:pointer">x</b> 
                </div>
                <div style="clear:both"></div>
                <div style="color:#666; font-size:12px"><b>{$lang255}</b>: {$lang256}</div>
                
                <link href="{$baseurl}/css/scriptolutionuploadfile.css" rel="stylesheet">
                <script src="{$baseurl}/js/jquery.uploadfile.min.js"></script>
                <div id="scriptolutionuploader">
                    {include file='scriptolutionreupload.tpl'} 
				</div>
                
            </div>
        </div>
    </div>	
</div>	
<input id="message_message_attachment_id" name="message_message_attachment_id" type="hidden" />			
</form> 