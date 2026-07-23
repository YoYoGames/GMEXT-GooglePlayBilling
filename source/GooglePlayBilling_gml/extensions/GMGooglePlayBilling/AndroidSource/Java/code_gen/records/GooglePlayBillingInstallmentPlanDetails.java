// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;

import java.nio.ByteBuffer;

public record GooglePlayBillingInstallmentPlanDetails(int commitment_payments_count, int subsequent_commitment_payments_count) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 13;
    @Override
    public void encode(ByteBuffer b)
    {
        GooglePlayBillingInstallmentPlanDetailsCodec.write(b, this);
    }
}
