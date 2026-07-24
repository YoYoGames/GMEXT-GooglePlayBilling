
play_billing_is_alternative_billing_only_available_async(
    function(_availability)
    {
        show_debug_message($"[Alternative Billing Test] Availability: {_availability}");

        if (_availability.code != GooglePlayBillingResponseCode.Ok)
        {
            return;
        }

        play_billing_create_alternative_billing_only_reporting_details_async(
            function(_billing_result, _reporting_details)
            {
                show_debug_message($"[Alternative Billing Test] Reporting result: {_billing_result}, {_reporting_details}");

                if (_billing_result.code != GooglePlayBillingResponseCode.Ok)
                {
                    return;
                }

                if (!is_undefined(_reporting_details))
                {
                    show_debug_message($"[Alternative Billing Test] External token: {_reporting_details.external_transaction_token}");
                }
            }
        );
    });

