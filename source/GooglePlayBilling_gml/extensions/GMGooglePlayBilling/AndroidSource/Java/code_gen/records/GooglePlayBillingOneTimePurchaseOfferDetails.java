// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;

import java.nio.ByteBuffer;
import java.util.Optional;
import java.util.List;

public record GooglePlayBillingOneTimePurchaseOfferDetails(String formatted_price, double price_amount_micros, String price_currency_code, java.util.Optional<String> offer_id, java.util.Optional<String> offer_token, java.util.List<String> offer_tags, java.util.Optional<String> purchase_option_id, java.util.Optional<Double> full_price_micros, java.util.Optional<GooglePlayBillingRentalDetails> rental_details, java.util.Optional<GooglePlayBillingPreorderDetails> preorder_details, java.util.Optional<GooglePlayBillingDiscountDisplayInfo> discount_display_info, java.util.Optional<GooglePlayBillingLimitedQuantityInfo> limited_quantity_info, java.util.Optional<GooglePlayBillingValidTimeWindow> valid_time_window) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 27;
    @Override
    public void encode(ByteBuffer b)
    {
        GooglePlayBillingOneTimePurchaseOfferDetailsCodec.write(b, this);
    }
}
