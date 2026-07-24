// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import java.util.Optional;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingChoiceInfoCodec {
    private GooglePlayBillingChoiceInfoCodec()
    {
    }
    public static GooglePlayBillingChoiceInfo read(ByteBuffer b)
    {
        java.util.Optional<String> billing_choice_image_url = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            String __opt_billing_choice_image_url = GMExtWire.readString(b);
            billing_choice_image_url = java.util.Optional.of(__opt_billing_choice_image_url);
        }

        java.util.Optional<String> loyalty_info = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            String __opt_loyalty_info = GMExtWire.readString(b);
            loyalty_info = java.util.Optional.of(__opt_loyalty_info);
        }

        return new GooglePlayBillingChoiceInfo(billing_choice_image_url, loyalty_info);
    }

    public static void write(ByteBuffer b, GooglePlayBillingChoiceInfo obj)
    {
        GMExtWire.writeBool(b, obj.billing_choice_image_url() != null && obj.billing_choice_image_url().isPresent());
        if (obj.billing_choice_image_url() != null && obj.billing_choice_image_url().isPresent())
        {
            GMExtWire.writeString(b, obj.billing_choice_image_url().get());
        }

        GMExtWire.writeBool(b, obj.loyalty_info() != null && obj.loyalty_info().isPresent());
        if (obj.loyalty_info() != null && obj.loyalty_info().isPresent())
        {
            GMExtWire.writeString(b, obj.loyalty_info().get());
        }

    }
}