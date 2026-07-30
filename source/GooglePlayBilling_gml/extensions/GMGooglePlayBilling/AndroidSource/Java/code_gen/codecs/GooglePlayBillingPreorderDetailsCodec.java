// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingPreorderDetailsCodec {
    private GooglePlayBillingPreorderDetailsCodec()
    {
    }
    public static GooglePlayBillingPreorderDetails read(ByteBuffer b)
    {
        double preorder_release_time = GMExtWire.readF64(b);

        double preorder_presale_end_time = GMExtWire.readF64(b);

        return new GooglePlayBillingPreorderDetails(preorder_release_time, preorder_presale_end_time);
    }

    public static void write(GMExtWire.IByteWriter b, GooglePlayBillingPreorderDetails obj)
    {
        GMExtWire.writeF64(b, obj.preorder_release_time());

        GMExtWire.writeF64(b, obj.preorder_presale_end_time());

    }
}