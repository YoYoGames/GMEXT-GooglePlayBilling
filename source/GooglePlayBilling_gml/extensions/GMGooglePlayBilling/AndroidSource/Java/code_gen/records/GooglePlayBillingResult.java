// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;
import ${YYAndroidPackageName}.enums.*;

import java.nio.ByteBuffer;
import java.util.Optional;

public record GooglePlayBillingResult(GooglePlayBillingResponseCode code, java.util.Optional<String> message, GooglePlayBillingPurchasesUpdatedSubResponseCode sub_response_code) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 5;
    @Override
    public void encode(GMExtWire.IByteWriter b)
    {
        GooglePlayBillingResultCodec.write(b, this);
    }
}
