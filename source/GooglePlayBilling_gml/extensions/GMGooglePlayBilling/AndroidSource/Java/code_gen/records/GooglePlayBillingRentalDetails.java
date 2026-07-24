// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;

import java.nio.ByteBuffer;
import java.util.Optional;

public record GooglePlayBillingRentalDetails(String rental_period, java.util.Optional<String> rental_expiration_period) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 7;
    @Override
    public void encode(ByteBuffer b)
    {
        GooglePlayBillingRentalDetailsCodec.write(b, this);
    }
}
