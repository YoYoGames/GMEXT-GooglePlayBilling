
play_billing_is_billing_program_available_async(
    GooglePlayBillingProgram.ExternalContentLink,
    function(_billing_result, _availability_details)
    {
        show_debug_message(
            $"[Billing Program Test] ExternalContentLink: {_billing_result}, {_availability_details}"
        );
    }
);

play_billing_is_billing_program_available_async(
    GooglePlayBillingProgram.ExternalOffer,
    function(_billing_result, _availability_details)
    {
        show_debug_message(
            $"[Billing Program Test] ExternalOffer: {_billing_result}, {_availability_details}"
        );
    }
);

play_billing_is_billing_program_available_async(
    GooglePlayBillingProgram.ExternalPayments,
    function(_billing_result, _availability_details)
    {
        show_debug_message(
            $"[Billing Program Test] ExternalPayments: {_billing_result}, {_availability_details}"
        );
    }
);

play_billing_is_billing_program_available_async(
    GooglePlayBillingProgram.BillingChoice,
    function(_billing_result, _availability_details)
    {
        show_debug_message(
            $"[Billing Program Test] BillingChoice: {_billing_result}, {_availability_details}"
        );

        if (
            _billing_result.code == GooglePlayBillingResponseCode.Ok
            && !is_undefined(_availability_details)
            && variable_struct_exists(
                _availability_details,
                "billing_choice_details"
            )
        )
        {
            show_debug_message(
                $"[Billing Program Test] Choice details: "
                + $"{_availability_details.billing_choice_details}"
            );
        }
    }
);
