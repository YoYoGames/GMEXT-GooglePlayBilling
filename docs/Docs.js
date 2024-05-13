// Functions

/**
 * @func GPBilling_Init
 * @desc This function initialises the Google Play Billing API.
 *
 * [[Note: By default this is set as the extension's Init function and called automatically. You can also call the function yourself manually. Subsequent calls to the function won't do anything.]]
 * 
 * @example
 * 
 * ```gml
 * GPBilling_Init();
 * ```
 * 
 * @func_end
 */

/**
 * @func GPBilling_ConnectToStore
 * @desc This function will attempt to connect the Google Play Billing API with the Play Store.
 * 
 * The function will return one the ${constant.gpb_error_type} constants to inform you of the status of the connection attempt.
 * 
 * This function **must be called before calling any other IAP functions** and the return status should be `gpb_no_error`. This does not, however, mean that the Store is available, only that the connection *attempt* has been successful. Before you can successfully define, query or purchase any products, you must ensure that the connection is valid.
 * 
 * To check the availability of the Play Store, the function will also trigger one of two callbacks in the ${event.iap}.
 * 
 * @event iap
 * @desc If the initial returned status is `gpb_no_error`.
 * @member {constant.gpb_event_type} id `gpb_store_connect` or `gpb_store_connect_failed`, depending on whether a connection could be made to the Play Store.
 * @event_end
 * 
 * @returns {constant.gpb_error_type}
 *
 * @example
 * 
 * In this extended example, we first send an API request to connect to the store in some event. This would normally be done in the ${event.create} of a dedicated controller object that is one of the first things created in your game:
 * 
 * ```gml
 * /// Create Event
 * var _init = GPBilling_ConnectToStore();
 * if (_init == gpb_error_unknown)
 * {
 *     show_debug_message("ERROR - Billing API Has Not Connected!");
 *     alarm[0] = game_get_speed(gamespeed_fps) * 10;
 * }
 * ```
 * 
 * [[Note: If the connection request has failed, then we can – for example - call an ${var.alarm}, where we can call this same code again to test for store connection periodically.]]
 * 
 * Assuming the API has correctly requested a store connection, it will trigger an ${event.iap} where you can check to see if the API has successfully connected to the Google Play Store or not:
 * 
 * ```gml
 * if(os_type != os_android) exit;
 * 
 * var _event_id = async_load[? "id"];
 * switch (_event_id)
 * {
 *     // ...
 *     
 *     case gpb_store_connect:
 *         // At this point we have just finished connecting to the store so we need to:
 *         
 *         // 1) Add the products to the local IAP
 *         GPBilling_AddProduct(IAP_100gems);
 *         GPBilling_AddProduct(IAP_noads);
 *         GPBilling_AddSubscription(IAP_premium);
 *         
 *         // 2) Query purchase data (async)
 *         GPBilling_QueryPurchasesAsync(gpb_purchase_skutype_inapp);
 *         
 *         // 3) Query products and subscriptions
 *         // (required to use 'GPBilling_Sku_GetOriginalJson')
 *         GPBilling_QueryProducts();
 *         GPBilling_QuerySubscriptions();
 *         break;
 *     
 *     case gpb_store_connect_failed:
 *         // Store has failed to connect, so try again periodically
 *         alarm[0] = game_get_speed(gamespeed_fps) * 10;
 *         break;
 *     
 *     // ...
 * }
 * ```
 * 
 * In the above example, if the store connection fails, you'll see we set an alarm, setting it to count down 10 seconds. In this event we can then try to initialise the store once more using the same code that we have in the ${event.create}, shown above.
 * @func_end
 */

/**
 * @func GPBilling_IsStoreConnected
 * @desc This function checks if the Google Play Billing API currently has a connection to the Google Play Store. The function will return `true` if it has and `false` if it hasn't.
 * 
 * [[Note: If there is no connection, **you should not permit any further Google Play Billing API function calls** and you could also disable or hide any purchase options for the user in your game UI until the connection has been re-established. 
 * In general, you should always call this function and check connectivity before doing any interactions with the Billing API.]]
 * 
 * @returns {bool}
 *
 * @example
 * 
 * ```gml
 * /// Left Mouse Released event
 * if (!GPBilling_IsStoreConnected()) exit;
 * 
 * GPBilling_PurchaseSubscription(product_id);
 * ```
 * @func_end
 */

/**
 * @func GPBilling_GetStatus
 * @desc This function returns the status of the Google Play Billing extension.
 * 
 * The status can be one of `gpb_no_error`, `gpb_error_not_initialised` or `gpb_error_no_skus`.
 *
 * @returns {constant.gpb_error_type}
 * 
 * @example
 * 
 * ```gml
 * GPBilling_GetStatus();
 * ```
 * 
 * @func_end
 */

/**
 * @func GPBilling_AddProduct
 * @desc This function can be used to add a **consumable** product to the internal product list for purchase. You supply the Product ID (as a string, the same as the product ID on the Google Play Console for the game), and the function will return either `gpb_error_unknown` or `gpb_no_error`.
 * For subscription products, you should be using the function ${func.GPBilling_AddSubscription}.
 * 
 * [[Note: There is no difference between a consumable and a non-consumable product as far as the API is concerned. So, for non-consumable IAPs – like a "no ads" IAP, for example – you simply don't call the ${func.GPBilling_ConsumeProduct} function on it. However, non-consumables should still be acknowledged using the ${func.GPBilling_AcknowledgePurchase} function when purchased.]]
 * 
 * @param {string} product_id The product ID (SKU) of the IAP product to add.
 * 
 * @returns {constant.gpb_error_type}
 *
 * @example
 * 
 * The following code is being called from the ${event.iap} when it has been triggered by the function ${func.GPBilling_ConnectToStore}: 
 * 
 * ```gml
 * var _eventId = async_load[? "id"];
 * switch (_eventId)
 * {
 *     // ...
 *     
 *     case gpb_store_connect:
 *         GPBilling_AddProduct(IAP_100gems);
 *         GPBilling_AddProduct(IAP_noads);
 *         GPBilling_AddSubscription(IAP_premium);
 *         
 *         GPBilling_QueryProducts();
 *         GPBilling_QuerySubscriptions();
 *         break;
 *     
 *     // ...
 * }
 * ```
 * @func_end
 */

/**
 * @func GPBilling_AddSubscription
 * @desc This function can be used to add a **subscription** product to the internal product list for purchase. You supply the Product ID (as a string, the same as the product ID on the Google Play Console for the game), and the function will return one of the constants listed below.
 * 
 * The function returns either `gpb_error_unknown` or `gpb_no_error`.
 * 
 * For consumable products, you should be using the function ${func.GPBilling_AddProduct}.
 * 
 * @param {string} product_id The product ID (SKU) to add.
 *
 * @example
 * 
 * The following code is being called from the ${event.iap} when it has been triggered by the function ${func.GPBilling_ConnectToStore}.
 * 
 * ```gml
 * var _eventId = async_load[? "id"];
 * switch (_eventId)
 * {
 *     // ...
 *     
 *     case gpb_store_connect:
 *         GPBilling_AddProduct(IAP_100gems);
 *         GPBilling_AddProduct(IAP_noads);
 *         GPBilling_AddSubscription(IAP_premium);
 *         
 *         GPBilling_QueryProducts();
 *         GPBilling_QuerySubscriptions();
 *         break;
 *     
 *     // ...
 * }
 * ```
 * @func_end
 */

/**
 * @func GPBilling_QueryProducts
 * @desc This function can be used to query the state of any **consumable** products (for subscriptions, please use the function ${func.GPBilling_QuerySubscriptions}).
 * 
 * This function will generate an ${event.iap} where the ${var.async_load} DS map `"id"` key holds the constant `gpb_product_data_response`, as well as the key `"json_response"`.
 * 
 * [[Note: You should NOT call this function at the same time as the equivalent subscription query, as this may cause the Google API to error. Instead, call one function, and then in the ${event.iap} callback, call the other function if you need to.]]
 * 
 * @event iap
 * 
 * @member {constant.gpb_event_type} id The value `gpb_product_data_response`
 * @member {string} json_response A JSON encoded string containing the response data: 
 * 
 * * `"success"` (${type.bool}) - Whether the query was successfully processed
 * * `"skuDetails"`(${type.array} of ${struct.sku_details}) - An array containing the details of every activated IAP product
 * 
 * @event_end
 * 
 * @example
 * 
 * The following code is being called from the ${event.iap} when it has been triggered by the function ${func.GPBilling_ConnectToStore}.
 * 
 * ```gml
 * var _event_id = async_load[? "id"];
 * switch (_event_id)
 * {
 *     // ...
 *     
 *     case gpb_store_connect:
 *         GPBilling_AddProduct(IAP_100gems);
 *         GPBilling_AddProduct(IAP_noads);
 *         GPBilling_AddSubscription(IAP_premium);
 *         
 *         GPBilling_QueryProducts();
 *         GPBilling_QuerySubscriptions();
 *         break;
 *     
 *     // ...
 * }
 * ```
 * 
 * The query products function will then trigger another call to the ${event.iap}, which can be parsed by adding another case to the switch statement, this time checking the ${var.async_load} key `"id"` for the constant `gpb_product_data_response`. Something like this:
 * 
 * ```gml
 * case gpb_product_data_response:
 *     var _json = async_load[? "response_json"];
 *     var _response_data = json_parse(_json);
 *     if (_response_data.success)
 *     {
 *         var _sku_detail, _arr_sku_details = _response.skuDetails;
 *         for (var i = 0; i < array_length(_arr_sku_details); ++i)
 *         {
 *             _sku_detail = _arr_sku_details[i];
 *             show_debug_message($"{_sku_detail.title} ({_sku_detail.productId})\n-----\n");
 *             show_debug_message($"{_sku_detail.description}");
 *             show_debug_message($"{_sku_detail.price}");
 *         }
 *         GPBilling_QuerySubscriptions();
 *     }
 *     break;
 * ```
 * 
 * [[Note: After parsing the returned product data, we then call the equivalent query function for subscriptions, and then when that triggers another asynchronous callback we'd call the function ${func.GPBilling_QueryPurchasesAsync} to check for any purchases that haven't been consumed.]]
 * @func_end
 */

/**
 * @func GPBilling_QuerySubscriptions
 * @desc This function can be used to query the state of any **subscription** products (for consumables, please use the function ${func.GPBilling_QueryProducts}).
 * 
 * This function will generate an ${event.iap} where the ${var.async_load} DS map `"id"` key holds the constant `gpb_subscription_data_response`, as well as the key `"json_response"`. This key contains a JSON object string that holds an ${type.array} of ${struct.sku_details} structs.
 * 
 * The DS map for each individual product will contain the following keys:
 * 
 * [[Note: You should NOT call this function at the same time as the equivalent products query, as this may cause the Google API to error. Instead, call one function, and then in the ${event.iap} callback, call the other function if you need to.]]
 * 
 * @event iap
 * 
 * @member {constant.gpb_event_type} id The value `gpb_product_data_response`
 * @member {string} json_response A JSON encoded string containing the response data: 
 * 
 * * `"success"` (${type.bool}) - Whether the query was successfully processed
 * * `"skuDetails"`(${type.array} of ${struct.sku_details}) - An array containing the details of every activated IAP product
 * 
 * @event_end
 * 
 * @example
 * 
 * The following code is being called from the ${event.iap} when it has been triggered by the function ${func.GPBilling_ConnectToStore}.
 * 
 * ```gml
 * var _event_id = async_load[? "id"];
 * switch (_event_id)
 *     {
 *     case gpb_store_connect:
 *         GPBilling_AddSubscription(global.IAP_PurchaseID[0]);
 *         GPBilling_AddSubscription(global.IAP_PurchaseID[1]);
 *         GPBilling_QuerySubscriptions();
 *         break;
 *     }
 * ```
 * 
 * The query subscriptions function will then trigger another call to the ${event.iap}, which can be parsed by adding another case to the switch statement, this time checking the ${var.async_load} key `"id"` for the constant `gpb_subscription_data_response`, something like this:
 * 
 * ```gml
 * case gpb_subscription_data_response:
 *     var _json = async_load[? "response_json"];
 *     var _response_data = json_parse(_json);
 *     if (_response_data.success)
 *     {
 *         var _arr_sku_details = _response.skuDetails;
 *         for (var i = 0; i < array_length(_arr_sku_details); ++i)
 *         {
 *             var _sku_detail = _arr_sku_details[i];
 *             show_debug_message($"{_sku_detail.title} ({_sku_detail.productId})\n-----\n");
 *             show_debug_message($"{_sku_detail.description}");
 *             show_debug_message($"{_sku_detail.price}");
 *         }
 *         GPBilling_QueryPurchasesAsync(gpb_purchase_skutype_inapp);
 *     }
 *     break;
 * ```
 * 
 * [[Note: After parsing the returned subscription data, we then call the function ${func.GPBilling_QueryPurchasesAsync} to check for any purchases that haven't been consumed. If you haven't already queried consumable products, then you should probably do that first, then in the corresponding ${event.iap} callback, you'd check the purchase status.]]
 * @func_end
 */

/**
 * @func GPBilling_PurchaseProduct
 * @desc This function sends a purchase request to the Billing API and attempts to purchase the product with the given ID. The ID value should be a string and is the product identifier name on the Google Play Console, for example `"buy_100_gold"`. The function will return one of the constants listed below to indicate the initial status of the purchase request, and then an ${event.iap} will be triggered with the callback.
 * 
 * The function returns one of `gpb_error_not_initialised`, `gpb_error_no_skus`, `gpb_error_selected_sku_list_empty` or `gpb_no_error`.
 * 
 * The ${event.iap} callback will return the ${var.async_load} DS map, which will contain an `"id"` key with the constant `gpb_iap_receipt` for a purchase request, as well as the key `"response_json"`, which will contain a JSON formatted string with the purchase data.
 * 
 * Keep in mind that any NON-consumable purchases will also have the purchased state (1), as the Google Billing API makes no distinction between consumable and non-consumable and it's up to you to decide when and if a purchase is consumed. However, **all purchases must be *acknowledged* within 2 days of purchase**, even if they are not being consumed. This is done automatically when a consumable is used, however for non-consumables this must be done using the function ${func.GPBilling_AcknowledgePurchase}. If you do not acknowledge a purchase within 2 days, it will be refunded. 
 * 
 * @param {string} product_id The ID of the product as shown on the Google Play Console.
 * 
 * @event iap
 * @desc 
 * @member {constant.gpb_event_type} id The constant `gpb_iap_receipt`
 * @member {string} response_json A JSON encoded string containing the response data: 
 * 
 * * `"success"` (${type.bool}) - Whether the query was successfully processed
 * * `"purchases"`(${type.array} of ${struct.purchase}) - An array containing the details of every purchase. Only present if `"success"` is `true`.
 * 
 * @event_end
 * 
 * @returns {constant.gpb_error_type}
 *
 * @example
 * 
 * The following code would be used in (for example, but not limited to) a mouse pressed event to purchase a product:
 * 
 * ```gml
 * /// Mouse Left Pressed Event
 * if (!GPBilling_IsStoreConnected()) exit;
 * 
 * GPBilling_PurchaseProduct(product_id);
 * ```
 * 
 * You would then have something like the following code in the ${event.iap} to deal with the purchase callback.
 * 
 * [[Note: The following code shows a simple purchase verification scheme, however you should ideally verify the purchase with an HTTP call to your server, supplying the returned token string, and then consume the purchase when you receive verification in the ${event.http}.]]
 * 
 * ```gml
 * var _event_id = async_load[? "id"];
 * switch (_event_id)
 * {
 *     case gpb_iap_receipt:
 *         var _json = async_load[? "response_json"];
 *         var _response_data = json_parse(_json);
 *         if (_response_data.success)
 *         {
 *             var _purchases = _response_data.purchases;
 *             for (var i = 0; i < array_length(_purchases); ++i)
 *             {
 *                 var _purchase = _purchases[i];
 *                 var _ptoken = _purchase.purchaseToken;
 *                 var _sig = GPBilling_Purchase_GetSignature(_ptoken);
 *                 var _pjson = GPBilling_Purchase_GetOriginalJson(_ptoken);
 *                 if (GPBilling_Purchase_VerifySignature(_pjson, _sig))
 *                 {
 *                     GPBilling_ConsumeProduct(_ptoken);
 *                     array_push(global.CurrentTokens, _ptoken);
 *                     array_push(global.CurrentProducts, _purchase.productId);
 *                 }
 *             }
 *         }
 *         break;
 *     
 *     // ...
 * }
 * ```
 * 
 * [[Note: We store the purchase tokens and product IDs of those products we consume or acknowledge in global arrays. This is done so that we can track the purchases correctly when the consumed or acknowledged response comes back (see the functions ${func.GPBilling_AcknowledgePurchase} and ${func.GPBilling_ConsumeProduct} for more details).]]
 * @func_end
 */

/**
 * @func GPBilling_PurchaseSubscription
 * @desc This function will send a subscription purchase request to the Billing API and attempt to subscribe to the product with the given ID. The ID value should be a string and is the subscription identifier name on the Google Play Console, for example `"improved_version"`. The function will return one of the constants listed below to indicate the initial status of the subscription request, and then an ${event.iap} will be triggered with the callback.
 * 
 * The function returns one of `gpb_error_not_initialised`, `gpb_error_no_skus`, `gpb_error_selected_sku_list_empty` or `gpb_no_error`.
 * 
 * The ${event.iap} callback will return the ${var.async_load} DS map, which will contain an `"id"` key with the constant `gpb_iap_receipt` for a purchase request, as well as the key `"response_json"`, which will contain a JSON formatted string with the purchase data.
 * 
 * [[Note: Keep in mind that **all subscription purchases must be *acknowledged* within 2 days of purchase**, using the function ${func.GPBilling_AcknowledgePurchase}. If you do not acknowledge a purchase within 2 days, it will be refunded. ]]
 * 
 * [[Note: After the initial purchase, the subscription will be renewed automatically by Google, and all you have to do is query the subscription state each time the game starts to unlock or block any additional content as required.]]
 * 
 * > __:warning: IMPORTANT__ Setting up and using subscriptions requires an external server to be able to communicate with your app and with the Google Play servers for verification and other purposes. This is outside of the scope of this documentation and instead we refer you to the following documents:
 *  > * [Google Developer Docs: Add Subscription-Specific Features](https://developer.android.com/google/play/billing/billing_subscriptions)
 *  > * [Google Developer Docs: Verify A Purchase On A Server](https://developer.android.com/google/play/billing/billing_library_overview#Verify-purchase)
 * 
 * @param {string} product_id The ID of the product as shown on the Google Play Console.
 * 
 * @event iap
 * @desc 
 * @member {constant.gpb_event_type} id The constant `gpb_iap_receipt`
 * @member {string} response_json A JSON encoded string containing the response data: 
 * 
 * * `"success"` (${type.bool}) - Whether the query was successfully processed
 * * `"purchases"` (${type.array} of ${struct.purchase}) - An array containing the details of every purchase. Only present if `"success"` is `true`.
 * 
 * @event_end
 * 
 * @returns {constant.gpb_error_type}

 * @example
 * 
 * The following code would be used in (for example, but not limited to) a mouse pressed event to purchase a product:
 * 
 * ```gml
 * /// Mouse Left Pressed Event
 * if (!GPBilling_IsStoreConnected()) exit;
 * 
 * GPBilling_PurchaseSubscription(product_id);
 * ```
 * 
 * You would then have something like the following code in the ${event.iap} to deal with the purchase callback.
 * 
 * [[Note: The following code shows a simple purchase verification scheme, however you should ideally verify the purchase with an HTTP call to your server, supplying the returned token string, and then consume the purchase only when you receive verification in the ${event.http}.]]
 * 
 * ```gml
 * var _event_id = async_load[? "id"];
 * switch (_event_id)
 * {
 *     case gpb_iap_receipt:
 *         var _json = async_load[? "response_json"];
 *         var _response_data = json_parse(_json);
 *         if (_response_data.success)
 *         {
 *             var _purchases = _response_data.purchases;
 *             for (var i = 0; i < array_length(_purchases);  ++i)
 *             {
 *                 var _purchase = _purchases[i];
 *                 var _ptoken = _purchase.purchaseToken;
 *                 var _sig = GPBilling_Purchase_GetSignature(_ptoken);
 *                 array_push(global.CurrentTokens, _ptoken);
 *                 array_push(global.CurrentProduct, _purchase.productId);
 *                 
 *                 // SERVER VERIFICATION CODE HERE
 *                 // Here you would send the token and signature to
 *                 // your servers for verification with the Google 
 *                 // Play API and then return the result, which would 
 *                 // then be received in an Asynchronous HTTP event.
 *                 // Once received, the subscription can then
 *                 // be acknowledged, and content, bonuses, etc.
 *                 // can be unlocked in your game.
 *             }
 *         }
 *         break;
 * }
 * ```
 * 
 * [[Note: We store the purchase tokens and product IDs of those products we consume or acknowledge in global arrays. This is done so that we can track the purchases correctly when the consumed or acknowledged response comes back (see the functions ${func.GPBilling_AcknowledgePurchase} and ${func.GPBilling_ConsumeProduct} for more details).]]
 * @func_end
 */

/**
 * @func GPBilling_AcknowledgePurchase
 * @desc This function acknowledges a purchase or subscription.
 * 
 * The function returns either `gpb_no_error` or `gpb_error_unknown`.
 * 
 * When you receive a notification that a purchase has been made, it needs to be acknowledged with the Google servers within 2 days, otherwise it is refunded. This is done automatically for consumable purchases when you call the function ${func.GPBilling_ConsumeProduct}, but for non-consumable and subscriptions, you must call this function to let Google know the purchase has been received correctly.
 * 
 * On calling the function initially, it will return one of the constants listed below to inform you of the request status, and if this is `gpb_no_error` then an ${event.iap} will be triggered where the ${var.async_load} DS map will have the key `"id"` which will correspond to the extension constant `gpb_acknowledge_purchase_response`. Additionally, the map will have the key `"response_json"` which will be a JSON string that can be converted into a ${type.struct} using the ${function.json_parse} function.
 * 
 * @param {string} purchase_token The unique string token for the purchase being acknowledged.
 * 
 * @event iap
 * 
 * @member {constant.gpb_event_type} id The constant `gpb_acknowledge_purchase_response`.
 * @member {string} response_json A JSON encoded string containing the details of the acknowledgement.
 * 
 * * `"responseCode"` (${type.real}) - This can be checked before proceeding to deal with the acknowledgement response. It can have one of the following integer values:
 *   * -3 - The request has reached the maximum timeout before Google Play responds.
 *   * -2 – Requested feature is not supported by Play Store on the current device.
 *   * -1 – The Play Store service is not connected currently.
 *   *  0 – Success
 *   *  1 – User has cancelled the action
 *   *  2 – Network connection is down 
 *   *  4 – Requested product is not available for purchase
 *   *  6 – Fatal error during the API action
 *   *  7 – Failure to purchase since item is already owned
 *   *  8 – Failure to consume since item is not owned
 * 
 * * `"purchaseToken"` (${type.string}) - A reference to the purchase token.
 * 
 * @event_end
 * 
 * @returns {constant.gpb_error_type}
 *
 * @example
 * 
 * This example shows how you'd deal with the callback in the ${event.iap} for an acknowledged product (for an example of when the ${func.GPBilling_AcknowledgePurchase} function should be called, see the Example for the function ${func.GPBilling_PurchaseSubscription}):
 * 
 * ```gml
 * var _event_id = async_load[? "id"];
 * switch (_event_id)
 * {
 *     case gpb_acknowledge_purchase_response:
 *         var _response_data = json_parse(async_load[? "response_json"]);
 *         var _num = -1;
 *         if (_response_data.responseCode == 0)
 *         {
 *             var _sz = array_length(global.CurrentProducts);
 *             for (var i = 0; i < _sz; ++i)
 *             {
 *                 if (global.CurrentProducts[i] == "yoyo_noads")
 *                 {
 *                     global.NoAds = true;
 *                     _num = i;
 *                     break;
 *                 }
 *                 // Add further checks for other products here...
 *             }
 *             if (_num > -1)
 *             {
 *                 array_delete(global.CurrentProducts, _num, 1);
 *                 array_delete(global.CurrentTokens, _num, 1);
 *             }
 *         }
 *         else
 *         {
 *             // Parse the other response codes here
 *             // and react appropriately
 *         }
 *         break;
 * }
 * ```
 * @func_end
 */

/**
 * @func GPBilling_ConsumeProduct
 * @desc This function will consume a purchase. When you receive a notification that a purchase has been made, it needs to be consumed or acknowledged with the Google servers within 2 days, otherwise it is refunded. Consumable purchases are acknowledged automatically when you call this function, but for non-consumable and subscription purchases, see the function ${func.GPBilling_AcknowledgePurchase}.
 * 
 * The function either returns `gpb_no_error` or `gpb_error_unknown`.
 * 
 * On calling the function initially, it will return one of the constants listed below to inform you of the request status, and if this is `gpb_no_error` then an ${event.iap} will be triggered where the ${var.async_load} DS map will have the key `"id"` which will correspond to the extension constant `gpb_product_consume_response`. Additionally, the map will have the key `"response_json"` which will be a JSON string that can be converted into a ${type.struct} using the ${function.json_parse} function.
 * 
 * If you have the `"responseCode"` key, then it can be checked for one of the following integer values:
 * 
 * * -3 – The request has reached the maximum timeout before Google Play responds.
 * * -2 – Requested feature is not supported by Play Store on the current device.
 * * -1 – The Play Store service is not connected currently.
 * *  0 – Success
 * *  1 – User has cancelled the action
 * *  2 – Network connection is down
 * *  4 – Requested product is not available for purchase
 * *  6 – Fatal error during the API action
 * *  7 – Failure to purchase since item is already owned
 * *  8 – Failure to consume since item is not owned
 * 
 * @param {string} purchase_token The unique string token for the purchase being acknowledged.
 * 
 * @event iap
 * 
 * @member {constant.gpb_event_type} id The constant `gpb_product_consume_response`.
 * @member {string} response_json A JSON encoded string containing the following: 
 * 
 * * `responseCode` - One of the following values: 
 * 
 *   * -3 – The request has reached the maximum timeout before Google Play responds.
 *   * -2 – Requested feature is not supported by Play Store on the current device.
 *   * -1 – The Play Store service is not connected currently.
 *   *  0 – Success
 *   *  1 – User has cancelled the action
 *   *  2 – Network connection is down
 *   *  4 – Requested product is not available for purchase
 *   *  6 – Fatal error during the API action
 *   *  7 – Failure to purchase since item is already owned
 *   *  8 – Failure to consume since item is not owned
 * 
 * * `purchaseToken` (${type.string}) - The purchase token string of the consumed product.
 * 
 * @event_end
 * 
 * @returns {constant.gpb_error_type}
 *
 * @example
 * 
 * This example shows how you'd deal with the callback in the ${event.iap} for a consumed product (for an example of when the ${func.GPBilling_ConsumeProduct} function should be called, see the Example for the function ${func.GPBilling_PurchaseProduct}):
 * 
 * ```gml
 * var _eventId = async_load[? "id"];
 * switch (_eventId)
 * {
 *     // ...
 *     
 *     case gpb_product_consume_response:
 *         var _response_data = json_parse(async_load[? "response_json"]);
 *         var _num = -1;
 *         if (struct_exists(_response_data, "purchaseToken"))
 *         {
 *             for (var i = 0; i < array_length(global.CurrentTokens); ++i)
 *             {
 *                 if (_response_data.purchaseToken == global.CurrentTokens[i])
 *                 {
 *                     if (global.CurrentProducts[i] == "yoyo_500gold")
 *                     {
 *                         global.Gold += 500;
 *                         _num = i;
 *                         break;
 *                     }
 *                     // Check any other products here...
 *                 }
 *             }
 *             if (_num > -1)
 *             {
 *                 array_delete(global.CurrentProducts, _num, 1);
 *                 array_delete(global.CurrentTokens, _num, 1);
 *             }
 *         }
 *         else
 *         {
 *             // Parse the error response codes here
 *             // and react appropriately
 *         }
 *         break;
 *     
 *     // ...
 * }
 * ```
 * @func_end
 */

/**
 * @func GPBilling_Sku_GetDescription
 * @desc This function will return the descriptive text as defined on the Google Play Developer Console for the given SKU (product ID) You supply the product ID as a string, and the function will return a string with the description.
 * 
 * [[Note: This function requires you to have called ${func.GPBilling_QueryProducts} or ${func.GPBilling_QuerySubscriptions} *first*, but once those have returned their respective Async callbacks, this function can be used anywhere in your game code to retrieve the required information.]]
 * 
 * @param {string} product_id The unique SKU (product ID) of the product.
 * 
 * @returns {string} (the SKU description)
 * 
 * @example
 * 
 * The following code would be called in the ${event.draw} of an object used to display the information for a given IAP product:
 * 
 * ```gml
 * var _name = GPBilling_Sku_GetTitle(global.IAP_PurchaseID[0]);
 * var _desc = GPBilling_Sku_GetDescription(global.IAP_PurchaseID[0]);
 * var _price = GPBilling_Sku_GetPrice(global.IAP_PurchaseID[0]);
 * draw_set_halign(fa_center);
 * draw_text(x, y + 32, _name);
 * draw_text(x, y + 48, _desc);
 * draw_text(x, y + 64, _price);
 * ```
 * @func_end
 */

/**
 * @func GPBilling_Sku_GetFreeTrialPeriod
 * @desc This function will return the Trial Period as defined on the Google Play Developer Console for the given SKU (product ID). You supply the product ID as a string, and the function will return a string in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format, for example `"P7D"` which would equate to seven days.
 * 
 * [[Note: This function requires you to have called ${func.GPBilling_QueryProducts} or ${func.GPBilling_QuerySubscriptions} *first*, but once those have returned their respective Async callbacks, this function can be used anywhere in your game code to retrieve the required information.]]
 * 
 * [[Note: This function is only valid for subscriptions which have a trial period configured.]]
 * 
 * @param {string} product_id The unique SKU (product ID) of the product.
 * 
 * @example
 * 
 * The following code would be called in the ${event.draw} of an object used to display the information for a given IAP product:
 * 
 * ```gml
 * var _name = GPBilling_Sku_GetTitle(global.IAP_PurchaseID[0]);
 * var _desc = GPBilling_Sku_GetDescription(global.IAP_PurchaseID[0]);
 * var _period = GPBilling_Sku_GetFreeTrialPeriod(global.IAP_PurchaseID[0]);
 * var _days = string_digits(_period);
 * draw_set_halign(fa_center);
 * draw_text(x, y + 32, _name);
 * draw_text(x, y + 48, _desc);
 * draw_text(x, y + 64, "Trial Period: " + _days + " days");
 * ```
 * @func_end
 */

/**
 * @func GPBilling_Sku_GetIconUrl
 * @desc This function returns the URL for the icon of the given SKU (product ID) as created on the Google Play Developer Console. You supply the product ID as a string, and the function will return a string with the URL. You can then use the ${function.sprite_add} function to retrieve this image (which will trigger an ${event.image_loaded} and then display it in your game).
 * 
 * [[Note: This function requires you to have called ${func.GPBilling_QueryProducts} or ${func.GPBilling_QuerySubscriptions} *first*, but once those have returned their respective Async callbacks, this function can be used anywhere in your game code to retrieve the required information.]]
 * 
 * @param {string} product_id The unique SKU (product ID) of the product.
 * 
 * @returns {string}
 *
 * @example
 * 
 * In this example, we first call the function to get the URL of the icon for a product (probably in an ${event.iap}, after querying the product details):
 * 
 * ```gml
 * var _url = GPBilling_Sku_GetIconUrl(global.IAP_PurchaseID[0]);
 * iap_sprite = sprite_add(_url, 0, false, false, 0, 0);
 * ```
 * 
 * This will trigger an ${event.image_loaded} where you can then store the returned image for drawing:
 * 
 * ```gml
 * if (ds_map_find_value(async_load, "id") == iap_sprite)
 * {
 *     if (ds_map_find_value(async_load, "status") >= 0)
 *     {
 *         sprite_index = iap_sprite;
 *     }
 * }
 * ```
 * @func_end
 */

/**
 * @func GPBilling_Sku_GetIntroductoryPrice
 * @desc This function will return the introductory price as defined on the Google Play Developer Console for the given SKU (product ID). You supply the product ID as a string, and the function will return a formatted string with the price that includes the currency sign, for example `"€3.99"`.
 * 
 * [[Note: This function requires you to have called ${func.GPBilling_QueryProducts} or ${func.GPBilling_QuerySubscriptions} *first*, but once those have returned their respective Async callbacks, this function can be used anywhere in your game code to retrieve the required information.]]
 * 
 * [[Warning: This function is only valid for subscriptions which have an introductory period configured.]]
 * 
 * @param {string} sku The unique SKU (product ID) of the product.
 * 
 * @returns {string}
 * 
 * @example
 * 
 * The following code would be called in the ${event.draw} of an object used to display the information for a given IAP product:
 * 
 * ```gml
 * var _name = GPBilling_Sku_GetTitle(global.IAP_PurchaseID[0]);
 * var _desc = GPBilling_Sku_GetDescription(global.IAP_PurchaseID[0]);
 * var _price = GPBilling_Sku_GetIntroductoryPrice(global.IAP_PurchaseID[0]);
 * draw_set_halign(fa_center);
 * draw_text(x, y + 32, _name);
 * draw_text(x, y + 48, _desc);
 * draw_text(x, y + 64, _price);
 * ```
 * @func_end
 */

/**
 * @func GPBilling_Sku_GetIntroductoryPriceAmountMicros
 * @desc This function will return the introductory price as defined on the Google Play Developer Console for the given SKU (product ID) in *micros*, where 1,000,000 micros equals one unit of the currency. You supply the product ID as a string, and the function will return an integer value for the price in micros, for example 7990000 (which would be 7.99 in currency).
 * 
 * [[Note: This function requires you to have called ${func.GPBilling_QueryProducts} or ${func.GPBilling_QuerySubscriptions} *first*, but once those have returned their respective Async callbacks, this function can be used anywhere in your game code to retrieve the required information.]]
 * 
 * [[Warning: This function is only valid for subscriptions which have an introductory period configured.]]
 * 
 * @param {string} product_id The unique SKU (product ID) of the product.
 * 
 * @returns {real}
 *
 * @example
 * 
 * The following code would be called in the ${event.draw} of an object used to display the information for a given IAP product:
 * 
 * ```gml
 * var _name = GPBilling_Sku_GetTitle(global.IAP_PurchaseID[0]);
 * var _desc = GPBilling_Sku_GetDescription(global.IAP_PurchaseID[0]);
 * var _m = GPBilling_Sku_GetIntroductoryPriceAmountMicros(global.IAP_PurchaseID[0]);
 * var _c = GPBilling_Sku_GetPriceCurrencyCode(global.IAP_PurchaseID[0]);
 * var _val = string(_m / 1000000);
 * var _symbol = "";
 * switch (_c)
 * {
 *     case "GBP": _symbol = "£"; break;
 *     case "JPY": _symbol = "¥"; break;
 *     case "EUR": _symbol = "€"; break;
 * }
 * draw_set_halign(fa_center);
 * draw_text(x, y + 32, _name);
 * draw_text(x, y + 48, _desc);
 * draw_text(x, y + 64, _symbol + _val);
 * ```
 * @func_end
 */

/**
 * @func GPBilling_Sku_GetIntroductoryPriceCycles
 * @desc This function will return the introductory price cycles as defined on the Google Play Developer Console for the given SKU (product ID). You supply the product ID as a string, and the function will return a string of the value for the number of billing cycles that the user will pay the introductory price for, for example `"3"`.
 * 
 * [[Note: This function requires you to have called ${func.GPBilling_QueryProducts} or ${func.GPBilling_QuerySubscriptions} *first*, but once those have returned their respective Async callbacks, this function can be used anywhere in your game code to retrieve the required information.]]
 * 
 * [[Warning: This function is only valid for subscriptions which have an introductory period configured.]]
 * 
 * @param {string} product_id The unique SKU (product ID) of the product.
 * 
 * @returns {string}
 * 
 * @example
 * 
 * The following code would be called in the ${event.draw} of an object used to display the information for a given IAP product:
 * 
 * ```gml
 * var _name = GPBilling_Sku_GetTitle(global.IAP_PurchaseID[0]);
 * var _desc = GPBilling_Sku_GetDescription(global.IAP_PurchaseID[0]);
 * var _price = GPBilling_Sku_GetIntroductoryPrice(global.IAP_PurchaseID[0]);
 * var _cycles = GPBilling_Sku_GetIntroductoryPriceCycles(global.IAP_PurchaseID[0]);
 * draw_set_halign(fa_center);
 * draw_text(x, y + 32, _name);
 * draw_text(x, y + 48, _desc);
 * draw_text(x, y + 64, _price);
 * draw_text(x, y + 80, "for " + _cycles + " months");
 * ```
 * @func_end
 */

/**
 * @func GPBilling_Sku_GetIntroductoryPricePeriod
 * @desc This function will return the introductory price period as defined on the Google Play Developer Console for the given SKU (product ID). You supply the product ID as a string, and the function will return a string in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format, for example `"P7D"` would equate to seven days.
 * 
 * [[Note: This function requires you to have called ${func.GPBilling_QueryProducts} or ${func.GPBilling_QuerySubscriptions} *first*, but once those have returned their respective Async callbacks, this function can be used anywhere in your game code to retrieve the required information.]]
 * 
 * [[Warning: This function is only valid for subscriptions which have an introductory period configured.]]
 * 
 * @param {string} product_id The unique SKU (product ID) of the product.
 * 
 * @returns {string}
 *
 * @example
 * 
 * The following code would be called in the ${event.draw} of an object used to display the information for a given IAP product:
 * 
 * ```gml
 * var _name = GPBilling_Sku_GetTitle(global.IAP_PurchaseID[0]);
 * var _desc = GPBilling_Sku_GetDescription(global.IAP_PurchaseID[0]);
 * var _period = GPBilling_Sku_GetIntroductoryPricePeriod(global.IAP_PurchaseID[0]);
 * var _days = string_digits(_period);
 * draw_set_halign(fa_center);
 * draw_text(x, y + 32, _name);
 * draw_text(x, y + 48, _desc);
 * draw_text(x, y + 64, "Offer Lasts For " + _days + " days!");
 * ```
 * @func_end
 */

/**
 * @func GPBilling_Sku_GetOriginalJson
 * @desc This function will return the original JSON corresponding to the given SKU (product ID), containing all the details about the product. You supply the product ID as a string, and the function will return a JSON string that can be decoded into a ${type.struct} using the ${function.json_parse} function. The struct's contents will correspond to the details listed in the Google Billing documentation (see the Android developer documentation on [SkuDetails](https://developer.android.com/reference/com/android/billingclient/api/SkuDetails.html) for more information).
 * 
 * [[Note: This function requires you to have called ${func.GPBilling_QueryProducts} or ${func.GPBilling_QuerySubscriptions} *first*, but once those have returned their respective Async callbacks, this function can be used anywhere in your game code to retrieve the required information.]]
 * 
 * @param {string} product_id The unique SKU (product ID) of the product.
 * 
 * @returns {string}
 * 
 * @example
 * 
 * The following code can be called after querying a product to retrieve all the information about it without calling the individual SKU functions:
 * 
 * ```gml
 * var _json = GPBilling_Sku_GetOriginalJson(global.IAP_PurchaseID[0]);
 * var _data = json_parse(_json);
 * global.IAP_PurchaseData[0, 0] = _data.price;
 * global.IAP_PurchaseData[0, 1] = _data.title;
 * global.IAP_PurchaseData[0, 2] = _data.description;
 * ```
 * @func_end
 */

/**
 * @func GPBilling_Sku_GetOriginalPrice
 * @desc This function will return the original price as defined on the Google Play Developer Console for the given SKU (product ID), where the original price is the price of the item before any applicable sales have been applied. You supply the product ID as a string, and the function will return a formatted string with the price that includes the currency sign, for example `"€3.99"`.
 * 
 * [[Note: This function requires you to have called ${func.GPBilling_QueryProducts} or ${func.GPBilling_QuerySubscriptions} *first*, but once those have returned their respective Async callbacks, this function can be used anywhere in your game code to retrieve the required information.]]
 * 
 * @param {string} product_id The unique SKU (product ID) of the product.
 * 
 * @returns {string}
 * 
 * @example
 * 
 * The following code would be called in the ${event.draw} of an object used to display the information for a given IAP product:
 * 
 * ```gml
 * var _name = GPBilling_Sku_GetTitle(global.IAP_PurchaseID[0]);
 * var _desc = GPBilling_Sku_GetDescription(global.IAP_PurchaseID[0]);
 * var _price = GPBilling_Sku_GetOriginalPrice(global.IAP_PurchaseID[0]);
 * draw_set_halign(fa_center);
 * draw_text(x, y + 32, _name);
 * draw_text(x, y + 48, _desc);
 * draw_text(x, y + 64, _price);
 * ```
 * @func_end
 */

/**
 * @func GPBilling_Sku_GetOriginalPriceAmountMicros
 * @desc This function will return the original price as defined on the Google Play Developer Console for the given SKU (product ID) in micros, where 1,000,000 micros equals one unit of the currency. The original price is defined as the price of the item before any applicable sales have been applied, and the value represents the localised, rounded price for a particular currency. You supply the product ID as a string, and the function will return an integer value for the price in micros, for example 7990000 (which would be 7.99 in currency).
 * 
 * [[Note: This function requires you to have called ${func.GPBilling_QueryProducts} or ${func.GPBilling_QuerySubscriptions} *first*, but once those have returned their respective Async callbacks, this function can be used anywhere in your game code to retrieve the required information.]]
 * 
 * @param {string} product_id The unique SKU (product ID) of the product.
 * 
 * @returns {real}
 *
 * @example
 * 
 * The following code would be called in the ${event.draw} of an object used to display the information for a given IAP product:
 * 
 * ```gml
 * var _name = GPBilling_Sku_GetTitle(global.IAP_PurchaseID[0]);
 * var _desc = GPBilling_Sku_GetDescription(global.IAP_PurchaseID[0]);
 * var _m = GPBilling_Sku_GetOriginalPriceAmountMicros(global.IAP_PurchaseID[0]);
 * var _c = GPBilling_Sku_GetPriceCurrencyCode(global.IAP_PurchaseID[0]);
 * var _val = string(_m / 1000000);
 * var _symbol = "";
 * switch (_c)
 * {
 *     case "GBP": _symbol = "£"; break;
 *     case "JPY": _symbol = "¥"; break;
 *     case "EUR": _symbol = "€"; break;
 * }
 * draw_set_halign(fa_center);
 * draw_text(x, y + 32, _name);
 * draw_text(x, y + 48, _desc);
 * draw_text(x, y + 64, _symbol + _val);
 * ```
 * @func_end
 */

/**
 * @func GPBilling_Sku_GetPrice
 * @desc This function will return the current price as defined on the Google Play Developer Console for the given SKU (product ID). You supply the product ID as a string, and the function will return a formatted string with the price that includes the currency sign, for example `"€3.99"`.
 * 
 * [[Note: This function requires you to have called ${func.GPBilling_QueryProducts} or ${func.GPBilling_QuerySubscriptions} *first*, but once those have returned their respective Async callbacks, this function can be used anywhere in your game code to retrieve the required information.]]
 * 
 * @param {string} product_id The unique SKU (product ID) of the product.
 * 
 * @returns {string}
 *
 * @example
 * 
 * The following code would be called in the ${event.draw} of an object used to display the information for a given IAP product:
 * 
 * ```gml
 * var _name = GPBilling_Sku_GetTitle(global.IAP_PurchaseID[0]);
 * var _desc = GPBilling_Sku_GetDescription(global.IAP_PurchaseID[0]);
 * var _price = GPBilling_Sku_GetPrice(global.IAP_PurchaseID[0]);
 * draw_set_halign(fa_center);
 * draw_text(x, y + 32, _name);
 * draw_text(x, y + 48, _desc);
 * draw_text(x, y + 64, _price);
 * ```
 * @func_end
 */

/**
 * @func GPBilling_Sku_GetPriceAmountMicros
 * @desc This function will return the current price as defined on the Google Play Developer Console for the given SKU (product ID) in micros, where 1,000,000 micros equals one unit of the currency, and the value represents the localized, rounded price for a particular currency. You supply the product ID as a string, and the function will return an integer value for the price in micros, for example 7990000 (which would be 7.99 in currency).
 * 
 * [[Note: This function requires you to have called ${func.GPBilling_QueryProducts} or ${func.GPBilling_QuerySubscriptions} *first*, but once those have returned their respective Async callbacks, this function can be used anywhere in your game code to retrieve the required information.]]
 * 
 * @param {string} product_id The unique SKU (product ID) of the product.
 * 
 * @returns {real}
 *
 * @example
 * 
 * The following code would be called in the ${event.draw} of an object used to display the information for a given IAP product:
 * 
 * ```gml
 * var _name = GPBilling_Sku_GetTitle(global.IAP_PurchaseID[0]);
 * var _desc = GPBilling_Sku_GetDescription(global.IAP_PurchaseID[0]);
 * var _m = GPBilling_Sku_GetPriceAmountMicros(global.IAP_PurchaseID[0]);
 * var _c = GPBilling_Sku_GetPriceCurrencyCode(global.IAP_PurchaseID[0]);
 * var _val = string(_m / 1000000);
 * var _symbol = "";
 * switch (_c)
 * {
 *     case "GBP": _symbol = "£"; break;
 *     case "JPY": _symbol = "¥"; break;
 *     case "EUR": _symbol = "€"; break;
 * }
 * draw_set_halign(fa_center);
 * draw_text(x, y + 32, _name);
 * draw_text(x, y + 48, _desc);
 * draw_text(x, y + 64, _symbol + _val);
 * ```
 * @func_end
 */

/**
 * @func GPBilling_Sku_GetPriceCurrencyCode
 * @desc This function will return the currency code for the given SKU (product ID). You supply the product ID as a string, and the function will return a string in [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) format, for example `"EUR"` would equate to the Euro currency.
 * 
 * [[Note: This function requires you to have called ${function.GPBilling_QueryProducts} or ${function.GPBilling_QuerySubscriptions} *first*, but once those have returned their respective Async callbacks, this function can be used anywhere in your game code to retrieve the required information.]]
 * 
 * @param {string} product_id The unique SKU (product ID) of the product.
 * 
 * @returns {string}
 *
 * @example
 * 
 * The following code would be called in the ${event.draw} of an object used to display the information for a given IAP product:
 * 
 * ```gml
 * var _name = GPBilling_Sku_GetTitle(global.IAP_PurchaseID[0]);
 * var _desc = GPBilling_Sku_GetDescription(global.IAP_PurchaseID[0]);
 * var _m = GPBilling_Sku_GetPriceAmountMicros(global.IAP_PurchaseID[0]);
 * var _c = GPBilling_Sku_GetPriceCurrencyCode(global.IAP_PurchaseID[0]);
 * var _val = string(_m / 1000000);
 * var _symbol = "";
 * switch (_c)
 * {
 *     case "GBP": _symbol = "£"; break;
 *     case "JPY": _symbol = "¥"; break;
 *     case "EUR": _symbol = "€"; break;
 * }
 * draw_set_halign(fa_center);
 * draw_text(x, y + 32, _name);
 * draw_text(x, y + 48, _desc);
 * draw_text(x, y + 64, _symbol + _val);
 * ```
 * @func_end
 */

/**
 * @func GPBilling_Sku_GetSubscriptionPeriod
 * @desc This function will return the subscription renewal period as defined on the Google Play Developer Console for the given SKU (product ID). You supply the product ID as a string, and the function will return a string in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format, for example `"P7D"` would equate to seven days.
 * 
 * [[Note: This function requires you to have called ${func.GPBilling_QueryProducts} or ${func.GPBilling_QuerySubscriptions} *first*, but once those have returned their respective Async callbacks, this function can be used anywhere in your game code to retrieve the required information.]]
 * 
 * [[Warning: This function is only valid for subscription IAPs.]]
 * 
 * @param {string} product_id The unique SKU (product ID) of the product.
 * 
 * @returns {string}
 * 
 * @example
 * 
 * The following code would be called in the ${event.draw} of an object used to display the information for a given IAP product:
 * 
 * ```gml
 * var _name = GPBilling_Sku_GetTitle(global.IAP_PurchaseID[0]);
 * var _desc = GPBilling_Sku_GetDescription(global.IAP_PurchaseID[0]);
 * var _period = GPBilling_Sku_GetSubscriptionPeriod(global.IAP_PurchaseID[0]);
 * var _days = string_digits(_period);
 * draw_set_halign(fa_center);
 * draw_text(x, y + 32, _name);
 * draw_text(x, y + 48, _desc);
 * draw_text(x, y + 64, "Renewal Period: " + _days + " days");
 * ```
 * @func_end
 */

/**
 * @func GPBilling_Sku_GetTitle
 * @desc This function will return the title of a given SKU (product ID) as defined on the Google Play Developer Console. You supply the product ID as a string, and the function will return a string with the product title.
 * 
 * [[Note: This function requires you to have called ${func.GPBilling_QueryProducts} or ${func.GPBilling_QuerySubscriptions} *first*, but once those have returned their respective Async callbacks, this function can be used anywhere in your game code to retrieve the required information.]]
 * 
 * @param {string} product_id The unique SKU (product ID) of the product.
 * 
 * @returns {string}
 *
 * @example
 * 
 * The following code would be called in the ${event.draw} of an object used to display the information for a given IAP product:
 * 
 * ```gml
 * var _name = GPBilling_Sku_GetTitle(global.IAP_PurchaseID[0]);
 * var _desc = GPBilling_Sku_GetDescription(global.IAP_PurchaseID[0]);
 * var _price = GPBilling_Sku_GetPrice(global.IAP_PurchaseID[0]);
 * draw_set_halign(fa_center);
 * draw_text(x, y + 32, _name);
 * draw_text(x, y + 48, _desc);
 * draw_text(x, y + 64, _price);
 * ```
 * @func_end
 */

/**
 * @func GPBilling_Sku_GetType
 * @desc This function will return the in-app purchase type of a given SKU (product ID) as defined on the Google Play Developer Console. You supply the product ID as a string, and the function will return a constant with the IAP product type.
 * 
 * [[Note: This function requires you to have called ${func.GPBilling_QueryProducts} or ${func.GPBilling_QuerySubscriptions} *first*, but once those have returned their respective Async callbacks, this function can be used anywhere in your game code to retrieve the required information.]]
 * 
 * @param {string} product_id The unique SKU (product ID) of the product.
 * 
 * @returns {constant.gpb_purchase_skutype}
 *
 * @example
 * 
 * The following code would be called in the ${event.draw} of an object used to display the information for a given IAP product:
 * 
 * ```gml
 * var _name = GPBilling_Sku_GetTitle(global.IAP_PurchaseID[0]);
 * var _desc = GPBilling_Sku_GetDescription(global.IAP_PurchaseID[0]);
 * var _price = GPBilling_Sku_GetPrice(global.IAP_PurchaseID[0]);
 * draw_set_halign(fa_center);
 * draw_text(x, y + 32, _name);
 * draw_text(x, y + 48, _desc);
 * draw_text(x, y + 64, _price);
 * if (GPBilling_Sku_GetType(global.IAP_PurchaseID[0]) == gpb_purchase_skutype_subs)
 * {
 *     draw_text(x, y + 80, "Subscription!");
 * }
 * ```
 * @func_end
 */

/**
 * @func GPBilling_Purchase_GetState
 * @desc This function can be used to check the current state of a product purchase. You supply the unique purchase token (as a string), and the function will return one of the ${constant.gpb_purchase_state} constants to indicate the current state of the purchase.
 *
 * @param {string} purchase_token The purchase token for the purchase to check.
 * 
 * @returns {constant.gpb_purchase_state}
 *
 * @example
 * 
 * ```gml
 * if (GPBilling_Purchase_GetState(global.CurrentToken) == gpb_purchase_state_purchased)
 * {
 *     sprite_index = spr_IconConsume;
 * }
 * ```
 * @func_end
 */

/**
 * @func GPBilling_Purchase_GetSignature
 * @desc This function will return a string containing the signature of the purchase data that was signed with the private key of the developer. If the function fails, then an empty string `""` will be returned.
 * 
 * @param {string} purchase_token The purchase token for the purchase to check.
 * 
 * @returns {string}
 *
 * @example
 * 
 * ```gml
 * for (var i = 0; i < array_length(global.CurrentTokens); ++i)
 * {
 *     var _sig = GPBilling_Purchase_GetSignature(global.CurrentTokens[i]);
 *     var _json = GPBilling_Purchase_GetOriginalJson(global.CurrentTokens[i]);
 *     if (GPBilling_Purchase_VerifySignature(_json, _sig))
 *     {
 *         GPBilling_ConsumeProduct(global.CurrentTokens[i]);
 *     }
 * }
 * ```
 * @func_end
 */

/**
 * @func GPBilling_Purchase_VerifySignature
 * @desc This function can be used to verify a purchase before consuming or acknowledging it. You supply a JSON string plus the unique signature for a purchase. You can retrieve these details using the ${func.GPBilling_Purchase_GetSignature} and ${func.GPBilling_Purchase_GetOriginalJson} functions, and the function will return `true` if the purchase can be verified, or `false` otherwise.
 * 
 * [[Warning: This form of verification **isn't truly secure** because it requires you to bundle purchase verification logic within your app. This logic becomes compromised if your app is reverse engineered. Instead we recommend that you create your own server to verify any product purchases.]]
 * 
 * @param {string} original_json The original JSON related to the purchase being verified
 * @param {string} signature The unique signature used to verify the purchase
 * 
 * @returns {bool}
 *
 * @example
 * 
 * ```gml
 * for (var i = 0; i < array_length(global.CurrentTokens); ++i)
 * {
 *     var _sig = GPBilling_Purchase_GetSignature(global.CurrentTokens[i]);
 *     var _json = GPBilling_Purchase_GetOriginalJson(global.CurrentTokens[i]);
 *     if (GPBilling_Purchase_VerifySignature(_json, _sig))
 *     {
 *         GPBilling_ConsumeProduct(global.CurrentTokens[i]);
 *     }
 * }
 * ```
 * @func_end
 */

/**
 * @func GPBilling_Purchase_GetOriginalJson
 * @desc This function will return the original JSON string related to a purchase. You supply the unique purchase token (a string) and the function will return a JSON object string that can be decoded into a ${type.struct} using the ${function.json_parse} function. This struct will contain all the details about the given purchase. If the function fails, then an empty string `""` will be returned.
 *
 * @param {string} purchaseToken The purchase token for the purchase to check.
 * 
 * @returns {string}
 *
 * @example
 * 
 * ```gml
 * for (var i = 0; i < array_length(global.CurrentTokens); ++i)
 * {
 *     var _sig = GPBilling_Purchase_GetSignature(global.CurrentTokens[i]);
 *     var _json = GPBilling_Purchase_GetOriginalJson(global.CurrentTokens[i]);
 *     if (GPBilling_Purchase_VerifySignature(_json, _sig))
 *     {
 *         GPBilling_ConsumeProduct(global.CurrentTokens[i]);
 *     }
 * }
 * ```
 * @func_end
 */

/**
 * @func GPBilling_QueryPurchasesAsync
 * @desc This function replaces `GPBilling_QueryPurchases` and works in an asynchronous manner. It is used for querying the purchase state of the different products available for your game. This function should always be called before permitting any in-app purchases, preferably near the startup of the game itself. The function takes a ${constant.gpb_purchase_skutype} as the `"type"` argument.
 * 
 * This function will generate an ${event.iap} where the ${var.async_load} DS map `"id"` key holds the constant `gpb_query_purchase_async`, a `"sku_type"` key that contains the argument provided during the function call, as well as the key `"response_json"`. This key contains a JSON object string, which – when decoded using ${function.json_parse} – will be a ${type.struct}. This struct will have the key `"success"` - which will be `true` if the query has been successfully processed, and `false` otherwise – as well as the key `"purchases"` (only if `"success"` is true).
 * 
 * * `"success"` – This will be either `true` or `false` depending on whether the purchase query succeeded or not.
 * 
 * * `"purchases"` – This is a JSON array, where each entry corresponds to an object for an individual purchase. This will be an additional key if "success" is `true`.
 * 
 * When the `"purchases"` key exists, this can then be looped through (as shown in the extended example below) to get the individual structs with the product and purchase information.
 * 
 * Purchases that have been made but not consumed will have a `"purchaseState"` of 1 for purchased, while purchases that are in progress but not yet resolved will have a state of 2 for pending.
 * 
 * Keep in mind that any NON-consumable purchases will also have the purchased state (1), as the Google Billing API makes no distinction between consumable and non-consumable and it's up to you to decide when and if a purchase is consumed. However, **all purchases must be *acknowledged* within 2 days of purchase, even if they are not being consumed**. This is done automatically when a consumable is used, however for non-consumables this must be done using the function ${func.GPBilling_AcknowledgePurchase}. If you do not acknowledge a purchase within 2 days, it will be refunded.
 * 
 * @param {string} skuType The type of product to be queried.
 * 
 * @event iap
 * 
 * @member {constant.gpb_event_type} id The constant `gpb_query_purchase_async`
 * @member {string} sku_type The constant `gpb_query_purchase_async`
 * @member {string} response_json A JSON encoded string containing the response data. The response contains the following:
 * 
 * * `"success"` (${type.boolean}) - Whether the query has been successfully processed.
 * * `"purchases"` - An ${type.array} of ${struct.purchase} structs.
 * 
 * @event_end
 * 
 * @example
 * 
 * For this example, we would first want to connect to the store, then add products and then query the product status, before checking the purchase state of each product. So, for example, we'd have a ${event.create} like this:
 * 
 * ```gml
 * var _init = GPBilling_ConnectToStore();
 * if (_init == gpb_error_unknown)
 * {
 *     show_debug_message("ERROR - Billing API Has Not Connected!");
 *     alarm[0] = game_get_speed(gamespeed_fps) * 10;
 * }
 * ```
 * 
 * Assuming the API has correctly requested a store connection, it will trigger an ${event.iap} where you can check to see if the API has successfully connected to the Google Play Store or not, and then add each of the products that you want to be available to the user, and then query the product details:
 * 
 * ```gml
 * var _event_id = async_load[? "id"];
 * switch (_event_id)
 * {
 *     case gpb_store_connect:
 *         GooglePlayBilling_AddProduct(global.IAP_PurchaseID[0]);
 *         GooglePlayBilling_AddProduct(global.IAP_PurchaseID[1]);
 *         GPBilling_QueryProducts();
 *         break;
 * }
 * ```
 * 
 * The query products function will then trigger another ${event.iap}, and we can add another case to our switch statement where we can check the state of any purchases from those that we've added, and consume or acknowledge any purchased product as required:
 * 
 * ```gml
 * case gpb_product_data_response:
 *     var _response_data = json_parse(async_load[? "response_json"]);
 *     if (_response_data.success)
 *     {
 *         GPBilling_QueryPurchasesAsync();
 *     }
 *     break;
 * case gpb_query_purchase_async:
 *     var _response_data = json_parse(async_load[? "response_json"]);
 *     if (_response_data.success)
 *     {
 *         var _purchases = _response_data.purchases;
 *         for (var i = 0; i < array_length(_purchases); ++i)
 *         {
 *             var _purchase = _purchases[i];
 *             if (_purchase.purchaseState == 1)
 *             {
 *                 var _pid = _purchase.productId;
 *                 var _token = _purchase.purchaseToken;
 *                 var _add = false;
 *                 if (_pid == global.IAP_PurchaseID[0])
 *                 {
 *                     GPBilling_ConsumeProduct(_token);
 *                     _add = true;
 *                 }
 *                 else if (_pid == global.IAP_PurchaseID[1])
 *                 {
 *                     if (_purchase.acknowledged == 0)
 *                     {
 *                         GPBilling_AcknowledgePurchase(_token);
 *                         _add = true;
 *                     }
 *                 }
 *                 if (_add)
 *                 {
 *                     array_push(global.CurrentTokens, _token);
 *                     array_push(global.CurrentProduct, _pid);
 *                 }
 *             }
 *         }
 *     }
 *     break;
 * ```
 * 
 * We store the purchase tokens and product IDs of those products we consume or acknowledge in global arrays. This is done so that we can track the purchases correctly when the consumed or acknowledged response comes back (see the functions ${func.GPBilling_AcknowledgePurchase} and ${func.GPBilling_ConsumeProduct} for more details).
 * 
 * @func_end
 */

/**
 * @struct sku_details
 * @desc This struct contains details on a single SKU item.
 * 
 * @member {string} skuDetailsToken This is a unique token created by Google for the details request.
 * @member {string} productId The product ID (SKU, a string) as listed on the Google Play Console for the game.
 * @member {constant.gpb_purchase_skutype} type The SKU type of the product, either `gpb_purchase_skutype_inapp` or` gpb_purchase_skutype_subs`.
 * @member {string} price The *formatted* price of the item, including its currency sign. The price does not include tax.
 * @member {real} price_amount_micros The price in *micro-units* (an integer), where 1,000,000 micro-units equals one unit of the currency. For example, if the price is `"€7.99"`, then the price in micros is `7990000`. This value represents the localised and rounded price for a particular currency.
 * @member {real} price_currency_code The [ISO 4217](https://www.xe.com/iso4217.php) currency code for the price and original price, as an integer. For example, if the price is specified in British pounds sterling, then the code returned would be `"GBP"`.
 * @member {string} title The title of the product as defined in the Google Play Console.
 * @member {string} description The product description as defined in the Google Play Console.
 * 
 * @struct_end
 */

/**
 * @struct purchase
 * @desc This struct contains details on a single purchase.
 * 
 * @member {string} orderId A unique order identifier for the transaction. This identifier corresponds to the Google Payments order ID.
 * @member {string} packageName The application package from which the purchase originated.
 * @member {string} productId The product ID (SKU).
 * @member {real} purchaseTime The time the product was purchased (as an integer). This is in milliseconds since the epoch (Jan 1, 1970).
 * @member {real} purchaseState The state of purchase (an integer). Possible values are: 0. Unspecified State, 1. Purchased, 2. Pending.
 * @member {string} purchaseToken A token that uniquely identifies a purchase for a given item and user pair. This should be used for any server verification.
 * @member {boolean} autoRenewing Indicates whether the subscription renews automatically (will always be `false` for non-subscription purchases).
 * @member {real} acknowledged The acknowledgement state of the in-app product. Possible values are: 0. Yet to be acknowledged, 1. Acknowledged.
 * @struct_end
 */

/**
 * @module functions
 * @title Functions
 * 
 * @section_func
 * @ref GPBilling_Init
 * @ref GPBilling_ConnectToStore
 * @ref GPBilling_IsStoreConnected
 * @ref GPBilling_GetStatus
 * @ref GPBilling_AddProduct
 * @ref GPBilling_AddSubscription
 * @ref GPBilling_QueryProducts
 * @ref GPBilling_QuerySubscriptions
 * @ref GPBilling_PurchaseProduct
 * @ref GPBilling_PurchaseSubscription
 * @ref GPBilling_AcknowledgePurchase
 * @ref GPBilling_ConsumeProduct
 * @ref GPBilling_Sku_GetDescription
 * @ref GPBilling_Sku_GetFreeTrialPeriod
 * @ref GPBilling_Sku_GetIconUrl
 * @ref GPBilling_Sku_GetIntroductoryPrice
 * @ref GPBilling_Sku_GetIntroductoryPriceAmountMicros
 * @ref GPBilling_Sku_GetIntroductoryPriceCycles
 * @ref GPBilling_Sku_GetIntroductoryPricePeriod
 * @ref GPBilling_Sku_GetOriginalJson
 * @ref GPBilling_Sku_GetOriginalPrice
 * @ref GPBilling_Sku_GetOriginalPriceAmountMicros
 * @ref GPBilling_Sku_GetPrice
 * @ref GPBilling_Sku_GetPriceAmountMicros
 * @ref GPBilling_Sku_GetPriceCurrencyCode
 * @ref GPBilling_Sku_GetSubscriptionPeriod
 * @ref GPBilling_Sku_GetTitle
 * @ref GPBilling_Sku_GetType
 * @ref GPBilling_Purchase_GetState
 * @ref GPBilling_Purchase_GetSignature
 * @ref GPBilling_Purchase_VerifySignature
 * @ref GPBilling_Purchase_GetOriginalJson
 * @ref GPBilling_QueryPurchasesAsync
 * @section_end
 * 
 * @section_struct
 * @ref sku_details
 * @ref purchase
 * @section_end
 * 
 * @module_end
 */

/**
 * @module home
 * @title Home
 * @desc This is the Google Play Billing extension which provides functionality to developers to sell digital products and content in their Android game. In this wiki you can find the full available API documentation and guides necessary to get started.
 * 
 * @section Extension's Features
 * 
 * @desc 
 * * Connect to the Google Store
 * * Query products/subscription/purchase information
 * * Purchase products/subscriptions
 * * Acknowledge/Consume purchases
 * * Verify purchases using signature/own server ([Verification](Quick_Start_Guide#verification))
 * 
 * @section_end
 * 
 * @section Setup
 * 
 * @desc
 * The Google Play Billing extension requires no setup apart from filling out the correct public key
 * to your application in the `Game Options` -> `Android` -> `Packaging` -> `Google Licensing
 * Public Key` field; make sure this information is correct and you should be good to go.
 * 
 * @section_end
 * 
 * @section Guides
 * 
 * @desc The following are guides for the Google Play Billing extension: 
 * @ref page.Quick_Start_Guide
 * @ref page.Using_The_Google_Play_IAP_Extension
 * 
 * @section_end
 * 
 * @section Functions and Constants
 * @desc These are the modules of the Google Play Billing extension:
 * @ref module.functions
 * @ref module.constants
 * @section_end
 * 
 * @module_end
 */