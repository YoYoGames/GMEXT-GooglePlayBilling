/**
 * @function_partial play_billing_init
 * @param {Struct.GooglePlayBillingInitOptions} [options]
 * @param {Function} callback
 * @function_end
 */

/**
 * @function_partial play_billing_start_connection
 * @param {Function} callback_start
 * @param {Function} callback_disconnect
 * @function_end
 */

/**
 * @function_partial play_billing_end_connection
 * @function_end
 */

/**
 * @function_partial play_billing_get_connection_state
 * @returns {Enum.GooglePlayBillingConnectionState}
 * @function_end
 */

/**
 * @function_partial play_billing_is_ready
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial play_billing_get_config_async
 * @param {Function} callback
 * @function_end
 */

/**
 * @function_partial play_billing_is_alternative_billing_only_available_async
 * @param {Function} callback
 * @function_end
 */

/**
 * @function_partial play_billing_is_billing_program_available_async
 * @param {Enum.GooglePlayBillingProgram} program
 * @param {Function} callback
 * @function_end
 */

/**
 * @function_partial play_billing_is_feature_supported
 * @param {Enum.GooglePlayBillingFeatureType} feature
 * @returns {Struct.GooglePlayBillingResult}
 * @function_end
 */

/**
 * @function_partial play_billing_query_product_details_async
 * @param {Array[Struct.GooglePlayBillingProductInput]} products
 * @param {Function} callback
 * @function_end
 */

/**
 * @function_partial play_billing_clear_products
 * @function_end
 */

/**
 * @function_partial play_billing_launch_billing_flow
 * @param {Array[Struct.GooglePlayBillingProductDetailsParams]} items
 * @param {Struct.GooglePlayBillingFlowOptions} [options]
 * @returns {Struct.GooglePlayBillingResult}
 * @function_end
 */

/**
 * @function_partial play_billing_query_purchases_async
 * @param {Enum.GooglePlayBillingProductType} product_type
 * @param {Bool} include_suspended_subscriptions
 * @param {Function} callback
 * @function_end
 */

/**
 * @function_partial play_billing_acknowledge_purchase
 * @param {String} purchase_token
 * @param {Function} callback
 * @function_end
 */

/**
 * @function_partial play_billing_consume_async
 * @param {String} purchase_token
 * @param {Function} callback
 * @function_end
 */

/**
 * @function_partial play_billing_create_alternative_billing_only_reporting_details_async
 * @param {Function} callback
 * @function_end
 */

/**
 * @function_partial play_billing_create_billing_program_reporting_details_async
 * @param {Enum.GooglePlayBillingProgram} program
 * @param {Function} callback
 * @function_end
 */

/**
 * @function_partial play_billing_show_in_app_messages
 * @param {Struct.GooglePlayBillingInAppMessageOptions} [options]
 * @param {Function} callback
 * @returns {Struct.GooglePlayBillingResult}
 * @function_end
 */

/**
 * @function_partial play_billing_get_billing_choice_info_async
 * @param {Function} callback
 * @function_end
 */

/**
 * @function_partial play_billing_show_billing_program_information_dialog
 * @param {Enum.GooglePlayBillingProgram} program
 * @param {Function} callback
 * @function_end
 */

/**
 * @function_partial play_billing_show_alternative_billing_only_information_dialog
 * @param {Function} callback
 * @function_end
 */

/**
 * @function_partial play_billing_launch_external_link
 * @param {Struct.GooglePlayBillingExternalLinkLaunchOptions} options
 * @param {Function} callback
 * @function_end
 */

/**
 * @struct_partial GooglePlayBillingInitOptions
 * @member {Bool} [enable_auto_service_reconnection]
 * @member {Bool} [enable_prepaid_plans]
 * @member {Bool} [enable_alternative_billing_only]
 * @member {Bool} [enable_external_content_link]
 * @member {Bool} [enable_external_offer]
 * @member {Bool} [enable_external_payments]
 * @member {Bool} [enable_billing_choice]
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingProductInput
 * @member {String} product_id
 * @member {Enum.GooglePlayBillingProductType} product_type
 * @member {String} [dynamic_product_token]
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingSubscriptionUpdateParams
 * @member {String} old_purchase_token
 * @member {String} old_product_id
 * @member {Enum.GooglePlayBillingSubscriptionReplacementMode} replacement_mode
 * @member {String} [original_external_transaction_id]
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingFlowOptions
 * @member {Bool} [is_offer_personalized]
 * @member {String} [obfuscated_account_id]
 * @member {String} [obfuscated_profile_id]
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingInAppMessageOptions
 * @member {Array[Enum.GooglePlayBillingInAppMessageCategory]} categories
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingResult
 * @member {Enum.GooglePlayBillingResponseCode} code
 * @member {String} [message]
 * @member {Enum.GooglePlayBillingPurchasesUpdatedSubResponseCode} sub_response_code
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingConfig
 * @member {String} country_code
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingRentalDetails
 * @member {String} rental_period
 * @member {String} [rental_expiration_period]
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingPreorderDetails
 * @member {Real} preorder_release_time
 * @member {Real} preorder_presale_end_time
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingDiscountAmount
 * @member {String} formatted_discount_amount
 * @member {Real} discount_amount_micros
 * @member {String} discount_amount_currency_code
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingLimitedQuantityInfo
 * @member {Real} maximum_quantity
 * @member {Real} remaining_quantity
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingValidTimeWindow
 * @member {Real} [start_time]
 * @member {Real} [end_time]
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingPricingPhase
 * @member {String} formatted_price
 * @member {Real} price_amount_micros
 * @member {String} price_currency_code
 * @member {Real} billing_cycle_count
 * @member {String} billing_period
 * @member {Enum.GooglePlayBillingRecurrenceMode} recurrence_mode
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingInstallmentPlanDetails
 * @member {Real} commitment_payments_count
 * @member {Real} subsequent_commitment_payments_count
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingAccountIdentifiers
 * @member {String} [obfuscated_account_id]
 * @member {String} [obfuscated_profile_id]
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingPendingPurchaseUpdate
 * @member {String} purchase_token
 * @member {Array[String]} products
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingUnfetchedProduct
 * @member {String} product_id
 * @member {Enum.GooglePlayBillingProductType} product_type
 * @member {Enum.GooglePlayBillingUnfetchedProductStatus} status_code
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingReportingDetails
 * @member {Enum.GooglePlayBillingProgram} [billing_program]
 * @member {String} external_transaction_token
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingChoiceAvailabilityDetails
 * @member {Enum.GooglePlayBillingChoiceScreenType} choice_screen_type
 * @member {Bool} external_link_available
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingInAppMessageResult
 * @member {Enum.GooglePlayBillingInAppMessageResponseCode} response_code
 * @member {String} [purchase_token]
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingChoiceInfo
 * @member {String} [billing_choice_image_url]
 * @member {String} [loyalty_info]
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingExternalLinkLaunchOptions
 * @member {Enum.GooglePlayBillingProgram} billing_program
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingProductDetailsParams
 * @member {String} product_id
 * @member {String} [offer_token]
 * @member {Struct.GooglePlayBillingSubscriptionUpdateParams} [subscription_replacement]
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingDiscountDisplayInfo
 * @member {Real} [percentage_discount]
 * @member {Struct.GooglePlayBillingDiscountAmount} [discount_amount]
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingSubscriptionOfferDetails
 * @member {String} base_plan_id
 * @member {String} [offer_id]
 * @member {Array[String]} offer_tags
 * @member {String} offer_token
 * @member {Array[Struct.GooglePlayBillingPricingPhase]} pricing_phases
 * @member {Struct.GooglePlayBillingInstallmentPlanDetails} [installment_plan_details]
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingPurchase
 * @member {String} [order_id]
 * @member {String} package_name
 * @member {Real} purchase_time
 * @member {String} purchase_token
 * @member {Array[String]} products
 * @member {String} signature
 * @member {Bool} is_acknowledged
 * @member {Bool} is_auto_renewing
 * @member {Enum.GooglePlayBillingPurchaseState} purchase_state
 * @member {Real} quantity
 * @member {String} original_json
 * @member {Bool} is_suspended
 * @member {Struct.GooglePlayBillingAccountIdentifiers} [account_identifiers]
 * @member {Struct.GooglePlayBillingPendingPurchaseUpdate} [pending_purchase_update]
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingProgramAvailabilityDetails
 * @member {Enum.GooglePlayBillingProgram} billing_program
 * @member {Struct.GooglePlayBillingChoiceAvailabilityDetails} [billing_choice_details]
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingOneTimePurchaseOfferDetails
 * @member {String} formatted_price
 * @member {Real} price_amount_micros
 * @member {String} price_currency_code
 * @member {String} [offer_id]
 * @member {String} [offer_token]
 * @member {Array[String]} offer_tags
 * @member {String} [purchase_option_id]
 * @member {Real} [full_price_micros]
 * @member {Struct.GooglePlayBillingRentalDetails} [rental_details]
 * @member {Struct.GooglePlayBillingPreorderDetails} [preorder_details]
 * @member {Struct.GooglePlayBillingDiscountDisplayInfo} [discount_display_info]
 * @member {Struct.GooglePlayBillingLimitedQuantityInfo} [limited_quantity_info]
 * @member {Struct.GooglePlayBillingValidTimeWindow} [valid_time_window]
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingProductDetails
 * @member {String} product_id
 * @member {String} name
 * @member {String} title
 * @member {String} description
 * @member {Enum.GooglePlayBillingProductType} product_type
 * @member {Array[Struct.GooglePlayBillingOneTimePurchaseOfferDetails]} one_time_purchase_offer_details
 * @member {Array[Struct.GooglePlayBillingSubscriptionOfferDetails]} subscription_offer_details
 * @struct_end
 */

/**
 * @struct_partial GooglePlayBillingProductDetailsQueryResult
 * @member {Array[Struct.GooglePlayBillingProductDetails]} products
 * @member {Array[Struct.GooglePlayBillingUnfetchedProduct]} unfetched_products
 * @struct_end
 */

/**
 * @enum_partial GooglePlayBillingProductType
 * @member InApp
 * @member Subscription
 * @member Unknown
 * @enum_end
 */

/**
 * @enum_partial GooglePlayBillingFeatureType
 * @member AlternativeBillingOnly
 * @member BillingConfig
 * @member ExternalOffer
 * @member IncludeSuspendedSubscriptions
 * @member InAppMessaging
 * @member PriceChangeConfirmation
 * @member ProductDetails
 * @member Subscriptions
 * @member SubscriptionsUpdate
 * @enum_end
 */

/**
 * @enum_partial GooglePlayBillingProgram
 * @member Unspecified
 * @member ExternalContentLink
 * @member ExternalOffer
 * @member ExternalPayments
 * @member BillingChoice
 * @enum_end
 */

/**
 * @enum_partial GooglePlayBillingResponseCode
 * @member ServiceTimeout
 * @member FeatureNotSupported
 * @member ServiceDisconnected
 * @member Ok
 * @member UserCanceled
 * @member ServiceUnavailable
 * @member BillingUnavailable
 * @member ItemUnavailable
 * @member DeveloperError
 * @member Error
 * @member ItemAlreadyOwned
 * @member ItemNotOwned
 * @member NetworkError
 * @enum_end
 */

/**
 * @enum_partial GooglePlayBillingPurchasesUpdatedSubResponseCode
 * @member None
 * @member PaymentDeclinedDueToInsufficientFunds
 * @member UserIneligible
 * @enum_end
 */

/**
 * @enum_partial GooglePlayBillingPurchaseState
 * @member UnspecifiedState
 * @member Purchased
 * @member Pending
 * @enum_end
 */

/**
 * @enum_partial GooglePlayBillingSubscriptionReplacementMode
 * @member UnknownReplacementMode
 * @member WithTimeProration
 * @member ChargeProratedPrice
 * @member WithoutProration
 * @member ChargeFullPrice
 * @member Deferred
 * @member KeepExisting
 * @enum_end
 */

/**
 * @enum_partial GooglePlayBillingConnectionState
 * @member Disconnected
 * @member Connecting
 * @member Connected
 * @member Closed
 * @enum_end
 */

/**
 * @enum_partial GooglePlayBillingRecurrenceMode
 * @member Unknown
 * @member InfiniteRecurring
 * @member FiniteRecurring
 * @member NonRecurring
 * @enum_end
 */

/**
 * @enum_partial GooglePlayBillingUnfetchedProductStatus
 * @member Unknown
 * @member InvalidProductIdFormat
 * @member ProductNotFound
 * @member NoEligibleOffer
 * @enum_end
 */

/**
 * @enum_partial GooglePlayBillingInAppMessageResponseCode
 * @member NoActionNeeded
 * @member SubscriptionStatusUpdated
 * @enum_end
 */

/**
 * @enum_partial GooglePlayBillingChoiceScreenType
 * @member Unspecified
 * @member DeveloperRendered
 * @member GoogleRendered
 * @enum_end
 */

/**
 * @enum_partial GooglePlayBillingInAppMessageCategory
 * @member Unknown
 * @member SubscriptionUpdate
 * @member PriceChange
 * @enum_end
 */

/**
 * @const_partial macros
 * @const_end
 */

