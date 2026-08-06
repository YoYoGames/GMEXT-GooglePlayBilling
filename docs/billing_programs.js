
// FUNCTIONS

/**
 * @function play_billing_create_alternative_billing_only_reporting_details_async
 * @desc This function creates the reporting details required to report a transaction made through the
 * alternative-billing-only program (see ${constant.GooglePlayBillingFeatureType}'s
 * `AlternativeBillingOnly`) back to Google, as required by Google Play policy.
 *
 * [[Note: `GooglePlayBillingInitOptions.enable_alternative_billing_only` must have been enabled in ${function.play_billing_init}.]]
 *
 * @param {Function} callback The function to call once the request finishes
 *
 * @event callback
 * @desc This callback fires once, when the request finishes.
 * @member {Struct.GooglePlayBillingResult} billing_result The result of the request
 * @member {Struct.GooglePlayBillingReportingDetails} [reporting_details] The reporting details to report to Google; absent on failure
 * @event_end
 *
 * @example
 * ```gml
 * play_billing_create_alternative_billing_only_reporting_details_async(function(_billing_result, _reporting_details) {
 *     if (_billing_result.code == GooglePlayBillingResponseCode.Ok && !is_undefined(_reporting_details)) {
 *         show_debug_message($"Report token: {_reporting_details.external_transaction_token}");
 *     }
 * });
 * ```
 * This code creates the reporting details for an alternative-billing-only transaction.
 * @function_end
 */

/**
 * @function play_billing_create_billing_program_reporting_details_async
 * @desc This function creates the reporting details required to report a transaction made through the
 * given billing program back to Google, as required by Google Play policy. This replaces the deprecated
 * `createExternalOfferReportingDetailsAsync` API.
 *
 * @param {Constant.GooglePlayBillingProgram} program The billing program the transaction was made through
 * @param {Function} callback The function to call once the request finishes
 *
 * @event callback
 * @desc This callback fires once, when the request finishes.
 * @member {Struct.GooglePlayBillingResult} billing_result The result of the request
 * @member {Struct.GooglePlayBillingReportingDetails} [reporting_details] The reporting details to report to Google; absent on failure
 * @event_end
 *
 * @example
 * ```gml
 * play_billing_create_billing_program_reporting_details_async(GooglePlayBillingProgram.ExternalOffer, function(_billing_result, _reporting_details) {
 *     if (_billing_result.code == GooglePlayBillingResponseCode.Ok && !is_undefined(_reporting_details)) {
 *         show_debug_message($"Report token: {_reporting_details.external_transaction_token}");
 *     }
 * });
 * ```
 * This code creates the reporting details for a transaction made through the external offer program.
 * @function_end
 */

/**
 * @function play_billing_show_billing_program_information_dialog
 * @desc This function launches the Play Store system UI to show the user informational details about the
 * given billing program before they use it.
 *
 * @param {Constant.GooglePlayBillingProgram} program The billing program to show information about
 * @param {Function} callback The function to call once the dialog is dismissed
 *
 * @event callback
 * @desc This callback fires once, when the dialog is dismissed.
 * @member {Struct.GooglePlayBillingResult} billing_result The result of showing the dialog
 * @event_end
 *
 * @example
 * ```gml
 * play_billing_show_billing_program_information_dialog(GooglePlayBillingProgram.ExternalOffer, function(_billing_result) {
 *     show_debug_message($"Information dialog dismissed with code: {_billing_result.code}");
 * });
 * ```
 * This code shows the informational dialog for the external offer program.
 * @function_end
 */

/**
 * @function play_billing_show_alternative_billing_only_information_dialog
 * @desc This function launches the Play Store system UI to show the user informational details about the
 * alternative-billing-only program before they use it.
 *
 * @param {Function} callback The function to call once the dialog is dismissed
 *
 * @event callback
 * @desc This callback fires once, when the dialog is dismissed.
 * @member {Struct.GooglePlayBillingResult} billing_result The result of showing the dialog
 * @event_end
 *
 * @example
 * ```gml
 * play_billing_show_alternative_billing_only_information_dialog(function(_billing_result) {
 *     show_debug_message($"Information dialog dismissed with code: {_billing_result.code}");
 * });
 * ```
 * This code shows the informational dialog for the alternative-billing-only program.
 * @function_end
 */

/**
 * @function play_billing_launch_external_link
 * @desc This function launches the external link associated with the given billing program (e.g. a link
 * to a website where the user can complete a purchase outside the app), if one is configured for the app.
 *
 * @param {Struct.GooglePlayBillingExternalLinkLaunchOptions} options The billing program whose external link should be launched
 * @param {Function} callback The function to call once the flow completes or is dismissed
 *
 * @event callback
 * @desc This callback fires once, when the flow completes or is dismissed.
 * @member {Struct.GooglePlayBillingResult} billing_result The result of launching the external link
 * @event_end
 *
 * @example
 * ```gml
 * play_billing_launch_external_link({ billing_program: GooglePlayBillingProgram.ExternalContentLink }, function(_billing_result) {
 *     show_debug_message($"External link flow finished with code: {_billing_result.code}");
 * });
 * ```
 * This code launches the external content link associated with the app.
 * @function_end
 */

/**
 * @function play_billing_show_in_app_messages
 * @desc This function shows any pending Play Store in-app messages to the user (e.g. a message about a
 * declined subscription renewal payment). It is recommended to call this when the game starts and resumes.
 *
 * This function returns the *immediate* result of requesting the messages; the outcome of the message
 * flow itself (once the user has seen and dismissed any messages) is delivered separately through
 * `callback`.
 *
 * @param {Struct.GooglePlayBillingInAppMessageOptions} [options] The message categories to show; when omitted, all categories are shown
 * @param {Function} callback The function to call once the message flow finishes
 *
 * @returns {Struct.GooglePlayBillingResult}
 *
 * @event callback
 * @desc This callback fires once, when the in-app message flow finishes.
 * @member {Struct.GooglePlayBillingInAppMessageResult} in_app_message_result The result of the message flow
 * @event_end
 *
 * @example
 * ```gml
 * var _result = play_billing_show_in_app_messages(undefined, function(_in_app_message_result) {
 *     if (_in_app_message_result.response_code == GooglePlayBillingInAppMessageResponseCode.SubscriptionStatusUpdated) {
 *         // Re-query purchases/entitlements here.
 *     }
 * });
 * ```
 * This code shows any pending in-app messages and re-queries entitlements if the user's subscription status changed.
 * @function_end
 */

/**
 * @function play_billing_get_billing_choice_info_async
 * @desc This function requests information about the Billing Choice program for display to the user,
 * such as loyalty program details, before they choose a billing option.
 *
 * @param {Function} callback The function to call once the request finishes
 *
 * @event callback
 * @desc This callback fires once, when the request finishes.
 * @member {Struct.GooglePlayBillingResult} billing_result The result of the request
 * @member {Struct.GooglePlayBillingChoiceInfo} [choice_info] The Billing Choice information; absent on failure
 * @event_end
 *
 * @example
 * ```gml
 * play_billing_get_billing_choice_info_async(function(_billing_result, _choice_info) {
 *     if (_billing_result.code == GooglePlayBillingResponseCode.Ok && !is_undefined(_choice_info)) {
 *         show_debug_message($"Loyalty info: {_choice_info.loyalty_info}");
 *     }
 * });
 * ```
 * This code requests Billing Choice information and shows any loyalty program details.
 * @function_end
 */

// STRUCTS

/**
 * @struct GooglePlayBillingReportingDetails
 * @desc This struct is delivered by ${function.play_billing_create_alternative_billing_only_reporting_details_async} and ${function.play_billing_create_billing_program_reporting_details_async}, and must be reported to Google as required by Google Play policy.
 * @member {Constant.GooglePlayBillingProgram} [billing_program] The billing program the transaction was made through; absent on the alternative-billing-only reporting path, which has no billing program of its own
 * @member {String} external_transaction_token The token identifying the transaction to report to Google
 * @struct_end
 */

/**
 * @struct GooglePlayBillingExternalLinkLaunchOptions
 * @desc This struct configures ${function.play_billing_launch_external_link}.
 * @member {Constant.GooglePlayBillingProgram} billing_program The billing program whose external link should be launched
 * @struct_end
 */

/**
 * @struct GooglePlayBillingInAppMessageOptions
 * @desc This struct configures ${function.play_billing_show_in_app_messages}.
 * @member {Array[Constant.GooglePlayBillingInAppMessageCategory]} categories The message categories to show; an empty array shows no messages
 * @struct_end
 */

/**
 * @struct GooglePlayBillingInAppMessageResult
 * @desc This struct is delivered by ${function.play_billing_show_in_app_messages}'s callback once the in-app message flow finishes. It uses its own response-code system, unrelated to ${constant.GooglePlayBillingResponseCode}.
 * @member {Constant.GooglePlayBillingInAppMessageResponseCode} response_code The outcome of the message flow
 * @member {String} [purchase_token] The purchase token affected by the message flow, if any
 * @struct_end
 */

/**
 * @struct GooglePlayBillingChoiceInfo
 * @desc This struct is delivered by ${function.play_billing_get_billing_choice_info_async}.
 * @member {String} [billing_choice_image_url] The URL of an image to display for the Billing Choice program, if configured
 * @member {String} [loyalty_info] Loyalty program information to display to the user, if configured
 * @struct_end
 */

// CONSTANTS

/**
 * @const GooglePlayBillingProgram
 * @desc This enumeration contains the billing programs supported by ${function.play_billing_init}'s `GooglePlayBillingInitOptions`.
 * @member Unspecified No billing program specified.
 * @member ExternalContentLink The external content link program, letting users be redirected outside the app to purchase content.
 * @member ExternalOffer The external offer program.
 * @member ExternalPayments The external payments program.
 * @member BillingChoice The Billing Choice program, letting the user pick between Google Play billing and an alternative billing system at purchase time.
 * @const_end
 */

/**
 * @const GooglePlayBillingInAppMessageResponseCode
 * @desc This enumeration contains the outcomes of ${function.play_billing_show_in_app_messages}'s message flow, delivered as ${struct.GooglePlayBillingInAppMessageResult}'s `response_code`.
 * @member NoActionNeeded The message flow finished without changing the user's entitlements; no action is needed.
 * @member SubscriptionStatusUpdated The user's subscription status changed as a result of the message flow; re-query purchases/entitlements.
 * @const_end
 */

/**
 * @const GooglePlayBillingInAppMessageCategory
 * @desc This enumeration contains the in-app message categories that can be requested with ${struct.GooglePlayBillingInAppMessageOptions}.
 * @member Unknown The message category could not be determined.
 * @member SubscriptionUpdate Messages about a subscription status change (e.g. a declined renewal payment).
 * @member PriceChange Messages about an upcoming subscription price change.
 * @const_end
 */

// MODULES

/**
 * @module billing_programs
 * @title Billing Programs
 * @desc This module provides functions for alternative/external billing programs, the Billing Choice program, and in-app messages.
 *
 * @section_func
 * @desc The following functions are provided to work with billing programs and in-app messages:
 * @ref play_billing_create_alternative_billing_only_reporting_details_async
 * @ref play_billing_create_billing_program_reporting_details_async
 * @ref play_billing_show_billing_program_information_dialog
 * @ref play_billing_show_alternative_billing_only_information_dialog
 * @ref play_billing_launch_external_link
 * @ref play_billing_show_in_app_messages
 * @ref play_billing_get_billing_choice_info_async
 * @section_end
 *
 * @section_struct
 * @desc The following structs are used by the billing program functions:
 * @ref GooglePlayBillingReportingDetails
 * @ref GooglePlayBillingExternalLinkLaunchOptions
 * @ref GooglePlayBillingInAppMessageOptions
 * @ref GooglePlayBillingInAppMessageResult
 * @ref GooglePlayBillingChoiceInfo
 * @section_end
 *
 * @section_const
 * @desc The following constants are used by the billing program functions:
 * @ref GooglePlayBillingProgram
 * @ref GooglePlayBillingInAppMessageResponseCode
 * @ref GooglePlayBillingInAppMessageCategory
 * @section_end
 *
 * @module_end
 */
