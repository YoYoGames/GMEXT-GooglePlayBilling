
// Show multiple categories
var options = new GooglePlayBillingInAppMessageOptions()
options.categories = [
    GooglePlayBillingInAppMessageCategory.SubscriptionUpdate,
    GooglePlayBillingInAppMessageCategory.PriceChange
];

var _immediate_result = play_billing_show_in_app_messages(options,function(_data)
    {
	    show_debug_message($"[In-App Message Test] Callback result: {_data}");

	    if (_data.response_code == GooglePlayBillingInAppMessageResponseCode.NoActionNeeded)
	    {
	        show_debug_message("[In-App Message Test] No message required action.");
	    }
	    else if (_data.response_code == GooglePlayBillingInAppMessageResponseCode.SubscriptionStatusUpdated)
	    {
	        show_debug_message("[In-App Message Test] Subscription status was updated.");

	        if (variable_struct_exists(_data, "purchase_token") && is_string(_data.purchase_token) && _data.purchase_token != "")
	        {
	            show_debug_message($"[In-App Message Test] New purchase token: " + $"{_data.purchase_token}");

	            play_billing_acknowledge_purchase(_data.purchase_token,
	                function(_ack_result)
	                {
	                    show_debug_message($"[In-App Message Test] Acknowledge result: {_ack_result}");
	                }
	            );
	        }
	    }
	});

show_debug_message($"[In-App Message Test] Immediate result: {_immediate_result}");

