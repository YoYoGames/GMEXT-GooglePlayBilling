// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import java.util.Optional;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingInitOptionsCodec {
    private GooglePlayBillingInitOptionsCodec()
    {
    }
    public static GooglePlayBillingInitOptions read(ByteBuffer b)
    {
        java.util.Optional<Boolean> enable_auto_service_reconnection = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            boolean __opt_enable_auto_service_reconnection = GMExtWire.readBool(b);
            enable_auto_service_reconnection = java.util.Optional.of(__opt_enable_auto_service_reconnection);
        }

        java.util.Optional<Boolean> enable_prepaid_plans = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            boolean __opt_enable_prepaid_plans = GMExtWire.readBool(b);
            enable_prepaid_plans = java.util.Optional.of(__opt_enable_prepaid_plans);
        }

        java.util.Optional<Boolean> enable_alternative_billing_only = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            boolean __opt_enable_alternative_billing_only = GMExtWire.readBool(b);
            enable_alternative_billing_only = java.util.Optional.of(__opt_enable_alternative_billing_only);
        }

        java.util.Optional<Boolean> enable_external_content_link = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            boolean __opt_enable_external_content_link = GMExtWire.readBool(b);
            enable_external_content_link = java.util.Optional.of(__opt_enable_external_content_link);
        }

        java.util.Optional<Boolean> enable_external_offer = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            boolean __opt_enable_external_offer = GMExtWire.readBool(b);
            enable_external_offer = java.util.Optional.of(__opt_enable_external_offer);
        }

        java.util.Optional<Boolean> enable_external_payments = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            boolean __opt_enable_external_payments = GMExtWire.readBool(b);
            enable_external_payments = java.util.Optional.of(__opt_enable_external_payments);
        }

        java.util.Optional<Boolean> enable_billing_choice = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            boolean __opt_enable_billing_choice = GMExtWire.readBool(b);
            enable_billing_choice = java.util.Optional.of(__opt_enable_billing_choice);
        }

        return new GooglePlayBillingInitOptions(enable_auto_service_reconnection, enable_prepaid_plans, enable_alternative_billing_only, enable_external_content_link, enable_external_offer, enable_external_payments, enable_billing_choice);
    }

    public static void write(GMExtWire.IByteWriter b, GooglePlayBillingInitOptions obj)
    {
        GMExtWire.writeBool(b, obj.enable_auto_service_reconnection() != null && obj.enable_auto_service_reconnection().isPresent());
        if (obj.enable_auto_service_reconnection() != null && obj.enable_auto_service_reconnection().isPresent())
        {
            GMExtWire.writeBool(b, obj.enable_auto_service_reconnection().get());
        }

        GMExtWire.writeBool(b, obj.enable_prepaid_plans() != null && obj.enable_prepaid_plans().isPresent());
        if (obj.enable_prepaid_plans() != null && obj.enable_prepaid_plans().isPresent())
        {
            GMExtWire.writeBool(b, obj.enable_prepaid_plans().get());
        }

        GMExtWire.writeBool(b, obj.enable_alternative_billing_only() != null && obj.enable_alternative_billing_only().isPresent());
        if (obj.enable_alternative_billing_only() != null && obj.enable_alternative_billing_only().isPresent())
        {
            GMExtWire.writeBool(b, obj.enable_alternative_billing_only().get());
        }

        GMExtWire.writeBool(b, obj.enable_external_content_link() != null && obj.enable_external_content_link().isPresent());
        if (obj.enable_external_content_link() != null && obj.enable_external_content_link().isPresent())
        {
            GMExtWire.writeBool(b, obj.enable_external_content_link().get());
        }

        GMExtWire.writeBool(b, obj.enable_external_offer() != null && obj.enable_external_offer().isPresent());
        if (obj.enable_external_offer() != null && obj.enable_external_offer().isPresent())
        {
            GMExtWire.writeBool(b, obj.enable_external_offer().get());
        }

        GMExtWire.writeBool(b, obj.enable_external_payments() != null && obj.enable_external_payments().isPresent());
        if (obj.enable_external_payments() != null && obj.enable_external_payments().isPresent())
        {
            GMExtWire.writeBool(b, obj.enable_external_payments().get());
        }

        GMExtWire.writeBool(b, obj.enable_billing_choice() != null && obj.enable_billing_choice().isPresent());
        if (obj.enable_billing_choice() != null && obj.enable_billing_choice().isPresent())
        {
            GMExtWire.writeBool(b, obj.enable_billing_choice().get());
        }

    }
}