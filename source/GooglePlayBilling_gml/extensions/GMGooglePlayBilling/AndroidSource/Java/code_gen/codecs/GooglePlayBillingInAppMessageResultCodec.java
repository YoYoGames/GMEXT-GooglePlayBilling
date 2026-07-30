// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import java.util.Optional;
import ${YYAndroidPackageName}.enums.*;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingInAppMessageResultCodec {
    private GooglePlayBillingInAppMessageResultCodec()
    {
    }
    public static GooglePlayBillingInAppMessageResult read(ByteBuffer b)
    {
        GooglePlayBillingInAppMessageResponseCode response_code = GooglePlayBillingInAppMessageResponseCode.from(GMExtWire.readI32(b));

        java.util.Optional<String> purchase_token = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            String __opt_purchase_token = GMExtWire.readString(b);
            purchase_token = java.util.Optional.of(__opt_purchase_token);
        }

        return new GooglePlayBillingInAppMessageResult(response_code, purchase_token);
    }

    public static void write(GMExtWire.IByteWriter b, GooglePlayBillingInAppMessageResult obj)
    {
        GMExtWire.writeI32(b, obj.response_code().value());

        GMExtWire.writeBool(b, obj.purchase_token() != null && obj.purchase_token().isPresent());
        if (obj.purchase_token() != null && obj.purchase_token().isPresent())
        {
            GMExtWire.writeString(b, obj.purchase_token().get());
        }

    }
}