/// @description Server verification

// ##################### SERVER VERIFICATION #######################
// This refers to the server verification and is not being used at the moment.
// The code triggering this is inside the Asynchronous IAP Event and is commented out
// This presents an advaned sample of how to run your verification through a dedicated
// server (for more instructions check the documentation: Verification)

// Check if the “id” key matches our current request. 
if (async_load[? "id"] == subsHttpId)
{
	// Check the status of the get request:
	//  < 0 : error
	//    0 : complete
	//    1 : receiving packets
	if (async_load[? "status"] == 0)
	{
		// We check for "success" (string returned by the server on success)
		if (async_load[? "result"]  == "valid")
		{
			// At this point the subscription was verified and can be acknowledged.
			GPBilling_AcknowledgePurchase(subsToken);
		}
		else
		{
			// At this point the subscription was not verified the item was not
			// actually purchased.
		}
	}
	
	// Invalidate the HTTP callback id
	subsHttpId = -1;
}
// #################################################################