// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingConfigCodec {
    private GooglePlayBillingConfigCodec()
    {
    }
    public static GooglePlayBillingConfig read(ByteBuffer b)
    {
        String country_code = GMExtWire.readString(b);

        return new GooglePlayBillingConfig(country_code);
    }

    public static void write(GMExtWire.IByteWriter b, GooglePlayBillingConfig obj)
    {
        GMExtWire.writeString(b, obj.country_code());

    }
}