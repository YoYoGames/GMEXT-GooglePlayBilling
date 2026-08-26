
// -----------------------------------------------------------------------------
// Define INAPP products
// -----------------------------------------------------------------------------

products_inapp = [];

var _product = new GooglePlayBillingProductInput();
_product.product_id = "100gems";
_product.product_type = GooglePlayBillingProductType.InApp;
array_push(products_inapp, _product);

_product = new GooglePlayBillingProductInput();
_product.product_id = "noads";
_product.product_type = GooglePlayBillingProductType.InApp;
array_push(products_inapp, _product);


// -----------------------------------------------------------------------------
// Define subscription products
// -----------------------------------------------------------------------------

products_subs = [];

_product = new GooglePlayBillingProductInput();
_product.product_id = "premium_subscription";
_product.product_type = GooglePlayBillingProductType.Subscription;
array_push(products_subs, _product);


// -----------------------------------------------------------------------------
// Local product caches
// -----------------------------------------------------------------------------

billing_inapp_products = [];
billing_subs_products = [];
billing_all_products = [];


// -----------------------------------------------------------------------------
// Initialize Google Play Billing
// -----------------------------------------------------------------------------


var _init_options = new GooglePlayBillingInitOptions();
_init_options.enable_auto_service_reconnection = true

//Prepaid
//_init_options.enable_prepaid_plans = true;

//external_availability
//_init_options.enable_external_content_link = true;
//_init_options.enable_external_offer = true;
//_init_options.enable_external_payments = true;
//_init_options.enable_billing_choice = true;

//Alternative-billing-only reporting details
//_init_options.enable_alternative_billing_only = true;

play_billing_init(_init_options,function(_billing_result, _purchases)
    {
		show_debug_message($"[PlayBilling] Purchase update: {_billing_result}, {_purchases}");


        // The purchase update itself must be successful.
        if (_billing_result.code != GooglePlayBillingResponseCode.Ok)
        {
            show_debug_message($"[PlayBilling] Purchase update failed: {_billing_result.message}");
            return;
        }


	    show_debug_message($"[PlayBilling] Updated purchases: {_purchases}");

        for (var _i = 0;_i < array_length(_purchases);_i++)
        {
            var _purchase = _purchases[_i];
			
			switch(_purchase.purchase_state)
			{
				case GooglePlayBillingPurchaseState.Pending:
                    show_debug_message($"[Pending Test] Payment pending; do not grant: {_purchase.products}");

                    if (variable_struct_exists(_purchase,"pending_purchase_update") && is_struct(_purchase.pending_purchase_update))
                        show_debug_message($"[Pending Test] Pending update: {_purchase.pending_purchase_update}");
					
				break
			
				case GooglePlayBillingPurchaseState.UnspecifiedState:
					//???
				break
			
	            // Never grant or acknowledge a pending purchase.
				case GooglePlayBillingPurchaseState.Purchased:


		            // Do not acknowledge the same purchase twice.
		            if (_purchase.is_acknowledged)
		            {
		                show_debug_message($"[PlayBilling] Purchase already acknowledged: {_purchase.products}");
		                continue;
		            }

		            if (!is_string(_purchase.purchase_token) || string_length(_purchase.purchase_token) <= 0)
		            {
		                show_debug_message("[PlayBilling] Purchase has an invalid token.");
		                continue;
		            }

		            // Grant the entitlement before acknowledging.
		            //
		            // Examples:
		            // - Add purchased currency.
		            // - Unlock no-ads.
		            // - Activate premium access.
		            //
		            // Production recommendation:
		            // Verify and process the purchase token on your server first.

		            play_billing_acknowledge_purchase(_purchase.purchase_token,function(_ack_result)
		                {
		                    if (_ack_result.code == GooglePlayBillingResponseCode.Ok)
		                        show_debug_message("[PlayBilling] Purchase acknowledged successfully.");
		                    else
		                        show_debug_message($"[PlayBilling] Acknowledge failed: {_ack_result.message}");
		                }
		            );


		            /*
		            // -------------------------------------------------------------
		            // RECOMMENDED FOR CONSUMABLE PRODUCTS
		            // -------------------------------------------------------------
		            //
		            // Use this INSTEAD of play_billing_acknowledge_purchase()
		            // for products such as:
		            //
		            // - 100gems
		            // - coins_pack
		            // - extra_lives
		            // - health_potion
		            //
		            // Consuming:
		            // 1. Fulfills the acknowledgment requirement.
		            // 2. Marks the purchase as consumed.
		            // 3. Allows the user to purchase the product again.
		            //
		            play_billing_consume_async(
		                _purchase.purchase_token,
		                function(_billing_result, _purchase_token)
		                {
		                    if (_billing_result.code == GooglePlayBillingResponseCode.Ok)
		                    {
		                        show_debug_message(
		                            $"[PlayBilling] Consumable processed: "
		                            + $"{_purchase_token}"
		                        );
		                    }
		                    else
		                    {
		                        show_debug_message(
		                            $"[PlayBilling] Consume failed: "
		                            + $"{_billing_result.message}"
		                        );
		                    }
		                }
		            );
		            */
				break
			}
        }
    });





// -----------------------------------------------------------------------------
// Connect to Google Play Billing
// -----------------------------------------------------------------------------

play_billing_start_connection(function(_connection_result) {
        show_debug_message($"[PlayBilling] Connection result: {_connection_result}");

        if (_connection_result.code != GooglePlayBillingResponseCode.Ok) {
            show_debug_message($"[PlayBilling] Connection failed: {_connection_result.message}");
            return;
        }

        show_debug_message("[PlayBilling] Connected successfully.");


// -----------------------------------------------------------------------------
// Query INAPP products
// -----------------------------------------------------------------------------
		show_debug_message($"[PlayBilling] play_billing_query_product_details_async");
        play_billing_query_product_details_async(
            products_inapp,
            function(_billing_result, _query_result) {
                show_debug_message($"[PlayBilling] INAPP query result: {_billing_result}, {_query_result}");

                if (_billing_result.code != GooglePlayBillingResponseCode.Ok) {
                    show_debug_message($"[PlayBilling] Error querying INAPP products: " + $"{_billing_result.message}");
                    show_debug_message( $"[PlayBilling] Unfetched INAPP products: " + $"{_query_result.unfetched_products}");
                    return;
                }

                billing_inapp_products = _query_result.products;

                show_debug_message($"[PlayBilling] Loaded {array_length(billing_inapp_products)} INAPP products.");


// -----------------------------------------------------------------------------
// Query subscription products
// -----------------------------------------------------------------------------
				show_debug_message($"[PlayBilling] play_billing_query_product_details_async");
                play_billing_query_product_details_async(
                    products_subs,
                    function(_billing_result, _query_result) {
                        show_debug_message($"[PlayBilling] Subscription query result: {_billing_result}, {_query_result}");

                        if (_billing_result.code != GooglePlayBillingResponseCode.Ok) {
                            show_debug_message($"[PlayBilling] Error querying subscriptions: {_billing_result.message}");
                            show_debug_message($"[PlayBilling] Unfetched subscriptions: {_query_result.unfetched_products}");

                            return;
                        }

                        billing_subs_products = _query_result.products;

                        show_debug_message($"[PlayBilling] Loaded {array_length(billing_subs_products)} subscription products.");


// -----------------------------------------------------------------------------
// Merge both product arrays
// -----------------------------------------------------------------------------

                        billing_all_products = [];

                        for (var _i = 0; _i < array_length(billing_inapp_products);_i++) {
                            array_push(billing_all_products,billing_inapp_products[_i]);
                        }

                        for (var _i = 0;_i < array_length(billing_subs_products);_i++) {
                            array_push(billing_all_products,billing_subs_products[_i]);
                        }

                        show_debug_message($"[PlayBilling] Total loaded products: " + $"{array_length(billing_all_products)}");


// -----------------------------------------------------------------------------
// Create product UI instances
// -----------------------------------------------------------------------------

                        for (var _i = 0;_i < array_length(billing_all_products);_i++) 
						{
                            var _billing_product =billing_all_products[_i];
                            show_debug_message($"[PlayBilling] Product " + $"{_billing_product.product_id}: " + $"{_billing_product}");
                            instance_create_depth(1000,225 + _i * 200,0,obj_play_billing_product,{data: _billing_product});
                        }
                    }
                );
            }
        );
    },
    function() {
        show_debug_message("[PlayBilling] Billing service disconnected.");
    });

