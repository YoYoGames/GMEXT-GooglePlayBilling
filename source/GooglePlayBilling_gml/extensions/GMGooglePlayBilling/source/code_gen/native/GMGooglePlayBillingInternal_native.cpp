// ##### extgen :: Auto-generated file do not edit!! #####

#include "GMGooglePlayBillingInternal_native.h"
#include "GMGooglePlayBillingInternal_exports.h"

using namespace gm_structs;
using namespace gm::wire::codec;

static gm::runtime::DispatchQueue __dispatch_queue;

// Internal function used for fetching dispatched function calls to GML
GMEXPORT double __EXT_NATIVE__GMGooglePlayBilling_invocation_handler(char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferWriter __bw{ __ret_buffer, static_cast<size_t>(__ret_buffer_length) };
    return __dispatch_queue.fetch(__bw);
}

GMEXPORT double __EXT_NATIVE__play_billing_init(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    play_billing_init(callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__play_billing_start_connection(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback_start, type: Function
    gm::wire::GMFunction callback_start = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    // field: callback_disconnect, type: Function
    gm::wire::GMFunction callback_disconnect = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    play_billing_start_connection(callback_start, callback_disconnect);
    return 0;
}

GMEXPORT double __EXT_NATIVE__play_billing_end_connection()
{
    play_billing_end_connection();
    return 0;
}

GMEXPORT double __EXT_NATIVE__play_billing_get_connection_state()
{
    auto&& __result = play_billing_get_connection_state();
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__play_billing_is_ready()
{
    auto&& __result = play_billing_is_ready();
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__play_billing_get_config_async(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    play_billing_get_config_async(callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__play_billing_is_alternative_billing_only_available_async(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    play_billing_is_alternative_billing_only_available_async(callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__play_billing_is_external_offer_available_async(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    play_billing_is_external_offer_available_async(callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__play_billing_is_feature_supported(char* feature, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = play_billing_is_feature_supported(feature);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: struct GooglePlayBillingResult
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__play_billing_query_product_details_async(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: products, type: struct GooglePlayBillingProductInput[]
    std::vector<gm_structs::GooglePlayBillingProductInput> products = gm::wire::codec::readVector<gm_structs::GooglePlayBillingProductInput>(__br);

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    play_billing_query_product_details_async(products, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__play_billing_query_products(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: products, type: struct GooglePlayBillingProductInput[]
    std::vector<gm_structs::GooglePlayBillingProductInput> products = gm::wire::codec::readVector<gm_structs::GooglePlayBillingProductInput>(__br);

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    play_billing_query_products(products, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__play_billing_clear_products()
{
    play_billing_clear_products();
    return 0;
}

GMEXPORT double __EXT_NATIVE__play_billing_launch_billing_flow(char* product_id)
{
    auto&& __result = play_billing_launch_billing_flow(product_id);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__play_billing_launch_billing_flow_ext(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: product_id, type: String
    std::string_view product_id = gm::wire::codec::readValue<std::string_view>(__br);

    // field: options, type: struct GooglePlayBillingFlowOptions
    gm_structs::GooglePlayBillingFlowOptions options = gm::wire::codec::readValue<gm_structs::GooglePlayBillingFlowOptions>(__br);

    auto&& __result = play_billing_launch_billing_flow_ext(product_id, options);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__play_billing_launch_billing_flow_result(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: product_id, type: String
    std::string_view product_id = gm::wire::codec::readValue<std::string_view>(__br);

    // field: options, type: struct GooglePlayBillingFlowOptions
    gm_structs::GooglePlayBillingFlowOptions options = gm::wire::codec::readValue<gm_structs::GooglePlayBillingFlowOptions>(__br);

    auto&& __result = play_billing_launch_billing_flow_result(product_id, options);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: struct GooglePlayBillingResult
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__play_billing_query_purchases_async(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: product_type, type: String
    std::string_view product_type = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    play_billing_query_purchases_async(product_type, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__play_billing_acknowledge_purchase(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: purchase_token, type: String
    std::string_view purchase_token = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    play_billing_acknowledge_purchase(purchase_token, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__play_billing_consume_async(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: purchase_token, type: String
    std::string_view purchase_token = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    play_billing_consume_async(purchase_token, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__play_billing_create_alternative_billing_only_reporting_details_async(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    play_billing_create_alternative_billing_only_reporting_details_async(callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__play_billing_create_external_offer_reporting_details_async(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    play_billing_create_external_offer_reporting_details_async(callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__play_billing_show_in_app_messages(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    play_billing_show_in_app_messages(callback);
    return 0;
}

