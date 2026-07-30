// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;
import ${YYAndroidPackageName}.enums.*;

import java.nio.ByteBuffer;

public record GooglePlayBillingUnfetchedProduct(String product_id, GooglePlayBillingProductType product_type, GooglePlayBillingUnfetchedProductStatus status_code) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 16;
    @Override
    public void encode(GMExtWire.IByteWriter b)
    {
        GooglePlayBillingUnfetchedProductCodec.write(b, this);
    }
}
