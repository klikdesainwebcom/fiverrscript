{include file="scriptolution_error7.tpl"}                          
<div class="bodybg scriptolutionpaddingtop15 scriptolutionopages">
	<div class="whitebody scriptolutionpaddingtop30 scriptolutionwidth842 gray">
		<div class="inner-wrapper scriptolutionwidth842">
			<div class="left-side scriptolutionwidth842">
				<div class="whiteBox twoHalfs padding0 scriptolutionwidth800">
                    
                    
                    <div id="scriptolutionOrderingForm" class="scriptolutionpadding20"> 
                        <h1><strong>{$lang380}</strong></h1>
                        {if $OID GT "0"}
                            <h2>{$lang381}</h2>
                            <h2>{$lang490} {$lang491}</h2>
                            <ul style="margin-left:10px; padding:10px;"> 
                            	{section name=i loop=$OID}
                              	<li style="padding:10px;"><b>{$lang140} #{$smarty.section.i.iteration}</b><br />{$lang383}<br /><a href="{$baseurl}/track?id={$OID[i].OID}" target="_blank">{$baseurl}/track?id={$OID[i].OID}</a></li> 
                              	{/section}
                            </ul>
                        {else}
                         	<h1><strong>{$lang440}</strong></h1>
                         	<h2>{$lang441}</h2>
                         	{literal}
							<script language="JavaScript">
                            var countDownInterval=15;
                            var c_reloadwidth=200
                            </script>
                            <ilayer id="c_reload" width=&{c_reloadwidth}; ><layer id="c_reload2" width=&{c_reloadwidth}; left=0 top=0></layer></ilayer>
                            <script>
                            var countDownTime=countDownInterval+1;
                            function countDown(){
                            countDownTime--;
                            if (countDownTime <=0){
                            countDownTime=countDownInterval;
                            clearTimeout(counter)
                            window.location.reload()
                            return
                            }
                            if (document.all)
                            document.all.countDownText.innerText = countDownTime+" ";
                            else if (document.getElementById)
                            document.getElementById("countDownText").innerHTML=countDownTime+" "
                            else if (document.layers){
                            document.c_reload.document.c_reload2.document.write('{/literal}{$lang444}{literal}<b id="countDownText">'+countDownTime+'</b> {/literal}{$lang443}{literal}. <a href="javascript:window.location.reload()">[{/literal}{$lang442}{literal}]</a>')
                            document.c_reload.document.c_reload2.document.close()
                            }
                            counter=setTimeout("countDown()", 1000);
                            }
                            function startit(){
                            if (document.all||document.getElementById)
                            document.write('{/literal}{$lang444}{literal} <b id="countDownText">'+countDownTime+'</b> {/literal}{$lang443}{literal}. <a href="javascript:window.location.reload()">[{/literal}{$lang442}{literal}]</a>')
                            countDown()
                            }
                            if (document.all||document.getElementById)
                            startit()
                            else
                            window.onload=startit
                            </script>
                            {/literal}
                        {/if}                            
                    </div>
                    
                    
					<div class="clear"></div>
				</div>
			</div>			
			<div class="clear"></div>
		</div>   
	</div>
</div>
<div id="scriptolutionnobottom">
    <div class="centerwrap footertop">
        <div class="footerbg gray scriptolutionfooter842"></div>
    </div>
</div>