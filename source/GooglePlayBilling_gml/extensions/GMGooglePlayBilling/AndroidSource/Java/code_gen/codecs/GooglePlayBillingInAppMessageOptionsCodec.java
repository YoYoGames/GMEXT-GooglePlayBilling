// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import java.util.List;
import ${YYAndroidPackageName}.enums.*;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingInAppMessageOptionsCodec {
    private GooglePlayBillingInAppMessageOptionsCodec()
    {
    }
    public static GooglePlayBillingInAppMessageOptions read(ByteBuffer b)
    {
        java.util.List<GooglePlayBillingInAppMessageCategory> categories = GMExtWire.readList(b, bb -> GooglePlayBillingInAppMessageCategory.from(GMExtWire.readI32(bb)));

        return new GooglePlayBillingInAppMessageOptions(categories);
    }

    public static void write(GMExtWire.IByteWriter b, GooglePlayBillingInAppMessageOptions obj)
    {
        GMExtWire.writeList(b, obj.categories(), (bb, x) -> GMExtWire.writeI32(bb, x.value()));

    }
}