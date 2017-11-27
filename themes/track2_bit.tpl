<div style="clear:both !important"></div>
<form action="{$baseurl}/send_track" class="nonajaxy" id="new_message" method="post">
<input type="hidden" name="submg" value="1" />
<input type="hidden" name="msgto" value="{$o.USERID}" />
<input type="hidden" name="oid" value="{$o.OID}" />        
<input type="hidden" name="who" value="owner" />
<div class="content-text">
	<div class="whitelinks">
        <div style="float:left">
        <a class="scriptolutiondmessageme achtung message_toggler" id="cancel-order-lin" href="#">{$lang325}</a>
        <a class="scriptolutiondeliver achtung deliver_toggler" href="#">{$lang327}</a>
        </div> 
    	<div style="float:right"><a class="scriptolutionprobs achtung problems_toggler" id="cancel-order-link" href="#">{$lang326}</a></div> 
    </div>
	<div style="clear:both !important;"></div>
    <div style="margin-top:3px !important;"></div>              
    <div style="clear:both !important;"></div>  
    <div class="conv-write" id="scriptolutiondelivery">
        <div id="gotProbs" class="content-text">
            <div class="toolbox seller-order"> 
                <div id="problems_box" style="display:none;"> 
                    <div class="boxes"> 
                        <div class="box mutual-cancel first mutual_toggler">
                            <h3><input type="radio" class="radio_button" id="radio_mutual" name="{$lang330}" value="{$lang330}"/> <span>{$lang328}</span></h3>
                            <p>{$lang329}</p>
                          </div>
                          <div class="box force-cancel mid selected force_toggler">
                            <h3><input type="radio" class="radio_button" id="radio_force" name="{$lang332}" value="{$lang332}"/> <span>{$lang331}</span></h3>
                            <p>{$lang333}</p>
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
                        <li style="font-weight:bold">{$lang338}</li> 
                        <li class="a">{$lang338}</li> 
                        <br />
                        <li style="font-weight:bold">{$lang340}</li> 
                        <li class="a">{$lang341}</li> 
                        <br />
                        <li style="font-weight:bold">{$lang342}</li> 
                        <li class="a">{$lang343}</li>
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