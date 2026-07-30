// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;

import java.nio.ByteBuffer;

public record GooglePlayBillingConfig(String country_code) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 6;
    @Override
    public void encode(GMExtWire.IByteWriter b)
    {
        GooglePlayBillingConfigCodec.write(b, this);
    }
}
