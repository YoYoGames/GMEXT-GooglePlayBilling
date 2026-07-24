@title Getting Started

# Getting Started

This guide is a quick tour of the Google Play Billing extension. It only works on **Android** (it wraps
Google's [Play Billing Library](https://developer.android.com/google/play/billing) 9.1.0), and every
purchase - however it was started - arrives through a single, long-lived callback rather than being
returned directly. Keep that in mind throughout.

## Prerequisites

Before writing any code:

* [Set up your app listing](https://support.google.com/googleplay/android-developer/answer/9859152) on the
  [Google Play Console](https://play.google.com/console) and upload a build to at least an internal
  testing track.
* Create your in-app products and/or subscriptions under **Monetize > Products** in the Play Console. Each
  product needs a unique product ID - you'll pass this as `product_id` when querying and purchasing.
* We recommend reading Google's own
  [Billing Overview](https://developer.android.com/google/play/billing/billing_overview) first; the
  concepts there (products, purchases, acknowledgement, consumption) map directly onto this extension's
  functions.

## Initializing and connecting

Call ${function.play_billing_init} once, early in your game (for example in a persistent controller
object's Create event), then connect to the Play Store with ${function.play_billing_start_connection}:

```gml
play_billing_init(undefined, function(_billing_result, _purchases) {
    // This callback fires for the lifetime of the client, every time a purchase updates.
    for (var i = 0; i < array_length(_purchases); i++) {
        handle_purchase_update(_purchases[i]);
    }
});

play_billing_start_connection(function(_billing_result) {
    if (_billing_result.code != GooglePlayBillingResponseCode.Ok) {
        show_debug_message($"Failed to connect: {_billing_result.code}");
        exit;
    }

    // Connected - safe to query products/purchases from here on.
    query_owned_products();
}, function() {
    // The service disconnected after a successful connection - reconnect.
    play_billing_start_connection(callback_start, callback_disconnect);
});
```

> [!NOTE]
> The `callback` passed to ${function.play_billing_init} is not a one-shot "did init succeed" callback -
> it is the **purchases-updated listener** for as long as the client exists. See the ${module.connection}
> module for the full details, including what happens if the current Android activity is unavailable when
> `play_billing_init` is called.

## Querying products

Once connected, query the products you configured in the Play Console with
${function.play_billing_query_product_details_async}. This caches each product's details, which is
required before you can purchase it:

```gml
var _products = [
    { product_id: "no_ads", product_type: GooglePlayBillingProductType.InApp },
    { product_id: "premium_monthly", product_type: GooglePlayBillingProductType.Subscription }
];

play_billing_query_product_details_async(_products, function(_billing_result, _query_result) {
    if (_billing_result.code != GooglePlayBillingResponseCode.Ok) exit;

    for (var i = 0; i < array_length(_query_result.products); i++) {
        var _product = _query_result.products[i];
        show_debug_message($"{_product.title}: {_product.product_id}");
    }
});
```

See the ${module.products} module for the full shape of a queried product, including pricing, offers and
pricing phases.

## Purchasing a product

Launch the Play Store purchase UI with ${function.play_billing_launch_billing_flow}, passing a product
that was already queried:

```gml
var _result = play_billing_launch_billing_flow([{ product_id: "no_ads" }]);
if (_result.code != GooglePlayBillingResponseCode.Ok) {
    show_debug_message($"Could not launch billing flow: {_result.code}");
}
```

This function only returns whether the flow was **launched**. The purchase outcome itself - success,
cancellation, or a pending purchase - is delivered later through ${function.play_billing_init}'s callback,
covered next.

## Handling purchase updates

Every purchase update, whether from ${function.play_billing_launch_billing_flow} or restored on a later
session, arrives as a ${struct.GooglePlayBillingPurchase} in ${function.play_billing_init}'s callback.
Verify each purchase (ideally against your own server using its `signature` and `original_json`), then
acknowledge or consume it:

```gml
function handle_purchase_update(_purchase) {
    if (_purchase.purchase_state != GooglePlayBillingPurchaseState.Purchased) return;
    if (_purchase.is_acknowledged) return;

    // Verify the purchase here before granting anything.

    if (array_contains(_purchase.products, "no_ads")) {
        // Non-consumable: acknowledge it once granted.
        play_billing_acknowledge_purchase(_purchase.purchase_token, function(_billing_result) {
            if (_billing_result.code == GooglePlayBillingResponseCode.Ok) {
                global.no_ads = true;
            }
        });
    } else if (array_contains(_purchase.products, "100_gems")) {
        // Consumable: consuming also acknowledges it.
        play_billing_consume_async(_purchase.purchase_token, function(_billing_result, _purchase_token) {
            if (_billing_result.code == GooglePlayBillingResponseCode.Ok) {
                global.gems += 100;
            }
        });
    }
}
```

[[Important: Every purchase - consumable or not - must be acknowledged (or consumed, which acknowledges it) within 3 days, or Google automatically refunds it.]]

At startup, also call ${function.play_billing_query_purchases_async} once per product type to catch any
purchase made in a previous session that still needs handling:

```gml
play_billing_query_purchases_async(GooglePlayBillingProductType.InApp, false, function(_billing_result, _purchases) {
    for (var i = 0; i < array_length(_purchases); i++) {
        handle_purchase_update(_purchases[i]);
    }
});
```

## Subscriptions

Subscriptions are queried and purchased the same way as one-time products, using
`GooglePlayBillingProductType.Subscription` and the offer's `offer_token` (see
${struct.GooglePlayBillingSubscriptionOfferDetails}). To let a user upgrade or downgrade between plans,
supply `subscription_replacement` on the new product's ${struct.GooglePlayBillingProductDetailsParams} -
see the ${module.products} module for details.

## Cleanup

Call ${function.play_billing_end_connection} when your game shuts down, or before calling
${function.play_billing_init} again to start a fresh session:

```gml
play_billing_end_connection();
```

## Testing notes

* Use a [license tester account](https://support.google.com/googleplay/android-developer/answer/6062777)
  added in the Play Console so test purchases don't charge real money.
* Test builds must be distributed through a Play Console testing track (internal, closed or open) - a
  locally-run debug build cannot query real product details or make real purchases.
* See Google's [Test Google Play Billing Library integration](https://developer.android.com/google/play/billing/test)
  guide for the full testing workflow, including how to clear and re-test purchases.
