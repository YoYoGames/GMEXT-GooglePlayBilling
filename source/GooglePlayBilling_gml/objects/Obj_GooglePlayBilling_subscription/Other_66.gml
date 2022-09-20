
if(os_type != os_android) exit;

var eventId = async_load[? "id"];
switch(eventId)
{
	case gpb_acknowledge_purchase_response:
		
		// Convert JSON string into data struct
		var responseData = json_parse(async_load[?"response_json"]);
			
		// Check if tokens match
		if (responseData.purchaseToken == purchaseToken) {
			
			// At this point we know the event refers to this in-app purchase.
			// Now we need to check if there are any errors.
			if (responseData.responseCode == gpb_no_error)
			{
				// At this point the purchase acknowledgement succeeded.
				// We can now call the event/function responsible for handling the OnAcknowledged logic.
				event_user(1);
			}
			else
			{
				// At this point the purchase acknowledgement failed.
				//  
				//  'responseData.responseCode' will contain the error code:
				// 
				//  -3 : timeout
				//  -2 : feature not supported
				//  -1 : store is not connected
				//   1 : user as cancelled action 
				//   2 : network connection down
				//   4 : requested product not available
				//   6 : fatal error during API action
				//   7 : failure to purchase item alreadt owned
				//   8 : failure to consume item is not owned
				//
				// We can now call the event/function responsible for handling the OnAcknowledgeFailed logic.
				event_user(2);
			}
		}
	
		break;
}
