// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;

import java.nio.ByteBuffer;
import java.util.Optional;

public record GooglePlayBillingAccountIdentifiers(java.util.Optional<String> obfuscated_account_id, java.util.Optional<String> obfuscated_profile_id) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 14;
    @Override
    public void encode(ByteBuffer b)
    {
        GooglePlayBillingAccountIdentifiersCodec.write(b, this);
    }
}
