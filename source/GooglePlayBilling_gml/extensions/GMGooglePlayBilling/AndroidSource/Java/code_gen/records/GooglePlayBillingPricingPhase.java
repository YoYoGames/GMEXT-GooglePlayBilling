// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;
import ${YYAndroidPackageName}.enums.*;

import java.nio.ByteBuffer;

public record GooglePlayBillingPricingPhase(String formatted_price, double price_amount_micros, String price_currency_code, int billing_cycle_count, String billing_period, GooglePlayBillingRecurrenceMode recurrence_mode) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 12;
    @Override
    public void encode(ByteBuffer b)
    {
        GooglePlayBillingPricingPhaseCodec.write(b, this);
    }
}
