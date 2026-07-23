// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import java.util.Optional;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingDiscountDisplayInfoCodec {
    private GooglePlayBillingDiscountDisplayInfoCodec()
    {
    }
    public static GooglePlayBillingDiscountDisplayInfo read(ByteBuffer b)
    {
        java.util.Optional<Integer> percentage_discount = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            int __opt_percentage_discount = GMExtWire.readI32(b);
            percentage_discount = java.util.Optional.of(__opt_percentage_discount);
        }

        java.util.Optional<GooglePlayBillingDiscountAmount> discount_amount = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            GooglePlayBillingDiscountAmount __opt_discount_amount = GooglePlayBillingDiscountAmountCodec.read(b);
            discount_amount = java.util.Optional.of(__opt_discount_amount);
        }

        return new GooglePlayBillingDiscountDisplayInfo(percentage_discount, discount_amount);
    }

    public static void write(ByteBuffer b, GooglePlayBillingDiscountDisplayInfo obj)
    {
        GMExtWire.writeBool(b, obj.percentage_discount() != null && obj.percentage_discount().isPresent());
        if (obj.percentage_discount() != null && obj.percentage_discount().isPresent())
        {
            GMExtWire.writeI32(b, obj.percentage_discount().get());
        }

        GMExtWire.writeBool(b, obj.discount_amount() != null && obj.discount_amount().isPresent());
        if (obj.discount_amount() != null && obj.discount_amount().isPresent())
        {
            GooglePlayBillingDiscountAmountCodec.write(b, obj.discount_amount().get());
        }

    }
}