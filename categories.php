<?php
/**************************************************************************************************
| Fiverr Script
| http://www.fiverrscript.com
| webmaster@fiverrscript.com
|
|**************************************************************************************************
|
| By using this software you agree that you have read and acknowledged our End-User License 
| Agreement available at http://www.fiverrscript.com/eula.html and to be bound by it.
|
| Copyright (c) FiverrScript.com. All rights reserved.
|**************************************************************************************************/

include("include/config.php");
include("include/functions/import.php");

//TEMPLATES BEGIN
STemplate::assign('pagetitle',$lang['521']);
STemplate::display('scriptolution_header.tpl');
STemplate::display('categories.tpl');
STemplate::display('scriptolution_footer_nobottom.tpl');
//TEMPLATES END
?>