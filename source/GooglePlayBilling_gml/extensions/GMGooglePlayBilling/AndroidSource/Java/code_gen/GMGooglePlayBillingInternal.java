// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName};

import java.nio.ByteBuffer;
import java.util.*;
import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.GMExtWire.GMFunction;
import ${YYAndroidPackageName}.GMExtWire.GMValue;
import ${YYAndroidPackageName}.records.*;
import ${YYAndroidPackageName}.codecs.*;
import ${YYAndroidPackageName}.enums.*;

public abstract class GMGooglePlayBillingInternal extends RunnerSocial {

    private final GMGooglePlayBillingKotlin __kotlin_instance = new GMGooglePlayBillingKotlin();

    private final GMExtWire.DispatchQueue __dispatch_queue = new GMExtWire.DispatchQueue();
    public double __EXT_NATIVE__GMGooglePlayBilling_invocation_handler(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __dispatch_queue.fetch(__ret_buffer);
    }

    public double __EXT_NATIVE__play_billing_init(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: options, type: optional<struct GooglePlayBillingInitOptions>
        java.util.Optional<GooglePlayBillingInitOptions> options = java.util.Optional.empty();
        if (GMExtWire.readBool(__arg_buffer))
        {
            GooglePlayBillingInitOptions __opt_options = GooglePlayBillingInitOptionsCodec.read(__arg_buffer);
            options = java.util.Optional.of(__opt_options);
        }

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        __kotlin_instance.play_billing_init(options, callback);
        return 0;
    }

    public double __EXT_NATIVE__play_billing_start_connection(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: callback_start, type: Function
        GMFunction callback_start = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        // field: callback_disconnect, type: Function
        GMFunction callback_disconnect = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        __kotlin_instance.play_billing_start_connection(callback_start, callback_disconnect);
        return 0;
    }

    public double __EXT_NATIVE__play_billing_end_connection()
    {
        __kotlin_instance.play_billing_end_connection();
        return 0;
    }

    public double __EXT_NATIVE__play_billing_get_connection_state(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        GooglePlayBillingConnectionState __result = __kotlin_instance.play_billing_get_connection_state();

        GMExtWire.order(__ret_buffer);
        // return: __result, type: enum GooglePlayBillingConnectionState
        GMExtWire.writeI32(__ret_buffer, __result.value());

        return 0;
    }

    public double __EXT_NATIVE__play_billing_is_ready()
    {
        boolean __result = __kotlin_instance.play_billing_is_ready();
        return __result ? 1.0 : 0.0;
    }

    public double __EXT_NATIVE__play_billing_get_config_async(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        __kotlin_instance.play_billing_get_config_async(callback);
        return 0;
    }

    public double __EXT_NATIVE__play_billing_is_alternative_billing_only_available_async(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        __kotlin_instance.play_billing_is_alternative_billing_only_available_async(callback);
        return 0;
    }

    public double __EXT_NATIVE__play_billing_is_billing_program_available_async(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: program, type: enum GooglePlayBillingProgram
        GooglePlayBillingProgram program = GooglePlayBillingProgram.from(GMExtWire.readI32(__arg_buffer));

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        __kotlin_instance.play_billing_is_billing_program_available_async(program, callback);
        return 0;
    }

    public double __EXT_NATIVE__play_billing_is_feature_supported(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: feature, type: enum GooglePlayBillingFeatureType
        GooglePlayBillingFeatureType feature = GooglePlayBillingFeatureType.from(GMExtWire.readI32(__arg_buffer));

        GooglePlayBillingResult __result = __kotlin_instance.play_billing_is_feature_supported(feature);

        GMExtWire.order(__ret_buffer);
        // return: __result, type: struct GooglePlayBillingResult
        GooglePlayBillingResultCodec.write(__ret_buffer, __result);

        return 0;
    }

    public double __EXT_NATIVE__play_billing_query_product_details_async(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: products, type: struct GooglePlayBillingProductInput[]
        java.util.List<GooglePlayBillingProductInput> products = GMExtWire.readList(__arg_buffer, bb -> GooglePlayBillingProductInputCodec.read(bb));

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        __kotlin_instance.play_billing_query_product_details_async(products, callback);
        return 0;
    }

    public double __EXT_NATIVE__play_billing_clear_products()
    {
        __kotlin_instance.play_billing_clear_products();
        return 0;
    }

    public double __EXT_NATIVE__play_billing_launch_billing_flow(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: items, type: struct GooglePlayBillingProductDetailsParams[]
        java.util.List<GooglePlayBillingProductDetailsParams> items = GMExtWire.readList(__arg_buffer, bb -> GooglePlayBillingProductDetailsParamsCodec.read(bb));

        // field: options, type: optional<struct GooglePlayBillingFlowOptions>
        java.util.Optional<GooglePlayBillingFlowOptions> options = java.util.Optional.empty();
        if (GMExtWire.readBool(__arg_buffer))
        {
            GooglePlayBillingFlowOptions __opt_options = GooglePlayBillingFlowOptionsCodec.read(__arg_buffer);
            options = java.util.Optional.of(__opt_options);
        }

        GooglePlayBillingResult __result = __kotlin_instance.play_billing_launch_billing_flow(items, options);

        GMExtWire.order(__ret_buffer);
        // return: __result, type: struct GooglePlayBillingResult
        GooglePlayBillingResultCodec.write(__ret_buffer, __result);

        return 0;
    }

    public double __EXT_NATIVE__play_billing_query_purchases_async(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: product_type, type: enum GooglePlayBillingProductType
        GooglePlayBillingProductType product_type = GooglePlayBillingProductType.from(GMExtWire.readI32(__arg_buffer));

        // field: include_suspended_subscriptions, type: Bool
        boolean include_suspended_subscriptions = GMExtWire.readBool(__arg_buffer);

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        __kotlin_instance.play_billing_query_purchases_async(product_type, include_suspended_subscriptions, callback);
        return 0;
    }

    public double __EXT_NATIVE__play_billing_acknowledge_purchase(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: purchase_token, type: String
        String purchase_token = GMExtWire.readString(__arg_buffer);

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        __kotlin_instance.play_billing_acknowledge_purchase(purchase_token, callback);
        return 0;
    }

    public double __EXT_NATIVE__play_billing_consume_async(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: purchase_token, type: String
        String purchase_token = GMExtWire.readString(__arg_buffer);

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        __kotlin_instance.play_billing_consume_async(purchase_token, callback);
        return 0;
    }

    public double __EXT_NATIVE__play_billing_create_alternative_billing_only_reporting_details_async(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        __kotlin_instance.play_billing_create_alternative_billing_only_reporting_details_async(callback);
        return 0;
    }

    public double __EXT_NATIVE__play_billing_create_billing_program_reporting_details_async(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: program, type: enum GooglePlayBillingProgram
        GooglePlayBillingProgram program = GooglePlayBillingProgram.from(GMExtWire.readI32(__arg_buffer));

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        __kotlin_instance.play_billing_create_billing_program_reporting_details_async(program, callback);
        return 0;
    }

    public double __EXT_NATIVE__play_billing_show_in_app_messages(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: options, type: optional<struct GooglePlayBillingInAppMessageOptions>
        java.util.Optional<GooglePlayBillingInAppMessageOptions> options = java.util.Optional.empty();
        if (GMExtWire.readBool(__arg_buffer))
        {
            GooglePlayBillingInAppMessageOptions __opt_options = GooglePlayBillingInAppMessageOptionsCodec.read(__arg_buffer);
            options = java.util.Optional.of(__opt_options);
        }

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        GooglePlayBillingResult __result = __kotlin_instance.play_billing_show_in_app_messages(options, callback);

        GMExtWire.order(__ret_buffer);
        // return: __result, type: struct GooglePlayBillingResult
        GooglePlayBillingResultCodec.write(__ret_buffer, __result);

        return 0;
    }

    public double __EXT_NATIVE__play_billing_get_billing_choice_info_async(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        __kotlin_instance.play_billing_get_billing_choice_info_async(callback);
        return 0;
    }

    public double __EXT_NATIVE__play_billing_show_billing_program_information_dialog(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: program, type: enum GooglePlayBillingProgram
        GooglePlayBillingProgram program = GooglePlayBillingProgram.from(GMExtWire.readI32(__arg_buffer));

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        __kotlin_instance.play_billing_show_billing_program_information_dialog(program, callback);
        return 0;
    }

    public double __EXT_NATIVE__play_billing_show_alternative_billing_only_information_dialog(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        __kotlin_instance.play_billing_show_alternative_billing_only_information_dialog(callback);
        return 0;
    }

    public double __EXT_NATIVE__play_billing_launch_external_link(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: options, type: struct GooglePlayBillingExternalLinkLaunchOptions
        GooglePlayBillingExternalLinkLaunchOptions options = GooglePlayBillingExternalLinkLaunchOptionsCodec.read(__arg_buffer);

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        __kotlin_instance.play_billing_launch_external_link(options, callback);
        return 0;
    }

}