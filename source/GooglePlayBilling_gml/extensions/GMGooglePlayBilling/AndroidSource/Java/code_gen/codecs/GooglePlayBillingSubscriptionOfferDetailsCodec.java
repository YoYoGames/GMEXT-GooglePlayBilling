// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import java.util.Optional;
import java.util.List;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingSubscriptionOfferDetailsCodec {
    private GooglePlayBillingSubscriptionOfferDetailsCodec()
    {
    }
    public static GooglePlayBillingSubscriptionOfferDetails read(ByteBuffer b)
    {
        String base_plan_id = GMExtWire.readString(b);

        java.util.Optional<String> offer_id = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            String __opt_offer_id = GMExtWire.readString(b);
            offer_id = java.util.Optional.of(__opt_offer_id);
        }

        java.util.List<String> offer_tags = GMExtWire.readList(b, bb -> GMExtWire.readString(bb));

        String offer_token = GMExtWire.readString(b);

        java.util.List<GooglePlayBillingPricingPhase> pricing_phases = GMExtWire.readList(b, bb -> GooglePlayBillingPricingPhaseCodec.read(bb));

        java.util.Optional<GooglePlayBillingInstallmentPlanDetails> installment_plan_details = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            GooglePlayBillingInstallmentPlanDetails __opt_installment_plan_details = GooglePlayBillingInstallmentPlanDetailsCodec.read(b);
            installment_plan_details = java.util.Optional.of(__opt_installment_plan_details);
        }

        return new GooglePlayBillingSubscriptionOfferDetails(base_plan_id, offer_id, offer_tags, offer_token, pricing_phases, installment_plan_details);
    }

    public static void write(ByteBuffer b, GooglePlayBillingSubscriptionOfferDetails obj)
    {
        GMExtWire.writeString(b, obj.base_plan_id());

        GMExtWire.writeBool(b, obj.offer_id() != null && obj.offer_id().isPresent());
        if (obj.offer_id() != null && obj.offer_id().isPresent())
        {
            GMExtWire.writeString(b, obj.offer_id().get());
        }

        GMExtWire.writeList(b, obj.offer_tags(), (bb, x) -> GMExtWire.writeString(bb, x));

        GMExtWire.writeString(b, obj.offer_token());

        GMExtWire.writeList(b, obj.pricing_phases(), (bb, x) -> GooglePlayBillingPricingPhaseCodec.write(bb, x));

        GMExtWire.writeBool(b, obj.installment_plan_details() != null && obj.installment_plan_details().isPresent());
        if (obj.installment_plan_details() != null && obj.installment_plan_details().isPresent())
        {
            GooglePlayBillingInstallmentPlanDetailsCodec.write(b, obj.installment_plan_details().get());
        }

    }
}