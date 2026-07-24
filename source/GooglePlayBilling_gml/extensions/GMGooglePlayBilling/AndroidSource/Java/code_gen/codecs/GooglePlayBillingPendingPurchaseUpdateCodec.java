// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import java.util.List;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingPendingPurchaseUpdateCodec {
    private GooglePlayBillingPendingPurchaseUpdateCodec()
    {
    }
    public static GooglePlayBillingPendingPurchaseUpdate read(ByteBuffer b)
    {
        String purchase_token = GMExtWire.readString(b);

        java.util.List<String> products = GMExtWire.readList(b, bb -> GMExtWire.readString(bb));

        return new GooglePlayBillingPendingPurchaseUpdate(purchase_token, products);
    }

    public static void write(ByteBuffer b, GooglePlayBillingPendingPurchaseUpdate obj)
    {
        GMExtWire.writeString(b, obj.purchase_token());

        GMExtWire.writeList(b, obj.products(), (bb, x) -> GMExtWire.writeString(bb, x));

    }
}