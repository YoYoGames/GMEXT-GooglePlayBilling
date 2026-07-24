// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;
import ${YYAndroidPackageName}.enums.*;

import java.nio.ByteBuffer;
import java.util.Optional;

public record GooglePlayBillingSubscriptionUpdateParams(String old_purchase_token, String old_product_id, GooglePlayBillingSubscriptionReplacementMode replacement_mode, java.util.Optional<String> original_external_transaction_id) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 2;
    @Override
    public void encode(ByteBuffer b)
    {
        GooglePlayBillingSubscriptionUpdateParamsCodec.write(b, this);
    }
}
