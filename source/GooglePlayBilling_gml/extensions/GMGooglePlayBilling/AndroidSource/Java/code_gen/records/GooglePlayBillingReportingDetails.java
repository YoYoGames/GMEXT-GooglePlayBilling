// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;
import ${YYAndroidPackageName}.enums.*;

import java.nio.ByteBuffer;
import java.util.Optional;

public record GooglePlayBillingReportingDetails(java.util.Optional<GooglePlayBillingProgram> billing_program, String external_transaction_token) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 17;
    @Override
    public void encode(ByteBuffer b)
    {
        GooglePlayBillingReportingDetailsCodec.write(b, this);
    }
}
