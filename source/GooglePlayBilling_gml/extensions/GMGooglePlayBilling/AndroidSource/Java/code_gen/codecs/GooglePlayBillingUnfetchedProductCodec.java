// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.enums.*;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingUnfetchedProductCodec {
    private GooglePlayBillingUnfetchedProductCodec()
    {
    }
    public static GooglePlayBillingUnfetchedProduct read(ByteBuffer b)
    {
        String product_id = GMExtWire.readString(b);

        GooglePlayBillingProductType product_type = GooglePlayBillingProductType.from(GMExtWire.readI32(b));

        GooglePlayBillingUnfetchedProductStatus status_code = GooglePlayBillingUnfetchedProductStatus.from(GMExtWire.readI32(b));

        return new GooglePlayBillingUnfetchedProduct(product_id, product_type, status_code);
    }

    public static void write(GMExtWire.IByteWriter b, GooglePlayBillingUnfetchedProduct obj)
    {
        GMExtWire.writeString(b, obj.product_id());

        GMExtWire.writeI32(b, obj.product_type().value());

        GMExtWire.writeI32(b, obj.status_code().value());

    }
}