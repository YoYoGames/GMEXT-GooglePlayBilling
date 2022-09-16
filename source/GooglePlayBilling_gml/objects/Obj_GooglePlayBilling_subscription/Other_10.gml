/// @description OnPurchased

// After being purchased, every purchase needs to be acknowledged.
GPBilling_AcknowledgePurchase(purchaseToken);

// We should NOT reward the user with the purchase just yet.. since it needs to be acknowledged first if
// this proccess fails the user will be refunded meaning the product was not purchased.