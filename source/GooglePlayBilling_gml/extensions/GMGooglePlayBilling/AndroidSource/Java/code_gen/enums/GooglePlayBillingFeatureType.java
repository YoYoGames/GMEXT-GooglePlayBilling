// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.enums;

public enum GooglePlayBillingFeatureType
{
    AlternativeBillingOnly((int)0),
    BillingConfig((int)1),
    ExternalOffer((int)2),
    IncludeSuspendedSubscriptions((int)3),
    InAppMessaging((int)4),
    PriceChangeConfirmation((int)5),
    ProductDetails((int)6),
    Subscriptions((int)7),
    SubscriptionsUpdate((int)8);

    private final int value;
    private GooglePlayBillingFeatureType(int v)
    {
        this.value = v;
    }
    public int value()
    {
        return this.value;
    }
    public static GooglePlayBillingFeatureType from(int v)
    {
        switch (v)
        {
            case 0:
                return GooglePlayBillingFeatureType.AlternativeBillingOnly;
            case 1:
                return GooglePlayBillingFeatureType.BillingConfig;
            case 2:
                return GooglePlayBillingFeatureType.ExternalOffer;
            case 3:
                return GooglePlayBillingFeatureType.IncludeSuspendedSubscriptions;
            case 4:
                return GooglePlayBillingFeatureType.InAppMessaging;
            case 5:
                return GooglePlayBillingFeatureType.PriceChangeConfirmation;
            case 6:
                return GooglePlayBillingFeatureType.ProductDetails;
            case 7:
                return GooglePlayBillingFeatureType.Subscriptions;
            case 8:
                return GooglePlayBillingFeatureType.SubscriptionsUpdate;
            default:
                throw new IllegalArgumentException("Unknown GooglePlayBillingFeatureType value: " + v);
        }
    }
}