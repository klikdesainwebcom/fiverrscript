                    <script>
                    $(document).ready(function()
                    {
                        sQuery("#fileuploader").uploadFile({
                        url:"{$baseurl}/scriptolutionupload.php",
                        fileName:"fileInput",
                        maxFileCount:1,
                        showDelete: true,					
                        dragDropStr: "",
                        abortStr:"{$lang615}",
                        cancelStr:"{$lang614}",
                        doneStr:"{$lang616}",
                        multiDragErrorStr: "{$lang613}",
                        maxFileCountErrorStr:"{$lang613}",
                        uploadStr:"{$lang248}",
                        deletelStr:"{$lang185}",
                        {literal}
                        onSelect:function(files)
                        {	
                            document.getElementById('message_validation_error').innerHTML = ''; 
                            $('.msg-error').hide();
                            var allowupload = '0';
                            sQuery.ajax({
                                url: "{/literal}{$baseurl}{literal}/scriptolutionuploadcheck.php?scriptolutionsubmit=1&scriptolutionfilename=" + files[0].name,
                                async: false,
                                cache: false,
                                dataType: "html",
                                success: function(datar){
                                  allowupload = datar;
                                }
                            });
                            if(allowupload == "1")
                            {
                                return true;
                            }
                            else
                            {
                                document.getElementById('message_validation_error').innerHTML = "{/literal}{$lang241}{literal}"; 
                                $('.msg-error').show();
                                return false;
                            }
                        },
                        deleteCallback: function (data, pd) {
                            $('#message_message_attachment_id').val('0');
                            pd.statusbar.hide();
                        },					
                        onSuccess:function(files,data,xhr,pd)
                        {
                            $('#message_message_attachment_id').val(data);
                        }
                        {/literal}
                        });
                    });
                    </script>
                    <div id="fileuploader"></div> 
				