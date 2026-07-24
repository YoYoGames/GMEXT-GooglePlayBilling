// ##### extgen :: Auto-generated file do not edit!! #####

#pragma once
#include <cstdint>
#include <string_view>
#include <vector>
#include <array>
#include <optional>
#include "core/GMExtWire.h"

namespace gm_consts
{
    inline constexpr std::string_view GooglePlayBillingProductTypeInapp = "inapp";
    inline constexpr std::string_view GooglePlayBillingProductTypeSubs = "subs";
    inline constexpr std::string_view GooglePlayBillingFeatureTypeAlternativeBillingOnly = "jjj";
    inline constexpr std::string_view GooglePlayBillingFeatureTypeBillingConfig = "ggg";
    inline constexpr std::string_view GooglePlayBillingFeatureTypeExternalOffer = "kkk";
    inline constexpr std::string_view GooglePlayBillingFeatureTypeIncludeSuspendedSubscriptions = "nnn";
    inline constexpr std::string_view GooglePlayBillingFeatureTypeInAppMessaging = "bbb";
    inline constexpr std::string_view GooglePlayBillingFeatureTypePriceChangeConfirmation = "priceChangeConfirmation";
    inline constexpr std::string_view GooglePlayBillingFeatureTypeProductDetails = "fff";
    inline constexpr std::string_view GooglePlayBillingFeatureTypeSubscriptions = "subscriptions";
    inline constexpr std::string_view GooglePlayBillingFeatureTypeSubscriptionsUpdate = "subscriptionsUpdate";
}


namespace gm_enums
{
    enum class GooglePlayBillingResponseCode : std::int32_t
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
    };

    enum class GooglePlayBillingPurchaseState : std::int32_t
    {
        UnspecifiedState = 0,
        Purchased = 1,
        Pending = 2
    };

    enum class GooglePlayBillingSubscriptionReplacementMode : std::int32_t
    {
        UnknownReplacementMode = 0,
        WithTimeProration = 1,
        ChargeProratedPrice = 2,
        WithoutProration = 3,
        ChargeFullPrice = 5,
        Deferred = 6
    };

    enum class GooglePlayBillingConnectionState : std::int32_t
    {
        Disconnected = 0,
        Connecting = 1,
        Connected = 2,
        Closed = 3
    };

}


namespace gm_structs
{
    struct GooglePlayBillingResult;
    struct GooglePlayBillingConfig;
    struct GooglePlayBillingProductInput;
    struct GooglePlayBillingSubscriptionUpdateParams;
    struct GooglePlayBillingOneTimePurchaseOfferDetails;
    struct GooglePlayBillingPricingPhase;
    struct GooglePlayBillingAccountIdentifiers;
    struct GooglePlayBillingUnfetchedProduct;
    struct GooglePlayBillingFlowOptions;
    struct GooglePlayBillingSubscriptionOfferDetails;
    struct GooglePlayBillingPurchase;
    struct GooglePlayBillingProductDetails;
    struct GooglePlayBillingEvent;

    struct GooglePlayBillingResult
    {
        std::int32_t code;
        std::string message;
        std::int32_t sub_response_code;
    };

    struct GooglePlayBillingConfig
    {
        std::string country_code;
    };

    struct GooglePlayBillingProductInput
    {
        std::string product;
        std::string type;
    };

    struct GooglePlayBillingSubscriptionUpdateParams
    {
        std::string old_purchase_token;
        std::int32_t replacement_mode;
    };

    struct GooglePlayBillingOneTimePurchaseOfferDetails
    {
        std::string formatted_price;
        double price_amount_micros;
        std::string price_currency_code;
        std::string offer_id;
        std::string offer_token;
        std::vector<std::string> offer_tags;
        std::string purchase_option_id;
        double full_price_micros;
        bool has_rental_details;
        bool has_preorder_details;
        bool has_discount;
        bool has_limited_quantity;
        bool has_valid_time_window;
    };

    struct GooglePlayBillingPricingPhase
    {
        std::string formatted_price;
        double price_amount_micros;
        std::string price_currency_code;
        std::int32_t billing_cycle_count;
        std::string billing_period;
        std::int32_t recurrence_mode;
    };

    struct GooglePlayBillingAccountIdentifiers
    {
        std::string obfuscated_account_id;
        std::string obfuscated_profile_id;
    };

    struct GooglePlayBillingUnfetchedProduct
    {
        std::string product_id;
        std::string product_type;
        std::int32_t status_code;
    };

    struct GooglePlayBillingFlowOptions
    {
        std::string offer_token;
        bool is_offer_personalized;
        std::string obfuscated_account_id;
        std::string obfuscated_profile_id;
        std::optional<gm_structs::GooglePlayBillingSubscriptionUpdateParams> subscription_update_params;
    };

    struct GooglePlayBillingSubscriptionOfferDetails
    {
        std::string base_plan_id;
        std::string offer_id;
        std::vector<std::string> offer_tags;
        std::string offer_token;
        std::vector<gm_structs::GooglePlayBillingPricingPhase> pricing_phases;
        bool has_installment_plan_details;
    };

    struct GooglePlayBillingPurchase
    {
        std::string order_id;
        std::string package_name;
        double purchase_time;
        std::string purchase_token;
        std::vector<std::string> products;
        std::string signature;
        bool is_acknowledged;
        bool is_auto_renewing;
        std::string developer_payload;
        std::int32_t purchase_state;
        std::int32_t quantity;
        std::string original_json;
        bool is_suspended;
        gm_structs::GooglePlayBillingAccountIdentifiers account_identifiers;
    };

    struct GooglePlayBillingProductDetails
    {
        std::string product_id;
        std::string title;
        std::string description;
        std::string product_type;
        std::optional<gm_structs::GooglePlayBillingOneTimePurchaseOfferDetails> one_time_purchase_offer_details;
        std::vector<gm_structs::GooglePlayBillingOneTimePurchaseOfferDetails> one_time_purchase_offer_details_list;
        std::vector<gm_structs::GooglePlayBillingSubscriptionOfferDetails> subscription_offer_details;
        std::vector<gm_structs::GooglePlayBillingPricingPhase> all_pricing_phases;
    };

    struct GooglePlayBillingEvent
    {
        std::string type;
        std::optional<gm_structs::GooglePlayBillingResult> result;
        std::optional<std::string> message;
        std::optional<gm_structs::GooglePlayBillingConfig> config;
        std::vector<gm_structs::GooglePlayBillingProductDetails> products;
        std::vector<gm_structs::GooglePlayBillingPurchase> purchases;
        std::vector<gm_structs::GooglePlayBillingUnfetchedProduct> unfetched_products;
        std::optional<std::string> purchase_token;
        std::optional<std::string> external_transaction_token;
        std::optional<std::int32_t> response_code;
    };

}

namespace gm::wire::codec
{
    template<>
    inline void writeValue<gm_structs::GooglePlayBillingResult>(gm::byteio::IByteWriter& _buf, const gm_structs::GooglePlayBillingResult& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.code);
        gm::wire::codec::writeValue(_buf, obj.message);
        gm::wire::codec::writeValue(_buf, obj.sub_response_code);
    }

    template<>
    inline gm_structs::GooglePlayBillingResult readValue<gm_structs::GooglePlayBillingResult>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::GooglePlayBillingResult obj;
        obj.code = gm::wire::codec::readValue<std::int32_t>(_buf);
        obj.message = gm::wire::codec::readValue<std::string>(_buf);
        obj.sub_response_code = gm::wire::codec::readValue<std::int32_t>(_buf);
        return obj;
    }

    template<>
    inline void writeValue<gm_structs::GooglePlayBillingConfig>(gm::byteio::IByteWriter& _buf, const gm_structs::GooglePlayBillingConfig& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.country_code);
    }

    template<>
    inline gm_structs::GooglePlayBillingConfig readValue<gm_structs::GooglePlayBillingConfig>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::GooglePlayBillingConfig obj;
        obj.country_code = gm::wire::codec::readValue<std::string>(_buf);
        return obj;
    }

    template<>
    inline void writeValue<gm_structs::GooglePlayBillingProductInput>(gm::byteio::IByteWriter& _buf, const gm_structs::GooglePlayBillingProductInput& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.product);
        gm::wire::codec::writeValue(_buf, obj.type);
    }

    template<>
    inline gm_structs::GooglePlayBillingProductInput readValue<gm_structs::GooglePlayBillingProductInput>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::GooglePlayBillingProductInput obj;
        obj.product = gm::wire::codec::readValue<std::string>(_buf);
        obj.type = gm::wire::codec::readValue<std::string>(_buf);
        return obj;
    }

    template<>
    inline void writeValue<gm_structs::GooglePlayBillingSubscriptionUpdateParams>(gm::byteio::IByteWriter& _buf, const gm_structs::GooglePlayBillingSubscriptionUpdateParams& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.old_purchase_token);
        gm::wire::codec::writeValue(_buf, obj.replacement_mode);
    }

    template<>
    inline gm_structs::GooglePlayBillingSubscriptionUpdateParams readValue<gm_structs::GooglePlayBillingSubscriptionUpdateParams>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::GooglePlayBillingSubscriptionUpdateParams obj;
        obj.old_purchase_token = gm::wire::codec::readValue<std::string>(_buf);
        obj.replacement_mode = gm::wire::codec::readValue<std::int32_t>(_buf);
        return obj;
    }

    template<>
    inline void writeValue<gm_structs::GooglePlayBillingOneTimePurchaseOfferDetails>(gm::byteio::IByteWriter& _buf, const gm_structs::GooglePlayBillingOneTimePurchaseOfferDetails& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.formatted_price);
        gm::wire::codec::writeValue(_buf, obj.price_amount_micros);
        gm::wire::codec::writeValue(_buf, obj.price_currency_code);
        gm::wire::codec::writeValue(_buf, obj.offer_id);
        gm::wire::codec::writeValue(_buf, obj.offer_token);
        gm::wire::codec::writeValue(_buf, obj.offer_tags);
        gm::wire::codec::writeValue(_buf, obj.purchase_option_id);
        gm::wire::codec::writeValue(_buf, obj.full_price_micros);
        gm::wire::codec::writeValue(_buf, obj.has_rental_details);
        gm::wire::codec::writeValue(_buf, obj.has_preorder_details);
        gm::wire::codec::writeValue(_buf, obj.has_discount);
        gm::wire::codec::writeValue(_buf, obj.has_limited_quantity);
        gm::wire::codec::writeValue(_buf, obj.has_valid_time_window);
    }

    template<>
    inline gm_structs::GooglePlayBillingOneTimePurchaseOfferDetails readValue<gm_structs::GooglePlayBillingOneTimePurchaseOfferDetails>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::GooglePlayBillingOneTimePurchaseOfferDetails obj;
        obj.formatted_price = gm::wire::codec::readValue<std::string>(_buf);
        obj.price_amount_micros = gm::wire::codec::readValue<double>(_buf);
        obj.price_currency_code = gm::wire::codec::readValue<std::string>(_buf);
        obj.offer_id = gm::wire::codec::readValue<std::string>(_buf);
        obj.offer_token = gm::wire::codec::readValue<std::string>(_buf);
        obj.offer_tags = gm::wire::codec::readVector<std::string>(_buf);
        obj.purchase_option_id = gm::wire::codec::readValue<std::string>(_buf);
        obj.full_price_micros = gm::wire::codec::readValue<double>(_buf);
        obj.has_rental_details = gm::wire::codec::readValue<bool>(_buf);
        obj.has_preorder_details = gm::wire::codec::readValue<bool>(_buf);
        obj.has_discount = gm::wire::codec::readValue<bool>(_buf);
        obj.has_limited_quantity = gm::wire::codec::readValue<bool>(_buf);
        obj.has_valid_time_window = gm::wire::codec::readValue<bool>(_buf);
        return obj;
    }

    template<>
    inline void writeValue<gm_structs::GooglePlayBillingPricingPhase>(gm::byteio::IByteWriter& _buf, const gm_structs::GooglePlayBillingPricingPhase& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.formatted_price);
        gm::wire::codec::writeValue(_buf, obj.price_amount_micros);
        gm::wire::codec::writeValue(_buf, obj.price_currency_code);
        gm::wire::codec::writeValue(_buf, obj.billing_cycle_count);
        gm::wire::codec::writeValue(_buf, obj.billing_period);
        gm::wire::codec::writeValue(_buf, obj.recurrence_mode);
    }

    template<>
    inline gm_structs::GooglePlayBillingPricingPhase readValue<gm_structs::GooglePlayBillingPricingPhase>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::GooglePlayBillingPricingPhase obj;
        obj.formatted_price = gm::wire::codec::readValue<std::string>(_buf);
        obj.price_amount_micros = gm::wire::codec::readValue<double>(_buf);
        obj.price_currency_code = gm::wire::codec::readValue<std::string>(_buf);
        obj.billing_cycle_count = gm::wire::codec::readValue<std::int32_t>(_buf);
        obj.billing_period = gm::wire::codec::readValue<std::string>(_buf);
        obj.recurrence_mode = gm::wire::codec::readValue<std::int32_t>(_buf);
        return obj;
    }

    template<>
    inline void writeValue<gm_structs::GooglePlayBillingAccountIdentifiers>(gm::byteio::IByteWriter& _buf, const gm_structs::GooglePlayBillingAccountIdentifiers& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.obfuscated_account_id);
        gm::wire::codec::writeValue(_buf, obj.obfuscated_profile_id);
    }

    template<>
    inline gm_structs::GooglePlayBillingAccountIdentifiers readValue<gm_structs::GooglePlayBillingAccountIdentifiers>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::GooglePlayBillingAccountIdentifiers obj;
        obj.obfuscated_account_id = gm::wire::codec::readValue<std::string>(_buf);
        obj.obfuscated_profile_id = gm::wire::codec::readValue<std::string>(_buf);
        return obj;
    }

    template<>
    inline void writeValue<gm_structs::GooglePlayBillingUnfetchedProduct>(gm::byteio::IByteWriter& _buf, const gm_structs::GooglePlayBillingUnfetchedProduct& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.product_id);
        gm::wire::codec::writeValue(_buf, obj.product_type);
        gm::wire::codec::writeValue(_buf, obj.status_code);
    }

    template<>
    inline gm_structs::GooglePlayBillingUnfetchedProduct readValue<gm_structs::GooglePlayBillingUnfetchedProduct>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::GooglePlayBillingUnfetchedProduct obj;
        obj.product_id = gm::wire::codec::readValue<std::string>(_buf);
        obj.product_type = gm::wire::codec::readValue<std::string>(_buf);
        obj.status_code = gm::wire::codec::readValue<std::int32_t>(_buf);
        return obj;
    }

    template<>
    inline void writeValue<gm_structs::GooglePlayBillingFlowOptions>(gm::byteio::IByteWriter& _buf, const gm_structs::GooglePlayBillingFlowOptions& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.offer_token);
        gm::wire::codec::writeValue(_buf, obj.is_offer_personalized);
        gm::wire::codec::writeValue(_buf, obj.obfuscated_account_id);
        gm::wire::codec::writeValue(_buf, obj.obfuscated_profile_id);
        gm::wire::codec::writeValue(_buf, obj.subscription_update_params);
    }

    template<>
    inline gm_structs::GooglePlayBillingFlowOptions readValue<gm_structs::GooglePlayBillingFlowOptions>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::GooglePlayBillingFlowOptions obj;
        obj.offer_token = gm::wire::codec::readValue<std::string>(_buf);
        obj.is_offer_personalized = gm::wire::codec::readValue<bool>(_buf);
        obj.obfuscated_account_id = gm::wire::codec::readValue<std::string>(_buf);
        obj.obfuscated_profile_id = gm::wire::codec::readValue<std::string>(_buf);
        obj.subscription_update_params = gm::wire::codec::readOptional<gm_structs::GooglePlayBillingSubscriptionUpdateParams>(_buf);
        return obj;
    }

    template<>
    inline void writeValue<gm_structs::GooglePlayBillingSubscriptionOfferDetails>(gm::byteio::IByteWriter& _buf, const gm_structs::GooglePlayBillingSubscriptionOfferDetails& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.base_plan_id);
        gm::wire::codec::writeValue(_buf, obj.offer_id);
        gm::wire::codec::writeValue(_buf, obj.offer_tags);
        gm::wire::codec::writeValue(_buf, obj.offer_token);
        gm::wire::codec::writeValue(_buf, obj.pricing_phases);
        gm::wire::codec::writeValue(_buf, obj.has_installment_plan_details);
    }

    template<>
    inline gm_structs::GooglePlayBillingSubscriptionOfferDetails readValue<gm_structs::GooglePlayBillingSubscriptionOfferDetails>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::GooglePlayBillingSubscriptionOfferDetails obj;
        obj.base_plan_id = gm::wire::codec::readValue<std::string>(_buf);
        obj.offer_id = gm::wire::codec::readValue<std::string>(_buf);
        obj.offer_tags = gm::wire::codec::readVector<std::string>(_buf);
        obj.offer_token = gm::wire::codec::readValue<std::string>(_buf);
        obj.pricing_phases = gm::wire::codec::readVector<gm_structs::GooglePlayBillingPricingPhase>(_buf);
        obj.has_installment_plan_details = gm::wire::codec::readValue<bool>(_buf);
        return obj;
    }

    template<>
    inline void writeValue<gm_structs::GooglePlayBillingPurchase>(gm::byteio::IByteWriter& _buf, const gm_structs::GooglePlayBillingPurchase& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.order_id);
        gm::wire::codec::writeValue(_buf, obj.package_name);
        gm::wire::codec::writeValue(_buf, obj.purchase_time);
        gm::wire::codec::writeValue(_buf, obj.purchase_token);
        gm::wire::codec::writeValue(_buf, obj.products);
        gm::wire::codec::writeValue(_buf, obj.signature);
        gm::wire::codec::writeValue(_buf, obj.is_acknowledged);
        gm::wire::codec::writeValue(_buf, obj.is_auto_renewing);
        gm::wire::codec::writeValue(_buf, obj.developer_payload);
        gm::wire::codec::writeValue(_buf, obj.purchase_state);
        gm::wire::codec::writeValue(_buf, obj.quantity);
        gm::wire::codec::writeValue(_buf, obj.original_json);
        gm::wire::codec::writeValue(_buf, obj.is_suspended);
        gm::wire::codec::writeValue(_buf, obj.account_identifiers);
    }

    template<>
    inline gm_structs::GooglePlayBillingPurchase readValue<gm_structs::GooglePlayBillingPurchase>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::GooglePlayBillingPurchase obj;
        obj.order_id = gm::wire::codec::readValue<std::string>(_buf);
        obj.package_name = gm::wire::codec::readValue<std::string>(_buf);
        obj.purchase_time = gm::wire::codec::readValue<double>(_buf);
        obj.purchase_token = gm::wire::codec::readValue<std::string>(_buf);
        obj.products = gm::wire::codec::readVector<std::string>(_buf);
        obj.signature = gm::wire::codec::readValue<std::string>(_buf);
        obj.is_acknowledged = gm::wire::codec::readValue<bool>(_buf);
        obj.is_auto_renewing = gm::wire::codec::readValue<bool>(_buf);
        obj.developer_payload = gm::wire::codec::readValue<std::string>(_buf);
        obj.purchase_state = gm::wire::codec::readValue<std::int32_t>(_buf);
        obj.quantity = gm::wire::codec::readValue<std::int32_t>(_buf);
        obj.original_json = gm::wire::codec::readValue<std::string>(_buf);
        obj.is_suspended = gm::wire::codec::readValue<bool>(_buf);
        obj.account_identifiers = gm::wire::codec::readValue<gm_structs::GooglePlayBillingAccountIdentifiers>(_buf);
        return obj;
    }

    template<>
    inline void writeValue<gm_structs::GooglePlayBillingProductDetails>(gm::byteio::IByteWriter& _buf, const gm_structs::GooglePlayBillingProductDetails& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.product_id);
        gm::wire::codec::writeValue(_buf, obj.title);
        gm::wire::codec::writeValue(_buf, obj.description);
        gm::wire::codec::writeValue(_buf, obj.product_type);
        gm::wire::codec::writeValue(_buf, obj.one_time_purchase_offer_details);
        gm::wire::codec::writeValue(_buf, obj.one_time_purchase_offer_details_list);
        gm::wire::codec::writeValue(_buf, obj.subscription_offer_details);
        gm::wire::codec::writeValue(_buf, obj.all_pricing_phases);
    }

    template<>
    inline gm_structs::GooglePlayBillingProductDetails readValue<gm_structs::GooglePlayBillingProductDetails>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::GooglePlayBillingProductDetails obj;
        obj.product_id = gm::wire::codec::readValue<std::string>(_buf);
        obj.title = gm::wire::codec::readValue<std::string>(_buf);
        obj.description = gm::wire::codec::readValue<std::string>(_buf);
        obj.product_type = gm::wire::codec::readValue<std::string>(_buf);
        obj.one_time_purchase_offer_details = gm::wire::codec::readOptional<gm_structs::GooglePlayBillingOneTimePurchaseOfferDetails>(_buf);
        obj.one_time_purchase_offer_details_list = gm::wire::codec::readVector<gm_structs::GooglePlayBillingOneTimePurchaseOfferDetails>(_buf);
        obj.subscription_offer_details = gm::wire::codec::readVector<gm_structs::GooglePlayBillingSubscriptionOfferDetails>(_buf);
        obj.all_pricing_phases = gm::wire::codec::readVector<gm_structs::GooglePlayBillingPricingPhase>(_buf);
        return obj;
    }

    template<>
    inline void writeValue<gm_structs::GooglePlayBillingEvent>(gm::byteio::IByteWriter& _buf, const gm_structs::GooglePlayBillingEvent& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.type);
        gm::wire::codec::writeValue(_buf, obj.result);
        gm::wire::codec::writeValue(_buf, obj.message);
        gm::wire::codec::writeValue(_buf, obj.config);
        gm::wire::codec::writeValue(_buf, obj.products);
        gm::wire::codec::writeValue(_buf, obj.purchases);
        gm::wire::codec::writeValue(_buf, obj.unfetched_products);
        gm::wire::codec::writeValue(_buf, obj.purchase_token);
        gm::wire::codec::writeValue(_buf, obj.external_transaction_token);
        gm::wire::codec::writeValue(_buf, obj.response_code);
    }

    template<>
    inline gm_structs::GooglePlayBillingEvent readValue<gm_structs::GooglePlayBillingEvent>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::GooglePlayBillingEvent obj;
        obj.type = gm::wire::codec::readValue<std::string>(_buf);
        obj.result = gm::wire::codec::readOptional<gm_structs::GooglePlayBillingResult>(_buf);
        obj.message = gm::wire::codec::readOptional<std::string>(_buf);
        obj.config = gm::wire::codec::readOptional<gm_structs::GooglePlayBillingConfig>(_buf);
        obj.products = gm::wire::codec::readVector<gm_structs::GooglePlayBillingProductDetails>(_buf);
        obj.purchases = gm::wire::codec::readVector<gm_structs::GooglePlayBillingPurchase>(_buf);
        obj.unfetched_products = gm::wire::codec::readVector<gm_structs::GooglePlayBillingUnfetchedProduct>(_buf);
        obj.purchase_token = gm::wire::codec::readOptional<std::string>(_buf);
        obj.external_transaction_token = gm::wire::codec::readOptional<std::string>(_buf);
        obj.response_code = gm::wire::codec::readOptional<std::int32_t>(_buf);
        return obj;
    }

}

namespace gm::wire::details
{
    template<>
    struct gm_struct_traits<gm_structs::GooglePlayBillingResult>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 0;
    };

    template<>
    struct gm_struct_traits<gm_structs::GooglePlayBillingConfig>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 1;
    };

    template<>
    struct gm_struct_traits<gm_structs::GooglePlayBillingProductInput>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 2;
    };

    template<>
    struct gm_struct_traits<gm_structs::GooglePlayBillingSubscriptionUpdateParams>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 3;
    };

    template<>
    struct gm_struct_traits<gm_structs::GooglePlayBillingOneTimePurchaseOfferDetails>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 4;
    };

    template<>
    struct gm_struct_traits<gm_structs::GooglePlayBillingPricingPhase>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 5;
    };

    template<>
    struct gm_struct_traits<gm_structs::GooglePlayBillingAccountIdentifiers>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 6;
    };

    template<>
    struct gm_struct_traits<gm_structs::GooglePlayBillingUnfetchedProduct>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 7;
    };

    template<>
    struct gm_struct_traits<gm_structs::GooglePlayBillingFlowOptions>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 8;
    };

    template<>
    struct gm_struct_traits<gm_structs::GooglePlayBillingSubscriptionOfferDetails>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 9;
    };

    template<>
    struct gm_struct_traits<gm_structs::GooglePlayBillingPurchase>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 10;
    };

    template<>
    struct gm_struct_traits<gm_structs::GooglePlayBillingProductDetails>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 11;
    };

    template<>
    struct gm_struct_traits<gm_structs::GooglePlayBillingEvent>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 12;
    };

}

void play_billing_init(const gm::wire::GMFunction& callback);
void play_billing_start_connection(const gm::wire::GMFunction& callback_start, const gm::wire::GMFunction& callback_disconnect);
void play_billing_end_connection();
std::int32_t play_billing_get_connection_state();
bool play_billing_is_ready();
void play_billing_get_config_async(const gm::wire::GMFunction& callback);
void play_billing_is_alternative_billing_only_available_async(const gm::wire::GMFunction& callback);
void play_billing_is_external_offer_available_async(const gm::wire::GMFunction& callback);
gm_structs::GooglePlayBillingResult play_billing_is_feature_supported(std::string_view feature);
void play_billing_query_product_details_async(const std::vector<gm_structs::GooglePlayBillingProductInput>& products, const gm::wire::GMFunction& callback);
void play_billing_query_products(const std::vector<gm_structs::GooglePlayBillingProductInput>& products, const gm::wire::GMFunction& callback);
void play_billing_clear_products();
bool play_billing_launch_billing_flow(std::string_view product_id);
bool play_billing_launch_billing_flow_ext(std::string_view product_id, const gm_structs::GooglePlayBillingFlowOptions& options);
gm_structs::GooglePlayBillingResult play_billing_launch_billing_flow_result(std::string_view product_id, const gm_structs::GooglePlayBillingFlowOptions& options);
void play_billing_query_purchases_async(std::string_view product_type, const gm::wire::GMFunction& callback);
void play_billing_acknowledge_purchase(std::string_view purchase_token, const gm::wire::GMFunction& callback);
void play_billing_consume_async(std::string_view purchase_token, const gm::wire::GMFunction& callback);
void play_billing_create_alternative_billing_only_reporting_details_async(const gm::wire::GMFunction& callback);
void play_billing_create_external_offer_reporting_details_async(const gm::wire::GMFunction& callback);
void play_billing_show_in_app_messages(const gm::wire::GMFunction& callback);
