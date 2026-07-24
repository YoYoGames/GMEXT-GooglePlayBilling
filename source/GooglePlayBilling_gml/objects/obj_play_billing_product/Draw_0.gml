event_inherited();

draw_set_font(fnt_gm_20);

var yy = y - 100;

draw_text(x, yy, data.title);
yy += 25;

draw_text(x, yy, data.product_id);
yy += 25;

draw_text(x, yy, data.description);
yy += 25;

// INAPP price
if (struct_exists(data, "one_time_purchase_offer_details")) {
    if (!is_undefined(data.one_time_purchase_offer_details) && is_struct(data.one_time_purchase_offer_details)) {
        draw_text(x, yy, data.one_time_purchase_offer_details.formatted_price);
        yy += 25;
    }
}

// SUB price
if (struct_exists(data, "subscription_offer_details")) {
    if (is_array(data.subscription_offer_details) && array_length(data.subscription_offer_details) > 0) {
        var offer = data.subscription_offer_details[0];

        if (is_struct(offer)
        && variable_struct_exists(offer, "pricing_phases")
        && is_array(offer.pricing_phases)
        && array_length(offer.pricing_phases) > 0) {
            var phase = offer.pricing_phases[0];

            if (is_struct(phase) && variable_struct_exists(phase, "formatted_price")) {
                draw_text(x, yy, phase.formatted_price);
                yy += 25;
            }
        }
    }
}

