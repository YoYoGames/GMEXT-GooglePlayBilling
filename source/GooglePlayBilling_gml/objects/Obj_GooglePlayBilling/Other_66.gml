
// Early exit if not on Android
if(os_type != os_android) exit;
switch(async_load[?"id"])
{
	
	// @triggered by GPBilling_ConnectToStore
	case gpb_store_connect:
		// At this point we have just finished connecting to the store so we need to:
		
		// 1) Add the products to the local IAP
		GPBilling_AddProduct(IAP_100gems);
		GPBilling_AddProduct(IAP_noads);
		GPBilling_AddSubscription(IAP_premium);
		
		// [UPDATED CODE]
		// 2) Query purchases data (async)
		GPBilling_QueryPurchasesAsync(gpb_purchase_skutype_inapp)

		// 3) Query for products and subscriptions
		// (required to use 'GPBilling_Sku_GetOriginalJson')
		GPBilling_QueryProducts();
		GPBilling_QuerySubscriptions();
		break;

	// @triggered by GPBilling_ConnectToStore
	case gpb_store_connect_failed:
		// At this point we have just failed to connect to the store.
		// Here you can add the logic to act accordingly.
		break;

	// @triggered by GPBilling_PurchaseSubscription or GPBilling_PurchaseProduct
	case gpb_iap_receipt:
	
		// At this point we just finished a purchase and are now triggering a receipt event.
		
		// We look at the async load for a 'response_json' key and parse the json value.
		var responseData = json_parse(async_load[?"response_json"]);
		if (responseData.success) {
			
			var purchaseTokens = {};
			
			var purchases = responseData.purchases;
			var purchasesCount = array_length(purchases);
			
			for(var i = 0; i < purchasesCount; i++)
			{
				var purchase = purchases[i];	
					
				var sku = purchase[$ "productId"];
				var token = purchase[$ "purchaseToken"];
				
				show_debug_message($"purchase: {purchase[$ "productId"]}")
				show_debug_message($"quantity: {purchase[$ "quantity"]}")
				
				/* 
				// ##################### SERVER VERIFICATION #######################
				// This is a demo implementation of a dedicated server to verify your purchases
				// the included server only checks for subscriptions but it should present you
				// with a starting point for our own implementation.
				if (GPBilling_Sku_GetType(sku) == gpb_purchase_skutype_subs)
				{
					// For testing purposes
					
					// This is the internal address of your machine in the local network
					var address = "192.168.1.129"; // <-- change this accordingly
					
					// This is the port being used (the server uses 8080 by default)
					var port = "8080";
					
					// We build a http get request using the information above
					var url = "http://" + address + ":" + port + "/subs?";
					url += "subscriptionId=" + sku;
					url += "&token=" + token;

					// We keep the purchase token for further acknowledgement 
					subsToken = token;
					
					// We can now make a HTTP get request keeping its id to use inside
					// the Ssynchronous HTTP Event and 'continue' to next purchase.
					subsHttpId = http_get(url);
					continue;
				}
				// #################################################################
				*/
				
				// This is purely an example. Verifying in this manner is less secure and prone to spoofing. 
				// Ideally, developers will verify all IAPs, consumable/subs/entitlements using their own server.						
				var signature = GPBilling_Purchase_GetSignature(token);
				var purchaseJsonStr = GPBilling_Purchase_GetOriginalJson(token);					
				if(GPBilling_Purchase_VerifySignature(purchaseJsonStr, signature))
				{					
					// At this point the purchase was verified and we should now proceed to
					// store the purchaseToken for later triggering the acknowledge/consume logic
					// that confirms the purchase within the google play servers.
					purchaseTokens[$ sku] = token;
				}
			}
			
			// This loops through all the IAP buttons (common parent) since in this demo each purchase
			// is represented by a button, however in your case you should loop through all your products.
			with(Obj_GooglePlayBilling_IAP_Button)
			{
				// If the product ID is present inside the 'purchaseTokens' struct
				// means that it was successfully verified with the code above.
				if (variable_struct_exists(purchaseTokens, product_id))
				{
					// Store the purchase token and trigger the OnPurchased logic.
					// Note that this logic still needs to confirm purchase:
					//  - Consumables: need to call GPBilling_ConsumeProduct
					//  - Subscription & other: need to call GPBilling_AcknowledgePurchase
					// In this demo this is done inside each button's USER EVENT 0.
					purchaseToken = purchaseTokens[$ product_id];
					event_user(0);
				}
			}
		}
		
		break;
	
	// @triggered by GPBilling_QueryProducts
	case gpb_product_data_response:
		show_debug_message("Event: gpb_product_data_response");
		break;
	
	// @triggered by GPBilling_QuerySubscriptions
	case gpb_subscription_data_response:
		show_debug_message("Event: gpb_subscription_data_response");
		break;
	
	// ????
	case gpb_purchase_status:
		show_debug_message("Event: gpb_purchase_status");
		break;
	
	// @triggered by GPBilling_ConsumeProduct
	case gpb_product_consume_response:
		// At this point we have just finished consuming an IAP so we need to update
		// the purchases data and lock away puchased items.
		// Update purchased data and lock buttons.
		// [UPDATED CODE]
		GPBilling_QueryPurchasesAsync(gpb_purchase_skutype_inapp)
		//lockPurchasedProducts();//Now async
		
		break;
	
	// @triggered by GPBilling_AcknowledgePurchase
	case gpb_acknowledge_purchase_response:
		// At this point we have just finished acknowledging an IAP so we need to update
		// the purchases data and lock away puchased items.
		// Update purchased data and lock buttons.
		// [UPDATED CODE]
		GPBilling_QueryPurchasesAsync(gpb_purchase_skutype_inapp)
		lockPurchasedProducts();
		
		break;
		
	// [NEW CODE]
	// @triggered by GPBilling_QueryPurchasesAsync
	case gpb_query_purchase_async:
		
		switch(async_load[?"sku_type"])
		{
			case gpb_purchase_skutype_inapp:
				purchasesData = {}
				updatePurchasesData(async_load[?"response_json"])
				GPBilling_QueryPurchasesAsync(gpb_purchase_skutype_subs);
			break
			
			case gpb_purchase_skutype_subs:
				updatePurchasesData(async_load[?"response_json"])
				lockPurchasedProducts()
			break
		}
		
	break
}

