
with(obj_play_billing_purchase)
	instance_destroy()

play_billing_query_purchases_async(
    GooglePlayBillingProductType.InApp,
    false,
    function(_billing_result, _purchases)
    {
        if (_billing_result.code != GooglePlayBillingResponseCode.Ok)
        {
            show_debug_message(
                $"[PlayBilling] Error querying purchases: "
                + $"{_billing_result.message}"
            );

            return;
        }

        var _purchase_count = array_length(_purchases);

        show_debug_message(
            $"[PlayBilling] Found {_purchase_count} INAPP purchases to consume."
        );

        for (var _i = 0; _i < _purchase_count; _i++)
        {
            var _purchase = _purchases[_i];
            var _purchase_token = _purchase.purchase_token;

            show_debug_message(
                $"[PlayBilling] Consuming products "
                + $"{_purchase.products} with token: {_purchase_token}"
            );

            play_billing_consume_async(
                _purchase_token,
                function(_billing_result, _purchase_token)
                {
                    if (_billing_result.code == GooglePlayBillingResponseCode.Ok)
                    {
                        show_debug_message(
                            $"[PlayBilling] Successfully consumed: "
                            + $"{_purchase_token}"
                        );
                    }
                    else
                    {
                        show_debug_message(
                            $"[PlayBilling] Failed to consume: "
                            + $"{_billing_result.message}"
                        );
                    }
                }
            );
        }
    }
);

