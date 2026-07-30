// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingDiscountAmountCodec {
    private GooglePlayBillingDiscountAmountCodec()
    {
    }
    public static GooglePlayBillingDiscountAmount read(ByteBuffer b)
    {
        String formatted_discount_amount = GMExtWire.readString(b);

        double discount_amount_micros = GMExtWire.readF64(b);

        String discount_amount_currency_code = GMExtWire.readString(b);

        return new GooglePlayBillingDiscountAmount(formatted_discount_amount, discount_amount_micros, discount_amount_currency_code);
    }

    public static void write(GMExtWire.IByteWriter b, GooglePlayBillingDiscountAmount obj)
    {
        GMExtWire.writeString(b, obj.formatted_discount_amount());

        GMExtWire.writeF64(b, obj.discount_amount_micros());

        GMExtWire.writeString(b, obj.discount_amount_currency_code());

    }
}