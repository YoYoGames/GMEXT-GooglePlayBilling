// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;

import java.nio.ByteBuffer;
import java.util.Optional;

public record GooglePlayBillingFlowOptions(java.util.Optional<Boolean> is_offer_personalized, java.util.Optional<String> obfuscated_account_id, java.util.Optional<String> obfuscated_profile_id) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 3;
    @Override
    public void encode(GMExtWire.IByteWriter b)
    {
        GooglePlayBillingFlowOptionsCodec.write(b, this);
    }
}
