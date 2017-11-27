<?php
header('Content-type: text/css');
include("../include/config.php");
$imageurl = $config['imageurl'];
?>
.gig-stats-box ul {
	margin:0;
	padding:0
}
.gig-stats-box ul .bull {
	color:#ccc;
	font-size:32px!important
}
.gig-stats-box.top-seller {
	height:29px
}
.gig-stats {
	color:#5a564d;
	font-size:9px;
	list-style:none;
	padding:0
}
.gig-stats.prime {
	height:65px;
	margin:12px 0 13px -0px;
	background:#eeebe2 url(<?php echo $imageurl; ?>/gig_stats_bg.png) repeat-x;
	border:1px solid #dedad1
}
.gig-stats.secondary {
	margin:0;
	background:#faf9f2;
	border-top:1px solid #eae8da;
	border-bottom:1px solid #eae8da
}
.gig-stats li {
	position:relative;
	float:left;
	margin:8px 0 6px 10px
}
.gig-stats.secondary li {
	font-size:11px;
	margin:5px 0 5px 126px
}
.gig-stats.secondary li:first-child {
	margin-left:12px
}
.gig-stats li.user-det {
	max-width:237px;
	margin-left:10px
}
.gig-stats li.gig-rating {
	max-width:99px
}
.gig-stats li.gig-rating .max-rate {
	padding-right:18px;
	background:url(<?php echo $imageurl; ?>/green_v.png) top right no-repeat
}
.gig-stats li.queue {
	width:110px
}
.gig-stats li.user-det a {
	color:#3c7292;
	text-decoration:none;
	text-transform:lowercase
}
.gig-stats.prime li.clear {
	height:1px;
	background-color:#a59f91
}
.gig-stats li.user-det>* {
	float:left;
	font-size:14px
}
.gig-stats li.user-det>img {
	margin-right:7px
}
.gig-stats li.user-det .user-rate {
	margin:3px 0 4px
}
.gig-stats.prime .big-txt {
	font-size:35px;
	line-height:33px;
	background-image:none;
}
.gig-stats .not-availale {
	color:#c9c4b5
}
.gig-stats.secondary .big-txt {
	font-size:28px;
	line-height:23px;
	margin-top:5px
}
.gig-stats.secondary .stat-star .big-txt {
	float:left
}
.gig-stats .mid-txt {
	margin-left:3px;
	font-size:20px;
	line-height:20px;
	background-image:none;
}
.gig-stats-numbers {
	font-size:24px;
	float:left;
	margin-right:4px
}
.gig-stats .small-txt {
	font-size:11px;
	margin:2px 0 0 2px;
	line-height:17px
}
.clear {
	float:none!important;
	clear:both!important;
	border:0 none!important;
	outline:none!important;
	background:transparent none;
	padding:0!important;
	margin:0!important
}
.gig-stats .small-txt .express {
	color:#fff;
	background-color:#ffa800;
	padding:0 2px 0;
	border-radius:3px;
	line-height:15px;
	height:14px
}
.gig-stats .thumbs .thumb,.gig-stats .stars .stat-star {
	background:url(<?php echo $imageurl; ?>/gig_stats_items.png) no-repeat top left;
	width:19px;
	height:18px;
	float:left
}
.gig-stats .thumbs .thumb {
	margin:5px 1px 0 0
}
.gig-stats .thumbs .down .thumb {
	background-position:center left
}
.gig-stats .small-txt.down {
	margin-left:10px;
	margin-right:10px
}
.gig-stats .stars .stat-star {
	float:left;
	background-position:bottom left;
	margin:5px 1px 0 0
}
.gig-stats .stars .big-txt {
	float:left
}
.gig-stats.secondary .delv-percent .mid-txt {
	margin-right:3px
}
.gig-stats div span{
	background-image:none;
}
div.country{position:relative;display:inline-block;background:url(<?php echo $imageurl; ?>/scriptolution_flags.png) no-repeat 0px 12px;height:11px;width:17px;vertical-align:middle;margin:1px 0 0 0}
div.us{background-position:-4px -565px !important}
div.ro{background-position:-144px -509px !important}
div.ru{background-position:-144px -453px !important}
div.co{background-position:-60px -117px !important}
div.ph{background-position:-116px -425px !important}
div.ua{background-position:-256px -537px !important}
div.ca{background-position:-60px -89px !important}
div.gb{background-position:-284px -173px !important}
div.cz{background-position:-256px -117px !important}
div.hu{background-position:-228px -229px !important}
div.md{background-position:-32px -341px !important}
div.za{background-position:-144px -593px !important}
div.br{background-position:-172px -61px !important}
div.in{background-position:-32px -257px !important}
div.mx{background:url(<?php echo $imageurl; ?>/flag_mexico.jpg);height:11px;width:16px}
div.es{background-position:-4px -173px !important}
div.de{background-position:-284px -117px !important}
div.it{background-position:-172px -257px !important}
div.fr{background-position:-228px -173px !important}
div.lv{background-position:-228px -313px !important}
div.ar{background-position:-256px -5px !important}
div.au{background-position:-256px -89px !important}
div.pe{background-position:-32px -425px !important}
div.ve{background-position:-228px -593px !important}
div.dr{background-position:-88px -145px !important}
div.cl{background-position:-284px -89px !important}
div.sk{background-position:-144px -481px !important}
div.pt{background-position:-4px -453px !important}
div.tr{background-position:-116px -537px !important}
div.be{background-position:-228px -33px !important}
div.pl{background-position:-172px -425px !important}
div.th{background-position:-228px -509px !important}
div.bg{background-position:-284px -33px !important}
div.nl{background-position:-200px -313px !important}
div.ng{background-position:-60px -397px !important}
div.my{background-position:-200px -369px !important}
div.id{background-position:-256px -229px !important}
div.uz{background-position:-88px -565px !important}
div.ec{background-position:-144px -145px !important}
div.nz{background-position:-256px -397px !important}
div.dk{background-position:-32px -145px !important}
div.dz{background-position:-116px -145px !important}
div.gr{background-position:-256px -201px !important}
div.at{background-position:-4px -33px !important}
div.no{background-position:-256px -61px !important}
div.bd{background-position:-200px -33px !important}
div.ch{background-position:-200px -89px !important}
div.pa{background-position:-4px -425px !important}
div.ie{background-position:-284px -229px !important}
div.af{background-position:-60px -5px !important}
div.ax{background-position:-88px -33px !important}
div.al{background-position:-144px -5px !important}
div.as{background-position:-284px -5px !important}
div.ad{background-position:-4px -5px !important}
div.ao{background-position:-258px -593px !important}
div.ai{background-position:-116px -5px !important}
div.aq{background-position:-88px -622px !important}
div.ag{background-position:-88px -5px !important}
div.am{background-position:-172px -5px !important}
div.aw{background-position:-60px -33px !important}
div.az{background-position:-116px -33px !important}
div.bs{background-position:-200px -61px !important}
div.bh{background-position:-4px -61px !important}
div.bb{background-position:-172px -33px !important}
div.by{background-position:-4px -89px !important}
div.bz{background-position:-32px -89px !important}
div.bj{background-position:-60px -61px !important}
div.bm{background-position:-88px -61px !important}
div.bt{background-position:-228px -61px !important}
div.bo{background-position:-44px -61px !important}
div.ba{background-position:-144px -33px !important}
div.bw{background-position:-284px -61px !important}
div.bv{background-position:-256px -61px !important}
div.io{background-position:-60px -285px !important}
div.bn{background-position:-116px -61px !important}
div.bf{background-position:-256px -33px !important}
div.bi{background-position:-32px -61px !important}
div.kh{background-position:-32px -285px !important}
div.cm{background-position:-4px -33px !important}
div.cv{background-position:-4px -117px !important}
div.ky{background-position:-228px -285px !important}
div.cf{background-position:-144px -89px !important}
div.td{background-position:-116px -453px !important}
div.cn{background-position:-32px -117px !important}
div.cx{background-position:-200px -117px !important}
div.cc{background-position:-32px -33px !important}
div.km{background-position:-88px -285px !important}
div.cg{background-position:-1726px -89px !important}
div.cd{background-position:-284px -593px !important}
div.ck{background-position:-256px -89px !important}
div.cr{background-position:-88px -117px !important}
div.ci{background-position:-228px -89px !important}
div.hr{background-position:-172px -229px !important}
div.cu{background-position:-144px -117px !important}
div.cy{background-position:-228px -117px !important}
div.dj{background-position:-4px -145px !important}
div.dm{background-position:-60px -145px !important}
div.do{background-position:-88px -145px !important}
div.eg{background-position:-200px -145px !important}
div.sv{background-position:-32px -509px !important}
div.gq{background-position:-228px -201px !important}
div.er{background-position:-284px -145px !important}
div.ee{background-position:-172px -145px !important}
div.et{background-position:-32px -173px !important}
div.fk{background-position:-144px -173px !important}
div.fo{background-position:-200px -173px !important}
div.fj{background-position:-116px -173px !important}
div.fi{background-position:-88px -173px !important}
div.gf{background-position:-228px -173px !important}
div.pf{background-position:-608px -425px !important}
div.tf{background-position:-172px -509px !important}
div.ga{background-position:-256px -173px !important}
div.gm{background-position:-144px -201px !important}
div.ge{background-position:-228px -425px !important}
div.gh{background-position:-60px -229px !important}
div.gi{background-position:-88px -201px !important}
div.gl{background-position:-116px -201px !important}
div.gd{background-position:-4px -201px !important}
div.gp{background-position:-228px -117px !important}
div.gu{background-position:-32px -229px !important}
div.gt{background-position:-4px -229px !important}
div.gg{background-position:-116px -622px !important}
div.gn{background-position:-172px -201px !important}
div.gw{background-position:-60px -229px !important}
div.gy{background-position:-88px -229px !important}
div.ht{background-position:-200px -229px !important}
div.hm{background-position:-32px -33px !important}
div.va{background-position:-116px -565px !important}
div.hn{background-position:-144px -229px !important}
div.hk{background-position:-116px -229px !important}
div.is{background-position:-144px -257px !important}
div.ir{background-position:-116px -257px !important}
div.iq{background-position:-88px -257px !important}
div.im{background-position:-144px -622px !important}
div.il{background-position:-4px -257px !important}
div.jm{background-position:-200px -257px !important}
div.jp{background-position:-256px -257px !important}
div.je{background-position:-172px -622px !important}
div.jo{background-position:-228px -257px !important}
div.kz{background-position:-256px -285px !important}
div.ke{background-position:-284px -257px !important}
div.ki{background-position:-60px -285px !important}
div.kp{background-position:-144px -285px !important}
div.kr{background-position:-172px -285px !important}
div.kw{background-position:-200px -285px !important}
div.kg{background-position:-4px -285px !important}
div.la{background-position:-284px -285px !important}
div.lb{background-position:-4px -313px !important}
div.ls{background-position:-142px -313px !important}
div.lr{background-position:-116px -313px !important}
div.ly{background-position:-256px -313px !important}
div.li{background-position:-60px -313px !important}
div.lt{background-position:-172px -313px !important}
div.lu{background-position:-116px -397px !important}
div.mo{background-position:-228px -341px !important}
div.mk{background-position:-116px -341px !important}
div.mg{background-position:-60px -341px !important}
div.mw{background-position:-144px -369px !important}
div.mv{background-position:-116px -369px !important}
div.ml{background-position:-144px -341px !important}
/* */div.mt{background-position:-60px -369px !important}
div.mh{background-position:-88px -341px !important}
div.mq{background-position:-284px -341px !important}
div.mr{background-position:-4px -369px !important}
div.mu{background-position:-88px -369px !important}
div.yt{background-position:-116px -593px !important}
div.fm{background-position:-172px -173px !important}
div.mc{background-position:-4px -341px !important}
div.mn{background-position:-200px -341px !important}
div.me{background-position:-284px -313px !important}
div.ms{background-position:-34px -369px !important}
div.ma{background-position:-284px -313px !important}
div.mz{background-position:-228px -369px !important}
div.mm{background-position:-172px -341px !important}
div.na{background-position:-256px -369px !important}
div.nr{background-position:-200px -397px !important}
div.np{background-position:-172px -397px !important}
div.an{background-position:-200px -5px !important}
div.nc{background-position:-284px -369px !important}
div.ni{background-position:-32px -509px !important}
div.ne{background-position:-4px -397px !important}
div.nu{background-position:-228px -397px !important}
div.nf{background-position:-32px -397px !important}
div.mp{background-position:-256px -341px !important}
div.om{background-position:-286px -397px !important}
div.pk{background-position:-144px -425px !important}
div.pw{background-position:-32px -453px !important}
div.ps{background-position:-284px -425px !important}
div.pg{background-position:-88px -425px !important}
div.py{background-position:-60px -453px !important}
div.pn{background-position:-228px -425px !important}
div.pr{background-position:-256px -425px !important}
div.qa{background-position:-88px -453px !important}
div.re{background-position:-4px -621px !important}
div.rw{background-position:-60px -341px !important}
div.bl{background-position:-228px -173px !important}
div.sh{background-position:-88px -481px !important}
div.kn{background-position:-116px -285px !important}
div.lc{background-position:-32px -313px !important}
div.mf{background-position:-228px -173px !important}
div.pm{background-position:-200px -425px !important}
div.vc{background-position:-144px -565px !important}
div.ws{background-position:-60px -593px !important}
div.sm{background-position:-200px -481px !important}
div.st{background-position:-4px -509px !important}
div.sa{background-position:-200px -453px !important}
div.sn{background-position:-228px -481px !important}
div.rs{background-position:-32px -621px !important}
div.sc{background-position:-256px -451px !important}
div.sl{background-position:-172px -481px !important}
div.sg{background-position:-60px -481px !important}
div.si{background-position:-116px -481px !important}
div.sb{background-position:-228px -451px !important}
div.so{background-position:-256px -481px !important}
div.gs{background-position:-200px -561px !important}
div.lk{background-position:-88px -313px !important}
div.sd{background-position:-4px -481px !important}
div.sr{background-position:-284px -481px !important}
div.sj{background-position:-60px -622px !important}
div.sz{background-position:-88px -509px !important}
div.se{background-position:-32px -481px !important}
div.sy{background-position:-60px -509px !important}
div.tw{background-position:-172px -341px !important}
div.tj{background-position:-4px -397px !important}
div.tz{background-position:-228px -537px !important}
div.tl{background-position:-4px -537px !important}
div.tg{background-position:-200px -509px !important}
div.tk{background-position:-284px -509px !important}
div.to{background-position:-88px -537px !important}
div.tt{background-position:-144px -537px !important}
div.tn{background-position:-60px -537px !important}
div.tm{background-position:-32px -537px !important}
div.tc{background-position:-116px -509px !important}
div.tv{background-position:-172px -537px !important}
div.ug{background-position:-284px -537px !important}
div.ae{background-position:-32px -5px !important}
div.um{background-position:-4px -565px !important}
div.uy{background-position:-60px -565px !important}
div.vu{background-position:-284px -565px !important}
div.vn{background-position:-256px -565px !important}
div.vg{background-position:-200px -565px !important}
div.vi{background-position:-228px -565px !important}
div.wf{background-position:-32px -593px !important}
div.eh{background-position:-228px -145px !important}
div.ye{background-position:-88px -593px !important}
div.zm{background-position:-172px -593px !important}
div.zw{background-position:-200px -593px !important}
div.US{background-position:-4px -565px !important}
div.RO{background-position:-144px -509px !important}
div.RU{background-position:-144px -453px !important}
div.CO{background-position:-60px -117px !important}
div.PH{background-position:-116px -425px !important}
div.UA{background-position:-256px -537px !important}
div.CA{background-position:-60px -89px !important}
div.GB{background-position:-284px -173px !important}
div.CZ{background-position:-256px -117px !important}
div.HU{background-position:-228px -229px !important}
div.MD{background-position:-32px -341px !important}
div.ZA{background-position:-144px -593px !important}
div.BR{background-position:-172px -61px !important}
div.IN{background-position:-32px -257px !important}
div.MX{background:url(<?php echo $imageurl; ?>/flag_mexico.jpg);height:11px;width:16px}
div.ES{background-position:-4px -173px !important}
div.DE{background-position:-284px -117px !important}
div.IT{background-position:-172px -257px !important}
div.FR{background-position:-228px -173px !important}
div.LV{background-position:-228px -313px !important}
div.AR{background-position:-256px -5px !important}
div.AU{background-position:-256px -89px !important}
div.PE{background-position:-32px -425px !important}
div.VE{background-position:-228px -593px !important}
div.DR{background-position:-88px -145px !important}
div.CL{background-position:-284px -89px !important}
div.SK{background-position:-144px -481px !important}
div.PT{background-position:-4px -453px !important}
div.TR{background-position:-116px -537px !important}
div.BE{background-position:-228px -33px !important}
div.PL{background-position:-172px -425px !important}
div.TH{background-position:-228px -509px !important}
div.BG{background-position:-284px -33px !important}
div.NL{background-position:-200px -313px !important}
div.NG{background-position:-60px -397px !important}
div.MY{background-position:-200px -369px !important}
div.ID{background-position:-256px -229px !important}
div.UZ{background-position:-88px -565px !important}
div.EC{background-position:-144px -145px !important}
div.NZ{background-position:-256px -397px !important}
div.DK{background-position:-32px -145px !important}
div.DZ{background-position:-116px -145px !important}
div.GR{background-position:-256px -201px !important}
div.AT{background-position:-4px -33px !important}
div.NO{background-position:-256px -61px !important}
div.BD{background-position:-200px -33px !important}
div.CH{background-position:-200px -89px !important}
div.PA{background-position:-4px -425px !important}
div.IE{background-position:-284px -229px !important}
div.AF{background-position:-60px -5px !important}
div.AX{background-position:-88px -33px !important}
div.AL{background-position:-144px -5px !important}
div.AS{background-position:-284px -5px !important}
div.AD{background-position:-4px -5px !important}
div.AO{background-position:-258px -593px !important}
div.AI{background-position:-116px -5px !important}
div.AQ{background-position:-88px -622px !important}
div.AG{background-position:-88px -5px !important}
div.AM{background-position:-172px -5px !important}
div.AW{background-position:-60px -33px !important}
div.AZ{background-position:-116px -33px !important}
div.BS{background-position:-200px -61px !important}
div.BH{background-position:-4px -61px !important}
div.BB{background-position:-172px -33px !important}
div.BY{background-position:-4px -89px !important}
div.BZ{background-position:-32px -89px !important}
div.BJ{background-position:-60px -61px !important}
div.BM{background-position:-88px -61px !important}
div.BT{background-position:-228px -61px !important}
div.BO{background-position:-44px -61px !important}
div.BA{background-position:-144px -33px !important}
div.BW{background-position:-284px -61px !important}
div.BV{background-position:-256px -61px !important}
div.IO{background-position:-60px -285px !important}
div.BN{background-position:-116px -61px !important}
div.BF{background-position:-256px -33px !important}
div.BI{background-position:-32px -61px !important}
div.KH{background-position:-32px -285px !important}
div.CM{background-position:-4px -33px !important}
div.CV{background-position:-4px -117px !important}
div.KY{background-position:-228px -285px !important}
div.CF{background-position:-144px -89px !important}
div.TD{background-position:-116px -453px !important}
div.CN{background-position:-32px -117px !important}
div.CX{background-position:-200px -117px !important}
div.CC{background-position:-32px -33px !important}
div.KM{background-position:-88px -285px !important}
div.CG{background-position:-1726px -89px !important}
div.CD{background-position:-284px -593px !important}
div.CK{background-position:-256px -89px !important}
div.CR{background-position:-88px -117px !important}
div.CI{background-position:-228px -89px !important}
div.HR{background-position:-172px -229px !important}
div.CU{background-position:-144px -117px !important}
div.CY{background-position:-228px -117px !important}
div.DJ{background-position:-4px -145px !important}
div.DM{background-position:-60px -145px !important}
div.DO{background-position:-88px -145px !important}
div.EG{background-position:-200px -145px !important}
div.SV{background-position:-32px -509px !important}
div.GQ{background-position:-228px -201px !important}
div.ER{background-position:-284px -145px !important}
div.EE{background-position:-172px -145px !important}
div.ET{background-position:-32px -173px !important}
div.FK{background-position:-144px -173px !important}
div.FO{background-position:-200px -173px !important}
div.FJ{background-position:-116px -173px !important}
div.FI{background-position:-88px -173px !important}
div.GF{background-position:-228px -173px !important}
div.PF{background-position:-608px -425px !important}
div.TF{background-position:-172px -509px !important}
div.GA{background-position:-256px -173px !important}
div.GM{background-position:-144px -201px !important}
div.GE{background-position:-228px -425px !important}
div.GH{background-position:-60px -229px !important}
div.GI{background-position:-88px -201px !important}
div.GL{background-position:-116px -201px !important}
div.GD{background-position:-4px -201px !important}
div.GP{background-position:-228px -117px !important}
div.GU{background-position:-32px -229px !important}
div.GT{background-position:-4px -229px !important}
div.GG{background-position:-116px -622px !important}
div.GN{background-position:-172px -201px !important}
div.GW{background-position:-60px -229px !important}
div.GY{background-position:-88px -229px !important}
div.HT{background-position:-200px -229px !important}
div.HM{background-position:-32px -33px !important}
div.VA{background-position:-116px -565px !important}
div.HN{background-position:-144px -229px !important}
div.HK{background-position:-116px -229px !important}
div.IS{background-position:-144px -257px !important}
div.IR{background-position:-116px -257px !important}
div.IQ{background-position:-88px -257px !important}
div.IM{background-position:-144px -622px !important}
div.IL{background-position:-4px -257px !important}
div.JM{background-position:-200px -257px !important}
div.JP{background-position:-256px -257px !important}
div.JE{background-position:-172px -622px !important}
div.JO{background-position:-228px -257px !important}
div.KZ{background-position:-256px -285px !important}
div.KE{background-position:-284px -257px !important}
div.KI{background-position:-60px -285px !important}
div.KP{background-position:-144px -285px !important}
div.KR{background-position:-172px -285px !important}
div.KW{background-position:-200px -285px !important}
div.KG{background-position:-4px -285px !important}
div.LA{background-position:-284px -285px !important}
div.LB{background-position:-4px -313px !important}
div.LS{background-position:-142px -313px !important}
div.LR{background-position:-116px -313px !important}
div.LY{background-position:-256px -313px !important}
div.LI{background-position:-60px -313px !important}
div.LT{background-position:-172px -313px !important}
div.LU{background-position:-116px -397px !important}
div.MO{background-position:-228px -341px !important}
div.MK{background-position:-116px -341px !important}
div.MG{background-position:-60px -341px !important}
div.MW{background-position:-144px -369px !important}
div.MV{background-position:-116px -369px !important}
div.ML{background-position:-144px -341px !important}
/* */div.MT{background-position:-60px -369px !important}
div.MH{background-position:-88px -341px !important}
div.MQ{background-position:-284px -341px !important}
div.MR{background-position:-4px -369px !important}
div.MU{background-position:-88px -369px !important}
div.YT{background-position:-116px -593px !important}
div.FM{background-position:-172px -173px !important}
div.MC{background-position:-4px -341px !important}
div.MC{background-position:-200px -341px !important}
div.ME{background-position:-284px -313px !important}
div.MS{background-position:-34px -369px !important}
div.MA{background-position:-284px -313px !important}
div.MZ{background-position:-228px -369px !important}
div.MM{background-position:-172px -341px !important}
div.NA{background-position:-256px -369px !important}
div.NR{background-position:-200px -397px !important}
div.NP{background-position:-172px -397px !important}
div.AN{background-position:-200px -5px !important}
div.NC{background-position:-284px -369px !important}
div.NI{background-position:-32px -509px !important}
div.NE{background-position:-4px -397px !important}
div.NU{background-position:-228px -397px !important}
div.NF{background-position:-32px -397px !important}
div.MP{background-position:-256px -341px !important}
div.OM{background-position:-286px -397px !important}
div.PK{background-position:-144px -425px !important}
div.PW{background-position:-32px -453px !important}
div.PS{background-position:-284px -425px !important}
div.PG{background-position:-88px -425px !important}
div.PY{background-position:-60px -453px !important}
div.PN{background-position:-228px -425px !important}
div.PR{background-position:-256px -425px !important}
div.QA{background-position:-88px -453px !important}
div.RE{background-position:-4px -621px !important}
div.RW{background-position:-60px -341px !important}
div.BL{background-position:-228px -173px !important}
div.SH{background-position:-88px -481px !important}
div.KN{background-position:-116px -285px !important}
div.LC{background-position:-32px -313px !important}
div.MF{background-position:-228px -173px !important}
div.PM{background-position:-200px -425px !important}
div.VC{background-position:-144px -565px !important}
div.WS{background-position:-60px -593px !important}
div.SM{background-position:-200px -481px !important}
div.ST{background-position:-4px -509px !important}
div.SA{background-position:-200px -453px !important}
div.SN{background-position:-228px -481px !important}
div.RS{background-position:-32px -621px !important}
div.SC{background-position:-256px -451px !important}
div.SL{background-position:-172px -481px !important}
div.SG{background-position:-60px -481px !important}
div.SI{background-position:-116px -481px !important}
div.SB{background-position:-228px -451px !important}
div.SO{background-position:-256px -481px !important}
div.GS{background-position:-200px -561px !important}
div.LK{background-position:-88px -313px !important}
div.SD{background-position:-4px -481px !important}
div.SR{background-position:-284px -481px !important}
div.SJ{background-position:-60px -622px !important}
div.SZ{background-position:-88px -509px !important}
div.SE{background-position:-32px -481px !important}
div.SY{background-position:-60px -509px !important}
div.TW{background-position:-172px -341px !important}
div.TJ{background-position:-4px -397px !important}
div.TZ{background-position:-228px -537px !important}
div.TL{background-position:-4px -537px !important}
div.TG{background-position:-200px -509px !important}
div.TK{background-position:-284px -509px !important}
div.TO{background-position:-88px -537px !important}
div.TT{background-position:-144px -537px !important}
div.TN{background-position:-60px -537px !important}
div.TM{background-position:-32px -537px !important}
div.TC{background-position:-116px -509px !important}
div.TV{background-position:-172px -537px !important}
div.UG{background-position:-284px -537px !important}
div.AE{background-position:-32px -5px !important}
div.UM{background-position:-4px -565px !important}
div.UY{background-position:-60px -565px !important}
div.VU{background-position:-284px -565px !important}
div.VN{background-position:-256px -565px !important}
div.VG{background-position:-200px -565px !important}
div.VI{background-position:-228px -565px !important}
div.WF{background-position:-32px -593px !important}
div.EH{background-position:-228px -145px !important}
div.YE{background-position:-88px -593px !important}
div.ZM{background-position:-172px -593px !important}
div.ZW{background-position:-200px -593px !important}