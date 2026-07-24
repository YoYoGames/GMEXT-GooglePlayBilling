// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;

import java.nio.ByteBuffer;
import java.util.List;

public record GooglePlayBillingProductDetailsQueryResult(java.util.List<GooglePlayBillingProductDetails> products, java.util.List<GooglePlayBillingUnfetchedProduct> unfetched_products) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 29;
    @Override
    public void encode(ByteBuffer b)
    {
        GooglePlayBillingProductDetailsQueryResultCodec.write(b, this);
    }
}
