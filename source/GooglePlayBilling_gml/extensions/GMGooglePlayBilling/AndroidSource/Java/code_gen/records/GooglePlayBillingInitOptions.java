// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;

import java.nio.ByteBuffer;
import java.util.Optional;

public record GooglePlayBillingInitOptions(java.util.Optional<Boolean> enable_auto_service_reconnection, java.util.Optional<Boolean> enable_prepaid_plans, java.util.Optional<Boolean> enable_alternative_billing_only, java.util.Optional<Boolean> enable_external_content_link, java.util.Optional<Boolean> enable_external_offer, java.util.Optional<Boolean> enable_external_payments, java.util.Optional<Boolean> enable_billing_choice) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 0;
    @Override
    public void encode(GMExtWire.IByteWriter b)
    {
        GooglePlayBillingInitOptionsCodec.write(b, this);
    }
}
