// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import java.util.Optional;
import ${YYAndroidPackageName}.enums.*;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingProductInputCodec {
    private GooglePlayBillingProductInputCodec()
    {
    }
    public static GooglePlayBillingProductInput read(ByteBuffer b)
    {
        String product_id = GMExtWire.readString(b);

        GooglePlayBillingProductType product_type = GooglePlayBillingProductType.from(GMExtWire.readI32(b));

        java.util.Optional<String> dynamic_product_token = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            String __opt_dynamic_product_token = GMExtWire.readString(b);
            dynamic_product_token = java.util.Optional.of(__opt_dynamic_product_token);
        }

        return new GooglePlayBillingProductInput(product_id, product_type, dynamic_product_token);
    }

    public static void write(ByteBuffer b, GooglePlayBillingProductInput obj)
    {
        GMExtWire.writeString(b, obj.product_id());

        GMExtWire.writeI32(b, obj.product_type().value());

        GMExtWire.writeBool(b, obj.dynamic_product_token() != null && obj.dynamic_product_token().isPresent());
        if (obj.dynamic_product_token() != null && obj.dynamic_product_token().isPresent())
        {
            GMExtWire.writeString(b, obj.dynamic_product_token().get());
        }

    }
}