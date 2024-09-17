package ${YYAndroidPackageName};

import android.app.Activity;
import android.app.PendingIntent;
import android.app.Service;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.util.Log;
import android.net.Uri;

import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;

//import com.android.vending.billing.IInAppBillingService;
import com.yoyogames.runner.RunnerJNILib;

import com.android.billingclient.api.AcknowledgePurchaseParams;
import com.android.billingclient.api.AcknowledgePurchaseResponseListener;
import com.android.billingclient.api.BillingClient;
import com.android.billingclient.api.BillingClient.BillingResponseCode;
import com.android.billingclient.api.BillingClientStateListener;
import com.android.billingclient.api.BillingFlowParams;
import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.ConsumeParams;
import com.android.billingclient.api.ConsumeResponseListener;
import com.android.billingclient.api.Purchase;
// import com.android.billingclient.api.Purchase.PurchasesResult;
import com.android.billingclient.api.PurchasesUpdatedListener;
import com.android.billingclient.api.SkuDetails;
import com.android.billingclient.api.SkuDetailsParams;
import com.android.billingclient.api.SkuDetailsResponseListener;
import com.android.billingclient.api.PurchasesResponseListener;
import com.android.billingclient.api.BillingFlowParams.SubscriptionUpdateParams;

import androidx.annotation.NonNull;


//This is version 1.0.2
//----------------------------------------------------------------------------------------------------

public class GooglePlayBillingService  //extends IRunnerBilling implements RunnerBillingInterface
{	
	// This map will keep track of purchases that have not yet been consumed.
	private HashMap<String, Purchase> m_purchaseRequests = new HashMap<String, Purchase>();	

	private static final String TAG = "yoyo";

	private static boolean m_isStoreConnected = false;

	private class YYPurchasesUpdatedListener implements PurchasesUpdatedListener
	{
		@Override
		public void onPurchasesUpdated(BillingResult billingResult, List<Purchase> purchases)
		{
			String [] keys = {"id"};
			double [] dvals ={GooglePlayBillingEnums.YY_IAP_RECEIPT};

			Log.d(TAG,"onPurchasesUpdated called");
			if (billingResult.getResponseCode() == BillingClient.BillingResponseCode.OK)
			{
				try 
				{
					JSONObject purchasesJson = new JSONObject();
					JSONArray purchasesJsonArray = new JSONArray();

					purchasesJson.put("success", true);
					
					if(purchases != null)
					for (Purchase purchase : purchases)
					{
						// For now just return the json
						// The emphasis should be that the developers choose what do with their purchases.
						// They should be calling "verify" functionality, not us.
						// Ideally, via a server that they are operating.
						//Log.d(TAG, "Purchase successful: " + purchase.getPurchaseToken());

						if (!m_purchaseRequests.containsKey(purchase.getPurchaseToken())) 
						{
							//Log.d(TAG, "Purchase Request Map Adding: " + purchase.getPurchaseToken());
							m_purchaseRequests.put(purchase.getPurchaseToken(), purchase);
						}

						JSONObject purchaseJson = new JSONObject(purchase.getOriginalJson());
						//Log.d(TAG, "purchaseJson: " + purchaseJson.toString());
						purchasesJsonArray.put(purchaseJson);
					}
					purchasesJson.put("purchases", purchasesJsonArray);

					//Log.d(TAG, purchaseData);

					String purchaseData = purchasesJson.toString();

					int dsmapindex = RunnerJNILib.jCreateDsMap(keys,null,dvals);
					RunnerJNILib.DsMapAddString(dsmapindex, "response_json", purchaseData);
					
					RunnerJNILib.CreateAsynEventWithDSMap(dsmapindex, GooglePlayBillingEnums.EVENT_OTHER_WEB_IAP);
				}
				catch (JSONException e) 
				{
					Log.e(TAG, "Malformed JSON data from queryPurchases.");
				}
			} 
			else if (billingResult.getResponseCode() == BillingClient.BillingResponseCode.USER_CANCELED) 
			{
				Log.w(TAG, "onPurchasesUpdated() - user cancelled the purchase flow - skipping");
				String json = "{ \"success\":false, \"failure\":\"user_cancelled\" }";
				int dsmapindex = RunnerJNILib.jCreateDsMap(keys,null,dvals);
				RunnerJNILib.DsMapAddString(dsmapindex,"response_json",json);
				
				RunnerJNILib.CreateAsynEventWithDSMap(dsmapindex, GooglePlayBillingEnums.EVENT_OTHER_WEB_IAP);
			} 
			else 
			{
				Log.w(TAG, "onPurchasesUpdated() got unknown resultCode: " + billingResult.getResponseCode());
				String json = "{ \"success\":false, \"failure\":\"unknown error\", \"responseCode\":" + Integer.toString(billingResult.getResponseCode()) + " }";
				int dsmapindex = RunnerJNILib.jCreateDsMap(keys,null,dvals);
				RunnerJNILib.DsMapAddString(dsmapindex,"response_json",json);
				
				RunnerJNILib.CreateAsynEventWithDSMap(dsmapindex, GooglePlayBillingEnums.EVENT_OTHER_WEB_IAP);
			}
		}
	}
	private YYPurchasesUpdatedListener m_purchaseUpdatedListener = null;
	private BillingClient m_billingClient = null;

	private List<SkuDetails> m_skuDetails;
	private List<SkuDetails> m_subSkuDetails;

	// ==== Lifetime ====

	/*
	 * Constructor
	 */
	public GooglePlayBillingService()
	{
	}

	/*
	 * Called when onDestroy() is hit for the main Activity
	 */
	public void Destroy()
	{
	}

	public Object InitRunnerBilling()
	{
		return (Object)this;
	}

	// public String queryPurchases(String _skuType)
	// {
		// PurchasesResult result = m_billingClient.queryPurchases(_skuType);

		// if (result != null
			// && result.getBillingResult().getResponseCode() == BillingClient.BillingResponseCode.OK) 
		// {
			// try 
			// {
				// //Log.d(TAG, "result: " + result.toString());
				// JSONObject o = new JSONObject();
				// JSONArray purchasesJsonArray = new JSONArray();
				
				// List<Purchase> purchases = result.getPurchasesList();
				// Iterator<Purchase> it = purchases.iterator();
				// while (it.hasNext())
				// {
					// Purchase purchase = it.next();
					// JSONObject purchaseJson = new JSONObject(purchase.getOriginalJson());
					// //Log.d(TAG, "purchaseJson: " + purchaseJson.toString());
					// purchasesJsonArray.put(purchaseJson);
				// }
				// o.put("purchases", purchasesJsonArray);
				// o.put("success", true);
				
				// String resultJson = o.toString();
				// return resultJson;
			// }
			// catch (JSONException e) 
			// {
				// Log.e(TAG, "Malformed JSON data from queryPurchases.");
			// }
		// }
		
		// try 
		// {
			// JSONObject o = new JSONObject();
				
			// o.put("success", false);
			// if (result != null)
			// {
				// o.put("responseCode", result.getBillingResult().getResponseCode());
			// }
				
			// String resultJson = o.toString();
			// return resultJson;
		// }
		// catch (JSONException e)
		// {
			// Log.e(TAG, "Malformed JSON data from queryPurchases after failure.");
		// }

	// return "";
	// }
	
	
	public void queryPurchasesAsync(String _skuType)
	{
		m_billingClient.queryPurchasesAsync(_skuType, new PurchasesResponseListener() {
        @Override
        public void onQueryPurchasesResponse(@NonNull BillingResult billingResult, @NonNull List<Purchase> list) 
		{
			try 
			{
				JSONObject purchasesJson = new JSONObject();
				JSONArray purchasesJsonArray = new JSONArray();

				purchasesJson.put("success", true);

				for (Purchase purchase : list)
				{
					// For now just return the json
					// The emphasis should be that the developers choose what do with their purchases.
					// They should be calling "verify" functionality, not us.
					// Ideally, via a server that they are operating.
					//Log.d(TAG, "Purchase successful: " + purchase.getPurchaseToken());

					if (!m_purchaseRequests.containsKey(purchase.getPurchaseToken())) 
					{
						//Log.d(TAG, "Purchase Request Map Adding: " + purchase.getPurchaseToken());
						m_purchaseRequests.put(purchase.getPurchaseToken(), purchase);
					}

					JSONObject purchaseJson = new JSONObject(purchase.getOriginalJson());
					//Log.d(TAG, "purchaseJson: " + purchaseJson.toString());
					purchasesJsonArray.put(purchaseJson);
				}
				purchasesJson.put("purchases", purchasesJsonArray);

				//Log.d(TAG, purchaseData);

				String purchaseData = purchasesJson.toString();

				String [] keys ={"id"};
				double [] dvals = {GooglePlayBillingEnums.YY_QUERYPURCHASESASYNC};
				
				int dsmapindex = RunnerJNILib.jCreateDsMap(keys,null,dvals);
				RunnerJNILib.DsMapAddString(dsmapindex, "response_json", purchaseData);
				RunnerJNILib.DsMapAddString(dsmapindex, "sku_type", _skuType);
				
				RunnerJNILib.CreateAsynEventWithDSMap(dsmapindex, GooglePlayBillingEnums.EVENT_OTHER_WEB_IAP);
			}
			catch (JSONException e) 
			{
				Log.e(TAG, "Malformed JSON data from queryPurchases.");
			}
        }
    });
	}
	

	/*
	 * Called whilst enabling the store at the IRunnerBilling level
	 * This is a little bit messy as it's trying to put a linear
	 * model through a bunch of async w/ callback routines
	 */
	public void loadStore()
	{
		m_isStoreConnected = false;
		
		if(m_purchaseUpdatedListener == null && m_billingClient == null) 
		{
			m_purchaseUpdatedListener = new YYPurchasesUpdatedListener();
		
			m_billingClient = BillingClient.newBuilder(RunnerJNILib.ms_context)
				.setListener(m_purchaseUpdatedListener)
				.enablePendingPurchases()
				.build();
		}
		
		//Log.d(TAG, m_billingClient != null ? "Not null!" : "Is null!");
		
		m_billingClient.startConnection(new BillingClientStateListener()
		{
			@Override
			public void onBillingSetupFinished(BillingResult billingResult) 
			{
				if (billingResult.getResponseCode() == BillingClient.BillingResponseCode.OK) 
				{
					//Log.d(TAG, "onBillingSetupFinished: Billing enabled.");
					m_isStoreConnected = true;

					String [] keys ={"id"};
					double [] dvals = {GooglePlayBillingEnums.YY_STORE_CONNECT};

					int dsmapindex = RunnerJNILib.jCreateDsMap(keys,null,dvals);
					RunnerJNILib.CreateAsynEventWithDSMap(dsmapindex, GooglePlayBillingEnums.EVENT_OTHER_WEB_IAP);
				}
				else
				{
					m_isStoreConnected = false;
					
					String [] keys ={"id"};
					double [] dvals ={GooglePlayBillingEnums.YY_STORE_CONNECT_FAILED};
					
					int dsmapindex = RunnerJNILib.jCreateDsMap(keys,null,dvals);
					RunnerJNILib.CreateAsynEventWithDSMap(dsmapindex, GooglePlayBillingEnums.EVENT_OTHER_WEB_IAP);
				}
			}
			@Override
			public void onBillingServiceDisconnected() 
			{
				m_isStoreConnected = false;

				String [] keys ={"id"};
				double [] dvals ={GooglePlayBillingEnums.YY_STORE_CONNECT_FAILED};

				int dsmapindex = RunnerJNILib.jCreateDsMap(keys,null,dvals);
				RunnerJNILib.CreateAsynEventWithDSMap(dsmapindex, GooglePlayBillingEnums.EVENT_OTHER_WEB_IAP);
			}
		});
	}
	
	public boolean isStoreConnected()
	{
		return m_isStoreConnected;
	}

	/**
	 * Called once the billing service is bound to find out the available products and their statuses
	 */
	public int retrieveManagedProducts(List<String> _productList)
	{
		SkuDetailsParams.Builder params = SkuDetailsParams.newBuilder();
		params.setSkusList(_productList).setType(BillingClient.SkuType.INAPP);
		m_billingClient.querySkuDetailsAsync(params.build(),
			new SkuDetailsResponseListener()
			{
				@Override
				public void onSkuDetailsResponse(BillingResult billingResult,
						List<SkuDetails> skuDetailsList) 
				{
					// Process the result.
					int _responseCode = billingResult.getResponseCode();
					if (_responseCode == BillingClient.BillingResponseCode.OK) 
					{
						try 
						{
							//Log.d(TAG, "onSkuDetailsResponse response was okay!");
							m_skuDetails = skuDetailsList;

							JSONObject o = new JSONObject();
							JSONArray skuDetailsJsonArray = new JSONArray();

							Iterator<SkuDetails> it = skuDetailsList.iterator();
							while (it.hasNext())
							{
								SkuDetails skuDetails = it.next();
								JSONObject skuDetailsJson = new JSONObject(skuDetails.getOriginalJson());
								//Log.d(TAG, "skuDetailsJson: " + skuDetailsJson.toString());
								skuDetailsJsonArray.put(skuDetailsJson);
							}
							o.put("skuDetails", skuDetailsJsonArray);
							o.put("success", true);
							
							String json = o.toString();
							//Log.d(TAG, "SKU DETAILS: " + json);

							String [] keys = {"id"};
							double [] dvals = {GooglePlayBillingEnums.YY_PRODUCT_DATA_RESPONSE};

							int dsmapindex = RunnerJNILib.jCreateDsMap(keys,null,dvals);
							RunnerJNILib.DsMapAddString(dsmapindex,"response_json",json);
							RunnerJNILib.CreateAsynEventWithDSMap(dsmapindex, GooglePlayBillingEnums.EVENT_OTHER_WEB_IAP);
						}
						catch (JSONException e) 
						{
							Log.e(TAG, "Malformed JSON data from queryPurchases.");
						}
                    }
					else 
					{
						try
						{
							Log.w(TAG, "onSkuDetailsResponse response was unsuccessful! Error Code: " + Integer.toString(billingResult.getResponseCode()));
							// Send a failure response now...

							JSONObject o = new JSONObject();
							o.put("success", false);
							o.put("responseCode", billingResult.getResponseCode());
							String json = o.toString();

							String [] keys = {"id"};
							double [] dvals = {GooglePlayBillingEnums.YY_PRODUCT_DATA_RESPONSE};

							int dsmapindex = RunnerJNILib.jCreateDsMap(keys,null,dvals);
							RunnerJNILib.DsMapAddString(dsmapindex,"response_json",json);
							RunnerJNILib.CreateAsynEventWithDSMap(dsmapindex, GooglePlayBillingEnums.EVENT_OTHER_WEB_IAP);
						}
						catch (JSONException e) 
						{
							Log.e(TAG, "Malformed JSON data from queryPurchases.");
						}
					}
				}
			});
		return 0;
	}

	/**
	 * Called once the billing service is bound to find out the available products and their statuses
	 */
	public int retrieveSubscriptions(List<String> _productList)
	{
		SkuDetailsParams.Builder params = SkuDetailsParams.newBuilder();
		params.setSkusList(_productList).setType(BillingClient.SkuType.SUBS);
		m_billingClient.querySkuDetailsAsync(params.build(),
			new SkuDetailsResponseListener() {
				@Override
				public void onSkuDetailsResponse(BillingResult billingResult,
						List<SkuDetails> skuDetailsList) 
				{
					// Process the result.
					int _responseCode = billingResult.getResponseCode();
					if (_responseCode == BillingClient.BillingResponseCode.OK) 
					{
						try 
						{
							//Log.d(TAG, "onSkuDetailsResponse response was okay!");
							m_subSkuDetails = skuDetailsList;

							JSONObject o = new JSONObject();
							JSONArray skuDetailsJsonArray = new JSONArray();

							Iterator<SkuDetails> it = skuDetailsList.iterator();
							while (it.hasNext())
							{
								SkuDetails skuDetails = it.next();
								JSONObject skuDetailsJson = new JSONObject(skuDetails.getOriginalJson());
								//Log.d(TAG, "skuDetailsJson: " + skuDetailsJson.toString());
								skuDetailsJsonArray.put(skuDetailsJson);
							}
							o.put("skuDetails", skuDetailsJsonArray);
							o.put("success", true);
							
							String json = o.toString();
							//Log.d(TAG, "SKU DETAILS: " + json);

							String [] keys = {"id"};
							double [] dvals = {GooglePlayBillingEnums.YY_SUBSCRIPTION_DATA_RESPONSE};

							int dsmapindex = RunnerJNILib.jCreateDsMap(keys,null,dvals);
							RunnerJNILib.DsMapAddString(dsmapindex,"response_json",json);
							RunnerJNILib.CreateAsynEventWithDSMap(dsmapindex, GooglePlayBillingEnums.EVENT_OTHER_WEB_IAP);
						}
						catch (JSONException e) 
						{
							Log.e(TAG, "Malformed JSON data from queryPurchases.");
						}
                    }
					else
					{
						try
						{
							Log.w(TAG, "onSkuDetailsResponse response was unsuccessful! Error Code: " + Integer.toString(billingResult.getResponseCode()));
							// Send a failure response now...

							JSONObject o = new JSONObject();
							o.put("success", false);
							o.put("responseCode", billingResult.getResponseCode());
							String json = o.toString();

							String [] keys = {"id"};
							double [] dvals = {GooglePlayBillingEnums.YY_SUBSCRIPTION_DATA_RESPONSE};

							int dsmapindex = RunnerJNILib.jCreateDsMap(keys,null,dvals);
							RunnerJNILib.DsMapAddString(dsmapindex,"response_json",json);
							RunnerJNILib.CreateAsynEventWithDSMap(dsmapindex, GooglePlayBillingEnums.EVENT_OTHER_WEB_IAP);
						}
						catch (JSONException e) 
						{
							Log.e(TAG, "Malformed JSON data from queryPurchases.");
						}
					}
				}
			});
		return 0;
	}

	public List<SkuDetails> GetSkuDetails()
	{
		return m_skuDetails;
	}

	public List<SkuDetails> GetSubSkuDetails()
	{
		return m_subSkuDetails;
	}

	public Map<String, Purchase> GetPurchases()
	{
		return m_purchaseRequests;
	}

	/**
     * Called from the VC_Runner when the current game decides it wants all previously purchased items restored
     */
    public void restorePurchasedItems()
    {
    }

	public boolean isFeatureSupported(String _feature)
	{
		BillingResult responseCode = m_billingClient.isFeatureSupported(_feature);
        if (responseCode.getResponseCode() != BillingClient.BillingResponseCode.OK) {
            Log.w(TAG, "feature: " + _feature + "() got an error response: " + responseCode);
        }
        return responseCode.getResponseCode() == BillingClient.BillingResponseCode.OK;
	}

	private int purchaseSku(String _productId, List<SkuDetails> _skuDetails)
	{
		if (_skuDetails == null) {
			Log.e(TAG, "Sku Details: no product data was retreived.");
			return 2;
		}

		SkuDetails sku = null;
		for (SkuDetails _sku : _skuDetails)
		{
			if (_sku.getSku().equals(_productId))
			{
				sku = _sku;
				break;
			}
		}

		if (sku == null)
		{
			Log.e(TAG, "Sku: " + _productId + ", not found.");
			return 1;
		}

		final SkuDetails fSku = sku;
		RunnerActivity.CurrentActivity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                //Log.d(TAG, "Launching in-app purchase flow.");
                BillingFlowParams purchaseParams = BillingFlowParams.newBuilder()
                        .setSkuDetails(fSku)
						.build();
                m_billingClient.launchBillingFlow(RunnerActivity.CurrentActivity, purchaseParams);
            }
        }
		);
		return 0;
	}
	
	public int purchaseCatalogItem(String _productId) 
    {
		return purchaseSku(_productId, m_skuDetails);
	}

	public int purchaseSubscription(String _productId)
	{
		return purchaseSku(_productId, m_subSkuDetails);
	}

	public void acknowledgePurchase(final String purchaseToken)
	{
		RunnerActivity.CurrentActivity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                //Log.d(TAG, "Launching acknowledge purchase async flow.");
                // Consume the purchase async
                AcknowledgePurchaseParams params = AcknowledgePurchaseParams.newBuilder()
                        .setPurchaseToken(purchaseToken)
                        .build();
                m_billingClient.acknowledgePurchase(params, 
                        new AcknowledgePurchaseResponseListener() {
                            @Override
                            public void onAcknowledgePurchaseResponse(BillingResult responseCode) {
								//Log.d(TAG, "onAcknowledgePurchaseResponse: responseCode: " + Integer.toString(responseCode.getResponseCode()));
								
								String [] keys = {"id"};
								double [] dvals = {GooglePlayBillingEnums.YY_ACKNOWLEDGE_PURCHASE_RESPONSE};

								String json;
								json = "{ \"responseCode\" : " + Integer.toString(responseCode.getResponseCode()) + ", \"purchaseToken\" : \"" + purchaseToken + "\" }";

								int dsmapindex = RunnerJNILib.jCreateDsMap(keys,null,dvals);
								RunnerJNILib.DsMapAddString(dsmapindex,"response_json",json);
								RunnerJNILib.CreateAsynEventWithDSMap(dsmapindex, GooglePlayBillingEnums.EVENT_OTHER_WEB_IAP);
                            }
                        });
            }
        }
		);
	}

	public void consumeProduct(final String purchaseToken_)
	{
		RunnerActivity.CurrentActivity.runOnUiThread(new Runnable() 
		{
            @Override
            public void run() 
			{
                //Log.d(TAG, "Launching consume async flow.");
                // Consume the purchase async
                ConsumeParams params = ConsumeParams.newBuilder().setPurchaseToken(purchaseToken_).build();
                m_billingClient.consumeAsync(params, new ConsumeResponseListener() 
				{
					@Override
					public void onConsumeResponse(BillingResult responseCode, String purchaseToken) 
					{
						//Log.d(TAG, "onConsumeResponse: responseCode: " + Integer.toString(responseCode.getResponseCode()));
						
						if (m_purchaseRequests.containsKey(purchaseToken)) 
						{
							//Log.d(TAG, "Purchase Request Map Removing: " + purchaseToken);
							m_purchaseRequests.remove(purchaseToken);
						}
						
						String [] keys = {"id"};
						double [] dvals = {GooglePlayBillingEnums.YY_PRODUCT_CONSUME_RESPONSE};

						String json;
						if(responseCode.getResponseCode() == BillingClient.BillingResponseCode.OK) 
						{
							json = "{ \"success\":true, \"purchaseToken\" : \"" + purchaseToken + "\" }";
						}
						else 
						{Log.d("yoyo","purchaseToken: " + purchaseToken);
							json = "{ \"success\":false, \"responseCode\" : " + Integer.toString(responseCode.getResponseCode()) + ", \"purchaseToken\" : \"" + purchaseToken + "\" }";
						}

						int dsmapindex = RunnerJNILib.jCreateDsMap(keys,null,dvals);
						RunnerJNILib.DsMapAddString(dsmapindex,"response_json",json);
						RunnerJNILib.CreateAsynEventWithDSMap(dsmapindex, GooglePlayBillingEnums.EVENT_OTHER_WEB_IAP);
					}
				});
            }
        });
	}
	
	
	
	// m_subSkuDetails

	public void updatePurchase(SkuDetails skuDetails,String oldPurchaseToken) 
	{
		   SubscriptionUpdateParams updateParams = BillingFlowParams.SubscriptionUpdateParams.newBuilder()
				.setOldPurchaseToken(oldPurchaseToken)
				.setSubscriptionReplacementMode(SubscriptionUpdateParams.ReplacementMode.CHARGE_PRORATED_PRICE)
				.build();
		 
		   BillingFlowParams billingFlowParams = BillingFlowParams.newBuilder()
				.setSkuDetails(skuDetails)
				.setSubscriptionUpdateParams(updateParams)
				.build();
		 
		   m_billingClient.launchBillingFlow(RunnerActivity.CurrentActivity, billingFlowParams);
	}
}

