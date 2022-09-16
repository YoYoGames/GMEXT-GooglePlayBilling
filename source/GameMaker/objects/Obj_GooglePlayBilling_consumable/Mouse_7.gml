/// @description Purchase the product

// Early exit if the button is locked.
if (locked) exit;

// Early exit if there is no connection to the store.
if (!GPBilling_IsStoreConnected()) exit;

// Proceed to puchase the product.
GPBilling_PurchaseProduct(product_id);