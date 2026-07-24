// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;

import java.nio.ByteBuffer;
import java.util.List;

public record GooglePlayBillingPendingPurchaseUpdate(String purchase_token, java.util.List<String> products) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 15;
    @Override
    public void encode(ByteBuffer b)
    {
        GooglePlayBillingPendingPurchaseUpdateCodec.write(b, this);
    }
}
