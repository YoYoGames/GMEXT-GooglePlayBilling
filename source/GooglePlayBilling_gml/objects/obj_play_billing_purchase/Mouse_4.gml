
play_billing_consume_async(data.purchase_token,function(_billing_result, _purchase_token)
	    {
	        if (_billing_result.code == GooglePlayBillingResponseCode.Ok)
			{
	            show_debug_message($"[PlayBilling] Successfully consumed: {_purchase_token}");
				instance_destroy()
			}
	        else
	            show_debug_message($"[PlayBilling] Failed to consume: {_billing_result.message}");
	    }
	);

