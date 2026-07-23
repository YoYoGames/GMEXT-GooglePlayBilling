// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import java.util.Optional;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingProductDetailsParamsCodec {
    private GooglePlayBillingProductDetailsParamsCodec()
    {
    }
    public static GooglePlayBillingProductDetailsParams read(ByteBuffer b)
    {
        String product_id = GMExtWire.readString(b);

        java.util.Optional<String> offer_token = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            String __opt_offer_token = GMExtWire.readString(b);
            offer_token = java.util.Optional.of(__opt_offer_token);
        }

        java.util.Optional<GooglePlayBillingSubscriptionUpdateParams> subscription_replacement = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            GooglePlayBillingSubscriptionUpdateParams __opt_subscription_replacement = GooglePlayBillingSubscriptionUpdateParamsCodec.read(b);
            subscription_replacement = java.util.Optional.of(__opt_subscription_replacement);
        }

        return new GooglePlayBillingProductDetailsParams(product_id, offer_token, subscription_replacement);
    }

    public static void write(ByteBuffer b, GooglePlayBillingProductDetailsParams obj)
    {
        GMExtWire.writeString(b, obj.product_id());

        GMExtWire.writeBool(b, obj.offer_token() != null && obj.offer_token().isPresent());
        if (obj.offer_token() != null && obj.offer_token().isPresent())
        {
            GMExtWire.writeString(b, obj.offer_token().get());
        }

        GMExtWire.writeBool(b, obj.subscription_replacement() != null && obj.subscription_replacement().isPresent());
        if (obj.subscription_replacement() != null && obj.subscription_replacement().isPresent())
        {
            GooglePlayBillingSubscriptionUpdateParamsCodec.write(b, obj.subscription_replacement().get());
        }

    }
}