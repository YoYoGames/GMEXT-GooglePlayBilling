// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import java.util.Optional;
import ${YYAndroidPackageName}.enums.*;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingResultCodec {
    private GooglePlayBillingResultCodec()
    {
    }
    public static GooglePlayBillingResult read(ByteBuffer b)
    {
        GooglePlayBillingResponseCode code = GooglePlayBillingResponseCode.from(GMExtWire.readI32(b));

        java.util.Optional<String> message = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            String __opt_message = GMExtWire.readString(b);
            message = java.util.Optional.of(__opt_message);
        }

        GooglePlayBillingPurchasesUpdatedSubResponseCode sub_response_code = GooglePlayBillingPurchasesUpdatedSubResponseCode.from(GMExtWire.readI32(b));

        return new GooglePlayBillingResult(code, message, sub_response_code);
    }

    public static void write(ByteBuffer b, GooglePlayBillingResult obj)
    {
        GMExtWire.writeI32(b, obj.code().value());

        GMExtWire.writeBool(b, obj.message() != null && obj.message().isPresent());
        if (obj.message() != null && obj.message().isPresent())
        {
            GMExtWire.writeString(b, obj.message().get());
        }

        GMExtWire.writeI32(b, obj.sub_response_code().value());

    }
}