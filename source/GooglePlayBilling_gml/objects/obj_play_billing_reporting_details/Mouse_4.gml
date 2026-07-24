
play_billing_is_billing_program_available_async(GooglePlayBillingProgram.ExternalOffer,
    function(_billing_result, _availability_details)
    {
        show_debug_message($"[Program Reporting Test] Availability: {_billing_result}, {_availability_details}");

        if (_billing_result.code != GooglePlayBillingResponseCode.Ok)
        {
            return;
        }

        play_billing_create_billing_program_reporting_details_async(GooglePlayBillingProgram.ExternalOffer,
            function(_billing_result, _reporting_details)
            {
                show_debug_message($"[Program Reporting Test] Result: {_billing_result}, {_reporting_details}");

                if (_billing_result.code != GooglePlayBillingResponseCode.Ok)
                    return;

                if (!is_undefined(_reporting_details))
                {
                    show_debug_message($"[Program Reporting Test] Program: {_reporting_details.billing_program}");
                    show_debug_message($"[Program Reporting Test] External token: {_reporting_details.external_transaction_token}");
                }
            }
        );
    });

