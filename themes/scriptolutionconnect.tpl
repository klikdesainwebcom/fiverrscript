{if $smarty.session.USERID ne ""}
{literal}
<script type="text/javascript">
function loadContent(elementSelector, sourceURL) {
$(""+elementSelector+"").load(""+sourceURL+"");
}
</script>
{/literal}
{/if}
{literal}
<style>
.whiteBox h4 {
    float: left;
    width: 100%;
    font-size: 18px;
    font-family: 'latobold', sans-serif;
    color: #424242;
    margin-bottom: 15px;
}
.launchfooter p {
    font-family: 'latoregular';
    font-size: 14px;
    color: #A39E9E;
    text-align: center;
    padding-top: 24px;
}
.launchfooter p a, .scriptolutionlo a{color:#38b0d9;}
.launchfooter p a:hover, .scriptolutionlo a:hover{color:#666;}
#scriptolutionForm label {
    color: #38b0d9 !important;
}
.whiteBox h1 {
    font-size: 34px !important;
}
</style>
{/literal}
    
    {include file="scriptolution_error7.tpl"}
    <div class="bodybg scriptolutionpaddingtop15 scriptolutionloginpage">
        <div class="whitebody scriptolutionpaddingtop30 scriptolutionwidth482">
            <div class="inner-wrapper scriptolutionwidth442">
                <div class="left-side scriptolutionwidth442">
                    <div class="whiteBox twoHalfs padding15 scriptolutionwidth400">
                        <h1>{$lang448}</h1>
                        <h4>{$lang449}</h4>
                        <div class="scriptolutionpaddingtop15"></div>
                        <div id="scriptolutionForm">
                            <form action="{$baseurl}/connect.php" method="post">  
                                <div class="form-entry">
                                    <label for="l_username">{$lang36}</label>
                                    <input class="text" name="l_username" size="16" maxlength="16" tabindex="1" type="text" value="{$user_username}" />
                                </div>
                                <div class="row">
                                    <input type="submit" value="{$lang46}" class="scriptolutionbluebutton" />
                                </div>
                                <input type="hidden" name="jlog" id="jlog" value="1" />
                            </form> 
                            
                            <div class="scriptolutionlo" style="float:right"><a href="{$baseurl}/logout.php">{$lang27}</a></div>
                              
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>			
                <div class="clear"></div>
                <div id="scriptolutionFormLinks">
                    <div class="scriptolutionloginsignuplink">
                        <!-- social -->
                    </div>
                </div>
            </div>   
        </div>
    </div>
    
    <div id="scriptolutionnobottom">
        <div class="centerwrap footertop">
            <div class="footerbg scriptolutionfooter482"></div>
        </div>
    </div>