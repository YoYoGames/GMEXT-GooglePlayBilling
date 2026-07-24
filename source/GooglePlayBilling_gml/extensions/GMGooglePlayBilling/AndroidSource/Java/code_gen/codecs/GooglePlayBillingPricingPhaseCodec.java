// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.enums.*;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingPricingPhaseCodec {
    private GooglePlayBillingPricingPhaseCodec()
    {
    }
    public static GooglePlayBillingPricingPhase read(ByteBuffer b)
    {
        String formatted_price = GMExtWire.readString(b);

        double price_amount_micros = GMExtWire.readF64(b);

        String price_currency_code = GMExtWire.readString(b);

        int billing_cycle_count = GMExtWire.readI32(b);

        String billing_period = GMExtWire.readString(b);

        GooglePlayBillingRecurrenceMode recurrence_mode = GooglePlayBillingRecurrenceMode.from(GMExtWire.readI32(b));

        return new GooglePlayBillingPricingPhase(formatted_price, price_amount_micros, price_currency_code, billing_cycle_count, billing_period, recurrence_mode);
    }

    public static void write(ByteBuffer b, GooglePlayBillingPricingPhase obj)
    {
        GMExtWire.writeString(b, obj.formatted_price());

        GMExtWire.writeF64(b, obj.price_amount_micros());

        GMExtWire.writeString(b, obj.price_currency_code());

        GMExtWire.writeI32(b, obj.billing_cycle_count());

        GMExtWire.writeString(b, obj.billing_period());

        GMExtWire.writeI32(b, obj.recurrence_mode().value());

    }
}