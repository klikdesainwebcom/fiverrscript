<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "https://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="https://www.w3.org/1999/xhtml" xmlns:fb="https://www.facebook.com/2008/fbml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>{if $mtitle ne ""}{$mtitle}{else}{if $pagetitle ne ""}{$pagetitle} - {/if}{$site_name}{/if}</title>
	<meta name="description" content="{if $mdesc ne ""}{$mdesc}{else}{if $pagetitle ne ""}{$pagetitle} - {/if}{if $metadescription ne ""}{$metadescription} - {/if}{$site_name}{/if}">
	<meta name="keywords" content="{if $mtags ne ""}{$mtags}{else}{if $pagetitle ne ""}{$pagetitle},{/if}{if $metakeywords ne ""}{$metakeywords},{/if}{$site_name}{/if}"> 
    <link href="{$baseurl}/css/scriptolution_style_v7.css" media="screen" rel="stylesheet" type="text/css" /> 
    <link href="{$baseurl}/css/scriptolutionresponse.css" media="screen" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"> 
    <script type="text/javascript">
    var base_url = "{$baseurl}";
	</script>
	<script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
	<script>
        sQuery = jQuery.noConflict(true);
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>	
    <link rel="icon" href="{$baseurl}/favicon.ico" />
    <link rel="shortcut icon" href="{$baseurl}/favicon.ico" />
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
	<script src="{$baseurl}/js/scriptolution.js"></script>
    {if $rtl eq "1"}{include file='scriptolution_rtl2.tpl'}{/if}
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
    <div class="header" style="height:54px !important;">
        <div class="centerwrap relative">
            <div class="headertop">
                <div class="logo"><a href="{$baseurl}/"><img src="{$imageurl}/scriptolution_logo.png" alt="{$site_name}" /></a></div>        	
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <div style="clear:both"></div>   