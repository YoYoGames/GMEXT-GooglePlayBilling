// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import java.util.Optional;
import java.util.List;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingOneTimePurchaseOfferDetailsCodec {
    private GooglePlayBillingOneTimePurchaseOfferDetailsCodec()
    {
    }
    public static GooglePlayBillingOneTimePurchaseOfferDetails read(ByteBuffer b)
    {
        String formatted_price = GMExtWire.readString(b);

        double price_amount_micros = GMExtWire.readF64(b);

        String price_currency_code = GMExtWire.readString(b);

        java.util.Optional<String> offer_id = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            String __opt_offer_id = GMExtWire.readString(b);
            offer_id = java.util.Optional.of(__opt_offer_id);
        }

        java.util.Optional<String> offer_token = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            String __opt_offer_token = GMExtWire.readString(b);
            offer_token = java.util.Optional.of(__opt_offer_token);
        }

        java.util.List<String> offer_tags = GMExtWire.readList(b, bb -> GMExtWire.readString(bb));

        java.util.Optional<String> purchase_option_id = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            String __opt_purchase_option_id = GMExtWire.readString(b);
            purchase_option_id = java.util.Optional.of(__opt_purchase_option_id);
        }

        java.util.Optional<Double> full_price_micros = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            double __opt_full_price_micros = GMExtWire.readF64(b);
            full_price_micros = java.util.Optional.of(__opt_full_price_micros);
        }

        java.util.Optional<GooglePlayBillingRentalDetails> rental_details = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            GooglePlayBillingRentalDetails __opt_rental_details = GooglePlayBillingRentalDetailsCodec.read(b);
            rental_details = java.util.Optional.of(__opt_rental_details);
        }

        java.util.Optional<GooglePlayBillingPreorderDetails> preorder_details = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            GooglePlayBillingPreorderDetails __opt_preorder_details = GooglePlayBillingPreorderDetailsCodec.read(b);
            preorder_details = java.util.Optional.of(__opt_preorder_details);
        }

        java.util.Optional<GooglePlayBillingDiscountDisplayInfo> discount_display_info = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            GooglePlayBillingDiscountDisplayInfo __opt_discount_display_info = GooglePlayBillingDiscountDisplayInfoCodec.read(b);
            discount_display_info = java.util.Optional.of(__opt_discount_display_info);
        }

        java.util.Optional<GooglePlayBillingLimitedQuantityInfo> limited_quantity_info = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            GooglePlayBillingLimitedQuantityInfo __opt_limited_quantity_info = GooglePlayBillingLimitedQuantityInfoCodec.read(b);
            limited_quantity_info = java.util.Optional.of(__opt_limited_quantity_info);
        }

        java.util.Optional<GooglePlayBillingValidTimeWindow> valid_time_window = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            GooglePlayBillingValidTimeWindow __opt_valid_time_window = GooglePlayBillingValidTimeWindowCodec.read(b);
            valid_time_window = java.util.Optional.of(__opt_valid_time_window);
        }

        return new GooglePlayBillingOneTimePurchaseOfferDetails(formatted_price, price_amount_micros, price_currency_code, offer_id, offer_token, offer_tags, purchase_option_id, full_price_micros, rental_details, preorder_details, discount_display_info, limited_quantity_info, valid_time_window);
    }

    public static void write(GMExtWire.IByteWriter b, GooglePlayBillingOneTimePurchaseOfferDetails obj)
    {
        GMExtWire.writeString(b, obj.formatted_price());

        GMExtWire.writeF64(b, obj.price_amount_micros());

        GMExtWire.writeString(b, obj.price_currency_code());

        GMExtWire.writeBool(b, obj.offer_id() != null && obj.offer_id().isPresent());
        if (obj.offer_id() != null && obj.offer_id().isPresent())
        {
            GMExtWire.writeString(b, obj.offer_id().get());
        }

        GMExtWire.writeBool(b, obj.offer_token() != null && obj.offer_token().isPresent());
        if (obj.offer_token() != null && obj.offer_token().isPresent())
        {
            GMExtWire.writeString(b, obj.offer_token().get());
        }

        GMExtWire.writeList(b, obj.offer_tags(), (bb, x) -> GMExtWire.writeString(bb, x));

        GMExtWire.writeBool(b, obj.purchase_option_id() != null && obj.purchase_option_id().isPresent());
        if (obj.purchase_option_id() != null && obj.purchase_option_id().isPresent())
        {
            GMExtWire.writeString(b, obj.purchase_option_id().get());
        }

        GMExtWire.writeBool(b, obj.full_price_micros() != null && obj.full_price_micros().isPresent());
        if (obj.full_price_micros() != null && obj.full_price_micros().isPresent())
        {
            GMExtWire.writeF64(b, obj.full_price_micros().get());
        }

        GMExtWire.writeBool(b, obj.rental_details() != null && obj.rental_details().isPresent());
        if (obj.rental_details() != null && obj.rental_details().isPresent())
        {
            GooglePlayBillingRentalDetailsCodec.write(b, obj.rental_details().get());
        }

        GMExtWire.writeBool(b, obj.preorder_details() != null && obj.preorder_details().isPresent());
        if (obj.preorder_details() != null && obj.preorder_details().isPresent())
        {
            GooglePlayBillingPreorderDetailsCodec.write(b, obj.preorder_details().get());
        }

        GMExtWire.writeBool(b, obj.discount_display_info() != null && obj.discount_display_info().isPresent());
        if (obj.discount_display_info() != null && obj.discount_display_info().isPresent())
        {
            GooglePlayBillingDiscountDisplayInfoCodec.write(b, obj.discount_display_info().get());
        }

        GMExtWire.writeBool(b, obj.limited_quantity_info() != null && obj.limited_quantity_info().isPresent());
        if (obj.limited_quantity_info() != null && obj.limited_quantity_info().isPresent())
        {
            GooglePlayBillingLimitedQuantityInfoCodec.write(b, obj.limited_quantity_info().get());
        }

        GMExtWire.writeBool(b, obj.valid_time_window() != null && obj.valid_time_window().isPresent());
        if (obj.valid_time_window() != null && obj.valid_time_window().isPresent())
        {
            GooglePlayBillingValidTimeWindowCodec.write(b, obj.valid_time_window().get());
        }

    }
}