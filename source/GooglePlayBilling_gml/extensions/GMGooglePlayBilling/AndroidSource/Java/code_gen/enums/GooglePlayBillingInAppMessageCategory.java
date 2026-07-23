// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.enums;

public enum GooglePlayBillingInAppMessageCategory
{
    Unknown((int)0),
    SubscriptionUpdate((int)1),
    PriceChange((int)2);

    private final int value;
    private GooglePlayBillingInAppMessageCategory(int v)
    {
        this.value = v;
    }
    public int value()
    {
        return this.value;
    }
    public static GooglePlayBillingInAppMessageCategory from(int v)
    {
        switch (v)
        {
            case 0:
                return GooglePlayBillingInAppMessageCategory.Unknown;
            case 1:
                return GooglePlayBillingInAppMessageCategory.SubscriptionUpdate;
            case 2:
                return GooglePlayBillingInAppMessageCategory.PriceChange;
            default:
                throw new IllegalArgumentException("Unknown GooglePlayBillingInAppMessageCategory value: " + v);
        }
    }
}