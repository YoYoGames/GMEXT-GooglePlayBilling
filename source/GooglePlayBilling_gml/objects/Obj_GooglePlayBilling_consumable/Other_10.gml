/// @description OnPurchased

// After being purchased, consumables (products that you can buy more than once) need to be consumed.
// From an API point of view there is no difference between consumables and other types of products
// so we need to tell GooglePlay that despite being purchased this item is still available for buying.
// Consumed products will automatically be acknowledged so no need to call the function.
GPBilling_ConsumeProduct(purchaseToken);

// We should NOT reward the user with the purchase just yet.. since it needs to be consumed first if
// consumption fails the user will be refunded meaning the product was not purchased.