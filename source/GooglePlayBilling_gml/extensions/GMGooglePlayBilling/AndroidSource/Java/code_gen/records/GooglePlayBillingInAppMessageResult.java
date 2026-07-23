// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;
import ${YYAndroidPackageName}.enums.*;

import java.nio.ByteBuffer;
import java.util.Optional;

public record GooglePlayBillingInAppMessageResult(GooglePlayBillingInAppMessageResponseCode response_code, java.util.Optional<String> purchase_token) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 19;
    @Override
    public void encode(ByteBuffer b)
    {
        GooglePlayBillingInAppMessageResultCodec.write(b, this);
    }
}
