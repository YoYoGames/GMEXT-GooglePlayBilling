// Constants

/**
 * @const gpb_event_type
 * @desc Event Type
 * 
 * @member gpb_iap_receipt The ${var.async_load} DS map contains data on a purchase request
 * @member gpb_purchase_status The ${var.async_load} DS map contains data on a purchase status
 * @member gpb_product_data_response The ${var.async_load} DS map contains a product data response
 * @member gpb_store_connect The API has connected to the Google Play Store.
 * @member gpb_store_connect_failed The API has failed to connect to the Google Play Store.
 * @member gpb_product_consume_response The ${var.async_load} DS map contains a consume response
 * @member gpb_acknowledge_purchase_response The ${var.async_load} DS map contains a purchase response
 * @member gpb_subscription_data_response The ${var.async_load} DS map contains a subscriptions query response
 * @member gpb_query_purchase_async The ${var.async_load} DS map contains an async purchase query response
 * 
 * @const_end
 */

/**
 * @const gpb_error_type
 * @desc Error Type
 * 
 * @member gpb_error_unknown An unknown error occurred
 * @member gpb_no_error The Billing API has been initialised correctly.
 * @member gpb_error_not_initialised The Billing API has not been initialised before calling this function.
 * @member gpb_error_no_skus There are no SKUs in the product list or subscription list.
 * @member gpb_error_selected_sku_list_empty You have tried to purchase a subscription when there is no subscription in the list (although there may be products in the list)
 * 
 * @const_end
 */

/**
 * @const gpb_purchase_state
 * @desc Purchase State
 * 
 * @member gpb_purchase_state_pending The purchase is pending
 * @member gpb_purchase_state_purchased The purchase is purchased
 * @member gpb_purchase_state_unspecified The purchase state is unspecified
 *
 * @const_end
 */

/**
 * @const gpb_purchase_skutype
 * @desc SKU Type
 *
 * @member gpb_purchase_skutype_inapp This constant indicates that the product is a consumable purchase.
 * @member gpb_purchase_skutype_subs This constant indicates that the product is a subscription purchase.
 *
 * @const_end
 */

/**
 * @module constants
 * @title Constants
 * 
 * @section_const
 * @ref gpb_event_type
 * @ref gpb_error_type
 * @ref gpb_purchase_state
 * @ref gpb_purchase_skutype
 * @section_end
 * 
 * @module_end
 */
