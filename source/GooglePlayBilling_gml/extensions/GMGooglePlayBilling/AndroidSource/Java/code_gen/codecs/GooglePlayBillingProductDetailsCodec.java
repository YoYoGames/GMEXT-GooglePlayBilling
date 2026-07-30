// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import java.util.List;
import ${YYAndroidPackageName}.enums.*;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingProductDetailsCodec {
    private GooglePlayBillingProductDetailsCodec()
    {
    }
    public static GooglePlayBillingProductDetails read(ByteBuffer b)
    {
        String product_id = GMExtWire.readString(b);

        String name = GMExtWire.readString(b);

        String title = GMExtWire.readString(b);

        String description = GMExtWire.readString(b);

        GooglePlayBillingProductType product_type = GooglePlayBillingProductType.from(GMExtWire.readI32(b));

        java.util.List<GooglePlayBillingOneTimePurchaseOfferDetails> one_time_purchase_offer_details = GMExtWire.readList(b, bb -> GooglePlayBillingOneTimePurchaseOfferDetailsCodec.read(bb));

        java.util.List<GooglePlayBillingSubscriptionOfferDetails> subscription_offer_details = GMExtWire.readList(b, bb -> GooglePlayBillingSubscriptionOfferDetailsCodec.read(bb));

        return new GooglePlayBillingProductDetails(product_id, name, title, description, product_type, one_time_purchase_offer_details, subscription_offer_details);
    }

    public static void write(GMExtWire.IByteWriter b, GooglePlayBillingProductDetails obj)
    {
        GMExtWire.writeString(b, obj.product_id());

        GMExtWire.writeString(b, obj.name());

        GMExtWire.writeString(b, obj.title());

        GMExtWire.writeString(b, obj.description());

        GMExtWire.writeI32(b, obj.product_type().value());

        GMExtWire.writeList(b, obj.one_time_purchase_offer_details(), (bb, x) -> GooglePlayBillingOneTimePurchaseOfferDetailsCodec.write(bb, x));

        GMExtWire.writeList(b, obj.subscription_offer_details(), (bb, x) -> GooglePlayBillingSubscriptionOfferDetailsCodec.write(bb, x));

    }
}