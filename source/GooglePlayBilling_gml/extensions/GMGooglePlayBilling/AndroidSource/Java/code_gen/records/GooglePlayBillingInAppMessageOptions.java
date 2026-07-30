// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;
import ${YYAndroidPackageName}.enums.*;

import java.nio.ByteBuffer;
import java.util.List;

public record GooglePlayBillingInAppMessageOptions(java.util.List<GooglePlayBillingInAppMessageCategory> categories) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 4;
    @Override
    public void encode(GMExtWire.IByteWriter b)
    {
        GooglePlayBillingInAppMessageOptionsCodec.write(b, this);
    }
}
