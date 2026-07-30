// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import java.util.Optional;
import ${YYAndroidPackageName}.enums.*;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingSubscriptionUpdateParamsCodec {
    private GooglePlayBillingSubscriptionUpdateParamsCodec()
    {
    }
    public static GooglePlayBillingSubscriptionUpdateParams read(ByteBuffer b)
    {
        String old_purchase_token = GMExtWire.readString(b);

        String old_product_id = GMExtWire.readString(b);

        GooglePlayBillingSubscriptionReplacementMode replacement_mode = GooglePlayBillingSubscriptionReplacementMode.from(GMExtWire.readI32(b));

        java.util.Optional<String> original_external_transaction_id = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            String __opt_original_external_transaction_id = GMExtWire.readString(b);
            original_external_transaction_id = java.util.Optional.of(__opt_original_external_transaction_id);
        }

        return new GooglePlayBillingSubscriptionUpdateParams(old_purchase_token, old_product_id, replacement_mode, original_external_transaction_id);
    }

    public static void write(GMExtWire.IByteWriter b, GooglePlayBillingSubscriptionUpdateParams obj)
    {
        GMExtWire.writeString(b, obj.old_purchase_token());

        GMExtWire.writeString(b, obj.old_product_id());

        GMExtWire.writeI32(b, obj.replacement_mode().value());

        GMExtWire.writeBool(b, obj.original_external_transaction_id() != null && obj.original_external_transaction_id().isPresent());
        if (obj.original_external_transaction_id() != null && obj.original_external_transaction_id().isPresent())
        {
            GMExtWire.writeString(b, obj.original_external_transaction_id().get());
        }

    }
}