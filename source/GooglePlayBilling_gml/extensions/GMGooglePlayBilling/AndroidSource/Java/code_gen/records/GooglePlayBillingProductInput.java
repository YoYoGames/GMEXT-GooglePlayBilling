// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;
import ${YYAndroidPackageName}.enums.*;

import java.nio.ByteBuffer;
import java.util.Optional;

public record GooglePlayBillingProductInput(String product_id, GooglePlayBillingProductType product_type, java.util.Optional<String> dynamic_product_token) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 1;
    @Override
    public void encode(ByteBuffer b)
    {
        GooglePlayBillingProductInputCodec.write(b, this);
    }
}
