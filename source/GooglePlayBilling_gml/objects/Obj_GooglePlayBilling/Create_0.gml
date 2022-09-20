
// We start by definining 3 macros one for each product with the respective SKU ids.
// this is not necessary but will help with code auto-completion further down the line.
#macro IAP_100gems "yoyo_100gems"
#macro IAP_noads "yoyo_noads"
#macro IAP_premium "yoyo_premium_subscription"

// Before executing any other code we first need to initialize the Google Play Billing API.
// This initialization is done with a simple function call and requires no arguments.
GPBilling_Init();

// After initialization you can connect to the store, this is necessary since we cannot buy/query
// products if we are not connected to our account. This function will trigger an ASYNC IN-APP
// PURCHASE event (similarly to all the functions that trigger events in this extension).
GPBilling_ConnectToStore();

// This struct will have this structure:
// {
//		product_id: purchase_data
//		...
// }
purchasesData = {};

// ##################### SERVER VERIFICATION #######################
// This variables are not used by default and are part of an example
// on how to correctly and securely verify your purchasese.
// Check manual for more details.
subsHttpId = -1;
subsToken = "";
// #################################################################

// This function updates the 'purchasesData' structure.
// It creates a struct with <productID : purchaseData> key-value pairs.
function updatePurchasesData(queryJson)
{
	// Query an array of purchases of type "inapp" (consumables/permanent)
	var queryData
	// If there was a valid output
	if (queryJson != "")
	{
		// Convert query json to data
		queryData = json_parse(queryJson);
		if (queryData.success)
		{
			// Get array
			var purchasesArray = queryData.purchases;
		
			// Loop through the array of purchases
			var purchase, purchasesCount = array_length(purchasesArray);
			for (var i = 0; i < purchasesCount; i++)
			{
				// Add <product_id : purchase_data> to 'purchases' struct.
				purchase = purchasesArray[i];
				purchasesData[$ purchase.productId] = purchase;
			}
		}
	}
}

// This function locks purchased products buttons.
function lockPurchasedProducts()
{
	var purchases = purchasesData;
	
	// This loops through all the IAP buttons (common parent)
	with(Obj_GooglePlayBilling_IAP_Button)
	{
		// If their 'product_id' exists in the purchases struct
		if(variable_struct_exists(purchases, product_id))
		{
			// Lock the button so we cannot buy it again.
			locked = true
		}
	}
}
