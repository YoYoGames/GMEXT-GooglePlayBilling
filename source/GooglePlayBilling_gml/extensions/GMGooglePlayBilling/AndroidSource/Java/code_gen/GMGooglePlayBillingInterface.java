// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName};
import ${YYAndroidPackageName}.GMExtWire.GMFunction;
import ${YYAndroidPackageName}.GMExtWire.GMValue;
import ${YYAndroidPackageName}.enums.*;
import ${YYAndroidPackageName}.records.*;

import java.util.Optional;
import java.util.List;

public interface GMGooglePlayBillingInterface {
    public void play_billing_init(java.util.Optional<GooglePlayBillingInitOptions> options, GMFunction callback);
    public void play_billing_start_connection(GMFunction callback_start, GMFunction callback_disconnect);
    public void play_billing_end_connection();
    public GooglePlayBillingConnectionState play_billing_get_connection_state();
    public boolean play_billing_is_ready();
    public void play_billing_get_config_async(GMFunction callback);
    public void play_billing_is_alternative_billing_only_available_async(GMFunction callback);
    public void play_billing_is_billing_program_available_async(GooglePlayBillingProgram program, GMFunction callback);
    public GooglePlayBillingResult play_billing_is_feature_supported(GooglePlayBillingFeatureType feature);
    public void play_billing_query_product_details_async(java.util.List<GooglePlayBillingProductInput> products, GMFunction callback);
    public void play_billing_clear_products();
    public GooglePlayBillingResult play_billing_launch_billing_flow(java.util.List<GooglePlayBillingProductDetailsParams> items, java.util.Optional<GooglePlayBillingFlowOptions> options);
    public void play_billing_query_purchases_async(GooglePlayBillingProductType product_type, boolean include_suspended_subscriptions, GMFunction callback);
    public void play_billing_acknowledge_purchase(String purchase_token, GMFunction callback);
    public void play_billing_consume_async(String purchase_token, GMFunction callback);
    public void play_billing_create_alternative_billing_only_reporting_details_async(GMFunction callback);
    public void play_billing_create_billing_program_reporting_details_async(GooglePlayBillingProgram program, GMFunction callback);
    public GooglePlayBillingResult play_billing_show_in_app_messages(java.util.Optional<GooglePlayBillingInAppMessageOptions> options, GMFunction callback);
    public void play_billing_get_billing_choice_info_async(GMFunction callback);
    public void play_billing_show_billing_program_information_dialog(GooglePlayBillingProgram program, GMFunction callback);
    public void play_billing_show_alternative_billing_only_information_dialog(GMFunction callback);
    public void play_billing_launch_external_link(GooglePlayBillingExternalLinkLaunchOptions options, GMFunction callback);
}