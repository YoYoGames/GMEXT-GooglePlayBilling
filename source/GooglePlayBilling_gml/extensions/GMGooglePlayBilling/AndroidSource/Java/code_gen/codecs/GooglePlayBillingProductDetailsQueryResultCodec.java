// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import java.util.List;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingProductDetailsQueryResultCodec {
    private GooglePlayBillingProductDetailsQueryResultCodec()
    {
    }
    public static GooglePlayBillingProductDetailsQueryResult read(ByteBuffer b)
    {
        java.util.List<GooglePlayBillingProductDetails> products = GMExtWire.readList(b, bb -> GooglePlayBillingProductDetailsCodec.read(bb));

        java.util.List<GooglePlayBillingUnfetchedProduct> unfetched_products = GMExtWire.readList(b, bb -> GooglePlayBillingUnfetchedProductCodec.read(bb));

        return new GooglePlayBillingProductDetailsQueryResult(products, unfetched_products);
    }

    public static void write(ByteBuffer b, GooglePlayBillingProductDetailsQueryResult obj)
    {
        GMExtWire.writeList(b, obj.products(), (bb, x) -> GooglePlayBillingProductDetailsCodec.write(bb, x));

        GMExtWire.writeList(b, obj.unfetched_products(), (bb, x) -> GooglePlayBillingUnfetchedProductCodec.write(bb, x));

    }
}