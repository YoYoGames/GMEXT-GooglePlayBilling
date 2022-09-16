/// @description Purchase the subscription

// Early exit if the button is locked.
if (locked) exit;

// Early exit if there is no connection to the store.
if (!GPBilling_IsStoreConnected()) exit;

// When dealing with subscriptions we need to purchase them using this specific
// function call 'GPBilling_PurchaseSubscription'.
GPBilling_PurchaseSubscription(product_id);

