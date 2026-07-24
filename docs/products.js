
// FUNCTIONS

/**
 * @function play_billing_query_product_details_async
 * @desc This function queries the Play Store for the details of one or more products, caching the native
 * `ProductDetails` for each product found so it can later be used by
 * ${function.play_billing_launch_billing_flow}.
 *
 * [[Note: Successful results are merged into the existing cache rather than replacing it, so you can query in-app products and subscriptions separately (or in multiple batches) without losing earlier results.]]
 *
 * @param {Array[Struct.GooglePlayBillingProductInput]} products The products to query
 * @param {Function} callback The function to call once the query finishes
 *
 * @event callback
 * @desc This callback fires once, when the query finishes.
 * @member {Struct.GooglePlayBillingResult} billing_result The result of the query
 * @member {Struct.GooglePlayBillingProductDetailsQueryResult} query_result The products that were found and any that could not be fetched; always present, with empty arrays on failure
 * @event_end
 *
 * @example
 * ```gml
 * var _products = [
 *     { product_id: "single_time_purchase", product_type: GooglePlayBillingProductType.InApp },
 *     { product_id: "premium_subscription", product_type: GooglePlayBillingProductType.Subscription }
 * ];
 *
 * play_billing_query_product_details_async(_products, function(_billing_result, _query_result) {
 *     if (_billing_result.code != GooglePlayBillingResponseCode.Ok) exit;
 *
 *     for (var i = 0; i < array_length(_query_result.products); i++) {
 *         var _product = _query_result.products[i];
 *         show_debug_message($"{_product.title}: {_product.product_id}");
 *     }
 * });
 * ```
 * This code queries a one-time product and a subscription, then logs the title of every product found.
 * @function_end
 */

/**
 * @function play_billing_clear_products
 * @desc This function clears the native `ProductDetails` cache populated by
 * ${function.play_billing_query_product_details_async}. Products must be queried again before they can be
 * used with ${function.play_billing_launch_billing_flow}.
 *
 * @example
 * ```gml
 * play_billing_clear_products();
 * ```
 * This code clears the cached product details.
 * @function_end
 */

/**
 * @function play_billing_launch_billing_flow
 * @desc This function launches the Play Store purchase UI for one or more products previously cached by
 * ${function.play_billing_query_product_details_async}. It supports a single purchase, a bundle of
 * multiple one-time products, or a subscription with add-ons, and can replace (upgrade/downgrade) an
 * existing subscription in the same flow.
 *
 * This function only returns the *immediate* result of launching the flow. The actual purchase result
 * (success, cancellation, etc.) is delivered later through the callback registered in
 * ${function.play_billing_init}, exactly like any other purchase update.
 *
 * [[Note: Each product in `items` must already be present in the cache populated by ${function.play_billing_query_product_details_async}; otherwise this function fails with `GooglePlayBillingResponseCode.DeveloperError` before reaching Google.]]
 *
 * @param {Array[Struct.GooglePlayBillingProductDetailsParams]} items The products to purchase in this flow
 * @param {Struct.GooglePlayBillingFlowOptions} [options] Options controlling the billing flow
 *
 * @returns {Struct.GooglePlayBillingResult}
 *
 * @example
 * ```gml
 * var _items = [
 *     { product_id: "single_time_purchase" }
 * ];
 *
 * var _result = play_billing_launch_billing_flow(_items);
 * if (_result.code != GooglePlayBillingResponseCode.Ok) {
 *     show_debug_message($"Failed to launch billing flow: {_result.code}");
 * }
 * // The purchase outcome itself arrives later through play_billing_init's callback.
 * ```
 * This code launches the purchase flow for a single one-time product.
 * @function_end
 */

// STRUCTS

/**
 * @struct GooglePlayBillingProductInput
 * @desc This struct describes a single product to query with ${function.play_billing_query_product_details_async}.
 * @member {String} product_id The product ID (SKU) as configured in the Play Console
 * @member {Constant.GooglePlayBillingProductType} product_type Whether the product is a one-time product or a subscription
 * @member {String} [dynamic_product_token] The dynamic product token to use when querying a dynamically-priced product
 * @struct_end
 */

/**
 * @struct GooglePlayBillingProductDetails
 * @desc This struct is delivered inside ${struct.GooglePlayBillingProductDetailsQueryResult} for every product found by ${function.play_billing_query_product_details_async}.
 * @member {String} product_id The product ID (SKU) as configured in the Play Console
 * @member {String} name The product's display name
 * @member {String} title The product's title, including the app name, as shown by the Play Store
 * @member {String} description The product's description
 * @member {Constant.GooglePlayBillingProductType} product_type Whether the product is a one-time product or a subscription
 * @member {Array[Struct.GooglePlayBillingOneTimePurchaseOfferDetails]} one_time_purchase_offer_details The one-time purchase offers for this product; empty for subscriptions
 * @member {Array[Struct.GooglePlayBillingSubscriptionOfferDetails]} subscription_offer_details The subscription offers for this product; empty for one-time products
 * @struct_end
 */

/**
 * @struct GooglePlayBillingUnfetchedProduct
 * @desc This struct is delivered inside ${struct.GooglePlayBillingProductDetailsQueryResult} for every requested product that could not be fetched.
 * @member {String} product_id The product ID (SKU) that could not be fetched
 * @member {Constant.GooglePlayBillingProductType} product_type The product type that was requested
 * @member {Constant.GooglePlayBillingUnfetchedProductStatus} status_code Why the product could not be fetched
 * @struct_end
 */

/**
 * @struct GooglePlayBillingProductDetailsQueryResult
 * @desc This struct is delivered by ${function.play_billing_query_product_details_async}.
 * @member {Array[Struct.GooglePlayBillingProductDetails]} products The products that were found
 * @member {Array[Struct.GooglePlayBillingUnfetchedProduct]} unfetched_products The requested products that could not be fetched, and why
 * @struct_end
 */

/**
 * @struct GooglePlayBillingOneTimePurchaseOfferDetails
 * @desc This struct describes a single one-time purchase offer, as found inside ${struct.GooglePlayBillingProductDetails}'s `one_time_purchase_offer_details`.
 * @member {String} formatted_price The offer's price, formatted for display including the currency symbol (e.g. `"€3.99"`)
 * @member {Real} price_amount_micros The offer's price in micros, where 1,000,000 micros equals one unit of the currency
 * @member {String} price_currency_code The offer's currency, as an ISO 4217 code (e.g. `"EUR"`)
 * @member {String} [offer_id] The offer ID, if this is a discounted offer rather than the base price
 * @member {String} [offer_token] The token to pass as `offer_token` on ${struct.GooglePlayBillingProductDetailsParams} to purchase this specific offer
 * @member {Array[String]} offer_tags Developer-defined tags associated with this offer
 * @member {String} [purchase_option_id] The purchase option ID this offer belongs to
 * @member {Real} [full_price_micros] The full (undiscounted) price in micros, present only on a discounted offer
 * @member {Struct.GooglePlayBillingRentalDetails} [rental_details] Present only when this offer is a rental
 * @member {Struct.GooglePlayBillingPreorderDetails} [preorder_details] Present only when this offer is a preorder
 * @member {Struct.GooglePlayBillingDiscountDisplayInfo} [discount_display_info] Present only on a discounted offer
 * @member {Struct.GooglePlayBillingLimitedQuantityInfo} [limited_quantity_info] Present only when this offer has a limited purchase quantity
 * @member {Struct.GooglePlayBillingValidTimeWindow} [valid_time_window] Present only when this offer is only valid during a specific time window
 * @struct_end
 */

/**
 * @struct GooglePlayBillingRentalDetails
 * @desc This struct is nested inside ${struct.GooglePlayBillingOneTimePurchaseOfferDetails} when the offer is a rental.
 * @member {String} rental_period The rental viewing period, in ISO 8601 duration format (e.g. `"P7D"` for seven days)
 * @member {String} [rental_expiration_period] The period after which the rental expires once playback starts, in ISO 8601 duration format
 * @struct_end
 */

/**
 * @struct GooglePlayBillingPreorderDetails
 * @desc This struct is nested inside ${struct.GooglePlayBillingOneTimePurchaseOfferDetails} when the offer is a preorder.
 * @member {Real} preorder_release_time The scheduled release time, as milliseconds since epoch
 * @member {Real} preorder_presale_end_time The time the presale period ends, as milliseconds since epoch
 * @struct_end
 */

/**
 * @struct GooglePlayBillingDiscountAmount
 * @desc This struct is nested inside ${struct.GooglePlayBillingDiscountDisplayInfo}.
 * @member {String} formatted_discount_amount The discount amount, formatted for display including the currency symbol
 * @member {Real} discount_amount_micros The discount amount in micros, where 1,000,000 micros equals one unit of the currency
 * @member {String} discount_amount_currency_code The discount's currency, as an ISO 4217 code
 * @struct_end
 */

/**
 * @struct GooglePlayBillingDiscountDisplayInfo
 * @desc This struct is nested inside ${struct.GooglePlayBillingOneTimePurchaseOfferDetails} when the offer is discounted.
 * @member {Real} [percentage_discount] The discount, as a whole-number percentage off the full price
 * @member {Struct.GooglePlayBillingDiscountAmount} [discount_amount] The discount, as a formatted currency amount
 * @struct_end
 */

/**
 * @struct GooglePlayBillingLimitedQuantityInfo
 * @desc This struct is nested inside ${struct.GooglePlayBillingOneTimePurchaseOfferDetails} when the offer has a limited purchase quantity.
 * @member {Real} maximum_quantity The maximum quantity that can ever be purchased for this offer
 * @member {Real} remaining_quantity The quantity still available for purchase
 * @struct_end
 */

/**
 * @struct GooglePlayBillingValidTimeWindow
 * @desc This struct is nested inside ${struct.GooglePlayBillingOneTimePurchaseOfferDetails} when the offer is only valid during a specific time window.
 * @member {Real} [start_time] The time the offer becomes valid, as milliseconds since epoch
 * @member {Real} [end_time] The time the offer stops being valid, as milliseconds since epoch
 * @struct_end
 */

/**
 * @struct GooglePlayBillingSubscriptionOfferDetails
 * @desc This struct describes a single subscription offer, as found inside ${struct.GooglePlayBillingProductDetails}'s `subscription_offer_details`.
 * @member {String} base_plan_id The base plan ID this offer belongs to
 * @member {String} [offer_id] The offer ID, if this offer is a discounted offer on top of the base plan
 * @member {Array[String]} offer_tags Developer-defined tags associated with this offer
 * @member {String} offer_token The token to pass as `offer_token` on ${struct.GooglePlayBillingProductDetailsParams} to purchase this specific offer
 * @member {Array[Struct.GooglePlayBillingPricingPhase]} pricing_phases The sequence of pricing phases (e.g. a free trial followed by the recurring price) for this offer
 * @member {Struct.GooglePlayBillingInstallmentPlanDetails} [installment_plan_details] Present only when this offer is billed as fixed installments
 * @struct_end
 */

/**
 * @struct GooglePlayBillingPricingPhase
 * @desc This struct describes a single pricing phase of a subscription offer, as found inside ${struct.GooglePlayBillingSubscriptionOfferDetails}'s `pricing_phases`.
 * @member {String} formatted_price The phase's price, formatted for display including the currency symbol
 * @member {Real} price_amount_micros The phase's price in micros, where 1,000,000 micros equals one unit of the currency (`0` for a free trial phase)
 * @member {String} price_currency_code The phase's currency, as an ISO 4217 code
 * @member {Real} billing_cycle_count The number of billing cycles this phase lasts, only meaningful when `recurrence_mode` is `GooglePlayBillingRecurrenceMode.FiniteRecurring`
 * @member {String} billing_period The phase's billing period, in ISO 8601 duration format (e.g. `"P1M"` for monthly)
 * @member {Constant.GooglePlayBillingRecurrenceMode} recurrence_mode Whether and how this phase repeats
 * @struct_end
 */

/**
 * @struct GooglePlayBillingInstallmentPlanDetails
 * @desc This struct is nested inside ${struct.GooglePlayBillingSubscriptionOfferDetails} when the offer is billed as fixed installments.
 * @member {Real} commitment_payments_count The number of payments the user commits to for the initial commitment period
 * @member {Real} subsequent_commitment_payments_count The number of payments for each subsequent commitment period after the first, once the plan auto-renews
 * @struct_end
 */

/**
 * @struct GooglePlayBillingSubscriptionUpdateParams
 * @desc This struct is nested inside ${struct.GooglePlayBillingProductDetailsParams} to replace (upgrade or downgrade) an existing subscription as part of ${function.play_billing_launch_billing_flow}.
 * @member {String} old_purchase_token The purchase token of the subscription being replaced
 * @member {String} old_product_id The product ID of the subscription being replaced
 * @member {Constant.GooglePlayBillingSubscriptionReplacementMode} replacement_mode How the replacement should be prorated/timed
 * @member {String} [original_external_transaction_id] Only supply this when the subscription being replaced was originally purchased through alternative billing
 * @struct_end
 */

/**
 * @struct GooglePlayBillingProductDetailsParams
 * @desc This struct describes a single item to purchase in a call to ${function.play_billing_launch_billing_flow}.
 * @member {String} product_id The product ID (SKU) to purchase; must already be cached by ${function.play_billing_query_product_details_async}
 * @member {String} [offer_token] The offer token of the specific offer to purchase (see ${struct.GooglePlayBillingOneTimePurchaseOfferDetails}/${struct.GooglePlayBillingSubscriptionOfferDetails}); when omitted, the product's default offer is used
 * @member {Struct.GooglePlayBillingSubscriptionUpdateParams} [subscription_replacement] Only for subscription upgrades/downgrades; supply on at most one item per billing flow
 * @struct_end
 */

/**
 * @struct GooglePlayBillingFlowOptions
 * @desc This struct configures options for ${function.play_billing_launch_billing_flow}. Every member is optional; Google applies only the options actually present.
 * @member {Bool} [is_offer_personalized] Whether the price shown to the user was personalized using automated decision-making, as required by some regional regulations
 * @member {String} [obfuscated_account_id] An obfuscated identifier for the user's in-game account, echoed back on the resulting ${struct.GooglePlayBillingPurchase}; must not contain PII and must not exceed 64 characters
 * @member {String} [obfuscated_profile_id] An obfuscated identifier for the user's in-game profile, echoed back on the resulting ${struct.GooglePlayBillingPurchase}; must not contain PII and must not exceed 64 characters
 * @struct_end
 */

// CONSTANTS

/**
 * @const GooglePlayBillingProductType
 * @desc This enumeration contains the product types used throughout the extension.
 * @member InApp A one-time product (managed product).
 * @member Subscription A subscription product.
 * @member Unknown The product type could not be determined.
 * @const_end
 */

/**
 * @const GooglePlayBillingSubscriptionReplacementMode
 * @desc This enumeration contains the ways an existing subscription can be replaced by ${struct.GooglePlayBillingSubscriptionUpdateParams}.
 * @member UnknownReplacementMode No replacement mode specified; the billing flow fails if a replacement is required.
 * @member WithTimeProration The new plan takes effect immediately; remaining time from the old plan is credited towards the new plan's billing period.
 * @member ChargeProratedPrice The new plan takes effect immediately and the user is charged the prorated price difference immediately.
 * @member WithoutProration The new plan takes effect immediately without any proration.
 * @member ChargeFullPrice The new plan takes effect immediately and the user is charged the new plan's full price immediately, without proration.
 * @member Deferred The new plan takes effect when the old plan's current billing period expires.
 * @member KeepExisting The existing plan is kept as-is; no replacement occurs.
 * @const_end
 */

/**
 * @const GooglePlayBillingRecurrenceMode
 * @desc This enumeration describes whether and how a ${struct.GooglePlayBillingPricingPhase} repeats.
 * @member Unknown The recurrence mode could not be determined.
 * @member InfiniteRecurring The phase repeats until the subscription is canceled.
 * @member FiniteRecurring The phase repeats for a fixed number of billing periods (see `billing_cycle_count`).
 * @member NonRecurring The phase does not repeat.
 * @const_end
 */

/**
 * @const GooglePlayBillingUnfetchedProductStatus
 * @desc This enumeration explains why a requested product could not be fetched, delivered as ${struct.GooglePlayBillingUnfetchedProduct}'s `status_code`.
 * @member Unknown The product could not be fetched for an unspecified reason.
 * @member InvalidProductIdFormat The supplied product ID does not match the required format.
 * @member ProductNotFound No product with the supplied ID exists.
 * @member NoEligibleOffer No offer for the product is currently available to the user.
 * @const_end
 */

// MODULES

/**
 * @module products
 * @title Products
 * @desc This module provides functions for querying product/subscription details and launching the Play Store purchase UI.
 *
 * @section_func
 * @desc The following functions are provided to query products and launch the billing flow:
 * @ref play_billing_query_product_details_async
 * @ref play_billing_clear_products
 * @ref play_billing_launch_billing_flow
 * @section_end
 *
 * @section_struct
 * @desc The following structs are used by the product functions:
 * @ref GooglePlayBillingProductInput
 * @ref GooglePlayBillingProductDetails
 * @ref GooglePlayBillingUnfetchedProduct
 * @ref GooglePlayBillingProductDetailsQueryResult
 * @ref GooglePlayBillingOneTimePurchaseOfferDetails
 * @ref GooglePlayBillingRentalDetails
 * @ref GooglePlayBillingPreorderDetails
 * @ref GooglePlayBillingDiscountAmount
 * @ref GooglePlayBillingDiscountDisplayInfo
 * @ref GooglePlayBillingLimitedQuantityInfo
 * @ref GooglePlayBillingValidTimeWindow
 * @ref GooglePlayBillingSubscriptionOfferDetails
 * @ref GooglePlayBillingPricingPhase
 * @ref GooglePlayBillingInstallmentPlanDetails
 * @ref GooglePlayBillingSubscriptionUpdateParams
 * @ref GooglePlayBillingProductDetailsParams
 * @ref GooglePlayBillingFlowOptions
 * @section_end
 *
 * @section_const
 * @desc The following constants are used by the product functions:
 * @ref GooglePlayBillingProductType
 * @ref GooglePlayBillingSubscriptionReplacementMode
 * @ref GooglePlayBillingRecurrenceMode
 * @ref GooglePlayBillingUnfetchedProductStatus
 * @section_end
 *
 * @module_end
 */
