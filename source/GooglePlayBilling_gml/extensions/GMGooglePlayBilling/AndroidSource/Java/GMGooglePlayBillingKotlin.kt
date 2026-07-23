package ${YYAndroidPackageName}

import ${YYAndroidPackageName}.GMExtWire.GMFunction
import ${YYAndroidPackageName}.records.*
import ${YYAndroidPackageName}.enums.*

import android.app.Activity
import android.util.Log

import com.android.billingclient.api.AcknowledgePurchaseParams
import com.android.billingclient.api.AcknowledgePurchaseResponseListener
import com.android.billingclient.api.AlternativeBillingOnlyAvailabilityListener
import com.android.billingclient.api.AlternativeBillingOnlyInformationDialogListener
import com.android.billingclient.api.AlternativeBillingOnlyReportingDetailsListener
import com.android.billingclient.api.BillingChoiceInfoResponseListener
import com.android.billingclient.api.BillingClient
import com.android.billingclient.api.BillingClientStateListener
import com.android.billingclient.api.BillingConfigResponseListener
import com.android.billingclient.api.BillingFlowParams
import com.android.billingclient.api.BillingProgramAvailabilityListener
import com.android.billingclient.api.BillingProgramInformationDialogListener
import com.android.billingclient.api.BillingProgramInformationDialogParams
import com.android.billingclient.api.BillingProgramReportingDetailsListener
import com.android.billingclient.api.BillingProgramReportingDetailsParams
import com.android.billingclient.api.BillingResult
import com.android.billingclient.api.ConsumeParams
import com.android.billingclient.api.ConsumeResponseListener
import com.android.billingclient.api.GetBillingChoiceInfoParams
import com.android.billingclient.api.GetBillingConfigParams
import com.android.billingclient.api.InAppMessageParams
import com.android.billingclient.api.InAppMessageResponseListener
import com.android.billingclient.api.LaunchExternalLinkParams
import com.android.billingclient.api.LaunchExternalLinkResponseListener
import com.android.billingclient.api.PendingPurchasesParams
import com.android.billingclient.api.ProductDetails
import com.android.billingclient.api.Purchase
import com.android.billingclient.api.PurchasesResponseListener
import com.android.billingclient.api.PurchasesUpdatedListener
import com.android.billingclient.api.QueryProductDetailsParams
import com.android.billingclient.api.QueryProductDetailsResult
import com.android.billingclient.api.QueryPurchasesParams
import com.android.billingclient.api.UnfetchedProduct

import java.util.Optional
import java.util.concurrent.ConcurrentHashMap


class GMGooglePlayBillingKotlin : GMGooglePlayBillingInterface {

    companion object {
        private const val TAG = "GMGooglePlayBilling"
        private const val ERR_NOT_INITIALIZED =
            "BillingClient is not initialized. Call play_billing_init first."
        private const val ERR_NOT_READY =
            "BillingClient is not ready. Call play_billing_start_connection and wait for an OK result."
        private const val ERR_ACTIVITY_UNAVAILABLE =
            "Current Android activity is unavailable."
        private const val ERR_INVALID_PRODUCT =
            "ProductDetails were not found in the native cache. Query the product before launching billing flow."
        private const val MAX_OBFUSCATED_ID_LENGTH = 64
    }

    @Volatile
    private var billingClient: BillingClient? = null

    @Volatile
    private var purchasesUpdatedCallback: GMFunction? = null

    private val productDetailsById = ConcurrentHashMap<String, ProductDetails>()

    private fun activity(): Activity? = RunnerActivity.CurrentActivity

    // -------------------------------------------------------------------------
    // Init / connection
    // -------------------------------------------------------------------------

    override fun play_billing_init(options: Optional<GooglePlayBillingInitOptions>, callback: GMFunction) {
        // Only one BillingClient should exist at a time. Close and clear any old session.
        billingClient?.endConnection()
        billingClient = null
        productDetailsById.clear()
        purchasesUpdatedCallback = callback

        val currentActivity = activity()
        if (currentActivity == null) {
            invokeCallback(callback, errorResultRecord(ERR_ACTIVITY_UNAVAILABLE))
            return
        }

        val pendingPurchasesBuilder = PendingPurchasesParams.newBuilder()
            .enableOneTimeProducts()

        if (options.isPresent && options.get().enable_prepaid_plans().orElse(false)) {
            pendingPurchasesBuilder.enablePrepaidPlans()
        }

        var builder = BillingClient.newBuilder(currentActivity)
            .setListener(PurchasesUpdatedListener { billingResult, purchases ->
                invokeCallback(
                    purchasesUpdatedCallback,
                    billingResultToRecord(billingResult),
                    purchasesToRecords(purchases ?: emptyList())
                )
            })
            .enablePendingPurchases(pendingPurchasesBuilder.build())

        if (options.isPresent && options.get().enable_auto_service_reconnection().orElse(false)) {
            builder = builder.enableAutoServiceReconnection()
        }

        if (options.isPresent && options.get().enable_alternative_billing_only().orElse(false)) {
            builder = builder.enableAlternativeBillingOnly()
        }

        if (options.isPresent && options.get().enable_external_content_link().orElse(false)) {
            builder = builder.enableBillingProgram(
                BillingClient.BillingProgram.EXTERNAL_CONTENT_LINK
            )
        }

        if (options.isPresent && options.get().enable_external_offer().orElse(false)) {
            builder = builder.enableBillingProgram(
                BillingClient.BillingProgram.EXTERNAL_OFFER
            )
        }

        if (options.isPresent && options.get().enable_external_payments().orElse(false)) {
            builder = builder.enableBillingProgram(
                BillingClient.BillingProgram.EXTERNAL_PAYMENTS
            )
        }

        if (options.isPresent && options.get().enable_billing_choice().orElse(false)) {
            builder = builder.enableBillingProgram(
                BillingClient.BillingProgram.BILLING_CHOICE
            )
        }

        billingClient = builder.build()
    }

    override fun play_billing_start_connection(
        callback_start: GMFunction,
        callback_disconnect: GMFunction
    ) {
        val client = billingClient
        if (client == null) {
            invokeCallback(callback_start, errorResultRecord(ERR_NOT_INITIALIZED))
            return
        }

        try {
            client.startConnection(object : BillingClientStateListener {
                override fun onBillingSetupFinished(billingResult: BillingResult) {
                    invokeCallback(callback_start, billingResultToRecord(billingResult))
                }

                override fun onBillingServiceDisconnected() {
                    invokeCallback(callback_disconnect)
                }
            })
        } catch (e: Exception) {
            Log.e(TAG, "Failed to start BillingClient connection", e)
            invokeCallback(callback_start, errorResultRecord(e.message ?: ERR_NOT_READY))
        }
    }

    override fun play_billing_end_connection() {
        billingClient?.endConnection()
        billingClient = null
        purchasesUpdatedCallback = null
        productDetailsById.clear()
    }

    override fun play_billing_get_connection_state(): GooglePlayBillingConnectionState {
        val state = billingClient?.connectionState
            ?: BillingClient.ConnectionState.DISCONNECTED
        return connectionStateFromGoogle(state)
    }

    override fun play_billing_is_ready(): Boolean {
        return billingClient?.isReady == true
    }

    // -------------------------------------------------------------------------
    // Config / availability / feature support
    // -------------------------------------------------------------------------

    override fun play_billing_get_config_async(callback: GMFunction) {
        val client = readyClientOrError(callback) { invokeCallback(callback, it, Optional.empty<GooglePlayBillingConfig>()) }
            ?: return

        client.getBillingConfigAsync(
            GetBillingConfigParams.newBuilder().build(),
            BillingConfigResponseListener { billingResult, billingConfig ->
                val config = billingConfig?.let { GooglePlayBillingConfig(it.countryCode) }
                invokeCallback(callback, billingResultToRecord(billingResult), Optional.ofNullable(config))
            }
        )
    }

    override fun play_billing_is_alternative_billing_only_available_async(callback: GMFunction) {
        val client = readyClientOrError(callback) { invokeCallback(callback, it) } ?: return

        client.isAlternativeBillingOnlyAvailableAsync(
            AlternativeBillingOnlyAvailabilityListener { billingResult ->
                invokeCallback(callback, billingResultToRecord(billingResult))
            }
        )
    }

    override fun play_billing_is_billing_program_available_async(
        program: GooglePlayBillingProgram,
        callback: GMFunction
    ) {
        val googleProgram = billingProgramToGoogle(program)

        val client = readyClientOrError(callback) {
            invokeCallback(callback, it, Optional.empty<GooglePlayBillingProgramAvailabilityDetails>())
        } ?: return

        client.isBillingProgramAvailableAsync(
            googleProgram,
            BillingProgramAvailabilityListener { billingResult, details ->
                val choiceDetails = details.billingChoiceAvailabilityDetails?.let {
                    GooglePlayBillingChoiceAvailabilityDetails(
                        choiceScreenTypeFromGoogle(it.choiceScreenType),
                        it.isExternalLinkAvailable
                    )
                }

                val availabilityDetails = GooglePlayBillingProgramAvailabilityDetails(
                    billingProgramFromGoogle(details.billingProgram),
                    Optional.ofNullable(choiceDetails)
                )

                invokeCallback(
                    callback,
                    billingResultToRecord(billingResult),
                    Optional.of(availabilityDetails)
                )
            }
        )
    }

    override fun play_billing_is_feature_supported(
        feature: GooglePlayBillingFeatureType
    ): GooglePlayBillingResult {
        val client = billingClient
            ?: return errorResultRecord(ERR_NOT_INITIALIZED)

        if (!client.isReady) {
            return errorResultRecord(
                ERR_NOT_READY,
                BillingClient.BillingResponseCode.SERVICE_DISCONNECTED
            )
        }

        val googleFeature = try {
            featureTypeToGoogle(feature)
        } catch (e: IllegalArgumentException) {
            return errorResultRecord(e.message ?: "Invalid feature type.")
        }

        return billingResultToRecord(client.isFeatureSupported(googleFeature))
    }

    // -------------------------------------------------------------------------
    // Products
    // -------------------------------------------------------------------------

    override fun play_billing_query_product_details_async(
        products: List<GooglePlayBillingProductInput>,
        callback: GMFunction
    ) {
        val client = readyClientOrError(callback) { invokeCallback(callback, it, emptyQueryResult()) } ?: return

        val billingProducts = try {
            productInputsToBillingProducts(products)
        } catch (e: IllegalArgumentException) {
            invokeCallback(
                callback,
                errorResultRecord(e.message ?: "Invalid product input."),
                emptyQueryResult()
            )
            return
        }

        val params = QueryProductDetailsParams.newBuilder()
            .setProductList(billingProducts)
            .build()

        client.queryProductDetailsAsync(params) { billingResult, queryResult ->
            handleProductDetailsResult(billingResult, queryResult, callback)
        }
    }

    override fun play_billing_clear_products() {
        productDetailsById.clear()
    }

    // -------------------------------------------------------------------------
    // Billing flow
    // -------------------------------------------------------------------------

    override fun play_billing_launch_billing_flow(
        items: List<GooglePlayBillingProductDetailsParams>,
        options: Optional<GooglePlayBillingFlowOptions>
    ): GooglePlayBillingResult {
        val currentActivity = activity()
            ?: return errorResultRecord(ERR_ACTIVITY_UNAVAILABLE)

        val client = billingClient
            ?: return errorResultRecord(ERR_NOT_INITIALIZED)

        if (!client.isReady) {
            return errorResultRecord(
                ERR_NOT_READY,
                BillingClient.BillingResponseCode.SERVICE_DISCONNECTED
            )
        }

        val params = try {
            createBillingFlowParams(items, options)
        } catch (e: IllegalArgumentException) {
            Log.e(TAG, "Invalid BillingFlowParams", e)
            return errorResultRecord(e.message ?: "Invalid billing flow options.")
        } catch (e: Exception) {
            Log.e(TAG, "Failed to create BillingFlowParams", e)
            return errorResultRecord(e.message ?: "Failed to create BillingFlowParams.")
        }

        return billingResultToRecord(client.launchBillingFlow(currentActivity, params))
    }

    private fun createBillingFlowParams(
        items: List<GooglePlayBillingProductDetailsParams>,
        options: Optional<GooglePlayBillingFlowOptions>
    ): BillingFlowParams {
        if (items.isEmpty()) {
            throw IllegalArgumentException("items must not be empty.")
        }

        val productDetailsParamsList = mutableListOf<BillingFlowParams.ProductDetailsParams>()
        var subscriptionUpdateParams: BillingFlowParams.SubscriptionUpdateParams? = null

        for (item in items) {
            val productId = item.product_id()
            val productDetails = productDetailsById[productId]
                ?: throw IllegalArgumentException(
                    "ProductDetails not found for product '$productId'. Query the product before launching billing flow."
                )

            val productParamsBuilder = BillingFlowParams.ProductDetailsParams.newBuilder()
                .setProductDetails(productDetails)

            val itemOfferToken = item.offer_token().orElse(null)
            if (itemOfferToken != null && itemOfferToken.isNotEmpty()) {
                productParamsBuilder.setOfferToken(itemOfferToken)
            }

            val subscriptionReplacementOptional = item.subscription_replacement()
            if (subscriptionReplacementOptional?.isPresent == true) {
                if (productDetails.productType != BillingClient.ProductType.SUBS) {
                    throw IllegalArgumentException(
                        "subscription_replacement can only be used with subscription products."
                    )
                }
                if (subscriptionUpdateParams != null) {
                    throw IllegalArgumentException(
                        "subscription_replacement can only be set on one item per billing flow."
                    )
                }

                val replacement = subscriptionReplacementOptional.get()
                val oldPurchaseToken = replacement.old_purchase_token()
                val oldProductId = replacement.old_product_id()

                if (oldPurchaseToken.isBlank()) {
                    throw IllegalArgumentException("old_purchase_token must not be empty.")
                }
                if (oldProductId.isBlank()) {
                    throw IllegalArgumentException("old_product_id must not be empty.")
                }

                val replacementMode = replacement.replacement_mode().value().toInt()
                val replacementParams = BillingFlowParams.ProductDetailsParams
                    .SubscriptionProductReplacementParams.newBuilder()
                    .setOldProductId(oldProductId)
                    .setReplacementMode(replacementMode)
                    .build()

                productParamsBuilder.setSubscriptionProductReplacementParams(replacementParams)

                val subscriptionUpdateBuilder = BillingFlowParams.SubscriptionUpdateParams.newBuilder()
                    .setOldPurchaseToken(oldPurchaseToken)

                val originalExternalTransactionId =
                    replacement.original_external_transaction_id().orElse(null)
                if (!originalExternalTransactionId.isNullOrEmpty()) {
                    subscriptionUpdateBuilder.setOriginalExternalTransactionId(
                        originalExternalTransactionId
                    )
                }

                subscriptionUpdateParams = subscriptionUpdateBuilder.build()
            }

            productDetailsParamsList.add(productParamsBuilder.build())
        }

        val obfuscatedAccountId = if (options.isPresent) options.get().obfuscated_account_id().orElse(null) else null
        val obfuscatedProfileId = if (options.isPresent) options.get().obfuscated_profile_id().orElse(null) else null

        if (obfuscatedAccountId != null && obfuscatedAccountId.isNotEmpty()) {
            validateObfuscatedId("obfuscated_account_id", obfuscatedAccountId)
        }
        if (obfuscatedProfileId != null && obfuscatedProfileId.isNotEmpty()) {
            validateObfuscatedId("obfuscated_profile_id", obfuscatedProfileId)
        }

        val billingFlowBuilder = BillingFlowParams.newBuilder()
            .setProductDetailsParamsList(productDetailsParamsList)

        subscriptionUpdateParams?.let { billingFlowBuilder.setSubscriptionUpdateParams(it) }

        if (options.isPresent) {
            options.get().is_offer_personalized().ifPresent { isPersonalized ->
                billingFlowBuilder.setIsOfferPersonalized(isPersonalized)
            }
        }

        if (!obfuscatedAccountId.isNullOrEmpty()) {
            billingFlowBuilder.setObfuscatedAccountId(obfuscatedAccountId)
        }

        if (!obfuscatedProfileId.isNullOrEmpty()) {
            billingFlowBuilder.setObfuscatedProfileId(obfuscatedProfileId)
        }

        return billingFlowBuilder.build()
    }

    // -------------------------------------------------------------------------
    // Purchases
    // -------------------------------------------------------------------------

    override fun play_billing_query_purchases_async(
        product_type: GooglePlayBillingProductType,
        include_suspended_subscriptions: Boolean,
        callback: GMFunction
    ) {
        val client = readyClientOrError(callback) {
            invokeCallback(callback, it, emptyList<GooglePlayBillingPurchase>())
        } ?: return

        val googleProductType = try {
            productTypeToGoogle(product_type)
        } catch (e: IllegalArgumentException) {
            invokeCallback(
                callback,
                errorResultRecord(e.message ?: "Invalid product type."),
                emptyList<GooglePlayBillingPurchase>()
            )
            return
        }

        val params = QueryPurchasesParams.newBuilder()
            .setProductType(googleProductType)
            .includeSuspendedSubscriptions(include_suspended_subscriptions)
            .build()

        client.queryPurchasesAsync(
            params,
            PurchasesResponseListener { billingResult, purchases ->
                invokeCallback(
                    callback,
                    billingResultToRecord(billingResult),
                    purchasesToRecords(purchases)
                )
            }
        )
    }

    override fun play_billing_acknowledge_purchase(
        purchase_token: String,
        callback: GMFunction
    ) {
        val client = readyClientOrError(callback) { invokeCallback(callback, it) } ?: return

        val params = AcknowledgePurchaseParams.newBuilder()
            .setPurchaseToken(purchase_token)
            .build()

        client.acknowledgePurchase(
            params,
            AcknowledgePurchaseResponseListener { billingResult ->
                invokeCallback(callback, billingResultToRecord(billingResult))
            }
        )
    }

    override fun play_billing_consume_async(
        purchase_token: String,
        callback: GMFunction
    ) {
        val client = readyClientOrError(callback) { invokeCallback(callback, it, purchase_token) } ?: return

        val params = ConsumeParams.newBuilder()
            .setPurchaseToken(purchase_token)
            .build()

        client.consumeAsync(
            params,
            ConsumeResponseListener { billingResult, returnedPurchaseToken ->
                invokeCallback(callback, billingResultToRecord(billingResult), returnedPurchaseToken)
            }
        )
    }

    // -------------------------------------------------------------------------
    // Alternative billing / billing programs
    // -------------------------------------------------------------------------

    override fun play_billing_create_alternative_billing_only_reporting_details_async(
        callback: GMFunction
    ) {
        val client = readyClientOrError(callback) {
            invokeCallback(callback, it, Optional.empty<GooglePlayBillingReportingDetails>())
        } ?: return

        client.createAlternativeBillingOnlyReportingDetailsAsync(
            AlternativeBillingOnlyReportingDetailsListener { billingResult, details ->
                val reportingDetails = details?.let {
                    GooglePlayBillingReportingDetails(Optional.empty(), it.externalTransactionToken)
                }
                invokeCallback(
                    callback,
                    billingResultToRecord(billingResult),
                    Optional.ofNullable(reportingDetails)
                )
            }
        )
    }

    override fun play_billing_create_billing_program_reporting_details_async(
        program: GooglePlayBillingProgram,
        callback: GMFunction
    ) {
        val client = readyClientOrError(callback) {
            invokeCallback(callback, it, Optional.empty<GooglePlayBillingReportingDetails>())
        } ?: return

        val googleProgram = billingProgramToGoogle(program)

        val params = try {
            BillingProgramReportingDetailsParams.newBuilder()
                .setBillingProgram(googleProgram)
                .build()
        } catch (e: IllegalArgumentException) {
            invokeCallback(
                callback,
                errorResultRecord(e.message ?: "Invalid billing program."),
                Optional.empty<GooglePlayBillingReportingDetails>()
            )
            return
        }

        client.createBillingProgramReportingDetailsAsync(
            params,
            BillingProgramReportingDetailsListener { billingResult, details ->
                val reportingDetails = details?.let {
                    GooglePlayBillingReportingDetails(
                        Optional.of(billingProgramFromGoogle(it.billingProgram)),
                        it.externalTransactionToken
                    )
                }
                invokeCallback(
                    callback,
                    billingResultToRecord(billingResult),
                    Optional.ofNullable(reportingDetails)
                )
            }
        )
    }

    // -------------------------------------------------------------------------
    // In-app messages
    // -------------------------------------------------------------------------

    override fun play_billing_show_in_app_messages(
        options: Optional<GooglePlayBillingInAppMessageOptions>,
        callback: GMFunction
    ): GooglePlayBillingResult {
        val currentActivity = activity()
            ?: return errorResultRecord(ERR_ACTIVITY_UNAVAILABLE)

        val client = billingClient
            ?: return errorResultRecord(ERR_NOT_INITIALIZED)

        if (!client.isReady) {
            return errorResultRecord(
                ERR_NOT_READY,
                BillingClient.BillingResponseCode.SERVICE_DISCONNECTED
            )
        }

        val paramsBuilder = InAppMessageParams.newBuilder()

        var hasCategories = false
        if (options.isPresent) {
            val categories = options.get().categories()
            if (categories.isNotEmpty()) {
                for (category in categories) {
                    paramsBuilder.addInAppMessageCategoryToShow(category.value().toInt())
                }
                hasCategories = true
            }
        }

        if (!hasCategories) {
            paramsBuilder.addAllInAppMessageCategoriesToShow()
        }

        val params = paramsBuilder.build()

        val immediateResult = client.showInAppMessages(
            currentActivity,
            params,
            InAppMessageResponseListener { result ->
                val messageResult = GooglePlayBillingInAppMessageResult(
                    inAppMessageResponseCodeFromGoogle(result.responseCode),
                    Optional.ofNullable(result.purchaseToken)
                )
                invokeCallback(callback, messageResult)
            }
        )

        return billingResultToRecord(immediateResult)
    }

    // -------------------------------------------------------------------------
    // Billing Choice (Billing 9.1+)
    // -------------------------------------------------------------------------

    override fun play_billing_get_billing_choice_info_async(callback: GMFunction) {
        val client = readyClientOrError(callback) {
            invokeCallback(callback, it, Optional.empty<GooglePlayBillingChoiceInfo>())
        } ?: return

        val params = GetBillingChoiceInfoParams.newBuilder().build()

        client.getBillingChoiceInfoAsync(
            params,
            BillingChoiceInfoResponseListener { billingResult, billingChoiceInfo ->
                val choiceInfo = billingChoiceInfo?.let {
                    GooglePlayBillingChoiceInfo(
                        Optional.ofNullable(it.playBillingChoiceImageUrl),
                        Optional.ofNullable(it.playBillingLoyaltyInfo)
                    )
                }
                invokeCallback(
                    callback,
                    billingResultToRecord(billingResult),
                    Optional.ofNullable(choiceInfo)
                )
            }
        )
    }

    override fun play_billing_show_billing_program_information_dialog(
        program: GooglePlayBillingProgram,
        callback: GMFunction
    ) {
        val currentActivity = activity()
            ?: run {
                invokeCallback(callback, errorResultRecord(ERR_ACTIVITY_UNAVAILABLE))
                return
            }

        val client = readyClientOrError(callback) { invokeCallback(callback, it) } ?: return

        val googleProgram = billingProgramToGoogle(program)
        val params = BillingProgramInformationDialogParams.newBuilder()
            .setBillingProgram(googleProgram)
            .build()

        client.showBillingProgramInformationDialog(
            currentActivity,
            params,
            BillingProgramInformationDialogListener { billingResult ->
                invokeCallback(callback, billingResultToRecord(billingResult))
            }
        )
    }

    override fun play_billing_show_alternative_billing_only_information_dialog(callback: GMFunction) {
        val currentActivity = activity()
            ?: run {
                invokeCallback(callback, errorResultRecord(ERR_ACTIVITY_UNAVAILABLE))
                return
            }

        val client = readyClientOrError(callback) { invokeCallback(callback, it) } ?: return

        client.showAlternativeBillingOnlyInformationDialog(
            currentActivity,
            AlternativeBillingOnlyInformationDialogListener { billingResult ->
                invokeCallback(callback, billingResultToRecord(billingResult))
            }
        )
    }

    override fun play_billing_launch_external_link(
        options: GooglePlayBillingExternalLinkLaunchOptions,
        callback: GMFunction
    ) {
        val currentActivity = activity()
            ?: run {
                invokeCallback(callback, errorResultRecord(ERR_ACTIVITY_UNAVAILABLE))
                return
            }

        val client = readyClientOrError(callback) { invokeCallback(callback, it) } ?: return

        val googleProgram = billingProgramToGoogle(options.billing_program())
        val params = LaunchExternalLinkParams.newBuilder()
            .setBillingProgram(googleProgram)
            .build()

        client.launchExternalLink(
            currentActivity,
            params,
            LaunchExternalLinkResponseListener { billingResult ->
                invokeCallback(callback, billingResultToRecord(billingResult))
            }
        )
    }


    // -------------------------------------------------------------------------
    // Callback and result helpers
    // -------------------------------------------------------------------------

    private fun invokeCallback(callback: GMFunction?, vararg payload: Any) {
        if (callback == null) return
        try {
            callback.call(*payload)
        } catch (e: Exception) {
            Log.e(TAG, "Error invoking GML callback", e)
        }
    }

    private fun emptyQueryResult(): GooglePlayBillingProductDetailsQueryResult {
        return GooglePlayBillingProductDetailsQueryResult(emptyList(), emptyList())
    }

    // Checks client readiness. On failure, invokes onError with the error result
    // (matching whatever argument shape this call site's callback needs) and returns
    // null so the caller returns immediately; on success, returns the ready client.
    private fun readyClientOrError(
        callback: GMFunction,
        onError: (GooglePlayBillingResult) -> Unit
    ): BillingClient? {
        val client = billingClient
        if (client == null) {
            onError(errorResultRecord(ERR_NOT_INITIALIZED))
            return null
        }
        if (!client.isReady) {
            onError(errorResultRecord(ERR_NOT_READY, BillingClient.BillingResponseCode.SERVICE_DISCONNECTED))
            return null
        }
        return client
    }

    private fun billingResultToRecord(result: BillingResult): GooglePlayBillingResult {
        return GooglePlayBillingResult(
            responseCodeFromGoogle(result.responseCode),
            Optional.ofNullable(result.debugMessage),
            purchasesUpdatedSubResponseCodeFromGoogle(
                result.onPurchasesUpdatedSubResponseCode
            )
        )
    }

    private fun errorResultRecord(
        message: String,
        code: Int = BillingClient.BillingResponseCode.ERROR
    ): GooglePlayBillingResult {
        return GooglePlayBillingResult(
            responseCodeFromGoogle(code),
            Optional.of(message),
            GooglePlayBillingPurchasesUpdatedSubResponseCode.None
        )
    }

    // -------------------------------------------------------------------------
    // Product conversion
    // -------------------------------------------------------------------------

    private fun handleProductDetailsResult(
        billingResult: BillingResult,
        queryResult: QueryProductDetailsResult,
        callback: GMFunction
    ) {
        val products = queryResult.productDetailsList
        val unfetchedProducts = queryResult.unfetchedProductList

        if (billingResult.responseCode == BillingClient.BillingResponseCode.OK) {
            // Merge this query into the existing cache.
            // INAPP and SUBS may be queried separately, so clearing here would
            // discard products cached by the previous successful query.
            for (product in products) {
                productDetailsById[product.productId] = product
            }
        }

        val queryResultRecord = GooglePlayBillingProductDetailsQueryResult(
            productDetailsListToRecords(products),
            unfetchedProductsToRecords(unfetchedProducts)
        )

        invokeCallback(callback, billingResultToRecord(billingResult), queryResultRecord)
    }

    private fun productInputsToBillingProducts(
        products: List<GooglePlayBillingProductInput>
    ): List<QueryProductDetailsParams.Product> {
        return products.map { input ->
            val googleProductType = productTypeToGoogle(input.product_type())
            val builder = QueryProductDetailsParams.Product.newBuilder()
                .setProductId(input.product_id())
                .setProductType(googleProductType)

            input.dynamic_product_token().ifPresent { token ->
                if (token.isNotEmpty()) {
                    builder.setDynamicProductToken(token)
                }
            }

            builder.build()
        }
    }

    private fun productDetailsListToRecords(
        products: List<ProductDetails>
    ): List<GooglePlayBillingProductDetails> {
        return products.map { productDetailsToRecord(it) }
    }

    private fun productDetailsToRecord(product: ProductDetails): GooglePlayBillingProductDetails {
        val oneTimeOffers = normalizedOneTimeOffers(product)
        val subscriptionOffers = product.subscriptionOfferDetails ?: emptyList()

        return GooglePlayBillingProductDetails(
            product.productId,
            product.name,
            product.title,
            product.description,
            productTypeFromGoogle(product.productType),
            oneTimeOffers.map { oneTimeOfferToRecord(it) },
            subscriptionOffers.map { subscriptionOfferToRecord(it) }
        )
    }

    private fun normalizedOneTimeOffers(
        product: ProductDetails
    ): List<ProductDetails.OneTimePurchaseOfferDetails> {
        val offers = product.oneTimePurchaseOfferDetailsList
        if (!offers.isNullOrEmpty()) return offers
        return listOfNotNull(product.oneTimePurchaseOfferDetails)
    }

    private fun oneTimeOfferToRecord(
        offer: ProductDetails.OneTimePurchaseOfferDetails
    ): GooglePlayBillingOneTimePurchaseOfferDetails {
        return GooglePlayBillingOneTimePurchaseOfferDetails(
            offer.formattedPrice,
            offer.priceAmountMicros.toDouble(),
            offer.priceCurrencyCode,
            Optional.ofNullable(offer.offerId),
            Optional.ofNullable(offer.offerToken),
            offer.offerTags ?: emptyList(),
            Optional.ofNullable(offer.purchaseOptionId),
            Optional.ofNullable(offer.fullPriceMicros?.toDouble()),
            Optional.ofNullable(offer.rentalDetails?.let { rentalDetailsToRecord(it) }),
            Optional.ofNullable(offer.preorderDetails?.let { preorderDetailsToRecord(it) }),
            Optional.ofNullable(offer.discountDisplayInfo?.let { discountDisplayInfoToRecord(it) }),
            Optional.ofNullable(offer.limitedQuantityInfo?.let { limitedQuantityInfoToRecord(it) }),
            Optional.ofNullable(offer.validTimeWindow?.let { validTimeWindowToRecord(it) })
        )
    }

    private fun rentalDetailsToRecord(
        details: ProductDetails.OneTimePurchaseOfferDetails.RentalDetails
    ): GooglePlayBillingRentalDetails {
        return GooglePlayBillingRentalDetails(
            details.rentalPeriod,
            Optional.ofNullable(details.rentalExpirationPeriod)
        )
    }

    private fun preorderDetailsToRecord(
        details: ProductDetails.OneTimePurchaseOfferDetails.PreorderDetails
    ): GooglePlayBillingPreorderDetails {
        return GooglePlayBillingPreorderDetails(
            details.preorderReleaseTimeMillis.toDouble(),
            details.preorderPresaleEndTimeMillis.toDouble()
        )
    }

    private fun discountDisplayInfoToRecord(
        details: ProductDetails.OneTimePurchaseOfferDetails.DiscountDisplayInfo
    ): GooglePlayBillingDiscountDisplayInfo {
        return GooglePlayBillingDiscountDisplayInfo(
            Optional.ofNullable(details.percentageDiscount),
            Optional.ofNullable(details.discountAmount?.let { discountAmountToRecord(it) })
        )
    }

    private fun discountAmountToRecord(
        amount: ProductDetails.OneTimePurchaseOfferDetails.DiscountDisplayInfo.DiscountAmount
    ): GooglePlayBillingDiscountAmount {
        return GooglePlayBillingDiscountAmount(
            amount.formattedDiscountAmount,
            amount.discountAmountMicros.toDouble(),
            amount.discountAmountCurrencyCode
        )
    }

    private fun limitedQuantityInfoToRecord(
        details: ProductDetails.OneTimePurchaseOfferDetails.LimitedQuantityInfo
    ): GooglePlayBillingLimitedQuantityInfo {
        return GooglePlayBillingLimitedQuantityInfo(
            details.maximumQuantity,
            details.remainingQuantity
        )
    }

    private fun validTimeWindowToRecord(
        details: ProductDetails.OneTimePurchaseOfferDetails.ValidTimeWindow
    ): GooglePlayBillingValidTimeWindow {
        return GooglePlayBillingValidTimeWindow(
            Optional.ofNullable(details.startTimeMillis?.toDouble()),
            Optional.ofNullable(details.endTimeMillis?.toDouble())
        )
    }

    private fun subscriptionOfferToRecord(
        offer: ProductDetails.SubscriptionOfferDetails
    ): GooglePlayBillingSubscriptionOfferDetails {
        val installmentPlanDetails = offer.installmentPlanDetails?.let {
            GooglePlayBillingInstallmentPlanDetails(
                it.installmentPlanCommitmentPaymentsCount,
                it.subsequentInstallmentPlanCommitmentPaymentsCount
            )
        }

        return GooglePlayBillingSubscriptionOfferDetails(
            offer.basePlanId,
            Optional.ofNullable(offer.offerId),
            offer.offerTags ?: emptyList(),
            offer.offerToken,
            offer.pricingPhases.pricingPhaseList.map { pricingPhaseToRecord(it) },
            Optional.ofNullable(installmentPlanDetails)
        )
    }

    private fun pricingPhaseToRecord(
        phase: ProductDetails.PricingPhase
    ): GooglePlayBillingPricingPhase {
        return GooglePlayBillingPricingPhase(
            phase.formattedPrice,
            phase.priceAmountMicros.toDouble(),
            phase.priceCurrencyCode,
            phase.billingCycleCount,
            phase.billingPeriod,
            recurrenceModeFromGoogle(phase.recurrenceMode)
        )
    }

    private fun unfetchedProductsToRecords(
        products: List<UnfetchedProduct>
    ): List<GooglePlayBillingUnfetchedProduct> {
        return products.map {
            GooglePlayBillingUnfetchedProduct(
                it.productId,
                productTypeFromGoogle(it.productType),
                unfetchedProductStatusFromGoogle(it.statusCode)
            )
        }
    }

    // -------------------------------------------------------------------------
    // Purchase conversion
    // -------------------------------------------------------------------------

    private fun purchasesToRecords(purchases: List<Purchase>): List<GooglePlayBillingPurchase> {
        return purchases.map { purchaseToRecord(it) }
    }

    private fun purchaseToRecord(purchase: Purchase): GooglePlayBillingPurchase {
        val accountIdentifiers = purchase.accountIdentifiers?.let {
            GooglePlayBillingAccountIdentifiers(
                Optional.ofNullable(it.obfuscatedAccountId),
                Optional.ofNullable(it.obfuscatedProfileId)
            )
        }

        return GooglePlayBillingPurchase(
            Optional.ofNullable(purchase.orderId),
            purchase.packageName,
            purchase.purchaseTime.toDouble(),
            purchase.purchaseToken,
            purchase.products,
            purchase.signature,
            purchase.isAcknowledged,
            purchase.isAutoRenewing,
            purchaseStateFromGoogle(purchase.purchaseState),
            purchase.quantity,
            purchase.originalJson,
            purchase.isSuspended,
            Optional.ofNullable(accountIdentifiers),
            Optional.ofNullable(purchase.pendingPurchaseUpdate?.let { pendingPurchaseUpdateToRecord(it) })
        )
    }

    private fun pendingPurchaseUpdateToRecord(
        update: Purchase.PendingPurchaseUpdate
    ): GooglePlayBillingPendingPurchaseUpdate {
        return GooglePlayBillingPendingPurchaseUpdate(
            update.purchaseToken,
            update.products
        )
    }

    // -------------------------------------------------------------------------
    // Enum mapping and validation
    // -------------------------------------------------------------------------

    private fun productTypeToGoogle(
        productType: GooglePlayBillingProductType
    ): String {
        return when (productType.value().toInt()) {
            0 -> BillingClient.ProductType.INAPP
            1 -> BillingClient.ProductType.SUBS
            else -> throw IllegalArgumentException(
                "Unknown GooglePlayBillingProductType value: ${productType.value()}"
            )
        }
    }

    private fun productTypeFromGoogle(productType: String): GooglePlayBillingProductType {
        return when (productType) {
            BillingClient.ProductType.INAPP -> GooglePlayBillingProductType.InApp
            BillingClient.ProductType.SUBS -> GooglePlayBillingProductType.Subscription
            else -> GooglePlayBillingProductType.Unknown
        }
    }

    private fun featureTypeToGoogle(
        feature: GooglePlayBillingFeatureType
    ): String {
        return when (feature.value().toInt()) {
            0 -> BillingClient.FeatureType.ALTERNATIVE_BILLING_ONLY
            1 -> BillingClient.FeatureType.BILLING_CONFIG
            2 -> BillingClient.FeatureType.EXTERNAL_OFFER
            3 -> BillingClient.FeatureType.INCLUDE_SUSPENDED_SUBSCRIPTIONS
            4 -> BillingClient.FeatureType.IN_APP_MESSAGING
            5 -> BillingClient.FeatureType.PRICE_CHANGE_CONFIRMATION
            6 -> BillingClient.FeatureType.PRODUCT_DETAILS
            7 -> BillingClient.FeatureType.SUBSCRIPTIONS
            8 -> BillingClient.FeatureType.SUBSCRIPTIONS_UPDATE
            else -> throw IllegalArgumentException(
                "Unknown GooglePlayBillingFeatureType value: ${feature.value()}"
            )
        }
    }

    private fun billingProgramToGoogle(
        program: GooglePlayBillingProgram
    ): Int = program.value().toInt()

    private fun billingProgramFromGoogle(value: Int): GooglePlayBillingProgram {
        return GooglePlayBillingProgram.values().firstOrNull {
            it.value().toInt() == value
        } ?: GooglePlayBillingProgram.Unspecified
    }

    private fun connectionStateFromGoogle(
        state: Int
    ): GooglePlayBillingConnectionState {
        return GooglePlayBillingConnectionState.values().firstOrNull {
            it.value().toInt() == state
        } ?: GooglePlayBillingConnectionState.Disconnected
    }

    private fun responseCodeFromGoogle(
        code: Int
    ): GooglePlayBillingResponseCode {
        return GooglePlayBillingResponseCode.values().firstOrNull {
            it.value().toInt() == code
        } ?: GooglePlayBillingResponseCode.Error
    }

    private fun purchasesUpdatedSubResponseCodeFromGoogle(
        code: Int
    ): GooglePlayBillingPurchasesUpdatedSubResponseCode {
        return GooglePlayBillingPurchasesUpdatedSubResponseCode.values().firstOrNull {
            it.value().toInt() == code
        } ?: GooglePlayBillingPurchasesUpdatedSubResponseCode.None
    }

    private fun choiceScreenTypeFromGoogle(value: Int): GooglePlayBillingChoiceScreenType {
        return GooglePlayBillingChoiceScreenType.values().firstOrNull {
            it.value().toInt() == value
        } ?: GooglePlayBillingChoiceScreenType.Unspecified
    }

    private fun recurrenceModeFromGoogle(value: Int): GooglePlayBillingRecurrenceMode {
        return GooglePlayBillingRecurrenceMode.values().firstOrNull {
            it.value().toInt() == value
        } ?: GooglePlayBillingRecurrenceMode.Unknown
    }

    private fun purchaseStateFromGoogle(value: Int): GooglePlayBillingPurchaseState {
        return GooglePlayBillingPurchaseState.values().firstOrNull {
            it.value().toInt() == value
        } ?: GooglePlayBillingPurchaseState.UnspecifiedState
    }

    private fun unfetchedProductStatusFromGoogle(value: Int): GooglePlayBillingUnfetchedProductStatus {
        return GooglePlayBillingUnfetchedProductStatus.values().firstOrNull {
            it.value().toInt() == value
        } ?: GooglePlayBillingUnfetchedProductStatus.Unknown
    }

    private fun inAppMessageResponseCodeFromGoogle(value: Int): GooglePlayBillingInAppMessageResponseCode {
        return GooglePlayBillingInAppMessageResponseCode.values().firstOrNull {
            it.value().toInt() == value
        } ?: GooglePlayBillingInAppMessageResponseCode.NoActionNeeded
    }

    private fun validateObfuscatedId(name: String, value: String) {
        if (value.length > MAX_OBFUSCATED_ID_LENGTH) {
            throw IllegalArgumentException(
                "$name must not exceed $MAX_OBFUSCATED_ID_LENGTH characters."
            )
        }
    }
}
