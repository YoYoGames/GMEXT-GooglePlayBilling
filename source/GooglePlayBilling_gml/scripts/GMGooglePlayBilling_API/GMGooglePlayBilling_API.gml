// ##### extgen :: Auto-generated file do not edit!! #####

// #####################################################################
// # Macros
// #####################################################################

// #####################################################################
// # Enums
// #####################################################################

enum GooglePlayBillingProductType
{
    InApp = 0,
    Subscription = 1,
    Unknown = 2
}

enum GooglePlayBillingFeatureType
{
    AlternativeBillingOnly = 0,
    BillingConfig = 1,
    ExternalOffer = 2,
    IncludeSuspendedSubscriptions = 3,
    InAppMessaging = 4,
    PriceChangeConfirmation = 5,
    ProductDetails = 6,
    Subscriptions = 7,
    SubscriptionsUpdate = 8
}

enum GooglePlayBillingProgram
{
    Unspecified = 0,
    ExternalContentLink = 1,
    ExternalOffer = 3,
    ExternalPayments = 4,
    BillingChoice = 5
}

enum GooglePlayBillingResponseCode
{
    ServiceTimeout = -3,
    FeatureNotSupported = -2,
    ServiceDisconnected = -1,
    Ok = 0,
    UserCanceled = 1,
    ServiceUnavailable = 2,
    BillingUnavailable = 3,
    ItemUnavailable = 4,
    DeveloperError = 5,
    Error = 6,
    ItemAlreadyOwned = 7,
    ItemNotOwned = 8,
    NetworkError = 12
}

enum GooglePlayBillingPurchasesUpdatedSubResponseCode
{
    None = 0,
    PaymentDeclinedDueToInsufficientFunds = 1,
    UserIneligible = 2
}

enum GooglePlayBillingPurchaseState
{
    UnspecifiedState = 0,
    Purchased = 1,
    Pending = 2
}

enum GooglePlayBillingSubscriptionReplacementMode
{
    UnknownReplacementMode = 0,
    WithTimeProration = 1,
    ChargeProratedPrice = 2,
    WithoutProration = 3,
    ChargeFullPrice = 4,
    Deferred = 5,
    KeepExisting = 6
}

enum GooglePlayBillingConnectionState
{
    Disconnected = 0,
    Connecting = 1,
    Connected = 2,
    Closed = 3
}

enum GooglePlayBillingRecurrenceMode
{
    Unknown = 0,
    InfiniteRecurring = 1,
    FiniteRecurring = 2,
    NonRecurring = 3
}

enum GooglePlayBillingUnfetchedProductStatus
{
    Unknown = 0,
    InvalidProductIdFormat = 2,
    ProductNotFound = 3,
    NoEligibleOffer = 4
}

enum GooglePlayBillingInAppMessageResponseCode
{
    NoActionNeeded = 0,
    SubscriptionStatusUpdated = 1
}

enum GooglePlayBillingChoiceScreenType
{
    Unspecified = 0,
    DeveloperRendered = 1,
    GoogleRendered = 2
}

enum GooglePlayBillingInAppMessageCategory
{
    Unknown = 0,
    SubscriptionUpdate = 1,
    PriceChange = 2
}

// #####################################################################
// # Constructors
// #####################################################################

/**
 * @returns {Struct.GooglePlayBillingInitOptions}
 */
function GooglePlayBillingInitOptions() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 1048535493;

    self.enable_auto_service_reconnection = undefined;
    self.enable_prepaid_plans = undefined;
    self.enable_alternative_billing_only = undefined;
    self.enable_external_content_link = undefined;
    self.enable_external_offer = undefined;
    self.enable_external_payments = undefined;
    self.enable_billing_choice = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingProductInput}
 */
function GooglePlayBillingProductInput() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 2620246;

    self.product_id = undefined;
    self.product_type = undefined;
    self.dynamic_product_token = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingSubscriptionUpdateParams}
 */
function GooglePlayBillingSubscriptionUpdateParams() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 3671844645;

    self.old_purchase_token = undefined;
    self.old_product_id = undefined;
    self.replacement_mode = undefined;
    self.original_external_transaction_id = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingFlowOptions}
 */
function GooglePlayBillingFlowOptions() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 2954505059;

    self.is_offer_personalized = undefined;
    self.obfuscated_account_id = undefined;
    self.obfuscated_profile_id = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingInAppMessageOptions}
 */
function GooglePlayBillingInAppMessageOptions() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 2338048100;

    self.categories = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingResult}
 */
function GooglePlayBillingResult() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 2103178162;

    self.code = undefined;
    self.message = undefined;
    self.sub_response_code = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingConfig}
 */
function GooglePlayBillingConfig() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 2192142217;

    self.country_code = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingRentalDetails}
 */
function GooglePlayBillingRentalDetails() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 1967241797;

    self.rental_period = undefined;
    self.rental_expiration_period = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingPreorderDetails}
 */
function GooglePlayBillingPreorderDetails() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 1622783594;

    self.preorder_release_time = undefined;
    self.preorder_presale_end_time = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingDiscountAmount}
 */
function GooglePlayBillingDiscountAmount() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 271168832;

    self.formatted_discount_amount = undefined;
    self.discount_amount_micros = undefined;
    self.discount_amount_currency_code = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingLimitedQuantityInfo}
 */
function GooglePlayBillingLimitedQuantityInfo() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 2296699910;

    self.maximum_quantity = undefined;
    self.remaining_quantity = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingValidTimeWindow}
 */
function GooglePlayBillingValidTimeWindow() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 2476745770;

    self.start_time = undefined;
    self.end_time = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingPricingPhase}
 */
function GooglePlayBillingPricingPhase() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 1162554642;

    self.formatted_price = undefined;
    self.price_amount_micros = undefined;
    self.price_currency_code = undefined;
    self.billing_cycle_count = undefined;
    self.billing_period = undefined;
    self.recurrence_mode = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingInstallmentPlanDetails}
 */
function GooglePlayBillingInstallmentPlanDetails() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 2249750345;

    self.commitment_payments_count = undefined;
    self.subsequent_commitment_payments_count = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingAccountIdentifiers}
 */
function GooglePlayBillingAccountIdentifiers() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 2459787690;

    self.obfuscated_account_id = undefined;
    self.obfuscated_profile_id = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingPendingPurchaseUpdate}
 */
function GooglePlayBillingPendingPurchaseUpdate() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 155200688;

    self.purchase_token = undefined;
    self.products = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingUnfetchedProduct}
 */
function GooglePlayBillingUnfetchedProduct() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 521953500;

    self.product_id = undefined;
    self.product_type = undefined;
    self.status_code = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingReportingDetails}
 */
function GooglePlayBillingReportingDetails() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 1136203195;

    self.billing_program = undefined;
    self.external_transaction_token = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingChoiceAvailabilityDetails}
 */
function GooglePlayBillingChoiceAvailabilityDetails() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 3922471387;

    self.choice_screen_type = undefined;
    self.external_link_available = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingInAppMessageResult}
 */
function GooglePlayBillingInAppMessageResult() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 53882195;

    self.response_code = undefined;
    self.purchase_token = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingChoiceInfo}
 */
function GooglePlayBillingChoiceInfo() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 2050711684;

    self.billing_choice_image_url = undefined;
    self.loyalty_info = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingExternalLinkLaunchOptions}
 */
function GooglePlayBillingExternalLinkLaunchOptions() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 1626011839;

    self.billing_program = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingProductDetailsParams}
 */
function GooglePlayBillingProductDetailsParams() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 1292963414;

    self.product_id = undefined;
    self.offer_token = undefined;
    self.subscription_replacement = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingDiscountDisplayInfo}
 */
function GooglePlayBillingDiscountDisplayInfo() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 2459581066;

    self.percentage_discount = undefined;
    self.discount_amount = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingSubscriptionOfferDetails}
 */
function GooglePlayBillingSubscriptionOfferDetails() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 1754328638;

    self.base_plan_id = undefined;
    self.offer_id = undefined;
    self.offer_tags = undefined;
    self.offer_token = undefined;
    self.pricing_phases = undefined;
    self.installment_plan_details = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingPurchase}
 */
function GooglePlayBillingPurchase() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 3738190908;

    self.order_id = undefined;
    self.package_name = undefined;
    self.purchase_time = undefined;
    self.purchase_token = undefined;
    self.products = undefined;
    self.signature = undefined;
    self.is_acknowledged = undefined;
    self.is_auto_renewing = undefined;
    self.purchase_state = undefined;
    self.quantity = undefined;
    self.original_json = undefined;
    self.is_suspended = undefined;
    self.account_identifiers = undefined;
    self.pending_purchase_update = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingProgramAvailabilityDetails}
 */
function GooglePlayBillingProgramAvailabilityDetails() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 1227185620;

    self.billing_program = undefined;
    self.billing_choice_details = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingOneTimePurchaseOfferDetails}
 */
function GooglePlayBillingOneTimePurchaseOfferDetails() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 2826199879;

    self.formatted_price = undefined;
    self.price_amount_micros = undefined;
    self.price_currency_code = undefined;
    self.offer_id = undefined;
    self.offer_token = undefined;
    self.offer_tags = undefined;
    self.purchase_option_id = undefined;
    self.full_price_micros = undefined;
    self.rental_details = undefined;
    self.preorder_details = undefined;
    self.discount_display_info = undefined;
    self.limited_quantity_info = undefined;
    self.valid_time_window = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingProductDetails}
 */
function GooglePlayBillingProductDetails() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 2612326192;

    self.product_id = undefined;
    self.name = undefined;
    self.title = undefined;
    self.description = undefined;
    self.product_type = undefined;
    self.one_time_purchase_offer_details = undefined;
    self.subscription_offer_details = undefined;

}

/**
 * @returns {Struct.GooglePlayBillingProductDetailsQueryResult}
 */
function GooglePlayBillingProductDetailsQueryResult() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 274397069;

    self.products = undefined;
    self.unfetched_products = undefined;

}

// #####################################################################
// # Codecs
// #####################################################################

/**
 * @func __GooglePlayBillingInitOptions_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingInitOptions} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingInitOptions_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: enable_auto_service_reconnection, type: optional<Bool>
        if (is_undefined(self.enable_auto_service_reconnection))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_bool(self.enable_auto_service_reconnection)) show_error($"{_where} :: self.enable_auto_service_reconnection expected bool", true);
            buffer_write(_buffer, buffer_bool, self.enable_auto_service_reconnection);
        }

        // field: enable_prepaid_plans, type: optional<Bool>
        if (is_undefined(self.enable_prepaid_plans))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_bool(self.enable_prepaid_plans)) show_error($"{_where} :: self.enable_prepaid_plans expected bool", true);
            buffer_write(_buffer, buffer_bool, self.enable_prepaid_plans);
        }

        // field: enable_alternative_billing_only, type: optional<Bool>
        if (is_undefined(self.enable_alternative_billing_only))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_bool(self.enable_alternative_billing_only)) show_error($"{_where} :: self.enable_alternative_billing_only expected bool", true);
            buffer_write(_buffer, buffer_bool, self.enable_alternative_billing_only);
        }

        // field: enable_external_content_link, type: optional<Bool>
        if (is_undefined(self.enable_external_content_link))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_bool(self.enable_external_content_link)) show_error($"{_where} :: self.enable_external_content_link expected bool", true);
            buffer_write(_buffer, buffer_bool, self.enable_external_content_link);
        }

        // field: enable_external_offer, type: optional<Bool>
        if (is_undefined(self.enable_external_offer))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_bool(self.enable_external_offer)) show_error($"{_where} :: self.enable_external_offer expected bool", true);
            buffer_write(_buffer, buffer_bool, self.enable_external_offer);
        }

        // field: enable_external_payments, type: optional<Bool>
        if (is_undefined(self.enable_external_payments))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_bool(self.enable_external_payments)) show_error($"{_where} :: self.enable_external_payments expected bool", true);
            buffer_write(_buffer, buffer_bool, self.enable_external_payments);
        }

        // field: enable_billing_choice, type: optional<Bool>
        if (is_undefined(self.enable_billing_choice))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_bool(self.enable_billing_choice)) show_error($"{_where} :: self.enable_billing_choice expected bool", true);
            buffer_write(_buffer, buffer_bool, self.enable_billing_choice);
        }

    }
}

/**
 * @func __GooglePlayBillingInitOptions_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingInitOptions}
 * @ignore
 */
function __GooglePlayBillingInitOptions_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingInitOptions();
    with (_inst)
    {
        // field: enable_auto_service_reconnection, type: optional<Bool>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.enable_auto_service_reconnection = buffer_read(_buffer, buffer_bool);
        }
        else
        {
            self.enable_auto_service_reconnection = undefined;
        }

        // field: enable_prepaid_plans, type: optional<Bool>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.enable_prepaid_plans = buffer_read(_buffer, buffer_bool);
        }
        else
        {
            self.enable_prepaid_plans = undefined;
        }

        // field: enable_alternative_billing_only, type: optional<Bool>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.enable_alternative_billing_only = buffer_read(_buffer, buffer_bool);
        }
        else
        {
            self.enable_alternative_billing_only = undefined;
        }

        // field: enable_external_content_link, type: optional<Bool>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.enable_external_content_link = buffer_read(_buffer, buffer_bool);
        }
        else
        {
            self.enable_external_content_link = undefined;
        }

        // field: enable_external_offer, type: optional<Bool>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.enable_external_offer = buffer_read(_buffer, buffer_bool);
        }
        else
        {
            self.enable_external_offer = undefined;
        }

        // field: enable_external_payments, type: optional<Bool>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.enable_external_payments = buffer_read(_buffer, buffer_bool);
        }
        else
        {
            self.enable_external_payments = undefined;
        }

        // field: enable_billing_choice, type: optional<Bool>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.enable_billing_choice = buffer_read(_buffer, buffer_bool);
        }
        else
        {
            self.enable_billing_choice = undefined;
        }

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingProductInput_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingProductInput} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingProductInput_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: product_id, type: String
        if (!is_string(self.product_id)) show_error($"{_where} :: self.product_id expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.product_id));
        buffer_write(_buffer, buffer_string, self.product_id);

        // field: product_type, type: enum GooglePlayBillingProductType

        if (!is_numeric(self.product_type)) show_error($"{_where} :: self.product_type expected number", true);
        buffer_write(_buffer, buffer_s32, self.product_type);

        // field: dynamic_product_token, type: optional<String>
        if (is_undefined(self.dynamic_product_token))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.dynamic_product_token)) show_error($"{_where} :: self.dynamic_product_token expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.dynamic_product_token));
            buffer_write(_buffer, buffer_string, self.dynamic_product_token);
        }

    }
}

/**
 * @func __GooglePlayBillingProductInput_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingProductInput}
 * @ignore
 */
function __GooglePlayBillingProductInput_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingProductInput();
    with (_inst)
    {
        // field: product_id, type: String
        buffer_read(_buffer, buffer_u32);
        self.product_id = buffer_read(_buffer, buffer_string);

        // field: product_type, type: enum GooglePlayBillingProductType
        self.product_type = buffer_read(_buffer, buffer_s32);

        // field: dynamic_product_token, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.dynamic_product_token = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.dynamic_product_token = undefined;
        }

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingSubscriptionUpdateParams_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingSubscriptionUpdateParams} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingSubscriptionUpdateParams_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: old_purchase_token, type: String
        if (!is_string(self.old_purchase_token)) show_error($"{_where} :: self.old_purchase_token expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.old_purchase_token));
        buffer_write(_buffer, buffer_string, self.old_purchase_token);

        // field: old_product_id, type: String
        if (!is_string(self.old_product_id)) show_error($"{_where} :: self.old_product_id expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.old_product_id));
        buffer_write(_buffer, buffer_string, self.old_product_id);

        // field: replacement_mode, type: enum GooglePlayBillingSubscriptionReplacementMode

        if (!is_numeric(self.replacement_mode)) show_error($"{_where} :: self.replacement_mode expected number", true);
        buffer_write(_buffer, buffer_s32, self.replacement_mode);

        // field: original_external_transaction_id, type: optional<String>
        if (is_undefined(self.original_external_transaction_id))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.original_external_transaction_id)) show_error($"{_where} :: self.original_external_transaction_id expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.original_external_transaction_id));
            buffer_write(_buffer, buffer_string, self.original_external_transaction_id);
        }

    }
}

/**
 * @func __GooglePlayBillingSubscriptionUpdateParams_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingSubscriptionUpdateParams}
 * @ignore
 */
function __GooglePlayBillingSubscriptionUpdateParams_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingSubscriptionUpdateParams();
    with (_inst)
    {
        // field: old_purchase_token, type: String
        buffer_read(_buffer, buffer_u32);
        self.old_purchase_token = buffer_read(_buffer, buffer_string);

        // field: old_product_id, type: String
        buffer_read(_buffer, buffer_u32);
        self.old_product_id = buffer_read(_buffer, buffer_string);

        // field: replacement_mode, type: enum GooglePlayBillingSubscriptionReplacementMode
        self.replacement_mode = buffer_read(_buffer, buffer_s32);

        // field: original_external_transaction_id, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.original_external_transaction_id = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.original_external_transaction_id = undefined;
        }

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingFlowOptions_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingFlowOptions} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingFlowOptions_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: is_offer_personalized, type: optional<Bool>
        if (is_undefined(self.is_offer_personalized))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_bool(self.is_offer_personalized)) show_error($"{_where} :: self.is_offer_personalized expected bool", true);
            buffer_write(_buffer, buffer_bool, self.is_offer_personalized);
        }

        // field: obfuscated_account_id, type: optional<String>
        if (is_undefined(self.obfuscated_account_id))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.obfuscated_account_id)) show_error($"{_where} :: self.obfuscated_account_id expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.obfuscated_account_id));
            buffer_write(_buffer, buffer_string, self.obfuscated_account_id);
        }

        // field: obfuscated_profile_id, type: optional<String>
        if (is_undefined(self.obfuscated_profile_id))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.obfuscated_profile_id)) show_error($"{_where} :: self.obfuscated_profile_id expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.obfuscated_profile_id));
            buffer_write(_buffer, buffer_string, self.obfuscated_profile_id);
        }

    }
}

/**
 * @func __GooglePlayBillingFlowOptions_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingFlowOptions}
 * @ignore
 */
function __GooglePlayBillingFlowOptions_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingFlowOptions();
    with (_inst)
    {
        // field: is_offer_personalized, type: optional<Bool>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.is_offer_personalized = buffer_read(_buffer, buffer_bool);
        }
        else
        {
            self.is_offer_personalized = undefined;
        }

        // field: obfuscated_account_id, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.obfuscated_account_id = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.obfuscated_account_id = undefined;
        }

        // field: obfuscated_profile_id, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.obfuscated_profile_id = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.obfuscated_profile_id = undefined;
        }

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingInAppMessageOptions_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingInAppMessageOptions} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingInAppMessageOptions_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: categories, type: enum GooglePlayBillingInAppMessageCategory[]
        if (!is_array(self.categories)) show_error($"{_where} :: self.categories expected array", true);
        var _length = array_length(self.categories);
        buffer_write(_buffer, buffer_u32, _length);
        for (var _i = 0; _i < _length; ++_i)
        {

            if (!is_numeric(self.categories[_i])) show_error($"{_where} :: self.categories[_i] expected number", true);
            buffer_write(_buffer, buffer_s32, self.categories[_i]);
        }

    }
}

/**
 * @func __GooglePlayBillingInAppMessageOptions_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingInAppMessageOptions}
 * @ignore
 */
function __GooglePlayBillingInAppMessageOptions_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingInAppMessageOptions();
    with (_inst)
    {
        // field: categories, type: enum GooglePlayBillingInAppMessageCategory[]
        var _length = buffer_read(_buffer, buffer_u32);
        self.categories = array_create(_length);
        for (var _i = 0; _i < _length; ++_i)
        {
            self.categories[_i] = buffer_read(_buffer, buffer_s32);
        }

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingResult_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingResult} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingResult_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: code, type: enum GooglePlayBillingResponseCode

        if (!is_numeric(self.code)) show_error($"{_where} :: self.code expected number", true);
        buffer_write(_buffer, buffer_s32, self.code);

        // field: message, type: optional<String>
        if (is_undefined(self.message))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.message)) show_error($"{_where} :: self.message expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.message));
            buffer_write(_buffer, buffer_string, self.message);
        }

        // field: sub_response_code, type: enum GooglePlayBillingPurchasesUpdatedSubResponseCode

        if (!is_numeric(self.sub_response_code)) show_error($"{_where} :: self.sub_response_code expected number", true);
        buffer_write(_buffer, buffer_s32, self.sub_response_code);

    }
}

/**
 * @func __GooglePlayBillingResult_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingResult}
 * @ignore
 */
function __GooglePlayBillingResult_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingResult();
    with (_inst)
    {
        // field: code, type: enum GooglePlayBillingResponseCode
        self.code = buffer_read(_buffer, buffer_s32);

        // field: message, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.message = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.message = undefined;
        }

        // field: sub_response_code, type: enum GooglePlayBillingPurchasesUpdatedSubResponseCode
        self.sub_response_code = buffer_read(_buffer, buffer_s32);

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingConfig_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingConfig} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingConfig_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: country_code, type: String
        if (!is_string(self.country_code)) show_error($"{_where} :: self.country_code expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.country_code));
        buffer_write(_buffer, buffer_string, self.country_code);

    }
}

/**
 * @func __GooglePlayBillingConfig_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingConfig}
 * @ignore
 */
function __GooglePlayBillingConfig_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingConfig();
    with (_inst)
    {
        // field: country_code, type: String
        buffer_read(_buffer, buffer_u32);
        self.country_code = buffer_read(_buffer, buffer_string);

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingRentalDetails_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingRentalDetails} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingRentalDetails_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: rental_period, type: String
        if (!is_string(self.rental_period)) show_error($"{_where} :: self.rental_period expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.rental_period));
        buffer_write(_buffer, buffer_string, self.rental_period);

        // field: rental_expiration_period, type: optional<String>
        if (is_undefined(self.rental_expiration_period))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.rental_expiration_period)) show_error($"{_where} :: self.rental_expiration_period expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.rental_expiration_period));
            buffer_write(_buffer, buffer_string, self.rental_expiration_period);
        }

    }
}

/**
 * @func __GooglePlayBillingRentalDetails_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingRentalDetails}
 * @ignore
 */
function __GooglePlayBillingRentalDetails_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingRentalDetails();
    with (_inst)
    {
        // field: rental_period, type: String
        buffer_read(_buffer, buffer_u32);
        self.rental_period = buffer_read(_buffer, buffer_string);

        // field: rental_expiration_period, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.rental_expiration_period = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.rental_expiration_period = undefined;
        }

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingPreorderDetails_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingPreorderDetails} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingPreorderDetails_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: preorder_release_time, type: Float64
        if (!is_numeric(self.preorder_release_time)) show_error($"{_where} :: self.preorder_release_time expected number", true);
        buffer_write(_buffer, buffer_f64, self.preorder_release_time);

        // field: preorder_presale_end_time, type: Float64
        if (!is_numeric(self.preorder_presale_end_time)) show_error($"{_where} :: self.preorder_presale_end_time expected number", true);
        buffer_write(_buffer, buffer_f64, self.preorder_presale_end_time);

    }
}

/**
 * @func __GooglePlayBillingPreorderDetails_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingPreorderDetails}
 * @ignore
 */
function __GooglePlayBillingPreorderDetails_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingPreorderDetails();
    with (_inst)
    {
        // field: preorder_release_time, type: Float64
        self.preorder_release_time = buffer_read(_buffer, buffer_f64);

        // field: preorder_presale_end_time, type: Float64
        self.preorder_presale_end_time = buffer_read(_buffer, buffer_f64);

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingDiscountAmount_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingDiscountAmount} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingDiscountAmount_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: formatted_discount_amount, type: String
        if (!is_string(self.formatted_discount_amount)) show_error($"{_where} :: self.formatted_discount_amount expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.formatted_discount_amount));
        buffer_write(_buffer, buffer_string, self.formatted_discount_amount);

        // field: discount_amount_micros, type: Float64
        if (!is_numeric(self.discount_amount_micros)) show_error($"{_where} :: self.discount_amount_micros expected number", true);
        buffer_write(_buffer, buffer_f64, self.discount_amount_micros);

        // field: discount_amount_currency_code, type: String
        if (!is_string(self.discount_amount_currency_code)) show_error($"{_where} :: self.discount_amount_currency_code expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.discount_amount_currency_code));
        buffer_write(_buffer, buffer_string, self.discount_amount_currency_code);

    }
}

/**
 * @func __GooglePlayBillingDiscountAmount_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingDiscountAmount}
 * @ignore
 */
function __GooglePlayBillingDiscountAmount_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingDiscountAmount();
    with (_inst)
    {
        // field: formatted_discount_amount, type: String
        buffer_read(_buffer, buffer_u32);
        self.formatted_discount_amount = buffer_read(_buffer, buffer_string);

        // field: discount_amount_micros, type: Float64
        self.discount_amount_micros = buffer_read(_buffer, buffer_f64);

        // field: discount_amount_currency_code, type: String
        buffer_read(_buffer, buffer_u32);
        self.discount_amount_currency_code = buffer_read(_buffer, buffer_string);

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingLimitedQuantityInfo_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingLimitedQuantityInfo} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingLimitedQuantityInfo_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: maximum_quantity, type: Int32
        if (!is_numeric(self.maximum_quantity)) show_error($"{_where} :: self.maximum_quantity expected number", true);
        buffer_write(_buffer, buffer_s32, self.maximum_quantity);

        // field: remaining_quantity, type: Int32
        if (!is_numeric(self.remaining_quantity)) show_error($"{_where} :: self.remaining_quantity expected number", true);
        buffer_write(_buffer, buffer_s32, self.remaining_quantity);

    }
}

/**
 * @func __GooglePlayBillingLimitedQuantityInfo_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingLimitedQuantityInfo}
 * @ignore
 */
function __GooglePlayBillingLimitedQuantityInfo_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingLimitedQuantityInfo();
    with (_inst)
    {
        // field: maximum_quantity, type: Int32
        self.maximum_quantity = buffer_read(_buffer, buffer_s32);

        // field: remaining_quantity, type: Int32
        self.remaining_quantity = buffer_read(_buffer, buffer_s32);

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingValidTimeWindow_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingValidTimeWindow} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingValidTimeWindow_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: start_time, type: optional<Float64>
        if (is_undefined(self.start_time))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_numeric(self.start_time)) show_error($"{_where} :: self.start_time expected number", true);
            buffer_write(_buffer, buffer_f64, self.start_time);
        }

        // field: end_time, type: optional<Float64>
        if (is_undefined(self.end_time))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_numeric(self.end_time)) show_error($"{_where} :: self.end_time expected number", true);
            buffer_write(_buffer, buffer_f64, self.end_time);
        }

    }
}

/**
 * @func __GooglePlayBillingValidTimeWindow_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingValidTimeWindow}
 * @ignore
 */
function __GooglePlayBillingValidTimeWindow_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingValidTimeWindow();
    with (_inst)
    {
        // field: start_time, type: optional<Float64>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.start_time = buffer_read(_buffer, buffer_f64);
        }
        else
        {
            self.start_time = undefined;
        }

        // field: end_time, type: optional<Float64>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.end_time = buffer_read(_buffer, buffer_f64);
        }
        else
        {
            self.end_time = undefined;
        }

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingPricingPhase_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingPricingPhase} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingPricingPhase_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: formatted_price, type: String
        if (!is_string(self.formatted_price)) show_error($"{_where} :: self.formatted_price expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.formatted_price));
        buffer_write(_buffer, buffer_string, self.formatted_price);

        // field: price_amount_micros, type: Float64
        if (!is_numeric(self.price_amount_micros)) show_error($"{_where} :: self.price_amount_micros expected number", true);
        buffer_write(_buffer, buffer_f64, self.price_amount_micros);

        // field: price_currency_code, type: String
        if (!is_string(self.price_currency_code)) show_error($"{_where} :: self.price_currency_code expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.price_currency_code));
        buffer_write(_buffer, buffer_string, self.price_currency_code);

        // field: billing_cycle_count, type: Int32
        if (!is_numeric(self.billing_cycle_count)) show_error($"{_where} :: self.billing_cycle_count expected number", true);
        buffer_write(_buffer, buffer_s32, self.billing_cycle_count);

        // field: billing_period, type: String
        if (!is_string(self.billing_period)) show_error($"{_where} :: self.billing_period expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.billing_period));
        buffer_write(_buffer, buffer_string, self.billing_period);

        // field: recurrence_mode, type: enum GooglePlayBillingRecurrenceMode

        if (!is_numeric(self.recurrence_mode)) show_error($"{_where} :: self.recurrence_mode expected number", true);
        buffer_write(_buffer, buffer_s32, self.recurrence_mode);

    }
}

/**
 * @func __GooglePlayBillingPricingPhase_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingPricingPhase}
 * @ignore
 */
function __GooglePlayBillingPricingPhase_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingPricingPhase();
    with (_inst)
    {
        // field: formatted_price, type: String
        buffer_read(_buffer, buffer_u32);
        self.formatted_price = buffer_read(_buffer, buffer_string);

        // field: price_amount_micros, type: Float64
        self.price_amount_micros = buffer_read(_buffer, buffer_f64);

        // field: price_currency_code, type: String
        buffer_read(_buffer, buffer_u32);
        self.price_currency_code = buffer_read(_buffer, buffer_string);

        // field: billing_cycle_count, type: Int32
        self.billing_cycle_count = buffer_read(_buffer, buffer_s32);

        // field: billing_period, type: String
        buffer_read(_buffer, buffer_u32);
        self.billing_period = buffer_read(_buffer, buffer_string);

        // field: recurrence_mode, type: enum GooglePlayBillingRecurrenceMode
        self.recurrence_mode = buffer_read(_buffer, buffer_s32);

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingInstallmentPlanDetails_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingInstallmentPlanDetails} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingInstallmentPlanDetails_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: commitment_payments_count, type: Int32
        if (!is_numeric(self.commitment_payments_count)) show_error($"{_where} :: self.commitment_payments_count expected number", true);
        buffer_write(_buffer, buffer_s32, self.commitment_payments_count);

        // field: subsequent_commitment_payments_count, type: Int32
        if (!is_numeric(self.subsequent_commitment_payments_count)) show_error($"{_where} :: self.subsequent_commitment_payments_count expected number", true);
        buffer_write(_buffer, buffer_s32, self.subsequent_commitment_payments_count);

    }
}

/**
 * @func __GooglePlayBillingInstallmentPlanDetails_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingInstallmentPlanDetails}
 * @ignore
 */
function __GooglePlayBillingInstallmentPlanDetails_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingInstallmentPlanDetails();
    with (_inst)
    {
        // field: commitment_payments_count, type: Int32
        self.commitment_payments_count = buffer_read(_buffer, buffer_s32);

        // field: subsequent_commitment_payments_count, type: Int32
        self.subsequent_commitment_payments_count = buffer_read(_buffer, buffer_s32);

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingAccountIdentifiers_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingAccountIdentifiers} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingAccountIdentifiers_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: obfuscated_account_id, type: optional<String>
        if (is_undefined(self.obfuscated_account_id))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.obfuscated_account_id)) show_error($"{_where} :: self.obfuscated_account_id expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.obfuscated_account_id));
            buffer_write(_buffer, buffer_string, self.obfuscated_account_id);
        }

        // field: obfuscated_profile_id, type: optional<String>
        if (is_undefined(self.obfuscated_profile_id))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.obfuscated_profile_id)) show_error($"{_where} :: self.obfuscated_profile_id expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.obfuscated_profile_id));
            buffer_write(_buffer, buffer_string, self.obfuscated_profile_id);
        }

    }
}

/**
 * @func __GooglePlayBillingAccountIdentifiers_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingAccountIdentifiers}
 * @ignore
 */
function __GooglePlayBillingAccountIdentifiers_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingAccountIdentifiers();
    with (_inst)
    {
        // field: obfuscated_account_id, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.obfuscated_account_id = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.obfuscated_account_id = undefined;
        }

        // field: obfuscated_profile_id, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.obfuscated_profile_id = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.obfuscated_profile_id = undefined;
        }

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingPendingPurchaseUpdate_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingPendingPurchaseUpdate} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingPendingPurchaseUpdate_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: purchase_token, type: String
        if (!is_string(self.purchase_token)) show_error($"{_where} :: self.purchase_token expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.purchase_token));
        buffer_write(_buffer, buffer_string, self.purchase_token);

        // field: products, type: String[]
        if (!is_array(self.products)) show_error($"{_where} :: self.products expected array", true);
        var _length = array_length(self.products);
        buffer_write(_buffer, buffer_u32, _length);
        for (var _i = 0; _i < _length; ++_i)
        {
            if (!is_string(self.products[_i])) show_error($"{_where} :: self.products[_i] expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.products[_i]));
            buffer_write(_buffer, buffer_string, self.products[_i]);
        }

    }
}

/**
 * @func __GooglePlayBillingPendingPurchaseUpdate_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingPendingPurchaseUpdate}
 * @ignore
 */
function __GooglePlayBillingPendingPurchaseUpdate_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingPendingPurchaseUpdate();
    with (_inst)
    {
        // field: purchase_token, type: String
        buffer_read(_buffer, buffer_u32);
        self.purchase_token = buffer_read(_buffer, buffer_string);

        // field: products, type: String[]
        var _length = buffer_read(_buffer, buffer_u32);
        self.products = array_create(_length);
        for (var _i = 0; _i < _length; ++_i)
        {
            buffer_read(_buffer, buffer_u32);
            self.products[_i] = buffer_read(_buffer, buffer_string);
        }

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingUnfetchedProduct_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingUnfetchedProduct} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingUnfetchedProduct_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: product_id, type: String
        if (!is_string(self.product_id)) show_error($"{_where} :: self.product_id expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.product_id));
        buffer_write(_buffer, buffer_string, self.product_id);

        // field: product_type, type: enum GooglePlayBillingProductType

        if (!is_numeric(self.product_type)) show_error($"{_where} :: self.product_type expected number", true);
        buffer_write(_buffer, buffer_s32, self.product_type);

        // field: status_code, type: enum GooglePlayBillingUnfetchedProductStatus

        if (!is_numeric(self.status_code)) show_error($"{_where} :: self.status_code expected number", true);
        buffer_write(_buffer, buffer_s32, self.status_code);

    }
}

/**
 * @func __GooglePlayBillingUnfetchedProduct_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingUnfetchedProduct}
 * @ignore
 */
function __GooglePlayBillingUnfetchedProduct_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingUnfetchedProduct();
    with (_inst)
    {
        // field: product_id, type: String
        buffer_read(_buffer, buffer_u32);
        self.product_id = buffer_read(_buffer, buffer_string);

        // field: product_type, type: enum GooglePlayBillingProductType
        self.product_type = buffer_read(_buffer, buffer_s32);

        // field: status_code, type: enum GooglePlayBillingUnfetchedProductStatus
        self.status_code = buffer_read(_buffer, buffer_s32);

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingReportingDetails_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingReportingDetails} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingReportingDetails_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: billing_program, type: optional<enum GooglePlayBillingProgram>
        if (is_undefined(self.billing_program))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);

            if (!is_numeric(self.billing_program)) show_error($"{_where} :: self.billing_program expected number", true);
            buffer_write(_buffer, buffer_s32, self.billing_program);
        }

        // field: external_transaction_token, type: String
        if (!is_string(self.external_transaction_token)) show_error($"{_where} :: self.external_transaction_token expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.external_transaction_token));
        buffer_write(_buffer, buffer_string, self.external_transaction_token);

    }
}

/**
 * @func __GooglePlayBillingReportingDetails_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingReportingDetails}
 * @ignore
 */
function __GooglePlayBillingReportingDetails_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingReportingDetails();
    with (_inst)
    {
        // field: billing_program, type: optional<enum GooglePlayBillingProgram>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.billing_program = buffer_read(_buffer, buffer_s32);
        }
        else
        {
            self.billing_program = undefined;
        }

        // field: external_transaction_token, type: String
        buffer_read(_buffer, buffer_u32);
        self.external_transaction_token = buffer_read(_buffer, buffer_string);

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingChoiceAvailabilityDetails_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingChoiceAvailabilityDetails} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingChoiceAvailabilityDetails_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: choice_screen_type, type: enum GooglePlayBillingChoiceScreenType

        if (!is_numeric(self.choice_screen_type)) show_error($"{_where} :: self.choice_screen_type expected number", true);
        buffer_write(_buffer, buffer_s32, self.choice_screen_type);

        // field: external_link_available, type: Bool
        if (!is_bool(self.external_link_available)) show_error($"{_where} :: self.external_link_available expected bool", true);
        buffer_write(_buffer, buffer_bool, self.external_link_available);

    }
}

/**
 * @func __GooglePlayBillingChoiceAvailabilityDetails_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingChoiceAvailabilityDetails}
 * @ignore
 */
function __GooglePlayBillingChoiceAvailabilityDetails_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingChoiceAvailabilityDetails();
    with (_inst)
    {
        // field: choice_screen_type, type: enum GooglePlayBillingChoiceScreenType
        self.choice_screen_type = buffer_read(_buffer, buffer_s32);

        // field: external_link_available, type: Bool
        self.external_link_available = buffer_read(_buffer, buffer_bool);

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingInAppMessageResult_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingInAppMessageResult} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingInAppMessageResult_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: response_code, type: enum GooglePlayBillingInAppMessageResponseCode

        if (!is_numeric(self.response_code)) show_error($"{_where} :: self.response_code expected number", true);
        buffer_write(_buffer, buffer_s32, self.response_code);

        // field: purchase_token, type: optional<String>
        if (is_undefined(self.purchase_token))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.purchase_token)) show_error($"{_where} :: self.purchase_token expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.purchase_token));
            buffer_write(_buffer, buffer_string, self.purchase_token);
        }

    }
}

/**
 * @func __GooglePlayBillingInAppMessageResult_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingInAppMessageResult}
 * @ignore
 */
function __GooglePlayBillingInAppMessageResult_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingInAppMessageResult();
    with (_inst)
    {
        // field: response_code, type: enum GooglePlayBillingInAppMessageResponseCode
        self.response_code = buffer_read(_buffer, buffer_s32);

        // field: purchase_token, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.purchase_token = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.purchase_token = undefined;
        }

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingChoiceInfo_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingChoiceInfo} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingChoiceInfo_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: billing_choice_image_url, type: optional<String>
        if (is_undefined(self.billing_choice_image_url))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.billing_choice_image_url)) show_error($"{_where} :: self.billing_choice_image_url expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.billing_choice_image_url));
            buffer_write(_buffer, buffer_string, self.billing_choice_image_url);
        }

        // field: loyalty_info, type: optional<String>
        if (is_undefined(self.loyalty_info))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.loyalty_info)) show_error($"{_where} :: self.loyalty_info expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.loyalty_info));
            buffer_write(_buffer, buffer_string, self.loyalty_info);
        }

    }
}

/**
 * @func __GooglePlayBillingChoiceInfo_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingChoiceInfo}
 * @ignore
 */
function __GooglePlayBillingChoiceInfo_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingChoiceInfo();
    with (_inst)
    {
        // field: billing_choice_image_url, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.billing_choice_image_url = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.billing_choice_image_url = undefined;
        }

        // field: loyalty_info, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.loyalty_info = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.loyalty_info = undefined;
        }

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingExternalLinkLaunchOptions_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingExternalLinkLaunchOptions} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingExternalLinkLaunchOptions_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: billing_program, type: enum GooglePlayBillingProgram

        if (!is_numeric(self.billing_program)) show_error($"{_where} :: self.billing_program expected number", true);
        buffer_write(_buffer, buffer_s32, self.billing_program);

    }
}

/**
 * @func __GooglePlayBillingExternalLinkLaunchOptions_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingExternalLinkLaunchOptions}
 * @ignore
 */
function __GooglePlayBillingExternalLinkLaunchOptions_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingExternalLinkLaunchOptions();
    with (_inst)
    {
        // field: billing_program, type: enum GooglePlayBillingProgram
        self.billing_program = buffer_read(_buffer, buffer_s32);

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingProductDetailsParams_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingProductDetailsParams} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingProductDetailsParams_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: product_id, type: String
        if (!is_string(self.product_id)) show_error($"{_where} :: self.product_id expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.product_id));
        buffer_write(_buffer, buffer_string, self.product_id);

        // field: offer_token, type: optional<String>
        if (is_undefined(self.offer_token))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.offer_token)) show_error($"{_where} :: self.offer_token expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.offer_token));
            buffer_write(_buffer, buffer_string, self.offer_token);
        }

        // field: subscription_replacement, type: optional<struct GooglePlayBillingSubscriptionUpdateParams>
        if (is_undefined(self.subscription_replacement))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (self.subscription_replacement.__uid != 3671844645) show_error($"{_where} :: self.subscription_replacement expected GooglePlayBillingSubscriptionUpdateParams", true);
            __GooglePlayBillingSubscriptionUpdateParams_encode(self.subscription_replacement, _buffer, buffer_tell(_buffer), _where);
        }

    }
}

/**
 * @func __GooglePlayBillingProductDetailsParams_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingProductDetailsParams}
 * @ignore
 */
function __GooglePlayBillingProductDetailsParams_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingProductDetailsParams();
    with (_inst)
    {
        // field: product_id, type: String
        buffer_read(_buffer, buffer_u32);
        self.product_id = buffer_read(_buffer, buffer_string);

        // field: offer_token, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.offer_token = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.offer_token = undefined;
        }

        // field: subscription_replacement, type: optional<struct GooglePlayBillingSubscriptionUpdateParams>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.subscription_replacement = __GooglePlayBillingSubscriptionUpdateParams_decode(_buffer, buffer_tell(_buffer));
        }
        else
        {
            self.subscription_replacement = undefined;
        }

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingDiscountDisplayInfo_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingDiscountDisplayInfo} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingDiscountDisplayInfo_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: percentage_discount, type: optional<Int32>
        if (is_undefined(self.percentage_discount))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_numeric(self.percentage_discount)) show_error($"{_where} :: self.percentage_discount expected number", true);
            buffer_write(_buffer, buffer_s32, self.percentage_discount);
        }

        // field: discount_amount, type: optional<struct GooglePlayBillingDiscountAmount>
        if (is_undefined(self.discount_amount))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (self.discount_amount.__uid != 271168832) show_error($"{_where} :: self.discount_amount expected GooglePlayBillingDiscountAmount", true);
            __GooglePlayBillingDiscountAmount_encode(self.discount_amount, _buffer, buffer_tell(_buffer), _where);
        }

    }
}

/**
 * @func __GooglePlayBillingDiscountDisplayInfo_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingDiscountDisplayInfo}
 * @ignore
 */
function __GooglePlayBillingDiscountDisplayInfo_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingDiscountDisplayInfo();
    with (_inst)
    {
        // field: percentage_discount, type: optional<Int32>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.percentage_discount = buffer_read(_buffer, buffer_s32);
        }
        else
        {
            self.percentage_discount = undefined;
        }

        // field: discount_amount, type: optional<struct GooglePlayBillingDiscountAmount>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.discount_amount = __GooglePlayBillingDiscountAmount_decode(_buffer, buffer_tell(_buffer));
        }
        else
        {
            self.discount_amount = undefined;
        }

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingSubscriptionOfferDetails_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingSubscriptionOfferDetails} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingSubscriptionOfferDetails_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: base_plan_id, type: String
        if (!is_string(self.base_plan_id)) show_error($"{_where} :: self.base_plan_id expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.base_plan_id));
        buffer_write(_buffer, buffer_string, self.base_plan_id);

        // field: offer_id, type: optional<String>
        if (is_undefined(self.offer_id))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.offer_id)) show_error($"{_where} :: self.offer_id expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.offer_id));
            buffer_write(_buffer, buffer_string, self.offer_id);
        }

        // field: offer_tags, type: String[]
        if (!is_array(self.offer_tags)) show_error($"{_where} :: self.offer_tags expected array", true);
        var _length = array_length(self.offer_tags);
        buffer_write(_buffer, buffer_u32, _length);
        for (var _i = 0; _i < _length; ++_i)
        {
            if (!is_string(self.offer_tags[_i])) show_error($"{_where} :: self.offer_tags[_i] expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.offer_tags[_i]));
            buffer_write(_buffer, buffer_string, self.offer_tags[_i]);
        }

        // field: offer_token, type: String
        if (!is_string(self.offer_token)) show_error($"{_where} :: self.offer_token expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.offer_token));
        buffer_write(_buffer, buffer_string, self.offer_token);

        // field: pricing_phases, type: struct GooglePlayBillingPricingPhase[]
        if (!is_array(self.pricing_phases)) show_error($"{_where} :: self.pricing_phases expected array", true);
        var _length = array_length(self.pricing_phases);
        buffer_write(_buffer, buffer_u32, _length);
        for (var _i = 0; _i < _length; ++_i)
        {
            if (self.pricing_phases[_i].__uid != 1162554642) show_error($"{_where} :: self.pricing_phases[_i] expected GooglePlayBillingPricingPhase", true);
            __GooglePlayBillingPricingPhase_encode(self.pricing_phases[_i], _buffer, buffer_tell(_buffer), _where);
        }

        // field: installment_plan_details, type: optional<struct GooglePlayBillingInstallmentPlanDetails>
        if (is_undefined(self.installment_plan_details))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (self.installment_plan_details.__uid != 2249750345) show_error($"{_where} :: self.installment_plan_details expected GooglePlayBillingInstallmentPlanDetails", true);
            __GooglePlayBillingInstallmentPlanDetails_encode(self.installment_plan_details, _buffer, buffer_tell(_buffer), _where);
        }

    }
}

/**
 * @func __GooglePlayBillingSubscriptionOfferDetails_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingSubscriptionOfferDetails}
 * @ignore
 */
function __GooglePlayBillingSubscriptionOfferDetails_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingSubscriptionOfferDetails();
    with (_inst)
    {
        // field: base_plan_id, type: String
        buffer_read(_buffer, buffer_u32);
        self.base_plan_id = buffer_read(_buffer, buffer_string);

        // field: offer_id, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.offer_id = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.offer_id = undefined;
        }

        // field: offer_tags, type: String[]
        var _length = buffer_read(_buffer, buffer_u32);
        self.offer_tags = array_create(_length);
        for (var _i = 0; _i < _length; ++_i)
        {
            buffer_read(_buffer, buffer_u32);
            self.offer_tags[_i] = buffer_read(_buffer, buffer_string);
        }

        // field: offer_token, type: String
        buffer_read(_buffer, buffer_u32);
        self.offer_token = buffer_read(_buffer, buffer_string);

        // field: pricing_phases, type: struct GooglePlayBillingPricingPhase[]
        var _length = buffer_read(_buffer, buffer_u32);
        self.pricing_phases = array_create(_length);
        for (var _i = 0; _i < _length; ++_i)
        {
            self.pricing_phases[_i] = __GooglePlayBillingPricingPhase_decode(_buffer, buffer_tell(_buffer));
        }

        // field: installment_plan_details, type: optional<struct GooglePlayBillingInstallmentPlanDetails>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.installment_plan_details = __GooglePlayBillingInstallmentPlanDetails_decode(_buffer, buffer_tell(_buffer));
        }
        else
        {
            self.installment_plan_details = undefined;
        }

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingPurchase_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingPurchase} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingPurchase_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: order_id, type: optional<String>
        if (is_undefined(self.order_id))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.order_id)) show_error($"{_where} :: self.order_id expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.order_id));
            buffer_write(_buffer, buffer_string, self.order_id);
        }

        // field: package_name, type: String
        if (!is_string(self.package_name)) show_error($"{_where} :: self.package_name expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.package_name));
        buffer_write(_buffer, buffer_string, self.package_name);

        // field: purchase_time, type: Float64
        if (!is_numeric(self.purchase_time)) show_error($"{_where} :: self.purchase_time expected number", true);
        buffer_write(_buffer, buffer_f64, self.purchase_time);

        // field: purchase_token, type: String
        if (!is_string(self.purchase_token)) show_error($"{_where} :: self.purchase_token expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.purchase_token));
        buffer_write(_buffer, buffer_string, self.purchase_token);

        // field: products, type: String[]
        if (!is_array(self.products)) show_error($"{_where} :: self.products expected array", true);
        var _length = array_length(self.products);
        buffer_write(_buffer, buffer_u32, _length);
        for (var _i = 0; _i < _length; ++_i)
        {
            if (!is_string(self.products[_i])) show_error($"{_where} :: self.products[_i] expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.products[_i]));
            buffer_write(_buffer, buffer_string, self.products[_i]);
        }

        // field: signature, type: String
        if (!is_string(self.signature)) show_error($"{_where} :: self.signature expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.signature));
        buffer_write(_buffer, buffer_string, self.signature);

        // field: is_acknowledged, type: Bool
        if (!is_bool(self.is_acknowledged)) show_error($"{_where} :: self.is_acknowledged expected bool", true);
        buffer_write(_buffer, buffer_bool, self.is_acknowledged);

        // field: is_auto_renewing, type: Bool
        if (!is_bool(self.is_auto_renewing)) show_error($"{_where} :: self.is_auto_renewing expected bool", true);
        buffer_write(_buffer, buffer_bool, self.is_auto_renewing);

        // field: purchase_state, type: enum GooglePlayBillingPurchaseState

        if (!is_numeric(self.purchase_state)) show_error($"{_where} :: self.purchase_state expected number", true);
        buffer_write(_buffer, buffer_s32, self.purchase_state);

        // field: quantity, type: Int32
        if (!is_numeric(self.quantity)) show_error($"{_where} :: self.quantity expected number", true);
        buffer_write(_buffer, buffer_s32, self.quantity);

        // field: original_json, type: String
        if (!is_string(self.original_json)) show_error($"{_where} :: self.original_json expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.original_json));
        buffer_write(_buffer, buffer_string, self.original_json);

        // field: is_suspended, type: Bool
        if (!is_bool(self.is_suspended)) show_error($"{_where} :: self.is_suspended expected bool", true);
        buffer_write(_buffer, buffer_bool, self.is_suspended);

        // field: account_identifiers, type: optional<struct GooglePlayBillingAccountIdentifiers>
        if (is_undefined(self.account_identifiers))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (self.account_identifiers.__uid != 2459787690) show_error($"{_where} :: self.account_identifiers expected GooglePlayBillingAccountIdentifiers", true);
            __GooglePlayBillingAccountIdentifiers_encode(self.account_identifiers, _buffer, buffer_tell(_buffer), _where);
        }

        // field: pending_purchase_update, type: optional<struct GooglePlayBillingPendingPurchaseUpdate>
        if (is_undefined(self.pending_purchase_update))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (self.pending_purchase_update.__uid != 155200688) show_error($"{_where} :: self.pending_purchase_update expected GooglePlayBillingPendingPurchaseUpdate", true);
            __GooglePlayBillingPendingPurchaseUpdate_encode(self.pending_purchase_update, _buffer, buffer_tell(_buffer), _where);
        }

    }
}

/**
 * @func __GooglePlayBillingPurchase_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingPurchase}
 * @ignore
 */
function __GooglePlayBillingPurchase_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingPurchase();
    with (_inst)
    {
        // field: order_id, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.order_id = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.order_id = undefined;
        }

        // field: package_name, type: String
        buffer_read(_buffer, buffer_u32);
        self.package_name = buffer_read(_buffer, buffer_string);

        // field: purchase_time, type: Float64
        self.purchase_time = buffer_read(_buffer, buffer_f64);

        // field: purchase_token, type: String
        buffer_read(_buffer, buffer_u32);
        self.purchase_token = buffer_read(_buffer, buffer_string);

        // field: products, type: String[]
        var _length = buffer_read(_buffer, buffer_u32);
        self.products = array_create(_length);
        for (var _i = 0; _i < _length; ++_i)
        {
            buffer_read(_buffer, buffer_u32);
            self.products[_i] = buffer_read(_buffer, buffer_string);
        }

        // field: signature, type: String
        buffer_read(_buffer, buffer_u32);
        self.signature = buffer_read(_buffer, buffer_string);

        // field: is_acknowledged, type: Bool
        self.is_acknowledged = buffer_read(_buffer, buffer_bool);

        // field: is_auto_renewing, type: Bool
        self.is_auto_renewing = buffer_read(_buffer, buffer_bool);

        // field: purchase_state, type: enum GooglePlayBillingPurchaseState
        self.purchase_state = buffer_read(_buffer, buffer_s32);

        // field: quantity, type: Int32
        self.quantity = buffer_read(_buffer, buffer_s32);

        // field: original_json, type: String
        buffer_read(_buffer, buffer_u32);
        self.original_json = buffer_read(_buffer, buffer_string);

        // field: is_suspended, type: Bool
        self.is_suspended = buffer_read(_buffer, buffer_bool);

        // field: account_identifiers, type: optional<struct GooglePlayBillingAccountIdentifiers>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.account_identifiers = __GooglePlayBillingAccountIdentifiers_decode(_buffer, buffer_tell(_buffer));
        }
        else
        {
            self.account_identifiers = undefined;
        }

        // field: pending_purchase_update, type: optional<struct GooglePlayBillingPendingPurchaseUpdate>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.pending_purchase_update = __GooglePlayBillingPendingPurchaseUpdate_decode(_buffer, buffer_tell(_buffer));
        }
        else
        {
            self.pending_purchase_update = undefined;
        }

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingProgramAvailabilityDetails_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingProgramAvailabilityDetails} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingProgramAvailabilityDetails_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: billing_program, type: enum GooglePlayBillingProgram

        if (!is_numeric(self.billing_program)) show_error($"{_where} :: self.billing_program expected number", true);
        buffer_write(_buffer, buffer_s32, self.billing_program);

        // field: billing_choice_details, type: optional<struct GooglePlayBillingChoiceAvailabilityDetails>
        if (is_undefined(self.billing_choice_details))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (self.billing_choice_details.__uid != 3922471387) show_error($"{_where} :: self.billing_choice_details expected GooglePlayBillingChoiceAvailabilityDetails", true);
            __GooglePlayBillingChoiceAvailabilityDetails_encode(self.billing_choice_details, _buffer, buffer_tell(_buffer), _where);
        }

    }
}

/**
 * @func __GooglePlayBillingProgramAvailabilityDetails_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingProgramAvailabilityDetails}
 * @ignore
 */
function __GooglePlayBillingProgramAvailabilityDetails_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingProgramAvailabilityDetails();
    with (_inst)
    {
        // field: billing_program, type: enum GooglePlayBillingProgram
        self.billing_program = buffer_read(_buffer, buffer_s32);

        // field: billing_choice_details, type: optional<struct GooglePlayBillingChoiceAvailabilityDetails>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.billing_choice_details = __GooglePlayBillingChoiceAvailabilityDetails_decode(_buffer, buffer_tell(_buffer));
        }
        else
        {
            self.billing_choice_details = undefined;
        }

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingOneTimePurchaseOfferDetails_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingOneTimePurchaseOfferDetails} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingOneTimePurchaseOfferDetails_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: formatted_price, type: String
        if (!is_string(self.formatted_price)) show_error($"{_where} :: self.formatted_price expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.formatted_price));
        buffer_write(_buffer, buffer_string, self.formatted_price);

        // field: price_amount_micros, type: Float64
        if (!is_numeric(self.price_amount_micros)) show_error($"{_where} :: self.price_amount_micros expected number", true);
        buffer_write(_buffer, buffer_f64, self.price_amount_micros);

        // field: price_currency_code, type: String
        if (!is_string(self.price_currency_code)) show_error($"{_where} :: self.price_currency_code expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.price_currency_code));
        buffer_write(_buffer, buffer_string, self.price_currency_code);

        // field: offer_id, type: optional<String>
        if (is_undefined(self.offer_id))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.offer_id)) show_error($"{_where} :: self.offer_id expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.offer_id));
            buffer_write(_buffer, buffer_string, self.offer_id);
        }

        // field: offer_token, type: optional<String>
        if (is_undefined(self.offer_token))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.offer_token)) show_error($"{_where} :: self.offer_token expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.offer_token));
            buffer_write(_buffer, buffer_string, self.offer_token);
        }

        // field: offer_tags, type: String[]
        if (!is_array(self.offer_tags)) show_error($"{_where} :: self.offer_tags expected array", true);
        var _length = array_length(self.offer_tags);
        buffer_write(_buffer, buffer_u32, _length);
        for (var _i = 0; _i < _length; ++_i)
        {
            if (!is_string(self.offer_tags[_i])) show_error($"{_where} :: self.offer_tags[_i] expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.offer_tags[_i]));
            buffer_write(_buffer, buffer_string, self.offer_tags[_i]);
        }

        // field: purchase_option_id, type: optional<String>
        if (is_undefined(self.purchase_option_id))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.purchase_option_id)) show_error($"{_where} :: self.purchase_option_id expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.purchase_option_id));
            buffer_write(_buffer, buffer_string, self.purchase_option_id);
        }

        // field: full_price_micros, type: optional<Float64>
        if (is_undefined(self.full_price_micros))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_numeric(self.full_price_micros)) show_error($"{_where} :: self.full_price_micros expected number", true);
            buffer_write(_buffer, buffer_f64, self.full_price_micros);
        }

        // field: rental_details, type: optional<struct GooglePlayBillingRentalDetails>
        if (is_undefined(self.rental_details))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (self.rental_details.__uid != 1967241797) show_error($"{_where} :: self.rental_details expected GooglePlayBillingRentalDetails", true);
            __GooglePlayBillingRentalDetails_encode(self.rental_details, _buffer, buffer_tell(_buffer), _where);
        }

        // field: preorder_details, type: optional<struct GooglePlayBillingPreorderDetails>
        if (is_undefined(self.preorder_details))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (self.preorder_details.__uid != 1622783594) show_error($"{_where} :: self.preorder_details expected GooglePlayBillingPreorderDetails", true);
            __GooglePlayBillingPreorderDetails_encode(self.preorder_details, _buffer, buffer_tell(_buffer), _where);
        }

        // field: discount_display_info, type: optional<struct GooglePlayBillingDiscountDisplayInfo>
        if (is_undefined(self.discount_display_info))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (self.discount_display_info.__uid != 2459581066) show_error($"{_where} :: self.discount_display_info expected GooglePlayBillingDiscountDisplayInfo", true);
            __GooglePlayBillingDiscountDisplayInfo_encode(self.discount_display_info, _buffer, buffer_tell(_buffer), _where);
        }

        // field: limited_quantity_info, type: optional<struct GooglePlayBillingLimitedQuantityInfo>
        if (is_undefined(self.limited_quantity_info))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (self.limited_quantity_info.__uid != 2296699910) show_error($"{_where} :: self.limited_quantity_info expected GooglePlayBillingLimitedQuantityInfo", true);
            __GooglePlayBillingLimitedQuantityInfo_encode(self.limited_quantity_info, _buffer, buffer_tell(_buffer), _where);
        }

        // field: valid_time_window, type: optional<struct GooglePlayBillingValidTimeWindow>
        if (is_undefined(self.valid_time_window))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (self.valid_time_window.__uid != 2476745770) show_error($"{_where} :: self.valid_time_window expected GooglePlayBillingValidTimeWindow", true);
            __GooglePlayBillingValidTimeWindow_encode(self.valid_time_window, _buffer, buffer_tell(_buffer), _where);
        }

    }
}

/**
 * @func __GooglePlayBillingOneTimePurchaseOfferDetails_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingOneTimePurchaseOfferDetails}
 * @ignore
 */
function __GooglePlayBillingOneTimePurchaseOfferDetails_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingOneTimePurchaseOfferDetails();
    with (_inst)
    {
        // field: formatted_price, type: String
        buffer_read(_buffer, buffer_u32);
        self.formatted_price = buffer_read(_buffer, buffer_string);

        // field: price_amount_micros, type: Float64
        self.price_amount_micros = buffer_read(_buffer, buffer_f64);

        // field: price_currency_code, type: String
        buffer_read(_buffer, buffer_u32);
        self.price_currency_code = buffer_read(_buffer, buffer_string);

        // field: offer_id, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.offer_id = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.offer_id = undefined;
        }

        // field: offer_token, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.offer_token = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.offer_token = undefined;
        }

        // field: offer_tags, type: String[]
        var _length = buffer_read(_buffer, buffer_u32);
        self.offer_tags = array_create(_length);
        for (var _i = 0; _i < _length; ++_i)
        {
            buffer_read(_buffer, buffer_u32);
            self.offer_tags[_i] = buffer_read(_buffer, buffer_string);
        }

        // field: purchase_option_id, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.purchase_option_id = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.purchase_option_id = undefined;
        }

        // field: full_price_micros, type: optional<Float64>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.full_price_micros = buffer_read(_buffer, buffer_f64);
        }
        else
        {
            self.full_price_micros = undefined;
        }

        // field: rental_details, type: optional<struct GooglePlayBillingRentalDetails>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.rental_details = __GooglePlayBillingRentalDetails_decode(_buffer, buffer_tell(_buffer));
        }
        else
        {
            self.rental_details = undefined;
        }

        // field: preorder_details, type: optional<struct GooglePlayBillingPreorderDetails>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.preorder_details = __GooglePlayBillingPreorderDetails_decode(_buffer, buffer_tell(_buffer));
        }
        else
        {
            self.preorder_details = undefined;
        }

        // field: discount_display_info, type: optional<struct GooglePlayBillingDiscountDisplayInfo>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.discount_display_info = __GooglePlayBillingDiscountDisplayInfo_decode(_buffer, buffer_tell(_buffer));
        }
        else
        {
            self.discount_display_info = undefined;
        }

        // field: limited_quantity_info, type: optional<struct GooglePlayBillingLimitedQuantityInfo>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.limited_quantity_info = __GooglePlayBillingLimitedQuantityInfo_decode(_buffer, buffer_tell(_buffer));
        }
        else
        {
            self.limited_quantity_info = undefined;
        }

        // field: valid_time_window, type: optional<struct GooglePlayBillingValidTimeWindow>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.valid_time_window = __GooglePlayBillingValidTimeWindow_decode(_buffer, buffer_tell(_buffer));
        }
        else
        {
            self.valid_time_window = undefined;
        }

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingProductDetails_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingProductDetails} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingProductDetails_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: product_id, type: String
        if (!is_string(self.product_id)) show_error($"{_where} :: self.product_id expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.product_id));
        buffer_write(_buffer, buffer_string, self.product_id);

        // field: name, type: String
        if (!is_string(self.name)) show_error($"{_where} :: self.name expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.name));
        buffer_write(_buffer, buffer_string, self.name);

        // field: title, type: String
        if (!is_string(self.title)) show_error($"{_where} :: self.title expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.title));
        buffer_write(_buffer, buffer_string, self.title);

        // field: description, type: String
        if (!is_string(self.description)) show_error($"{_where} :: self.description expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.description));
        buffer_write(_buffer, buffer_string, self.description);

        // field: product_type, type: enum GooglePlayBillingProductType

        if (!is_numeric(self.product_type)) show_error($"{_where} :: self.product_type expected number", true);
        buffer_write(_buffer, buffer_s32, self.product_type);

        // field: one_time_purchase_offer_details, type: struct GooglePlayBillingOneTimePurchaseOfferDetails[]
        if (!is_array(self.one_time_purchase_offer_details)) show_error($"{_where} :: self.one_time_purchase_offer_details expected array", true);
        var _length = array_length(self.one_time_purchase_offer_details);
        buffer_write(_buffer, buffer_u32, _length);
        for (var _i = 0; _i < _length; ++_i)
        {
            if (self.one_time_purchase_offer_details[_i].__uid != 2826199879) show_error($"{_where} :: self.one_time_purchase_offer_details[_i] expected GooglePlayBillingOneTimePurchaseOfferDetails", true);
            __GooglePlayBillingOneTimePurchaseOfferDetails_encode(self.one_time_purchase_offer_details[_i], _buffer, buffer_tell(_buffer), _where);
        }

        // field: subscription_offer_details, type: struct GooglePlayBillingSubscriptionOfferDetails[]
        if (!is_array(self.subscription_offer_details)) show_error($"{_where} :: self.subscription_offer_details expected array", true);
        var _length = array_length(self.subscription_offer_details);
        buffer_write(_buffer, buffer_u32, _length);
        for (var _i = 0; _i < _length; ++_i)
        {
            if (self.subscription_offer_details[_i].__uid != 1754328638) show_error($"{_where} :: self.subscription_offer_details[_i] expected GooglePlayBillingSubscriptionOfferDetails", true);
            __GooglePlayBillingSubscriptionOfferDetails_encode(self.subscription_offer_details[_i], _buffer, buffer_tell(_buffer), _where);
        }

    }
}

/**
 * @func __GooglePlayBillingProductDetails_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingProductDetails}
 * @ignore
 */
function __GooglePlayBillingProductDetails_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingProductDetails();
    with (_inst)
    {
        // field: product_id, type: String
        buffer_read(_buffer, buffer_u32);
        self.product_id = buffer_read(_buffer, buffer_string);

        // field: name, type: String
        buffer_read(_buffer, buffer_u32);
        self.name = buffer_read(_buffer, buffer_string);

        // field: title, type: String
        buffer_read(_buffer, buffer_u32);
        self.title = buffer_read(_buffer, buffer_string);

        // field: description, type: String
        buffer_read(_buffer, buffer_u32);
        self.description = buffer_read(_buffer, buffer_string);

        // field: product_type, type: enum GooglePlayBillingProductType
        self.product_type = buffer_read(_buffer, buffer_s32);

        // field: one_time_purchase_offer_details, type: struct GooglePlayBillingOneTimePurchaseOfferDetails[]
        var _length = buffer_read(_buffer, buffer_u32);
        self.one_time_purchase_offer_details = array_create(_length);
        for (var _i = 0; _i < _length; ++_i)
        {
            self.one_time_purchase_offer_details[_i] = __GooglePlayBillingOneTimePurchaseOfferDetails_decode(_buffer, buffer_tell(_buffer));
        }

        // field: subscription_offer_details, type: struct GooglePlayBillingSubscriptionOfferDetails[]
        var _length = buffer_read(_buffer, buffer_u32);
        self.subscription_offer_details = array_create(_length);
        for (var _i = 0; _i < _length; ++_i)
        {
            self.subscription_offer_details[_i] = __GooglePlayBillingSubscriptionOfferDetails_decode(_buffer, buffer_tell(_buffer));
        }

    }

    return _inst;
}

/**
 * @func __GooglePlayBillingProductDetailsQueryResult_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.GooglePlayBillingProductDetailsQueryResult} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __GooglePlayBillingProductDetailsQueryResult_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: products, type: struct GooglePlayBillingProductDetails[]
        if (!is_array(self.products)) show_error($"{_where} :: self.products expected array", true);
        var _length = array_length(self.products);
        buffer_write(_buffer, buffer_u32, _length);
        for (var _i = 0; _i < _length; ++_i)
        {
            if (self.products[_i].__uid != 2612326192) show_error($"{_where} :: self.products[_i] expected GooglePlayBillingProductDetails", true);
            __GooglePlayBillingProductDetails_encode(self.products[_i], _buffer, buffer_tell(_buffer), _where);
        }

        // field: unfetched_products, type: struct GooglePlayBillingUnfetchedProduct[]
        if (!is_array(self.unfetched_products)) show_error($"{_where} :: self.unfetched_products expected array", true);
        var _length = array_length(self.unfetched_products);
        buffer_write(_buffer, buffer_u32, _length);
        for (var _i = 0; _i < _length; ++_i)
        {
            if (self.unfetched_products[_i].__uid != 521953500) show_error($"{_where} :: self.unfetched_products[_i] expected GooglePlayBillingUnfetchedProduct", true);
            __GooglePlayBillingUnfetchedProduct_encode(self.unfetched_products[_i], _buffer, buffer_tell(_buffer), _where);
        }

    }
}

/**
 * @func __GooglePlayBillingProductDetailsQueryResult_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.GooglePlayBillingProductDetailsQueryResult}
 * @ignore
 */
function __GooglePlayBillingProductDetailsQueryResult_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new GooglePlayBillingProductDetailsQueryResult();
    with (_inst)
    {
        // field: products, type: struct GooglePlayBillingProductDetails[]
        var _length = buffer_read(_buffer, buffer_u32);
        self.products = array_create(_length);
        for (var _i = 0; _i < _length; ++_i)
        {
            self.products[_i] = __GooglePlayBillingProductDetails_decode(_buffer, buffer_tell(_buffer));
        }

        // field: unfetched_products, type: struct GooglePlayBillingUnfetchedProduct[]
        var _length = buffer_read(_buffer, buffer_u32);
        self.unfetched_products = array_create(_length);
        for (var _i = 0; _i < _length; ++_i)
        {
            self.unfetched_products[_i] = __GooglePlayBillingUnfetchedProduct_decode(_buffer, buffer_tell(_buffer));
        }

    }

    return _inst;
}

// #####################################################################
// # Functions
// #####################################################################

/**
 * @param {Struct.GooglePlayBillingInitOptions} _options
 * @param {Function} _callback
 */
function play_billing_init(_options, _callback)
{
    var __available = __GMGooglePlayBilling_is_available();
    if (!__available) return;

    var __dispatcher = __GMGooglePlayBilling_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _options, type: optional<struct GooglePlayBillingInitOptions>
    if (is_undefined(_options))
    {
        buffer_write(__args_buffer, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer, buffer_bool, true);
        if (_options.__uid != 1048535493) show_error($"{_GMFUNCTION_} :: _options expected GooglePlayBillingInitOptions", true);
        __GooglePlayBillingInitOptions_encode(_options, __args_buffer, buffer_tell(__args_buffer), _GMFUNCTION_);
    }

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __play_billing_init(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {Function} _callback_start
 * @param {Function} _callback_disconnect
 */
function play_billing_start_connection(_callback_start, _callback_disconnect)
{
    var __available = __GMGooglePlayBilling_is_available();
    if (!__available) return;

    var __dispatcher = __GMGooglePlayBilling_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _callback_start, type: Function
    if (!is_callable(_callback_start)) show_error($"{_GMFUNCTION_} :: _callback_start expected callable type", true);
    var _callback_start_handle = __ext_core_function_register(_callback_start, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_start_handle);

    // param: _callback_disconnect, type: Function
    if (!is_callable(_callback_disconnect)) show_error($"{_GMFUNCTION_} :: _callback_disconnect expected callable type", true);
    var _callback_disconnect_handle = __ext_core_function_register(_callback_disconnect, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_disconnect_handle);

    var _return_value = __play_billing_start_connection(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

// Skipping function play_billing_end_connection (no wrapper is required)


/**
 * @returns {Enum.GooglePlayBillingConnectionState}
 */
function play_billing_get_connection_state()
{
    var __available = __GMGooglePlayBilling_is_available();
    if (!__available) return;

    var __ret_buffer = __ext_core_get_ret_buffer();

    var _return_value = __play_billing_get_connection_state(buffer_get_address(__ret_buffer), buffer_get_size(__ret_buffer));

    var _result = undefined;
    _result = buffer_read(__ret_buffer, buffer_s32);
    return _result;
}

// Skipping function play_billing_is_ready (no wrapper is required)


/**
 * @param {Function} _callback
 */
function play_billing_get_config_async(_callback)
{
    var __available = __GMGooglePlayBilling_is_available();
    if (!__available) return;

    var __dispatcher = __GMGooglePlayBilling_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __play_billing_get_config_async(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {Function} _callback
 */
function play_billing_is_alternative_billing_only_available_async(_callback)
{
    var __available = __GMGooglePlayBilling_is_available();
    if (!__available) return;

    var __dispatcher = __GMGooglePlayBilling_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __play_billing_is_alternative_billing_only_available_async(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {Enum.GooglePlayBillingProgram} _program
 * @param {Function} _callback
 */
function play_billing_is_billing_program_available_async(_program, _callback)
{
    var __available = __GMGooglePlayBilling_is_available();
    if (!__available) return;

    var __dispatcher = __GMGooglePlayBilling_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _program, type: enum GooglePlayBillingProgram

    if (!is_numeric(_program)) show_error($"{_GMFUNCTION_} :: _program expected number", true);
    buffer_write(__args_buffer, buffer_s32, _program);

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __play_billing_is_billing_program_available_async(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {Enum.GooglePlayBillingFeatureType} _feature
 * @returns {Struct.GooglePlayBillingResult}
 */
function play_billing_is_feature_supported(_feature)
{
    var __available = __GMGooglePlayBilling_is_available();
    if (!__available) return;

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _feature, type: enum GooglePlayBillingFeatureType

    if (!is_numeric(_feature)) show_error($"{_GMFUNCTION_} :: _feature expected number", true);
    buffer_write(__args_buffer, buffer_s32, _feature);

    var __ret_buffer = __ext_core_get_ret_buffer();

    var _return_value = __play_billing_is_feature_supported(buffer_get_address(__args_buffer), buffer_tell(__args_buffer), buffer_get_address(__ret_buffer), buffer_get_size(__ret_buffer));

    var _result = undefined;
    _result = __GooglePlayBillingResult_decode(__ret_buffer, buffer_tell(__ret_buffer));
    return _result;
}

/**
 * @param {Array[Struct.GooglePlayBillingProductInput]} _products
 * @param {Function} _callback
 */
function play_billing_query_product_details_async(_products, _callback)
{
    var __available = __GMGooglePlayBilling_is_available();
    if (!__available) return;

    var __dispatcher = __GMGooglePlayBilling_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _products, type: struct GooglePlayBillingProductInput[]
    if (!is_array(_products)) show_error($"{_GMFUNCTION_} :: _products expected array", true);
    var _length = array_length(_products);
    buffer_write(__args_buffer, buffer_u32, _length);
    for (var _i = 0; _i < _length; ++_i)
    {
        if (_products[_i].__uid != 2620246) show_error($"{_GMFUNCTION_} :: _products[_i] expected GooglePlayBillingProductInput", true);
        __GooglePlayBillingProductInput_encode(_products[_i], __args_buffer, buffer_tell(__args_buffer), _GMFUNCTION_);
    }

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __play_billing_query_product_details_async(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

// Skipping function play_billing_clear_products (no wrapper is required)


/**
 * @param {Array[Struct.GooglePlayBillingProductDetailsParams]} _items
 * @param {Struct.GooglePlayBillingFlowOptions} _options
 * @returns {Struct.GooglePlayBillingResult}
 */
function play_billing_launch_billing_flow(_items, _options)
{
    var __available = __GMGooglePlayBilling_is_available();
    if (!__available) return;

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _items, type: struct GooglePlayBillingProductDetailsParams[]
    if (!is_array(_items)) show_error($"{_GMFUNCTION_} :: _items expected array", true);
    var _length = array_length(_items);
    buffer_write(__args_buffer, buffer_u32, _length);
    for (var _i = 0; _i < _length; ++_i)
    {
        if (_items[_i].__uid != 1292963414) show_error($"{_GMFUNCTION_} :: _items[_i] expected GooglePlayBillingProductDetailsParams", true);
        __GooglePlayBillingProductDetailsParams_encode(_items[_i], __args_buffer, buffer_tell(__args_buffer), _GMFUNCTION_);
    }

    // param: _options, type: optional<struct GooglePlayBillingFlowOptions>
    if (is_undefined(_options))
    {
        buffer_write(__args_buffer, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer, buffer_bool, true);
        if (_options.__uid != 2954505059) show_error($"{_GMFUNCTION_} :: _options expected GooglePlayBillingFlowOptions", true);
        __GooglePlayBillingFlowOptions_encode(_options, __args_buffer, buffer_tell(__args_buffer), _GMFUNCTION_);
    }

    var __ret_buffer = __ext_core_get_ret_buffer();

    var _return_value = __play_billing_launch_billing_flow(buffer_get_address(__args_buffer), buffer_tell(__args_buffer), buffer_get_address(__ret_buffer), buffer_get_size(__ret_buffer));

    var _result = undefined;
    _result = __GooglePlayBillingResult_decode(__ret_buffer, buffer_tell(__ret_buffer));
    return _result;
}

/**
 * @param {Enum.GooglePlayBillingProductType} _product_type
 * @param {Bool} _include_suspended_subscriptions
 * @param {Function} _callback
 */
function play_billing_query_purchases_async(_product_type, _include_suspended_subscriptions, _callback)
{
    var __available = __GMGooglePlayBilling_is_available();
    if (!__available) return;

    var __dispatcher = __GMGooglePlayBilling_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _product_type, type: enum GooglePlayBillingProductType

    if (!is_numeric(_product_type)) show_error($"{_GMFUNCTION_} :: _product_type expected number", true);
    buffer_write(__args_buffer, buffer_s32, _product_type);

    // param: _include_suspended_subscriptions, type: Bool
    if (!is_bool(_include_suspended_subscriptions)) show_error($"{_GMFUNCTION_} :: _include_suspended_subscriptions expected bool", true);
    buffer_write(__args_buffer, buffer_bool, _include_suspended_subscriptions);

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __play_billing_query_purchases_async(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {String} _purchase_token
 * @param {Function} _callback
 */
function play_billing_acknowledge_purchase(_purchase_token, _callback)
{
    var __available = __GMGooglePlayBilling_is_available();
    if (!__available) return;

    var __dispatcher = __GMGooglePlayBilling_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _purchase_token, type: String
    if (!is_string(_purchase_token)) show_error($"{_GMFUNCTION_} :: _purchase_token expected string", true);
    buffer_write(__args_buffer, buffer_u32, string_byte_length(_purchase_token));
    buffer_write(__args_buffer, buffer_string, _purchase_token);

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __play_billing_acknowledge_purchase(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {String} _purchase_token
 * @param {Function} _callback
 */
function play_billing_consume_async(_purchase_token, _callback)
{
    var __available = __GMGooglePlayBilling_is_available();
    if (!__available) return;

    var __dispatcher = __GMGooglePlayBilling_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _purchase_token, type: String
    if (!is_string(_purchase_token)) show_error($"{_GMFUNCTION_} :: _purchase_token expected string", true);
    buffer_write(__args_buffer, buffer_u32, string_byte_length(_purchase_token));
    buffer_write(__args_buffer, buffer_string, _purchase_token);

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __play_billing_consume_async(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {Function} _callback
 */
function play_billing_create_alternative_billing_only_reporting_details_async(_callback)
{
    var __available = __GMGooglePlayBilling_is_available();
    if (!__available) return;

    var __dispatcher = __GMGooglePlayBilling_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __play_billing_create_alternative_billing_only_reporting_details_async(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {Enum.GooglePlayBillingProgram} _program
 * @param {Function} _callback
 */
function play_billing_create_billing_program_reporting_details_async(_program, _callback)
{
    var __available = __GMGooglePlayBilling_is_available();
    if (!__available) return;

    var __dispatcher = __GMGooglePlayBilling_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _program, type: enum GooglePlayBillingProgram

    if (!is_numeric(_program)) show_error($"{_GMFUNCTION_} :: _program expected number", true);
    buffer_write(__args_buffer, buffer_s32, _program);

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __play_billing_create_billing_program_reporting_details_async(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {Struct.GooglePlayBillingInAppMessageOptions} _options
 * @param {Function} _callback
 * @returns {Struct.GooglePlayBillingResult}
 */
function play_billing_show_in_app_messages(_options, _callback)
{
    var __available = __GMGooglePlayBilling_is_available();
    if (!__available) return;

    var __dispatcher = __GMGooglePlayBilling_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _options, type: optional<struct GooglePlayBillingInAppMessageOptions>
    if (is_undefined(_options))
    {
        buffer_write(__args_buffer, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer, buffer_bool, true);
        if (_options.__uid != 2338048100) show_error($"{_GMFUNCTION_} :: _options expected GooglePlayBillingInAppMessageOptions", true);
        __GooglePlayBillingInAppMessageOptions_encode(_options, __args_buffer, buffer_tell(__args_buffer), _GMFUNCTION_);
    }

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var __ret_buffer = __ext_core_get_ret_buffer();

    var _return_value = __play_billing_show_in_app_messages(buffer_get_address(__args_buffer), buffer_tell(__args_buffer), buffer_get_address(__ret_buffer), buffer_get_size(__ret_buffer));

    var _result = undefined;
    _result = __GooglePlayBillingResult_decode(__ret_buffer, buffer_tell(__ret_buffer));
    return _result;
}

/**
 * @param {Function} _callback
 */
function play_billing_get_billing_choice_info_async(_callback)
{
    var __available = __GMGooglePlayBilling_is_available();
    if (!__available) return;

    var __dispatcher = __GMGooglePlayBilling_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __play_billing_get_billing_choice_info_async(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {Enum.GooglePlayBillingProgram} _program
 * @param {Function} _callback
 */
function play_billing_show_billing_program_information_dialog(_program, _callback)
{
    var __available = __GMGooglePlayBilling_is_available();
    if (!__available) return;

    var __dispatcher = __GMGooglePlayBilling_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _program, type: enum GooglePlayBillingProgram

    if (!is_numeric(_program)) show_error($"{_GMFUNCTION_} :: _program expected number", true);
    buffer_write(__args_buffer, buffer_s32, _program);

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __play_billing_show_billing_program_information_dialog(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {Function} _callback
 */
function play_billing_show_alternative_billing_only_information_dialog(_callback)
{
    var __available = __GMGooglePlayBilling_is_available();
    if (!__available) return;

    var __dispatcher = __GMGooglePlayBilling_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __play_billing_show_alternative_billing_only_information_dialog(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/**
 * @param {Struct.GooglePlayBillingExternalLinkLaunchOptions} _options
 * @param {Function} _callback
 */
function play_billing_launch_external_link(_options, _callback)
{
    var __available = __GMGooglePlayBilling_is_available();
    if (!__available) return;

    var __dispatcher = __GMGooglePlayBilling_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _options, type: struct GooglePlayBillingExternalLinkLaunchOptions
    if (_options.__uid != 1626011839) show_error($"{_GMFUNCTION_} :: _options expected GooglePlayBillingExternalLinkLaunchOptions", true);
    __GooglePlayBillingExternalLinkLaunchOptions_encode(_options, __args_buffer, buffer_tell(__args_buffer), _GMFUNCTION_);

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var _return_value = __play_billing_launch_external_link(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return _return_value;
}

/// @ignore
function __GMGooglePlayBilling_get_decoders()
{
    static __decoders = [
        __GooglePlayBillingInitOptions_decode,
        __GooglePlayBillingProductInput_decode,
        __GooglePlayBillingSubscriptionUpdateParams_decode,
        __GooglePlayBillingFlowOptions_decode,
        __GooglePlayBillingInAppMessageOptions_decode,
        __GooglePlayBillingResult_decode,
        __GooglePlayBillingConfig_decode,
        __GooglePlayBillingRentalDetails_decode,
        __GooglePlayBillingPreorderDetails_decode,
        __GooglePlayBillingDiscountAmount_decode,
        __GooglePlayBillingLimitedQuantityInfo_decode,
        __GooglePlayBillingValidTimeWindow_decode,
        __GooglePlayBillingPricingPhase_decode,
        __GooglePlayBillingInstallmentPlanDetails_decode,
        __GooglePlayBillingAccountIdentifiers_decode,
        __GooglePlayBillingPendingPurchaseUpdate_decode,
        __GooglePlayBillingUnfetchedProduct_decode,
        __GooglePlayBillingReportingDetails_decode,
        __GooglePlayBillingChoiceAvailabilityDetails_decode,
        __GooglePlayBillingInAppMessageResult_decode,
        __GooglePlayBillingChoiceInfo_decode,
        __GooglePlayBillingExternalLinkLaunchOptions_decode,
        __GooglePlayBillingProductDetailsParams_decode,
        __GooglePlayBillingDiscountDisplayInfo_decode,
        __GooglePlayBillingSubscriptionOfferDetails_decode,
        __GooglePlayBillingPurchase_decode,
        __GooglePlayBillingProgramAvailabilityDetails_decode,
        __GooglePlayBillingOneTimePurchaseOfferDetails_decode,
        __GooglePlayBillingProductDetails_decode,
        __GooglePlayBillingProductDetailsQueryResult_decode
    ];
    return __decoders;
}
/// @ignore
function __GMGooglePlayBilling_get_dispatcher()
{
    static __dispatcher = new __GMNativeFunctionDispatcher(__GMGooglePlayBilling_invocation_handler, __GMGooglePlayBilling_get_decoders());
    return __dispatcher;
}
/// @ignore
function __GMGooglePlayBilling_is_available()
{
    static __available = extension_exists("GMGooglePlayBilling");
    return __available;
}
