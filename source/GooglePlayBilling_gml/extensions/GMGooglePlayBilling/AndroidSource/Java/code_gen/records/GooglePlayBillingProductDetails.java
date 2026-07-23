// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;
import ${YYAndroidPackageName}.enums.*;

import java.nio.ByteBuffer;
import java.util.List;

public record GooglePlayBillingProductDetails(String product_id, String name, String title, String description, GooglePlayBillingProductType product_type, java.util.List<GooglePlayBillingOneTimePurchaseOfferDetails> one_time_purchase_offer_details, java.util.List<GooglePlayBillingSubscriptionOfferDetails> subscription_offer_details) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 28;
    @Override
    public void encode(ByteBuffer b)
    {
        GooglePlayBillingProductDetailsCodec.write(b, this);
    }
}
