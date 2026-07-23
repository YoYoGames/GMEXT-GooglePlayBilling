// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;

import java.nio.ByteBuffer;
import java.util.Optional;
import java.util.List;

public record GooglePlayBillingSubscriptionOfferDetails(String base_plan_id, java.util.Optional<String> offer_id, java.util.List<String> offer_tags, String offer_token, java.util.List<GooglePlayBillingPricingPhase> pricing_phases, java.util.Optional<GooglePlayBillingInstallmentPlanDetails> installment_plan_details) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 24;
    @Override
    public void encode(ByteBuffer b)
    {
        GooglePlayBillingSubscriptionOfferDetailsCodec.write(b, this);
    }
}
