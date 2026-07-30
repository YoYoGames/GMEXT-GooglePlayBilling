// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;

import java.nio.ByteBuffer;

public record GooglePlayBillingDiscountAmount(String formatted_discount_amount, double discount_amount_micros, String discount_amount_currency_code) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 9;
    @Override
    public void encode(GMExtWire.IByteWriter b)
    {
        GooglePlayBillingDiscountAmountCodec.write(b, this);
    }
}
