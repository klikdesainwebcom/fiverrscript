{if $scriptolutionstripeenable eq "1"}
<script src="https://checkout.stripe.com/checkout.js"></script>
<h2>
	<a id="customButton" style="text-decoration:none" href="#">{$lang612}
    <br />
	<i class="fa fa-cc-visa fa-2x"></i>
    <i class="fa fa-cc-mastercard fa-2x"></i>
    <i class="fa fa-cc-amex fa-2x"></i>
    <i class="fa fa-cc-discover fa-2x"></i>
    <i class="fa fa-cc-diners-club fa-2x"></i>
    <i class="fa fa-cc-jcb fa-2x"></i>
    </a>
</h2>
<script>
  var handler = StripeCheckout.configure({
    key: '{$scriptolutionstripepublishable}',
    //image: '/img/documentation/checkout/marketplace.png',
    locale: 'auto',
    token: function(token) {
      // Use the token to create the charge with a server-side script.
      // You can access the token ID with `token.id`
	  window.location.href = '{$baseurl}/order.php?item={$p.IID|stripslashes}&scriptolutionstripe=1&scriptolutionencoded={$scriptolutionencoded}&token='+token.id
    }
  });
  sQuery('#customButton').on('click', function(e) {
    // Open Checkout with further options
    handler.open({
      name: '{$site_name}',
      description: '#{$p.PID|stripslashes} - {$p.gtitle|stripslashes}',
      currency: "{$scriptolutionstripecurrency}",
	  email: "{$scriptolutionuemail|stripslashes}",
	  {if $scriptolution_enable_processing_fee eq "1"}
	  amount: "{math equation='x * 100' x=$scriptolution_total_price}"
	  {else}
	  amount: "{math equation='x * 100' x=$scriptolution1price}"	  
	  {/if}
    });
    e.preventDefault();
  });
  // Close Checkout on page navigation
  sQuery(window).on('popstate', function() {
    handler.close();
  });
</script>
{/if}