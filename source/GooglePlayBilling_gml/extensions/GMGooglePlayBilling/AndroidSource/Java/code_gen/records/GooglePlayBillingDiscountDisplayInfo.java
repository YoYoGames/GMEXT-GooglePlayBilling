// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;

import java.nio.ByteBuffer;
import java.util.Optional;

public record GooglePlayBillingDiscountDisplayInfo(java.util.Optional<Integer> percentage_discount, java.util.Optional<GooglePlayBillingDiscountAmount> discount_amount) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 23;
    @Override
    public void encode(ByteBuffer b)
    {
        GooglePlayBillingDiscountDisplayInfoCodec.write(b, this);
    }
}
