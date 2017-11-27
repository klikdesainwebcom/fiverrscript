<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "https://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="https://www.w3.org/1999/xhtml" xmlns:fb="https://www.facebook.com/2008/fbml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />    
    <title>{if $mtitle ne ""}{$mtitle}{else}{if $pagetitle ne ""}{$pagetitle} - {/if}{$site_name}{/if}</title>
	<meta name="description" content="{if $mdesc ne ""}{$mdesc}{else}{if $pagetitle ne ""}{$pagetitle} - {/if}{if $metadescription ne ""}{$metadescription} - {/if}{$site_name}{/if}">
	<meta name="keywords" content="{if $mtags ne ""}{$mtags}{else}{if $pagetitle ne ""}{$pagetitle},{/if}{if $metakeywords ne ""}{$metakeywords},{/if}{$site_name}{/if}">   
    <link href="{$baseurl}/css/scriptolution_style_v7.css" media="screen" rel="stylesheet" type="text/css" />  
    <link href="{$baseurl}/css/scriptolution_countries.php" media="screen" rel="stylesheet" type="text/css" />  
    <script type="text/javascript">
    var base_url = "{$baseurl}";
	</script>
    <link rel="icon" href="{$baseurl}/favicon.ico" />
    <link rel="shortcut icon" href="{$baseurl}/favicon.ico" />
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
    <script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
	<script>
        sQuery = jQuery.noConflict(true);
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
    <script src="{$baseurl}/js/jquery.customSelect.js"></script>
	<script src="{$baseurl}/js/scriptolution.js"></script>
    <script src="{$baseurl}/js/scriptolution_notifications.js"></script>
    {if $rtl eq "1"}{include file='scriptolution_rtl.tpl'}{/if}
    {include file='scriptolution_colorbox.tpl'} 
    {include file='scriptolution_tooltip.tpl'} 
    {if $scriptolutionhome eq "1"}<link href="{$baseurl}/css/scriptolution_style_v7_home.css" media="screen" rel="stylesheet" type="text/css" />{/if}
    <script src="{$baseurl}/js/jscriptolution.js"></script>
    <link href="{$baseurl}/css/scriptolutionresponse.css" media="screen" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
</head>
<body>
<div id="loadme"></div>
{if $enable_fc eq "1"}
<div id="fb-root"></div>
{literal}
<script src="https://connect.facebook.net/en_US/all.js"></script>
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
        	<div class="scriptolutionmenubutton"><a href="javascript:void();" onclick="scriptolution_newtoggle('scriptolutionmobilenav');"><i class="fa fa-bars"></i></a></div>
        	<div class="logo"><a href="{$baseurl}/"><img src="{$imageurl}/scriptolution_logo.png" alt="{$site_name}" /></a></div>
            <div class="search">                
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
                	<div class="userimage"><a href="{$baseurl}/{insert name=get_seo_profile value=a username=$smarty.session.USERNAME|stripslashes}"><img src="{$membersprofilepicurl}/thumbs/{$myprofilepicture}" alt="{$smarty.session.USERNAME}" height="25px" width="25px" class="scriptolutionradius3" /></a></div>
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
                            <li><a href="{$baseurl}/requests">{$lang632}</a></li>
                        </ul>
                    </div>
                </div>
          		<div class="textdropdown sublinks">
               		<p><a href="{$baseurl}/balance">{$lang158} <span class="arrow"><img src="{$imageurl}/scriptolution_navdroparrow.png" alt="" /></span></a></p>
                    <div class="dropdownbox">
                    	<ul>
                        	<li><a href="{$baseurl}/newrequest">{$lang621}</a></li>
                        	<li><a href="{$baseurl}/myrequests">{$lang629}</a></li>
                        	<li><a href="{$baseurl}/orders">{$lang157}</a></li>
                            <li><a href="{$baseurl}/balance">{$lang159}</a></li>
                            {include file='scriptolution_co_bit2.tpl'}
                        </ul>
                    </div>
                </div>
                {insert name=scriptolutionnotificationcounter value=a assign=snctr}
                <div class="massage {if $snctr GT "0"}scriptolutionheadernotifycntcolor{else}scriptolutionheadernotifycnt{/if}">
                	<a href="#" onclick="scriptolutions_fiverrscript_toggleit('scriptolution-notifications-popup');"><i id="scriptolution-master" class="fa fa-bell-o" style="padding-top: 7px;"></i></a>
                </div>
                
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
                {section name=i loop=$c max=11}
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
<div class="nav-scriptolution" id="scriptolutionmobilenav" style="display:none">
	<div class="scriptolution-dotcom-mobile-dropdown" id="dropdown-menu">
    	<div class="scriptolutionclose-nav" onclick="scriptolution_newtoggle('scriptolutionmobilenav');">×</div>
        <div class="searchforscriptolutionmobleonly">
        	<form action="{$baseurl}/search" method="get">
            <input name="query" type="text" class="textbox scriptolutiontextbox18 scriptolutionwidth80"/>
            <input type="submit" value="{$lang504}" class="ascriptolutiongreenbutton" style="border: 0px;" />
            </form>
            <hr>
        </div>
        {if $smarty.session.USERID ne ""}
        <a class="scriptolutionfiverrscriptitem" href="{$baseurl}/inbox">{$lang28} <span>{$msgc}</span></a>
        <hr>
        <a class="scriptolutionfiverrscriptitem" href="{$baseurl}/notifications">{$lang544}{if $snctr GT "0"} <span>{$snctr}</span>{/if}</a>
        <hr>
        <a class="scriptolutionfiverrscriptitem" href="{$baseurl}/balance">{$lang158}</a>
        <a class="scriptolutionfiverrscriptitem" href="{$baseurl}/newrequest">{$lang621}</a>
        <a class="scriptolutionfiverrscriptitem" href="{$baseurl}/myrequests">{$lang629}</a>
        <a class="scriptolutionfiverrscriptitem" href="{$baseurl}/orders">{$lang157}</a>
        <a class="scriptolutionfiverrscriptitem" href="{$baseurl}/balance">{$lang159}</a>
        {include file='scriptolution_co_bit2_responsive.tpl'}
        <hr>
        <a class="scriptolutionfiverrscriptitem" href="{$baseurl}/manage_gigs">{$lang156}</a>
        <a class="scriptolutionfiverrscriptitem" href="{$baseurl}/new">{$lang55}</a></li>
        <a class="scriptolutionfiverrscriptitem" href="{$baseurl}/manage_gigs">{$lang153}</a>
        <a class="scriptolutionfiverrscriptitem" href="{$baseurl}/manage_orders">{$lang154}</a>
        <a class="scriptolutionfiverrscriptitem" href="{$baseurl}/balance?tab=sales">{$lang155}</a>
        <a class="scriptolutionfiverrscriptitem" href="{$baseurl}/purchases">{$lang461}</a>
        {include file='scriptolution_co_bit1_responsive.tpl'}
        <a class="scriptolutionfiverrscriptitem" href="{$baseurl}/requests">{$lang632}</a>
        <hr>
        <a class="scriptolutionfiverrscriptitem" href="{$baseurl}/{insert name=get_seo_profile value=a username=$smarty.session.USERNAME|stripslashes}">{$lang29}</a>
        {if $enable_ref eq "1"}<a class="scriptolutionfiverrscriptitem" href="{$baseurl}/myreferrals">{$lang512}</a>{/if}
        <a class="scriptolutionfiverrscriptitem" href="{$baseurl}/bookmarks">{$lang30}</a>
        <a class="scriptolutionfiverrscriptitem" href="{$baseurl}/settings">{$lang31}</a>
        <a class="scriptolutionfiverrscriptitem" href="javascript:loadContent('#loadme', '{$baseurl}/log_out');">{$lang27}</a>
        {else}
        <a class="scriptolutionfiverrscriptitem" href="{$baseurl}/">{$lang0}</a>
        <hr>
        <a class="scriptolutionfiverrscriptitem" href="{$baseurl}/login">{$lang2}</a>
        <hr>
        <a class="scriptolutionfiverrscriptitem join" href="{$baseurl}/signup">{$lang1}</a>
        {/if}
	</div>
</div>
{if $scriptolutionhome eq "1"}
{if $smarty.session.USERID eq ""}
<div class="banner">
    <div class="centerwrap relative">
    	<div class="bannertext">
        	<h3>{$lang21} {$site_name}</h3>
            <h2>{$lang102}<br />{$lang103}</h2>
            <div class="find-service">                
                <form action="{$baseurl}/search" method="get">
                <input name="query" type="text" class="findbox"/>
                <input type="submit" value="{$lang556}" class="findbtn"/>
                </form>
                <div class="clear"></div>
            </div>
            <p><a class='inline' href="#inline1" title="{$lang419}">{$lang419}</a></p>
            <div class="topnavbg"></div>
        </div>
        <div class="scriptolutionmobilecats">
            <div class="btn-list-space">
                <select class="btn outline-only white" onchange="javascript:location.href = this.value;">
                    <option value="">{$lang524}</option>
                    {insert name=get_categories assign=c}
                    {section name=i loop=$c}
                    <option value="{$baseurl}/categories/{$c[i].seo|stripslashes}">{$c[i].name|stripslashes}</option>
                    {insert name=get_subcategories assign=subcat value=var parent=$c[i].CATID}
                    {if $subcat|@count GT "0"}
                        {section name=sc loop=$subcat}
                        <option value="{$baseurl}/categories/{$subcat[sc].seo|stripslashes}">- {$subcat[sc].name|stripslashes}</option>
                        {/section}
                    {/if}
                    {/section}
                </select>
            </div>
        </div>
    </div>
</div>
{include file='scriptolution_colorbox2.tpl'}
{else}
		<div class="scriptolutionmobilecats">
            <div class="btn-list-space {if $smarty.session.USERID ne ""}scriptolutionaddwhitebg{/if}">
                <select class="btn outline-only white" onchange="javascript:location.href = this.value;">
                    <option value="">{$lang524}</option>
                    {insert name=get_categories assign=c}
                    {section name=i loop=$c}
                    <option value="{$baseurl}/categories/{$c[i].seo|stripslashes}">{$c[i].name|stripslashes}</option>
                    {insert name=get_subcategories assign=subcat value=var parent=$c[i].CATID}
                    {if $subcat|@count GT "0"}
                        {section name=sc loop=$subcat}
                        <option value="{$baseurl}/categories/{$subcat[sc].seo|stripslashes}">- {$subcat[sc].name|stripslashes}</option>
                        {/section}
                    {/if}
                    {/section}
                </select>
            </div>
            <div class="scriptolution60"></div>
        </div>
{/if}
{/if}