// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;

import java.nio.ByteBuffer;
import java.util.Optional;

public record GooglePlayBillingValidTimeWindow(java.util.Optional<Double> start_time, java.util.Optional<Double> end_time) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 11;
    @Override
    public void encode(ByteBuffer b)
    {
        GooglePlayBillingValidTimeWindowCodec.write(b, this);
    }
}
