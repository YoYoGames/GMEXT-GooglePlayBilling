// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;

import java.nio.ByteBuffer;
import java.util.Optional;

public record GooglePlayBillingProductDetailsParams(String product_id, java.util.Optional<String> offer_token, java.util.Optional<GooglePlayBillingSubscriptionUpdateParams> subscription_replacement) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 22;
    @Override
    public void encode(ByteBuffer b)
    {
        GooglePlayBillingProductDetailsParamsCodec.write(b, this);
    }
}
