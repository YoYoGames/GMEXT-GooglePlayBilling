// obj_play_billing_product - pressed/click purchase script
// Requires this instance to have product_id, product_type,
// one_time_purchase_offer_details, and subscription_offer_details from
// GooglePlayBillingProductDetails.

show_debug_message($"Product: {data}")

if (data.product_type == GooglePlayBillingProductType.InApp)
{	
	var options = new GooglePlayBillingFlowOptions();
	//[Optional] Obfuscated account and profile IDs
	//options.obfuscated_account_id = "acct_test_8f40d859";
	//options.obfuscated_profile_id = "profile_test_2a17c613";
	var _product_details = new GooglePlayBillingProductDetailsParams()
	_product_details.product_id = data.product_id
    var result = play_billing_launch_billing_flow([_product_details], options);
    show_debug_message($"[PlayBilling] INAPP launch result: {result}");
}
else if (data.product_type == GooglePlayBillingProductType.Subscription)
{
    if (!variable_struct_exists(data, "subscription_offer_details")
    || !is_array(data.subscription_offer_details)
    || array_length(data.subscription_offer_details) <= 0)
    {
        show_debug_message($"[PlayBilling] Subscription has no offers: {data.product_id}");
        exit;
    }

    var offer = data.subscription_offer_details[0];

    if (!is_struct(offer)
    || !variable_struct_exists(offer, "offer_token")
    || offer.offer_token == "")
    {
        show_debug_message($"[PlayBilling] Subscription offer has no offer_token: {data.product_id}");
        exit;
    }

    var options = new GooglePlayBillingFlowOptions();
	//[Optional] Obfuscated account and profile IDs
	//options.obfuscated_account_id = "acct_test_8f40d859";
	//options.obfuscated_profile_id = "profile_test_2a17c613";
    options.offer_token = offer.offer_token;
	
	var _product_details = new GooglePlayBillingProductDetailsParams()
	_product_details.product_id = data.product_id
    var result = play_billing_launch_billing_flow([_product_details],options);

    show_debug_message($"[PlayBilling] SUBS launch result: {result}");
}
else
{
    show_debug_message($"[PlayBilling] Unknown product type: {data.product_type}");
}

/*
Extended subscription upgrade/downgrade example:

var update_params = new GooglePlayBillingSubscriptionUpdateParams();
update_params.old_purchase_token = "some_old_purchase_token";
update_params.replacement_mode = GooglePlayBillingSubscriptionReplacementMode.WithTimeProration;

var options = new GooglePlayBillingFlowOptions();
options.is_offer_personalized = false;
// [Optional] Obfuscated account and profile IDs
// options.obfuscated_account_id = "acct_test_8f40d859";
// options.obfuscated_profile_id = "profile_test_2a17c613";

var _product_details = new GooglePlayBillingProductDetailsParams();
_product_details.product_id = data.product_id;
_product_details.offer_token = subscription_offer_details[0].offer_token;  // Item-level
_product_details.subscription_replacement = update_params;                 // Item-level

var result = play_billing_launch_billing_flow([_product_details], options);
show_debug_message($"[PlayBilling] SUBS update launch result: {result}");
*/
