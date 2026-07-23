// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;

import java.nio.ByteBuffer;

public record GooglePlayBillingPreorderDetails(double preorder_release_time, double preorder_presale_end_time) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 8;
    @Override
    public void encode(ByteBuffer b)
    {
        GooglePlayBillingPreorderDetailsCodec.write(b, this);
    }
}
