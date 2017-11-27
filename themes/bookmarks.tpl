<script src="{$baseurl}/js/mainscriptolution.js" type="text/javascript"></script>
<script src="{$baseurl}/js/jquery.qtip-1.0.0-rc3.js" type="text/javascript"></script> 
<script src="{$baseurl}/js/jquery.corner.js" type="text/javascript"></script> 
<script src="{$baseurl}/js/indexes.js" type="text/javascript"></script> 
{literal}
<style>
.songslist h1 {
  float: left;
  width: 100%;
  font-size: 39px;
  font-family: 'latobold', sans-serif;
  color: #424242;
  margin-bottom: 15px;
}
</style>
{/literal}
{include file="scriptolution_error7.tpl"}
<div class="bodybg scriptolutionpaddingtop15 scriptolutionbookmarks">
	<div class="whitebody scriptolutionpaddingtop30 gray">
		<div class="inner-wrapper">
			<div class="clear"></div>
			<div class="left-side">

                <div class="songslist">
                    <h1>{$lang30}</h1>
                    <div class="cusongslist">
                        {include file="scriptolution_bit_last3_my.tpl"}                
                        <div class="clear"></div>
                    </div>
                    <div align="center">
                        <div class="paging">
                            <div class="p1">
                                <ul>
                                    {$pagelinks}
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="clear" style="padding-bottom:20px;"></div>
                </div>
  
			</div>
			{include file='scriptolution_newside.tpl'}
		</div>    
	</div>
</div>