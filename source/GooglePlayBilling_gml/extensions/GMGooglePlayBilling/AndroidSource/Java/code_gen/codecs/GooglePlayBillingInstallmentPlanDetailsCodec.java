// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingInstallmentPlanDetailsCodec {
    private GooglePlayBillingInstallmentPlanDetailsCodec()
    {
    }
    public static GooglePlayBillingInstallmentPlanDetails read(ByteBuffer b)
    {
        int commitment_payments_count = GMExtWire.readI32(b);

        int subsequent_commitment_payments_count = GMExtWire.readI32(b);

        return new GooglePlayBillingInstallmentPlanDetails(commitment_payments_count, subsequent_commitment_payments_count);
    }

    public static void write(ByteBuffer b, GooglePlayBillingInstallmentPlanDetails obj)
    {
        GMExtWire.writeI32(b, obj.commitment_payments_count());

        GMExtWire.writeI32(b, obj.subsequent_commitment_payments_count());

    }
}