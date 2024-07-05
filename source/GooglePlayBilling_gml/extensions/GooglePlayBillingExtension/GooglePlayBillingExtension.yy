{
  "$GMExtension": "",
  "%Name": "GooglePlayBillingExtension",
  "androidactivityinject": "",
  "androidclassname": "GooglePlayBilling",
  "androidcodeinjection": "<YYAndroidGradleDependencies>\r\nimplementation 'com.android.billingclient:billing:7.0.0'\r\n</YYAndroidGradleDependencies>\r\n\r\n",
  "androidinject": "",
  "androidmanifestinject": "",
  "androidPermissions": [
    "com.android.vending.BILLING"
  ],
  "androidProps": true,
  "androidsourcedir": "",
  "author": "",
  "classname": "",
  "copyToTargets": 8,
  "description": "",
  "exportToGame": true,
  "extensionVersion": "1.1.0",
  "files": [
    {
      "$GMExtensionFile": "",
      "%Name": "GooglePlayBillingExtension.ext",
      "constants": [
        {
          "$GMExtensionConstant": "",
          "%Name": "gpb_iap_receipt",
          "hidden": false,
          "name": "gpb_iap_receipt",
          "resourceType": "GMExtensionConstant",
          "resourceVersion": "2.0",
          "value": "12001"
        },
        {
          "$GMExtensionConstant": "",
          "%Name": "gpb_purchase_status",
          "hidden": false,
          "name": "gpb_purchase_status",
          "resourceType": "GMExtensionConstant",
          "resourceVersion": "2.0",
          "value": "12002"
        },
        {
          "$GMExtensionConstant": "",
          "%Name": "gpb_product_data_response",
          "hidden": false,
          "name": "gpb_product_data_response",
          "resourceType": "GMExtensionConstant",
          "resourceVersion": "2.0",
          "value": "12003"
        },
        {
          "$GMExtensionConstant": "",
          "%Name": "gpb_store_connect",
          "hidden": false,
          "name": "gpb_store_connect",
          "resourceType": "GMExtensionConstant",
          "resourceVersion": "2.0",
          "value": "12005"
        },
        {
          "$GMExtensionConstant": "",
          "%Name": "gpb_store_connect_failed",
          "hidden": false,
          "name": "gpb_store_connect_failed",
          "resourceType": "GMExtensionConstant",
          "resourceVersion": "2.0",
          "value": "12006"
        },
        {
          "$GMExtensionConstant": "",
          "%Name": "gpb_product_consume_response",
          "hidden": false,
          "name": "gpb_product_consume_response",
          "resourceType": "GMExtensionConstant",
          "resourceVersion": "2.0",
          "value": "12007"
        },
        {
          "$GMExtensionConstant": "",
          "%Name": "gpb_acknowledge_purchase_response",
          "hidden": false,
          "name": "gpb_acknowledge_purchase_response",
          "resourceType": "GMExtensionConstant",
          "resourceVersion": "2.0",
          "value": "12008"
        },
        {
          "$GMExtensionConstant": "",
          "%Name": "gpb_subscription_data_response",
          "hidden": false,
          "name": "gpb_subscription_data_response",
          "resourceType": "GMExtensionConstant",
          "resourceVersion": "2.0",
          "value": "12009"
        },
        {
          "$GMExtensionConstant": "",
          "%Name": "gpb_purchase_state_pending",
          "hidden": false,
          "name": "gpb_purchase_state_pending",
          "resourceType": "GMExtensionConstant",
          "resourceVersion": "2.0",
          "value": "13002"
        },
        {
          "$GMExtensionConstant": "",
          "%Name": "gpb_purchase_state_purchased",
          "hidden": false,
          "name": "gpb_purchase_state_purchased",
          "resourceType": "GMExtensionConstant",
          "resourceVersion": "2.0",
          "value": "13001"
        },
        {
          "$GMExtensionConstant": "",
          "%Name": "gpb_purchase_state_unspecified",
          "hidden": false,
          "name": "gpb_purchase_state_unspecified",
          "resourceType": "GMExtensionConstant",
          "resourceVersion": "2.0",
          "value": "13000"
        },
        {
          "$GMExtensionConstant": "",
          "%Name": "gpb_purchase_skutype_inapp",
          "hidden": false,
          "name": "gpb_purchase_skutype_inapp",
          "resourceType": "GMExtensionConstant",
          "resourceVersion": "2.0",
          "value": "\"inapp\""
        },
        {
          "$GMExtensionConstant": "",
          "%Name": "gpb_purchase_skutype_subs",
          "hidden": false,
          "name": "gpb_purchase_skutype_subs",
          "resourceType": "GMExtensionConstant",
          "resourceVersion": "2.0",
          "value": "\"subs\""
        },
        {
          "$GMExtensionConstant": "",
          "%Name": "gpb_error_unknown",
          "hidden": false,
          "name": "gpb_error_unknown",
          "resourceType": "GMExtensionConstant",
          "resourceVersion": "2.0",
          "value": "-1"
        },
        {
          "$GMExtensionConstant": "",
          "%Name": "gpb_no_error",
          "hidden": false,
          "name": "gpb_no_error",
          "resourceType": "GMExtensionConstant",
          "resourceVersion": "2.0",
          "value": "0"
        },
        {
          "$GMExtensionConstant": "",
          "%Name": "gpb_error_not_initialised",
          "hidden": false,
          "name": "gpb_error_not_initialised",
          "resourceType": "GMExtensionConstant",
          "resourceVersion": "2.0",
          "value": "1"
        },
        {
          "$GMExtensionConstant": "",
          "%Name": "gpb_error_no_skus",
          "hidden": false,
          "name": "gpb_error_no_skus",
          "resourceType": "GMExtensionConstant",
          "resourceVersion": "2.0",
          "value": "2"
        },
        {
          "$GMExtensionConstant": "",
          "%Name": "gpb_error_selected_sku_list_empty",
          "hidden": false,
          "name": "gpb_error_selected_sku_list_empty",
          "resourceType": "GMExtensionConstant",
          "resourceVersion": "2.0",
          "value": "3"
        },
        {
          "$GMExtensionConstant": "",
          "%Name": "gpb_query_purchase_async",
          "hidden": false,
          "name": "gpb_query_purchase_async",
          "resourceType": "GMExtensionConstant",
          "resourceVersion": "2.0",
          "value": "12010"
        }
      ],
      "copyToTargets": 8,
      "filename": "GooglePlayBillingExtension.ext",
      "final": "",
      "functions": [
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_Init",
          "argCount": 0,
          "args": [],
          "documentation": "",
          "externalName": "GPBilling_Init",
          "help": "GPBilling_Init()",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_Init",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_QueryProducts",
          "argCount": 0,
          "args": [],
          "documentation": "",
          "externalName": "GPBilling_QueryProducts",
          "help": "GPBilling_QueryProducts()",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_QueryProducts",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_AddProduct",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_AddProduct",
          "help": "GPBilling_AddProduct(product_id)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_AddProduct",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_PurchaseProduct",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_PurchaseProduct",
          "help": "GPBilling_PurchaseProduct(product_id)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_PurchaseProduct",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_Sku_GetDescription",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_Sku_GetDescription",
          "help": "GPBilling_Sku_GetDescription(product_id)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_Sku_GetDescription",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_Sku_GetFreeTrialPeriod",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_Sku_GetFreeTrialPeriod",
          "help": "GPBilling_Sku_GetFreeTrialPeriod(product_id)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_Sku_GetFreeTrialPeriod",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_Sku_GetIconUrl",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_Sku_GetIconUrl",
          "help": "GPBilling_Sku_GetIconUrl(product_id)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_Sku_GetIconUrl",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_Sku_GetIntroductoryPrice",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_Sku_GetIntroductoryPrice",
          "help": "GPBilling_Sku_GetIntroductoryPrice(product_id)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_Sku_GetIntroductoryPrice",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_Sku_GetIntroductoryPriceAmountMicros",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_Sku_GetIntroductoryPriceAmountMicros",
          "help": "GPBilling_Sku_GetIntroductoryPriceAmountMicros(product_id)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_Sku_GetIntroductoryPriceAmountMicros",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_Sku_GetIntroductoryPriceCycles",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_Sku_GetIntroductoryPriceCycles",
          "help": "GPBilling_Sku_GetIntroductoryPriceCycles(product_id)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_Sku_GetIntroductoryPriceCycles",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_Sku_GetIntroductoryPricePeriod",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_Sku_GetIntroductoryPricePeriod",
          "help": "GPBilling_Sku_GetIntroductoryPricePeriod(product_id)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_Sku_GetIntroductoryPricePeriod",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_Sku_GetOriginalJson",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_Sku_GetOriginalJson",
          "help": "GPBilling_Sku_GetOriginalJson(product_id)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_Sku_GetOriginalJson",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_Sku_GetOriginalPrice",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_Sku_GetOriginalPrice",
          "help": "GPBilling_Sku_GetOriginalPrice(product_id)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_Sku_GetOriginalPrice",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_Sku_GetOriginalPriceAmountMicros",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_Sku_GetOriginalPriceAmountMicros",
          "help": "GPBilling_Sku_GetOriginalPriceAmountMicros(product_id)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_Sku_GetOriginalPriceAmountMicros",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_Sku_GetPrice",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_Sku_GetPrice",
          "help": "GPBilling_Sku_GetPrice(product_id)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_Sku_GetPrice",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_Sku_GetPriceAmountMicros",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_Sku_GetPriceAmountMicros",
          "help": "GPBilling_Sku_GetPriceAmountMicros(product_id)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_Sku_GetPriceAmountMicros",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_Sku_GetPriceCurrencyCode",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_Sku_GetPriceCurrencyCode",
          "help": "GPBilling_Sku_GetPriceCurrencyCode(product_id)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_Sku_GetPriceCurrencyCode",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_Sku_GetSubscriptionPeriod",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_Sku_GetSubscriptionPeriod",
          "help": "GPBilling_Sku_GetSubscriptionPeriod(product_id)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_Sku_GetSubscriptionPeriod",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_Sku_GetTitle",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_Sku_GetTitle",
          "help": "GPBilling_Sku_GetTitle(product_id)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_Sku_GetTitle",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_Sku_GetType",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_Sku_GetType",
          "help": "GPBilling_Sku_GetType(product_id)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_Sku_GetType",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_IsStoreConnected",
          "argCount": 0,
          "args": [],
          "documentation": "",
          "externalName": "GPBilling_IsStoreConnected",
          "help": "GPBilling_IsStoreConnected()",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_IsStoreConnected",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_ConsumeProduct",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_ConsumeProduct",
          "help": "GPBilling_ConsumeProduct(purchase_token)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_ConsumeProduct",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_Purchase_GetState",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_Purchase_GetState",
          "help": "GPBilling_Purchase_GetState(purchase_token)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_Purchase_GetState",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_Purchase_VerifySignature",
          "argCount": 0,
          "args": [ 1, 1 ],
          "documentation": "",
          "externalName": "GPBilling_Purchase_VerifySignature",
          "help": "GPBilling_Purchase_VerifySignature(purchase_token, signature)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_Purchase_VerifySignature",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_Purchase_GetSignature",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_Purchase_GetSignature",
          "help": "GPBilling_Purchase_GetSignature(purchase_token)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_Purchase_GetSignature",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_AcknowledgePurchase",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_AcknowledgePurchase",
          "help": "GPBilling_AcknowledgePurchase(purchase_token)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_AcknowledgePurchase",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_AddSubscription",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_AddSubscription",
          "help": "GPBilling_AddSubscription(product_id)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_AddSubscription",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_QuerySubscriptions",
          "argCount": 0,
          "args": [],
          "documentation": "",
          "externalName": "GPBilling_QuerySubscriptions",
          "help": "GPBilling_QuerySubscriptions()",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_QuerySubscriptions",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_PurchaseSubscription",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_PurchaseSubscription",
          "help": "GPBilling_PurchaseSubscription(product_id)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_PurchaseSubscription",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_Purchase_GetOriginalJson",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_Purchase_GetOriginalJson",
          "help": "GPBilling_Purchase_GetOriginalJson(purchaseToken)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_Purchase_GetOriginalJson",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_ConnectToStore",
          "argCount": 0,
          "args": [],
          "documentation": "",
          "externalName": "GPBilling_ConnectToStore",
          "help": "GPBilling_ConnectToStore()",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_ConnectToStore",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_GetStatus",
          "argCount": 0,
          "args": [],
          "documentation": "",
          "externalName": "GPBilling_GetStatus",
          "help": "GPBilling_GetStatus()",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_GetStatus",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "GPBilling_QueryPurchasesAsync",
          "argCount": 0,
          "args": [ 1 ],
          "documentation": "",
          "externalName": "GPBilling_QueryPurchasesAsync",
          "help": "GPBilling_QueryPurchasesAsync(skuType)",
          "hidden": false,
          "kind": 4,
          "name": "GPBilling_QueryPurchasesAsync",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        }
      ],
      "init": "GPBilling_Init",
      "kind": 4,
      "name": "GooglePlayBillingExtension.ext",
      "order": [
        {
          "name": "GPBilling_Init",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_ConnectToStore",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_IsStoreConnected",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_GetStatus",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_AddProduct",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_AddSubscription",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_QueryProducts",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_QuerySubscriptions",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_PurchaseProduct",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_PurchaseSubscription",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_AcknowledgePurchase",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_ConsumeProduct",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_Sku_GetDescription",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_Sku_GetFreeTrialPeriod",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_Sku_GetIconUrl",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_Sku_GetIntroductoryPrice",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_Sku_GetIntroductoryPriceAmountMicros",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_Sku_GetIntroductoryPriceCycles",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_Sku_GetIntroductoryPricePeriod",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_Sku_GetOriginalJson",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_Sku_GetOriginalPrice",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_Sku_GetOriginalPriceAmountMicros",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_Sku_GetPrice",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_Sku_GetPriceAmountMicros",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_Sku_GetPriceCurrencyCode",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_Sku_GetSubscriptionPeriod",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_Sku_GetTitle",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_Sku_GetType",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_Purchase_GetState",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_Purchase_GetSignature",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_Purchase_VerifySignature",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_Purchase_GetOriginalJson",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        },
        {
          "name": "GPBilling_QueryPurchasesAsync",
          "path": "extensions/GooglePlayBillingExtension/GooglePlayBillingExtension.yy"
        }
      ],
      "origname": "extensions\\GooglePlayBillingExtension.ext",
      "ProxyFiles": [],
      "resourceType": "GMExtensionFile",
      "resourceVersion": "2.0",
      "uncompress": false,
      "usesRunnerInterface": false
    }
  ],
  "gradleinject": "\r\nimplementation 'com.android.billingclient:billing:7.0.0'\r\n",
  "hasConvertedCodeInjection": true,
  "helpfile": "",
  "HTML5CodeInjection": "",
  "html5Props": false,
  "IncludedResources": [],
  "installdir": "",
  "iosCocoaPodDependencies": "",
  "iosCocoaPods": "",
  "ioscodeinjection": "",
  "iosdelegatename": "",
  "iosplistinject": "",
  "iosProps": false,
  "iosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "license": "Free to use, also for commercial games.",
  "maccompilerflags": "",
  "maclinkerflags": "",
  "macsourcedir": "",
  "name": "GooglePlayBillingExtension",
  "options": [],
  "optionsFile": "options.json",
  "packageId": "com.yoyogames.googleplayservicesiap",
  "parent": {
    "name": "Extensions",
    "path": "folders/GooglePlayBilling/Extensions.yy"
  },
  "productId": "",
  "resourceType": "GMExtension",
  "resourceVersion": "2.0",
  "sourcedir": "",
  "supportedTargets": 8,
  "tvosclassname": "",
  "tvosCocoaPodDependencies": "",
  "tvosCocoaPods": "",
  "tvoscodeinjection": "",
  "tvosdelegatename": "",
  "tvosmaccompilerflags": "",
  "tvosmaclinkerflags": "",
  "tvosplistinject": "",
  "tvosProps": false,
  "tvosSystemFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": []
}