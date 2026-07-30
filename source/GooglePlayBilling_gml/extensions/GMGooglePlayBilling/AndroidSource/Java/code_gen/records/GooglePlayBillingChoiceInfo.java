// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;

import java.nio.ByteBuffer;
import java.util.Optional;

public record GooglePlayBillingChoiceInfo(java.util.Optional<String> billing_choice_image_url, java.util.Optional<String> loyalty_info) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 20;
    @Override
    public void encode(GMExtWire.IByteWriter b)
    {
        GooglePlayBillingChoiceInfoCodec.write(b, this);
    }
}
