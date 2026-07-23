
with(obj_play_billing_purchase)
	instance_destroy()

play_billing_query_purchases_async(
	    GooglePlayBillingProductType.InApp,
	    false,
	    function(_billing_result, _purchases)
	    {
	        if (_billing_result.code != GooglePlayBillingResponseCode.Ok)
	        {
	            show_debug_message($"[PlayBilling] Error querying purchases: {_billing_result.message}");
	            return;
	        }

	        var _purchase_count = array_length(_purchases);

	        show_debug_message($"[PlayBilling] Found {_purchase_count} INAPP purchases to consume.");

	        for (var _i = 0; _i < _purchase_count; _i++)
	        {
	            var _purchase = _purchases[_i];
	            show_debug_message($"[PlayBilling] Purchase: {_i}: {_purchase}");
				instance_create_depth(x+300,y+100*_i,0,obj_play_billing_purchase,{data: _purchase}).text = _purchase.order_id
	        }
	    }
	);

