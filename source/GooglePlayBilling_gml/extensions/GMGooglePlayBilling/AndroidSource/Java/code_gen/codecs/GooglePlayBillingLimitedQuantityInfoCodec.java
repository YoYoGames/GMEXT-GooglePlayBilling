// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingLimitedQuantityInfoCodec {
    private GooglePlayBillingLimitedQuantityInfoCodec()
    {
    }
    public static GooglePlayBillingLimitedQuantityInfo read(ByteBuffer b)
    {
        int maximum_quantity = GMExtWire.readI32(b);

        int remaining_quantity = GMExtWire.readI32(b);

        return new GooglePlayBillingLimitedQuantityInfo(maximum_quantity, remaining_quantity);
    }

    public static void write(ByteBuffer b, GooglePlayBillingLimitedQuantityInfo obj)
    {
        GMExtWire.writeI32(b, obj.maximum_quantity());

        GMExtWire.writeI32(b, obj.remaining_quantity());

    }
}