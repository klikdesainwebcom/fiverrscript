<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>{if $mtitle ne ""}{$mtitle}{else}{if $pagetitle ne ""}{$pagetitle} - {/if}{$site_name}{/if}</title>
	<meta name="description" content="{if $mdesc ne ""}{$mdesc}{else}{if $pagetitle ne ""}{$pagetitle} - {/if}{if $metadescription ne ""}{$metadescription} - {/if}{$site_name}{/if}">
	<meta name="keywords" content="{if $mtags ne ""}{$mtags}{else}{if $pagetitle ne ""}{$pagetitle},{/if}{if $metakeywords ne ""}{$metakeywords},{/if}{$site_name}{/if}">    
    <link href="{$baseurl}/css/style.php" media="screen" rel="stylesheet" type="text/css" />
    <link href="{$baseurl}/css/scriptolution_countries.php" media="screen" rel="stylesheet" type="text/css" />
    <!--[if lte IE 8]><link href="{$baseurl}/css/ie8.php" media="screen" rel="stylesheet" type="text/css" /><![endif]-->
    <!--[if lte IE 7]><link href="{$baseurl}/css/ie7.php" media="screen" rel="stylesheet" type="text/css" /><![endif]-->
    <link href="{$baseurl}/css/uploadify.css" media="screen" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    var base_url = "{$baseurl}";
	</script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
	<script>
        sQuery = jQuery.noConflict(true);
    </script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.2/jquery-ui.min.js" type="text/javascript"></script>
	<script src="{$baseurl}/js/ie-hover-pack.js" type="text/javascript"></script>
	<script src="{$baseurl}/js/main.js" type="text/javascript"></script>
	<script src="{$baseurl}/js/topmenu.js" type="text/javascript"></script>
	<script src="{$baseurl}/js/jquery.cookie.js" type="text/javascript"></script>
	<script src="{$baseurl}/js/facebook_share.js" type="text/javascript"></script>    
    <script src="{$baseurl}/js/jquery.tools.min.js" type="text/javascript"></script>
    <script src="{$baseurl}/js/jquery.uploadify.v2.1.0.min.js" type="text/javascript"></script>
	<script src="{$baseurl}/js/swfobject.js" type="text/javascript"></script>
	<script src="{$baseurl}/js/jquery.corner.js" type="text/javascript"></script>
    <link rel="icon" href="{$baseurl}/favicon.ico" />
    <link rel="shortcut icon" href="{$baseurl}/favicon.ico" />
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
    <script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>
    <link href="{$baseurl}/css/scriptolution_style7.css" media="screen" rel="stylesheet" type="text/css" />
    <script src="{$baseurl}/js/jquery.customSelect.js"></script>
	<script src="{$baseurl}/js/scriptolution.js"></script>
    <script src="{$baseurl}/js/scriptolution_notifications.js"></script>
    {if $rtl eq "1"}{include file='scriptolution_rtl2.tpl'}{/if}
</head>
<body class="inner">
<div id="loadme"></div>
{if $enable_fc eq "1"}
<div id="fb-root"></div>
{literal}
<script src="http://connect.facebook.net/en_US/all.js"></script>
<script>
  FB.init({appId: '{/literal}{$FACEBOOK_APP_ID}{literal}', status: true,
           cookie: true, xfbml: true});
  FB.Event.subscribe('auth.login', function(response) {
  });	  
</script>
{/literal}
{/if}
{if $smarty.session.USERID ne ""}
{literal}
<script type="text/javascript">
function loadContent(elementSelector, sourceURL) {
$(""+elementSelector+"").load(""+sourceURL+"");
}
</script>
{/literal}
{/if}





<div class="header">
	<div class="centerwrap relative">
    	<div class="headertop">
        	<div class="logo"><a href="{$baseurl}/"><img src="{$imageurl}/scriptolution_logo.png" alt="{$site_name}" /></a></div>
            <div class="scriptolutionssearch">                
                <form action="{$baseurl}/search" id="search_form" method="get">
                <input name="query" type="text" class="textbox scriptolutiontextbox20"/>
                <input type="hidden" name="c" id="scriptolution_search_cat" value="0" />
                <input type="submit" value="" class="searchbtn" />
                </form>
            </div>
            {include file='scriptolution_dotcom_notifications.tpl'}
            {if $smarty.session.USERID ne ""}
            <div class="logoutheader">
    	  		<div class="usernamebox droparrow">
                	{insert name=get_member_profilepicture assign=myprofilepicture value=var USERID=$smarty.session.USERID}
                	<div class="userimage"><a href="{$baseurl}/{insert name=get_seo_profile value=a username=$smarty.session.USERNAME|stripslashes}"><img src="{$membersprofilepicurl}/thumbs/{$myprofilepicture}" alt="{$smarty.session.USERNAME}" height="25px" width="25px" /></a></div>
              		<p>{$lang29}</p>
           	  		<div class="clear"></div>
                    <div class="dropdownbox">
                    	<ul>
                        	{if $enable_ref eq "1"}<li><a href="{$baseurl}/myreferrals">{$lang512}</a></li>{/if}
                            <li><a href="{$baseurl}/bookmarks">{$lang30}</a></li>
                            <li><a href="{$baseurl}/settings">{$lang31}</a></li>
                            <li class="divider"></li>
                            <li><a href="javascript:loadContent('#loadme', '{$baseurl}/log_out');">{$lang27}</a></li>
                        </ul>
                    </div>
              	</div>
       	  		<div class="textdropdown sublinks">
               		<p><a href="{$baseurl}/manage_gigs">{$lang156} <span class="arrow"><img src="{$imageurl}/scriptolution_navdroparrow.png" alt="" /></span></a></p>
                    <div class="dropdownbox">
                    	<ul>
                        	<li><a href="{$baseurl}/new">{$lang55}</a></li>
                            <li><a href="{$baseurl}/manage_gigs">{$lang153}</a></li>
                            <li><a href="{$baseurl}/manage_orders">{$lang154}</a></li>
                            <li><a href="{$baseurl}/balance?tab=sales">{$lang155}</a></li>
                            <li><a href="{$baseurl}/purchases">{$lang461}</a></li>
                            {include file='scriptolution_co_bit1.tpl'} 
                        </ul>
                    </div>
                </div>
          		<div class="textdropdown sublinks">
               		<p><a href="{$baseurl}/balance">{$lang158} <span class="arrow"><img src="{$imageurl}/scriptolution_navdroparrow.png" alt="" /></span></a></p>
                    <div class="dropdownbox">
                    	<ul>
                        	<li><a href="{$baseurl}/orders">{$lang157}</a></li>
                            <li><a href="{$baseurl}/mysuggestions">{$lang511}</a></li>
                            <li><a href="{$baseurl}/balance">{$lang159}</a></li>
                            {include file='scriptolution_co_bit2.tpl'} 
                        </ul>
                    </div>
                </div>
                <div class="massage"><a href="#" onclick="scriptolutions_fiverrscript_toggleit('scriptolution-notifications-popup');"><img id="scriptolution-master" src="{$imageurl}/scriptolution_chat.png" style="margin-top: 5px;" /></a></div>
                <div class="todo leftborder">
                	{insert name=msg_cnt value=var assign=msgc}
                	<p><a href="{$baseurl}/inbox">{$lang28}</a> <span>{$msgc}</span></p>
                </div>
            	<div class="clear"></div>
          	</div> 
            {else}
        	<div class="headeright">
            	<ul>
                	<li><a href="{$baseurl}/">{$lang0}</a></li>
                    <li><a href="{$baseurl}/login">{$lang2}</a></li>
                    <li><a href="{$baseurl}/signup" class="join">{$lang1}</a></li>
                </ul>
            </div>
            {/if}
        	<div class="clear"></div>
        </div>
    </div>
	<div class="subnav">
    	<div class="centerwrap">
        	<ul>
            	{insert name=get_categories assign=c}
                {section name=i loop=$c max=10}
            	<li><a href="{$baseurl}/categories/{$c[i].seo|stripslashes}">{$c[i].name|stripslashes}</a>
                	{insert name=get_subcategories assign=subcat value=var parent=$c[i].CATID}
                    {if $subcat|@count GT "0"}
                	<div class="menubox">
                    	<div class="menulist">
                        	<ul>
                            	{section name=sc loop=$subcat}
                            	<li><a href="{$baseurl}/categories/{$subcat[sc].seo|stripslashes}">{$subcat[sc].name|stripslashes}</a></li>
                                {/section}
                            </ul>
                        </div>
                    </div>
                    {/if}
                </li>
                {/section}
                <li class="submenu-right"><a href="{$baseurl}/categories">{$lang557}</a></li>
            </ul>
        </div>
    </div>
    {include file='fiverrscript_dotcom_notifications.tpl'}
</div>





    <div id="main-wrapper">
      <div id="wrapper">
        <div class="main-area">
          <div class="main-content">
            <div class="main-content">