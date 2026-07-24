// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;

import java.nio.ByteBuffer;

public record GooglePlayBillingLimitedQuantityInfo(int maximum_quantity, int remaining_quantity) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 10;
    @Override
    public void encode(ByteBuffer b)
    {
        GooglePlayBillingLimitedQuantityInfoCodec.write(b, this);
    }
}
