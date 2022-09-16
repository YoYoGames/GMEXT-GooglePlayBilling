//
//
//

package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.GooglePlayBillingService;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.ArrayList;

import android.util.Log;

import com.android.billingclient.api.SkuDetails;
import com.android.billingclient.api.Purchase;

public class GooglePlayBilling
{
    private GooglePlayBillingService m_runnerBilling = null;

    private List<String> m_iapList = null;
    private List<String> m_subList = null;

    private final int EXT_ERROR_UNKNOWN = -1;
    private final int EXT_NO_ERROR = 0;
    private final int EXT_ERROR_NOT_INITIALISED = 1;
    private final int EXT_ERROR_NO_SKUS = 2;
    private final int EXT_ERROR_SELECTED_SKU_LIST_EMPTY = 3;

    public double GPBilling_Init()
    {
		if(m_runnerBilling == null)//Tis fix a repetitive bug....
		{
			Log.i("yoyo","CREATED: m_runnerBilling");
			m_runnerBilling = new GooglePlayBillingService();
		}
		
        return EXT_NO_ERROR;
    }

    public double GPBilling_ConnectToStore()
    {
        if (m_runnerBilling != null)
        {
            m_runnerBilling.loadStore();
            return EXT_NO_ERROR;
        }
        else
        {
            return EXT_ERROR_NOT_INITIALISED;
        }
    }

    public double GPBilling_IsStoreConnected()
    {
        if (m_runnerBilling != null)
        {
            // Is initialised returns 0 if there is no error, and an error code if there is one.
            // This converts it to a more boolean like structure for ease of use.
            return (double)((m_runnerBilling.isStoreConnected()) ? 1 : 0);
        }
        else 
        {
            return 0;
        }
    }

    public double GPBilling_GetStatus()
    {
        return getStatus();
    }

    public double GPBilling_AddProduct(String _item)
    {
        if (m_iapList == null)
        {
            m_iapList = new ArrayList<String>();
        }

        if (!m_iapList.contains(_item))
        {
            m_iapList.add(_item);
            return EXT_NO_ERROR;
        }
        return EXT_ERROR_UNKNOWN;
    }

    public double GPBilling_AddSubscription(String _item)
    {
        if (m_subList == null)
        {
            m_subList = new ArrayList<String>();
        }

        if (!m_subList.contains(_item))
        {
            m_subList.add(_item);
            return EXT_NO_ERROR;
        }
        return EXT_ERROR_UNKNOWN;
    }

    public double GPBilling_QueryProducts()
    {
        int status = getStatus();
        if (status > 0)
        {
            return status;
        }

        if (m_iapList == null) {
            return EXT_ERROR_SELECTED_SKU_LIST_EMPTY;
        }
        
        int result = m_runnerBilling.retrieveManagedProducts(m_iapList);
        return (double)result;
    }

    public double GPBilling_QuerySubscriptions()
    {
        int status = getStatus();
        if (status > 0)
        {
            return status;
        }

        if (m_subList == null) {
            return EXT_ERROR_SELECTED_SKU_LIST_EMPTY;
        }
        
        int result = m_runnerBilling.retrieveSubscriptions(m_subList);
        return (double)result;
    }

    public void GPBilling_QueryPurchasesAsync(String _skuType)
    {
        int status = getStatus();
        if (status > 0)
        {
            return;
        }
        
		m_runnerBilling.queryPurchasesAsync(_skuType);
        // String result = m_runnerBilling.queryPurchasesAsync(_skuType);
        // return result;
    }
	

    public String GPBilling_QueryPurchases(String _skuType)
    {
        int status = getStatus();
        if (status > 0)
        {
            return "";
        }
        
        String result = m_runnerBilling.queryPurchases(_skuType);
        return result;
    }

    public double GPBilling_PurchaseProduct(String _skuId)
    {
        int status = getStatus();
        if (status > 0)
        {
            return status;
        }

        m_runnerBilling.purchaseCatalogItem(_skuId);        
        return EXT_NO_ERROR;
    }

    public double GPBilling_PurchaseSubscription(String _skuId)
    {
        int status = getStatus();
        if (status > 0)
        {
            return status;
        }

        m_runnerBilling.purchaseSubscription(_skuId);        
        return EXT_NO_ERROR;
    }

    public double GPBilling_AcknowledgePurchase(String _purchaseId)
    {
        int status = getStatus();
        if (status > 0)
        {
            return status;
        }

        m_runnerBilling.acknowledgePurchase(_purchaseId);
        return EXT_NO_ERROR;
    }

    public double GPBilling_ConsumeProduct(String _purchaseId)
    {
        int status = getStatus();
        if (status > 0)
        {
            return status;
        }

        m_runnerBilling.consumeProduct(_purchaseId);
        return EXT_NO_ERROR;
    }

    public String GPBilling_Sku_GetDescription(String _skuId) {
        int status = getStatus();
        if (status > 0)
        {
            return "";
        }

        List<SkuDetails> skuDetails = m_runnerBilling.GetSkuDetails();
		if(skuDetails != null)
        for (SkuDetails sku : skuDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getDescription();
            }
        }

        List<SkuDetails> subDetails = m_runnerBilling.GetSubSkuDetails();
		if(subDetails != null)
        for (SkuDetails sku : subDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getDescription();
            }
        }

        return "";
    }

    public String	GPBilling_Sku_GetFreeTrialPeriod(String _skuId) {
        int status = getStatus();
        if (status > 0)
        {
            return "";
        }

        List<SkuDetails> skuDetails = m_runnerBilling.GetSkuDetails();
		if(skuDetails != null)
        for (SkuDetails sku : skuDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getFreeTrialPeriod();
            }
        }

        List<SkuDetails> subDetails = m_runnerBilling.GetSubSkuDetails();
		if(subDetails != null)
        for (SkuDetails sku : subDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getFreeTrialPeriod();
            }
        }

        return "";
    }

    public String	GPBilling_Sku_GetIconUrl(String _skuId) {
        int status = getStatus();
        if (status > 0)
        {
            return "";
        }

        List<SkuDetails> skuDetails = m_runnerBilling.GetSkuDetails();
		if(skuDetails != null)
        for (SkuDetails sku : skuDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getIconUrl();
            }
        }

        List<SkuDetails> subDetails = m_runnerBilling.GetSubSkuDetails();
		if(subDetails != null)
        for (SkuDetails sku : subDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getIconUrl();
            }
        }

        return "";
    }

    public String	GPBilling_Sku_GetIntroductoryPrice(String _skuId) {
        int status = getStatus();
        if (status > 0)
        {
            return "";
        }

        List<SkuDetails> skuDetails = m_runnerBilling.GetSkuDetails();
		if(skuDetails != null)
        for (SkuDetails sku : skuDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getIntroductoryPrice();
            }
        }

        List<SkuDetails> subDetails = m_runnerBilling.GetSubSkuDetails();
		if(subDetails != null)
        for (SkuDetails sku : subDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getIntroductoryPrice();
            }
        }

        return "";
    }

    public double	GPBilling_Sku_GetIntroductoryPriceAmountMicros(String _skuId) {
        int status = getStatus();
        if (status > 0)
        {
            return status;
        }

        List<SkuDetails> skuDetails = m_runnerBilling.GetSkuDetails();
		if(skuDetails != null)
        for (SkuDetails sku : skuDetails) {
            if (sku.getSku().equals(_skuId)) {
                return (double)sku.getIntroductoryPriceAmountMicros();
            }
        }

        List<SkuDetails> subDetails = m_runnerBilling.GetSubSkuDetails();
		if(subDetails != null)
        for (SkuDetails sku : subDetails) {
            if (sku.getSku().equals(_skuId)) {
                return (double)sku.getIntroductoryPriceAmountMicros();
            }
        }

        return (double)EXT_ERROR_UNKNOWN;
    }

    public String	GPBilling_Sku_GetIntroductoryPriceCycles(String _skuId) {
        int status = getStatus();
        if (status > 0)
        {
            return "";
        }

        List<SkuDetails> skuDetails = m_runnerBilling.GetSkuDetails();
		if(skuDetails != null)
        for (SkuDetails sku : skuDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getIntroductoryPrice();
            }
        }

        List<SkuDetails> subDetails = m_runnerBilling.GetSubSkuDetails();
		if(subDetails != null)
        for (SkuDetails sku : subDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getIntroductoryPrice();
            }
        }

        return "";
    }

    public String	GPBilling_Sku_GetIntroductoryPricePeriod(String _skuId) {
        int status = getStatus();
        if (status > 0)
        {
            return "";
        }

        List<SkuDetails> skuDetails = m_runnerBilling.GetSkuDetails();
		if(skuDetails != null)
        for (SkuDetails sku : skuDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getIntroductoryPricePeriod();
            }
        }

        List<SkuDetails> subDetails = m_runnerBilling.GetSubSkuDetails();
		if(subDetails != null)
        for (SkuDetails sku : subDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getIntroductoryPricePeriod();
            }
        }

        return "";
    }

    public String	GPBilling_Sku_GetOriginalJson(String _skuId) {
        int status = getStatus();
        if (status > 0)
        {
            return "";
        }

        List<SkuDetails> skuDetails = m_runnerBilling.GetSkuDetails();
		if(skuDetails != null)
        for (SkuDetails sku : skuDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getOriginalJson();
            }
        }

        List<SkuDetails> subDetails = m_runnerBilling.GetSubSkuDetails();
		if(subDetails != null)
        for (SkuDetails sku : subDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getOriginalJson();
            }
        }

        return "";
    }

    public String	GPBilling_Sku_GetOriginalPrice(String _skuId) {
        int status = getStatus();
        if (status > 0)
        {
            return "";
        }

        List<SkuDetails> skuDetails = m_runnerBilling.GetSkuDetails();
		if(skuDetails != null)
        for (SkuDetails sku : skuDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getOriginalPrice();
            }
        }

        List<SkuDetails> subDetails = m_runnerBilling.GetSubSkuDetails();
		if(subDetails != null)
        for (SkuDetails sku : subDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getOriginalPrice();
            }
        }

        return "";
    }

    public double	GPBilling_Sku_GetOriginalPriceAmountMicros(String _skuId) {
        int status = getStatus();
        if (status > 0)
        {
            return status;
        }

        List<SkuDetails> skuDetails = m_runnerBilling.GetSkuDetails();
		if(skuDetails != null)
        for (SkuDetails sku : skuDetails) {
            if (sku.getSku().equals(_skuId)) {
                return (double)sku.getOriginalPriceAmountMicros();
            }
        }

        List<SkuDetails> subDetails = m_runnerBilling.GetSubSkuDetails();
		if(subDetails != null)
        for (SkuDetails sku : subDetails) {
            if (sku.getSku().equals(_skuId)) {
                return (double)sku.getOriginalPriceAmountMicros();
            }
        }

        return EXT_ERROR_UNKNOWN;
    }

    public String	GPBilling_Sku_GetPrice(String _skuId) {
        int status = getStatus();
        if (status > 0)
        {
            return "";
        }

        List<SkuDetails> skuDetails = m_runnerBilling.GetSkuDetails();
		if(skuDetails != null)
        for (SkuDetails sku : skuDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getPrice();
            }
        }

        List<SkuDetails> subDetails = m_runnerBilling.GetSubSkuDetails();
		if(subDetails != null)
        for (SkuDetails sku : subDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getPrice();
            }
        }

        return "";
    }

    public double	GPBilling_Sku_GetPriceAmountMicros(String _skuId) {
        int status = getStatus();
        if (status > 0)
        {
            return status;
        }

        List<SkuDetails> skuDetails = m_runnerBilling.GetSkuDetails();
		if(skuDetails != null)
        for (SkuDetails sku : skuDetails) {
            if (sku.getSku().equals(_skuId)) {
                return (double)(sku.getPriceAmountMicros());
            }
        }

        List<SkuDetails> subDetails = m_runnerBilling.GetSubSkuDetails();
		if(subDetails != null)
        for (SkuDetails sku : subDetails) {
            if (sku.getSku().equals(_skuId)) {
                return (double)(sku.getPriceAmountMicros());
            }
        }

        return EXT_ERROR_UNKNOWN;
    }

    public String	GPBilling_Sku_GetPriceCurrencyCode(String _skuId) {
        int status = getStatus();
        if (status > 0)
        {
            return "";
        }

        List<SkuDetails> skuDetails = m_runnerBilling.GetSkuDetails();
		if(skuDetails != null)
        for (SkuDetails sku : skuDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getPriceCurrencyCode();
            }
        }

        List<SkuDetails> subDetails = m_runnerBilling.GetSubSkuDetails();
		if(subDetails != null)
        for (SkuDetails sku : subDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getPriceCurrencyCode();
            }
        }

        return "";
    }

    public String	GPBilling_Sku_GetSku(String _skuId) {
        int status = getStatus();
        if (status > 0)
        {
            return "";
        }

        List<SkuDetails> skuDetails = m_runnerBilling.GetSkuDetails();
		if(skuDetails != null)
        for (SkuDetails sku : skuDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getSku();
            }
        }

        List<SkuDetails> subDetails = m_runnerBilling.GetSubSkuDetails();
		if(subDetails != null)
        for (SkuDetails sku : subDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getSku();
            }
        }

        return "";
    }

    public String	GPBilling_Sku_GetSubscriptionPeriod(String _skuId) {
        int status = getStatus();
        if (status > 0)
        {
            return "";
        }

        List<SkuDetails> skuDetails = m_runnerBilling.GetSkuDetails();
		if(skuDetails != null)
        for (SkuDetails sku : skuDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getSubscriptionPeriod();
            }
        }

        List<SkuDetails> subDetails = m_runnerBilling.GetSubSkuDetails();
		if(subDetails != null)
        for (SkuDetails sku : subDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getSubscriptionPeriod();
            }
        }

        return "";
    }

    public String	GPBilling_Sku_GetTitle(String _skuId) {
        int status = getStatus();
        if (status > 0)
        {
            return "";
        }

        List<SkuDetails> skuDetails = m_runnerBilling.GetSkuDetails();
		if(skuDetails != null)
        for (SkuDetails sku : skuDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getTitle();
            }
        }

        List<SkuDetails> subDetails = m_runnerBilling.GetSubSkuDetails();
		if(subDetails != null)
        for (SkuDetails sku : subDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getTitle();
            }
        }

        return "";
    }

    public String	GPBilling_Sku_GetType(String _skuId) {
        int status = getStatus();
        if (status > 0)
        {
            return "";
        }

        List<SkuDetails> skuDetails = m_runnerBilling.GetSkuDetails();
		if(skuDetails != null)
        for (SkuDetails sku : skuDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getType();
            }
        }

        List<SkuDetails> subDetails = m_runnerBilling.GetSubSkuDetails();
		if(subDetails != null)
        for (SkuDetails sku : subDetails) {
            if (sku.getSku().equals(_skuId)) {
                return sku.getType();
            }
        }

        return "";
    }

    // public double	GPBilling_Sku_IsRewarded(String _skuId) {
        // int status = getStatus();
        // if (status > 0)
        // {
            // return status;
        // }

        // List<SkuDetails> skuDetails = m_runnerBilling.GetSkuDetails();
        // for (SkuDetails sku : skuDetails) {
            // if (sku.getSku().equals(_skuId)) {
                // return (double)(sku.isRewarded() ? 1 : 0);
            // }
        // }

        // List<SkuDetails> subDetails = m_runnerBilling.GetSubSkuDetails();
        // for (SkuDetails sku : subDetails) {
            // if (sku.getSku().equals(_skuId)) {
                // return (double)(sku.isRewarded() ? 1 : 0);
            // }
        // }

        // return EXT_ERROR_UNKNOWN;
    // }

    

    public double GPBilling_Purchase_GetState(String _purchaseId) {
        int status = getStatus();
        if (status > 0)
        {
            return status;
        }

        Map<String, Purchase> purchases = m_runnerBilling.GetPurchases();
        Purchase purchase = purchases.get(_purchaseId);
        if (purchase != null) 
        {
            // Values as specified https://developer.android.com/reference/com/android/billingclient/api/Purchase.PurchaseState.html
            // Done this way, so that if Google ever change the values, we won't be accidentally adding 3000 to whatever arbitrary number they return
            // and blowing past our three macros.
            // This is safer, and more controlled. 
            int internalState = purchase.getPurchaseState();
            if (internalState == 1)
            {
                return GooglePlayBillingEnums.yy_purchase_state_purchased;
            }
            else if (internalState == 2)
            {
                return GooglePlayBillingEnums.yy_purchase_state_pending;
            }
            else 
            {
                return GooglePlayBillingEnums.yy_purchase_state_unspecified;
            }
        }

        return EXT_ERROR_UNKNOWN;
    }

    public String GPBilling_Purchase_GetSignature(String _purchaseToken) {
        int status = getStatus();
        if (status > 0)
        {
            return "";
        }

        Map<String, Purchase> purchases = m_runnerBilling.GetPurchases();
        Purchase purchase = purchases.get(_purchaseToken);
        if (purchase != null) {
            return purchase.getSignature();
        }

        return "";
    }

    public String GPBilling_Purchase_GetOriginalJson(String _purchaseToken) 
    {
        int status = getStatus();
        if (status > 0)
        {
            return "";
        }

        Map<String, Purchase> purchases = m_runnerBilling.GetPurchases();
        Purchase purchase = purchases.get(_purchaseToken);
        if (purchase != null) {
            return purchase.getOriginalJson();
        }

        return "";
    }

    public double GPBilling_Purchase_VerifySignature(String _purchaseData, String _purchaseSignature) {
        int status = getStatus();
        if (status > 0)
        {
            return status;
        }

        boolean valid = RunnerBillingSecurity.verifyPurchase(_purchaseData, _purchaseSignature);

        // boolean return.
        return valid ? 1 : 0;
    }

    private int getStatus()
    {
        if (m_runnerBilling == null)
        {
            return EXT_ERROR_NOT_INITIALISED;
        }

        if (m_iapList == null && m_subList == null)
        {
            return EXT_ERROR_NO_SKUS;
        }

        return EXT_NO_ERROR;
    }

    private String _statusToString(int _error)
    {
        switch (_error)
        {
            case EXT_ERROR_NOT_INITIALISED:
                return "Google Play Billing has not been initialised.";
            case EXT_ERROR_NO_SKUS:
                return "IAP List is empty.";
            case EXT_ERROR_SELECTED_SKU_LIST_EMPTY:
                return "Selected SKU List was empty";
        }
        return "Error Unknown.";
    }
}