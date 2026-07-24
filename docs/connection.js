
// FUNCTIONS

/**
 * @function play_billing_init
 * @desc This function initializes the extension, creating the native `BillingClient` and registering the
 * purchases-updated listener. It must be called before any other `play_billing_*` function.
 *
 * The `callback` supplied here is stored and reused for the lifetime of the client: every time a purchase
 * updates (a new purchase, a subscription renewal/upgrade, etc.) - including purchases started by
 * ${function.play_billing_launch_billing_flow} - Google delivers the result through this same callback.
 *
 * [[Note: `callback` fires repeatedly for as long as the client exists, not just once after `play_billing_init` returns. If the current Android activity is unavailable when `play_billing_init` is called, `callback` fires immediately with only the `billing_result` argument (no `purchases` argument).]]
 *
 * Calling this function again tears down and replaces any existing `BillingClient` (and its cached
 * product details), so it should only be called once per app session, typically at startup.
 *
 * @param {Struct.GooglePlayBillingInitOptions} [options] Options controlling which optional billing capabilities are enabled
 * @param {Function} callback The function to call whenever purchases update
 *
 * @event callback
 * @desc This callback fires once for every purchases-updated event, for the lifetime of the client.
 * @member {Struct.GooglePlayBillingResult} billing_result The result of the purchases-updated event
 * @member {Array[Struct.GooglePlayBillingPurchase]} purchases The purchases that were updated; always a real (possibly empty) array
 * @event_end
 *
 * @example
 * ```gml
 * var _options = {
 *     enable_auto_service_reconnection: true
 * };
 *
 * play_billing_init(_options, function(_billing_result, _purchases) {
 *     if (_billing_result.code != GooglePlayBillingResponseCode.Ok) exit;
 *
 *     for (var i = 0; i < array_length(_purchases); i++) {
 *         var _purchase = _purchases[i];
 *         show_debug_message($"Purchase updated: {_purchase.purchase_token}");
 *     }
 * });
 *
 * play_billing_start_connection(function(_billing_result) {
 *     show_debug_message($"Connected with code: {_billing_result.code}");
 * }, function() {
 *     show_debug_message("Billing service disconnected.");
 * });
 * ```
 * This code initializes the extension and connects to the Play Store, listening for purchase updates.
 * @function_end
 */

/**
 * @function play_billing_start_connection
 * @desc This function establishes the connection between the `BillingClient` created by
 * ${function.play_billing_init} and the Google Play Store. It must succeed (`billing_result.code` equal to
 * `GooglePlayBillingResponseCode.Ok`) before calling any other `play_billing_*` function that requires a
 * ready client.
 *
 * A successful connection does not guarantee the Play Store remains reachable - if the connection drops
 * later, `callback_disconnect` fires and the client must call this function again to reconnect.
 *
 * @param {Function} callback_start The function to call once the connection attempt finishes
 * @param {Function} callback_disconnect The function to call if the billing service disconnects after a successful connection
 *
 * @event callback:start
 * @desc This callback fires once, when the initial connection attempt finishes.
 * @member {Struct.GooglePlayBillingResult} billing_result The result of the connection attempt
 * @event_end
 *
 * @event callback:disconnect
 * @desc This callback fires with no arguments whenever the billing service disconnects after having connected successfully. Call ${function.play_billing_start_connection} again to reconnect.
 * @event_end
 *
 * @example
 * ```gml
 * play_billing_start_connection(function(_billing_result) {
 *     if (_billing_result.code == GooglePlayBillingResponseCode.Ok) {
 *         show_debug_message("Connected to the Play Store.");
 *     }
 * }, function() {
 *     show_debug_message("Disconnected - will retry.");
 *     play_billing_start_connection(callback_start, callback_disconnect);
 * });
 * ```
 * This code connects to the Play Store and reconnects automatically if the service disconnects.
 * @function_end
 */

/**
 * @function play_billing_end_connection
 * @desc This function closes the connection to the Play Store and releases the native `BillingClient`
 * created by ${function.play_billing_init}, clearing any cached product details.
 *
 * [[Note: Call this function when your game shuts down, or before calling ${function.play_billing_init} again to start a fresh session.]]
 *
 * @example
 * ```gml
 * play_billing_end_connection();
 * ```
 * This code closes the connection to the Play Store.
 * @function_end
 */

/**
 * @function play_billing_get_connection_state
 * @desc This function returns the current connection state of the `BillingClient`.
 *
 * @returns {Constant.GooglePlayBillingConnectionState}
 *
 * @example
 * ```gml
 * if (play_billing_get_connection_state() == GooglePlayBillingConnectionState.Connected) {
 *     // Safe to query products/purchases
 * }
 * ```
 * This code checks whether the client is currently connected before using the API.
 * @function_end
 */

/**
 * @function play_billing_is_ready
 * @desc This function returns whether the `BillingClient` is ready to accept further requests (equivalent
 * to `play_billing_get_connection_state() == GooglePlayBillingConnectionState.Connected`, but cheaper to check).
 *
 * @returns {Bool}
 *
 * @example
 * ```gml
 * if (!play_billing_is_ready()) exit;
 * play_billing_query_purchases_async(GooglePlayBillingProductType.InApp, false, callback);
 * ```
 * This code exits early if the client is not ready before querying purchases.
 * @function_end
 */

/**
 * @function play_billing_get_config_async
 * @desc This function requests Play billing configuration data - currently the user's Play Store country
 * as an ISO 3166-1 alpha-2 code, useful for showing localized pricing before a product query completes.
 *
 * @param {Function} callback The function to call once the request finishes
 *
 * @event callback
 * @desc This callback fires once, when the request finishes.
 * @member {Struct.GooglePlayBillingResult} billing_result The result of the request
 * @member {Struct.GooglePlayBillingConfig} [config] The billing config; absent if Google didn't deliver one, including on failure
 * @event_end
 *
 * @example
 * ```gml
 * play_billing_get_config_async(function(_billing_result, _config) {
 *     if (_billing_result.code == GooglePlayBillingResponseCode.Ok && !is_undefined(_config)) {
 *         show_debug_message($"Store country: {_config.country_code}");
 *     }
 * });
 * ```
 * This code requests the billing config and shows the user's store country.
 * @function_end
 */

/**
 * @function play_billing_is_alternative_billing_only_available_async
 * @desc This function checks whether the alternative-billing-only program (letting the user pay through a
 * developer-managed payment system with no Google Play billing option at all) is available for the current
 * user and app.
 *
 * [[Note: The `GooglePlayBillingInitOptions.enable_alternative_billing_only` option must have been enabled in ${function.play_billing_init} for this program to be usable.]]
 *
 * @param {Function} callback The function to call once the check finishes
 *
 * @event callback
 * @desc This callback fires once, when the availability check finishes.
 * @member {Struct.GooglePlayBillingResult} billing_result The result of the availability check
 * @event_end
 *
 * @example
 * ```gml
 * play_billing_is_alternative_billing_only_available_async(function(_billing_result) {
 *     if (_billing_result.code == GooglePlayBillingResponseCode.Ok) {
 *         show_debug_message("Alternative billing only is available.");
 *     }
 * });
 * ```
 * This code checks whether the alternative-billing-only program is available.
 * @function_end
 */

/**
 * @function play_billing_is_billing_program_available_async
 * @desc This function checks whether the given billing program (see ${constant.GooglePlayBillingProgram})
 * is available for the current user and app.
 *
 * [[Note: The corresponding `GooglePlayBillingInitOptions.enable_*` option must have been enabled in ${function.play_billing_init} for the program to be usable.]]
 *
 * @param {Constant.GooglePlayBillingProgram} program The billing program to check
 * @param {Function} callback The function to call once the check finishes
 *
 * @event callback
 * @desc This callback fires once, when the availability check finishes.
 * @member {Struct.GooglePlayBillingResult} billing_result The result of the availability check
 * @member {Struct.GooglePlayBillingProgramAvailabilityDetails} [availability_details] Details about the program's availability; absent only when the request never reached Google (e.g. the client is not ready)
 * @event_end
 *
 * @example
 * ```gml
 * play_billing_is_billing_program_available_async(GooglePlayBillingProgram.BillingChoice, function(_billing_result, _availability_details) {
 *     if (_billing_result.code == GooglePlayBillingResponseCode.Ok && !is_undefined(_availability_details)) {
 *         show_debug_message($"Billing Choice available: {_availability_details.billing_program}");
 *     }
 * });
 * ```
 * This code checks whether the Billing Choice program is available.
 * @function_end
 */

/**
 * @function play_billing_is_feature_supported
 * @desc This function synchronously checks whether the given feature (see ${constant.GooglePlayBillingFeatureType}) is supported by the Play Store on the current device.
 *
 * @param {Constant.GooglePlayBillingFeatureType} feature The feature to check
 *
 * @returns {Struct.GooglePlayBillingResult}
 *
 * @example
 * ```gml
 * var _result = play_billing_is_feature_supported(GooglePlayBillingFeatureType.InAppMessaging);
 * if (_result.code == GooglePlayBillingResponseCode.Ok) {
 *     show_debug_message("In-app messaging is supported.");
 * }
 * ```
 * This code checks whether in-app messaging is supported on the current device.
 * @function_end
 */

// STRUCTS

/**
 * @struct GooglePlayBillingInitOptions
 * @desc This struct configures optional capabilities enabled when creating the `BillingClient` in
 * ${function.play_billing_init}. Every member defaults to `false` when omitted, including when the whole
 * struct itself is omitted.
 * @member {Bool} [enable_auto_service_reconnection] Whether the client automatically attempts to reconnect after an unexpected disconnection
 * @member {Bool} [enable_prepaid_plans] Whether pending transactions are enabled for prepaid subscription plans
 * @member {Bool} [enable_alternative_billing_only] Whether the alternative-billing-only program is enabled (see ${function.play_billing_is_alternative_billing_only_available_async})
 * @member {Bool} [enable_external_content_link] Whether the external content link billing program is enabled (see ${constant.GooglePlayBillingProgram})
 * @member {Bool} [enable_external_offer] Whether the external offer billing program is enabled
 * @member {Bool} [enable_external_payments] Whether the external payments billing program is enabled
 * @member {Bool} [enable_billing_choice] Whether the Billing Choice program is enabled
 * @struct_end
 */

/**
 * @struct GooglePlayBillingResult
 * @desc This struct is the outcome of virtually every `play_billing_*` operation - both the immediate
 * return value of the synchronous functions and the first argument delivered to every asynchronous
 * callback.
 * @member {Constant.GooglePlayBillingResponseCode} code The response code for the operation
 * @member {String} [message] A human-readable debug message; only meaningful when troubleshooting a non-`Ok` `code`
 * @member {Constant.GooglePlayBillingPurchasesUpdatedSubResponseCode} sub_response_code Additional detail; only meaningful when this result comes from the purchases-updated callback registered in ${function.play_billing_init}, otherwise generally `None`
 * @struct_end
 */

/**
 * @struct GooglePlayBillingConfig
 * @desc This struct is delivered by ${function.play_billing_get_config_async}.
 * @member {String} country_code The user's Play Store country, as an ISO 3166-1 alpha-2 code
 * @struct_end
 */

/**
 * @struct GooglePlayBillingChoiceAvailabilityDetails
 * @desc This struct is nested inside ${struct.GooglePlayBillingProgramAvailabilityDetails} when checking the Billing Choice program.
 * @member {Constant.GooglePlayBillingChoiceScreenType} choice_screen_type Who renders the billing choice screen
 * @member {Bool} external_link_available Whether an external-link option is available on the choice screen
 * @struct_end
 */

/**
 * @struct GooglePlayBillingProgramAvailabilityDetails
 * @desc This struct is delivered by ${function.play_billing_is_billing_program_available_async}.
 * @member {Constant.GooglePlayBillingProgram} billing_program The billing program the availability details describe
 * @member {Struct.GooglePlayBillingChoiceAvailabilityDetails} [billing_choice_details] Present only when `billing_program` is `GooglePlayBillingProgram.BillingChoice`
 * @struct_end
 */

// CONSTANTS

/**
 * @const GooglePlayBillingResponseCode
 * @desc This enumeration contains the response codes returned by the Play Billing Library, delivered as ${struct.GooglePlayBillingResult}'s `code` member.
 * @member ServiceTimeout The request reached the maximum timeout before Google Play responded. Deprecated by Google; modern clients receive `ServiceUnavailable` instead.
 * @member FeatureNotSupported The requested feature is not supported by the Play Store on the current device.
 * @member ServiceDisconnected The app is not currently connected to the Play Store service.
 * @member Ok Success.
 * @member UserCanceled The user pressed back or canceled a dialog.
 * @member ServiceUnavailable The network connection is down.
 * @member BillingUnavailable This billing API version is not supported for the type requested.
 * @member ItemUnavailable The requested product is not available for purchase.
 * @member DeveloperError Invalid arguments were provided to the API, or the app is not correctly configured for billing in the Play Console.
 * @member Error A fatal error occurred during the API action.
 * @member ItemAlreadyOwned The purchase failed because the item is already owned.
 * @member ItemNotOwned The consume/acknowledge failed because the item is not owned.
 * @member NetworkError A network error occurred during the operation.
 * @const_end
 */

/**
 * @const GooglePlayBillingPurchasesUpdatedSubResponseCode
 * @desc This enumeration contains additional detail delivered alongside ${constant.GooglePlayBillingResponseCode} when a purchase update (see ${function.play_billing_init}) doesn't succeed.
 * @member None No additional detail is available.
 * @member PaymentDeclinedDueToInsufficientFunds The purchase failed because the user's payment method has insufficient funds.
 * @member UserIneligible The user is not eligible for the requested product or offer.
 * @const_end
 */

/**
 * @const GooglePlayBillingConnectionState
 * @desc This enumeration contains the connection states returned by ${function.play_billing_get_connection_state}.
 * @member Disconnected The client is not connected to the Play Store service.
 * @member Connecting The client is currently connecting to the Play Store service.
 * @member Connected The client is connected to the Play Store service and ready for requests.
 * @member Closed The client has been closed via ${function.play_billing_end_connection} and must not be used again.
 * @const_end
 */

/**
 * @const GooglePlayBillingFeatureType
 * @desc This enumeration contains the features that can be queried with ${function.play_billing_is_feature_supported}.
 * @member AlternativeBillingOnly Alternative billing with no Google Play billing option.
 * @member BillingConfig Play billing configuration data (see ${function.play_billing_get_config_async}).
 * @member ExternalOffer The external offer billing program.
 * @member IncludeSuspendedSubscriptions Purchase/query support for suspended subscriptions.
 * @member InAppMessaging In-app messaging (see ${function.play_billing_show_in_app_messages}).
 * @member PriceChangeConfirmation Launching a price-change confirmation flow.
 * @member ProductDetails Product details queries (see ${function.play_billing_query_product_details_async}).
 * @member Subscriptions Subscription products.
 * @member SubscriptionsUpdate Subscription replacement (upgrade/downgrade).
 * @const_end
 */

/**
 * @const GooglePlayBillingChoiceScreenType
 * @desc This enumeration describes who renders the Billing Choice screen, as delivered in ${struct.GooglePlayBillingChoiceAvailabilityDetails}.
 * @member Unspecified No choice screen type was specified.
 * @member DeveloperRendered The app itself renders the billing choice screen.
 * @member GoogleRendered The Play Store renders the billing choice screen.
 * @const_end
 */

// MODULES

/**
 * @module connection
 * @title Connection
 * @desc This module provides functions for initializing the extension, connecting to the Play Store, and checking availability of billing config/features/programs before using the rest of the API.
 *
 * @section_func
 * @desc The following functions are provided to initialize and connect to the Play Store:
 * @ref play_billing_init
 * @ref play_billing_start_connection
 * @ref play_billing_end_connection
 * @ref play_billing_get_connection_state
 * @ref play_billing_is_ready
 * @ref play_billing_get_config_async
 * @ref play_billing_is_alternative_billing_only_available_async
 * @ref play_billing_is_billing_program_available_async
 * @ref play_billing_is_feature_supported
 * @section_end
 *
 * @section_struct
 * @desc The following structs are used by the connection functions:
 * @ref GooglePlayBillingInitOptions
 * @ref GooglePlayBillingResult
 * @ref GooglePlayBillingConfig
 * @ref GooglePlayBillingProgramAvailabilityDetails
 * @ref GooglePlayBillingChoiceAvailabilityDetails
 * @section_end
 *
 * @section_const
 * @desc The following constants are used by the connection functions:
 * @ref GooglePlayBillingResponseCode
 * @ref GooglePlayBillingPurchasesUpdatedSubResponseCode
 * @ref GooglePlayBillingConnectionState
 * @ref GooglePlayBillingFeatureType
 * @ref GooglePlayBillingChoiceScreenType
 * @section_end
 *
 * @module_end
 */
