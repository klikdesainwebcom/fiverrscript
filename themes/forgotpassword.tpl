{include file="scriptolution_error7.tpl"}
<div class="bodybg scriptolutionpaddingtop15">
	<div class="whitebody scriptolutionpaddingtop50">
		<div class="inner-wrapper">
			<div class="left-side scriptolutionwidth558">
				<div class="whiteBox twoHalfs padding15 scriptolutionwidth516">
					<h1>{$lang39}</h1>
                    <div id="scriptolutionForm">
                        <form action="{$baseurl}/forgotpassword" method="post">  
                            <div class="form-entry">
                                <label for="email">{$lang4}</label>
                                <input class="text" id="email" name="email" tabindex="1" type="text" value="" />
                            </div>
                            <div class="row">
                                <input type="submit" value="{$lang46}" class="scriptolutionbluebutton" />
                            </div>
                            <input type="hidden" name="fpsub" id="fpsub" value="1" />
                        </form>
                    </div>

					<div class="clear"></div>

				</div>
			</div>			
			<div class="right-side scriptolutionwidth390">
				<center>{insert name=get_advertisement AID=4}</center>
			</div>
			<div class="clear"></div>

		</div>   
	</div>
</div>
<div id="scriptolutionnobottom">
    <div class="centerwrap footertop">
        <div class="footerbg"></div>
    </div>
</div>