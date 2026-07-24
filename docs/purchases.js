
// FUNCTIONS

/**
 * @function play_billing_query_purchases_async
 * @desc This function queries the user's current purchases of the given product type. Use this at
 * startup to restore entitlements without requiring a fresh purchase, and to catch any purchase that
 * still needs to be acknowledged or consumed.
 *
 * [[Note: Query in-app products and subscriptions separately - do not call this function again for a different `product_type` while a previous call is still in flight, as this may cause the Play Store API to error.]]
 *
 * @param {Constant.GooglePlayBillingProductType} product_type The product type to query purchases for
 * @param {Bool} include_suspended_subscriptions Whether suspended subscriptions should be included in the result
 * @param {Function} callback The function to call once the query finishes
 *
 * @event callback
 * @desc This callback fires once, when the query finishes.
 * @member {Struct.GooglePlayBillingResult} billing_result The result of the query
 * @member {Array[Struct.GooglePlayBillingPurchase]} purchases The user's current purchases of the requested type; always a real (possibly empty) array
 * @event_end
 *
 * @example
 * ```gml
 * play_billing_query_purchases_async(GooglePlayBillingProductType.InApp, false, function(_billing_result, _purchases) {
 *     if (_billing_result.code != GooglePlayBillingResponseCode.Ok) exit;
 *
 *     for (var i = 0; i < array_length(_purchases); i++) {
 *         var _purchase = _purchases[i];
 *         if (_purchase.purchase_state == GooglePlayBillingPurchaseState.Purchased && !_purchase.is_acknowledged) {
 *             play_billing_acknowledge_purchase(_purchase.purchase_token, callback);
 *         }
 *     }
 * });
 * ```
 * This code queries the user's one-time purchases and acknowledges any that haven't been acknowledged yet.
 * @function_end
 */

/**
 * @function play_billing_acknowledge_purchase
 * @desc This function acknowledges a purchase or subscription. Every purchase - consumable or not - must
 * be acknowledged within 3 days of being made, or it is automatically refunded by Google. Consumable
 * purchases are acknowledged automatically by ${function.play_billing_consume_async}; use this function for
 * non-consumable one-time products and for subscriptions.
 *
 * @param {String} purchase_token The purchase token of the purchase to acknowledge
 * @param {Function} callback The function to call once the acknowledgement finishes
 *
 * @event callback
 * @desc This callback fires once, when the acknowledgement finishes.
 * @member {Struct.GooglePlayBillingResult} billing_result The result of the acknowledgement
 * @event_end
 *
 * @example
 * ```gml
 * play_billing_acknowledge_purchase(_purchase.purchase_token, function(_billing_result) {
 *     if (_billing_result.code == GooglePlayBillingResponseCode.Ok) {
 *         // Grant entitlement to the non-consumable product/subscription here.
 *     }
 * });
 * ```
 * This code acknowledges a purchase after it has been verified.
 * @function_end
 */

/**
 * @function play_billing_consume_async
 * @desc This function consumes a purchase, allowing the same product to be purchased again. Use this
 * only for consumable one-time products (e.g. in-game currency); non-consumable products and
 * subscriptions must instead be acknowledged with ${function.play_billing_acknowledge_purchase}.
 * Consuming a purchase acknowledges it at the same time - a separate acknowledge call is not needed.
 *
 * @param {String} purchase_token The purchase token of the purchase to consume
 * @param {Function} callback The function to call once the consumption finishes
 *
 * @event callback
 * @desc This callback fires once, when the consumption finishes.
 * @member {Struct.GooglePlayBillingResult} billing_result The result of the consumption
 * @member {String} purchase_token The same purchase token that was passed in, echoed back
 * @event_end
 *
 * @example
 * ```gml
 * play_billing_consume_async(_purchase.purchase_token, function(_billing_result, _purchase_token) {
 *     if (_billing_result.code == GooglePlayBillingResponseCode.Ok) {
 *         // Grant the consumable (e.g. in-game currency) here.
 *     }
 * });
 * ```
 * This code consumes a purchase after it has been verified, granting a consumable reward.
 * @function_end
 */

// STRUCTS

/**
 * @struct GooglePlayBillingAccountIdentifiers
 * @desc This struct is nested inside ${struct.GooglePlayBillingPurchase} when the purchase was made with obfuscated account/profile identifiers (see ${struct.GooglePlayBillingFlowOptions}).
 * @member {String} [obfuscated_account_id] The obfuscated account ID supplied when the purchase was made
 * @member {String} [obfuscated_profile_id] The obfuscated profile ID supplied when the purchase was made
 * @struct_end
 */

/**
 * @struct GooglePlayBillingPendingPurchaseUpdate
 * @desc This struct is nested inside ${struct.GooglePlayBillingPurchase} when a purchase has a pending update (e.g. a pending subscription upgrade/downgrade waiting to take effect) that hasn't completed yet.
 * @member {String} purchase_token The purchase token of the pending update
 * @member {Array[String]} products The product IDs involved in the pending update
 * @struct_end
 */

/**
 * @struct GooglePlayBillingPurchase
 * @desc This struct describes a single purchase, delivered both by the purchases-updated callback registered in ${function.play_billing_init} and by ${function.play_billing_query_purchases_async}.
 * @member {String} [order_id] The Google-assigned order ID; absent for some free/trial transactions
 * @member {String} package_name The app package name this purchase was made for
 * @member {Real} purchase_time The time the purchase was made, as milliseconds since epoch
 * @member {String} purchase_token The unique token identifying this purchase - pass this to ${function.play_billing_acknowledge_purchase}, ${function.play_billing_consume_async}, or as `old_purchase_token` on a subscription replacement
 * @member {Array[String]} products The product IDs included in this purchase (more than one for a multi-product bundle)
 * @member {String} signature The signature used to verify this purchase, e.g. with your own backend
 * @member {Bool} is_acknowledged Whether this purchase has already been acknowledged
 * @member {Bool} is_auto_renewing Whether this purchase is a subscription that will auto-renew
 * @member {Constant.GooglePlayBillingPurchaseState} purchase_state The purchase's current state
 * @member {Real} quantity The quantity of the product purchased
 * @member {String} original_json The original JSON string returned by Google for this purchase, as needed for server-side signature verification
 * @member {Bool} is_suspended Whether this purchase (subscription) is currently suspended
 * @member {Struct.GooglePlayBillingAccountIdentifiers} [account_identifiers] The obfuscated account/profile identifiers supplied when the purchase was made, if any
 * @member {Struct.GooglePlayBillingPendingPurchaseUpdate} [pending_purchase_update] Present only when this purchase has a pending update that hasn't completed yet
 * @struct_end
 */

// CONSTANTS

/**
 * @const GooglePlayBillingPurchaseState
 * @desc This enumeration contains the possible states of a ${struct.GooglePlayBillingPurchase}.
 * @member UnspecifiedState The purchase state could not be determined.
 * @member Purchased The purchase has completed.
 * @member Pending The purchase is pending and has not completed yet (e.g. awaiting a pending cash transaction).
 * @const_end
 */

// MODULES

/**
 * @module purchases
 * @title Purchases
 * @desc This module provides functions for querying, acknowledging and consuming the user's purchases.
 *
 * @section_func
 * @desc The following functions are provided to work with purchases:
 * @ref play_billing_query_purchases_async
 * @ref play_billing_acknowledge_purchase
 * @ref play_billing_consume_async
 * @section_end
 *
 * @section_struct
 * @desc The following structs are used by the purchase functions:
 * @ref GooglePlayBillingPurchase
 * @ref GooglePlayBillingAccountIdentifiers
 * @ref GooglePlayBillingPendingPurchaseUpdate
 * @section_end
 *
 * @section_const
 * @desc The following constants are used by the purchase functions:
 * @ref GooglePlayBillingPurchaseState
 * @section_end
 *
 * @module_end
 */
