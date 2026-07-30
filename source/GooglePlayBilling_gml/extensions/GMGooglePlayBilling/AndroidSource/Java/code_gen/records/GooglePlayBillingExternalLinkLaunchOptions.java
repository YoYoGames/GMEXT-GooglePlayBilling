// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;
import ${YYAndroidPackageName}.enums.*;

import java.nio.ByteBuffer;

public record GooglePlayBillingExternalLinkLaunchOptions(GooglePlayBillingProgram billing_program) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 21;
    @Override
    public void encode(GMExtWire.IByteWriter b)
    {
        GooglePlayBillingExternalLinkLaunchOptionsCodec.write(b, this);
    }
}
