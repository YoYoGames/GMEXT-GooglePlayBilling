// ##### extgen :: Auto-generated file do not edit!! #####

#pragma once
#include "core/GMExtUtils.h"

// Internal function used for fetching dispatched function calls to GML
GMEXPORT double __EXT_NATIVE__GMGooglePlayBilling_invocation_handler(char* __ret_buffer, double __ret_buffer_length);

GMEXPORT double __EXT_NATIVE__play_billing_init(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__play_billing_start_connection(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__play_billing_end_connection();
GMEXPORT double __EXT_NATIVE__play_billing_get_connection_state();
GMEXPORT double __EXT_NATIVE__play_billing_is_ready();
GMEXPORT double __EXT_NATIVE__play_billing_get_config_async(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__play_billing_is_alternative_billing_only_available_async(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__play_billing_is_external_offer_available_async(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__play_billing_is_feature_supported(char* feature, char* __ret_buffer, double __ret_buffer_length);
GMEXPORT double __EXT_NATIVE__play_billing_query_product_details_async(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__play_billing_query_products(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__play_billing_clear_products();
GMEXPORT double __EXT_NATIVE__play_billing_launch_billing_flow(char* product_id);
GMEXPORT double __EXT_NATIVE__play_billing_launch_billing_flow_ext(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__play_billing_launch_billing_flow_result(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length);
GMEXPORT double __EXT_NATIVE__play_billing_query_purchases_async(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__play_billing_acknowledge_purchase(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__play_billing_consume_async(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__play_billing_create_alternative_billing_only_reporting_details_async(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__play_billing_create_external_offer_reporting_details_async(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__play_billing_show_in_app_messages(char* __arg_buffer, double __arg_buffer_length);

