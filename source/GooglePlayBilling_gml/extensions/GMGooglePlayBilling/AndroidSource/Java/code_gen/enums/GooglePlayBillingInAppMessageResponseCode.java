// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.enums;

public enum GooglePlayBillingInAppMessageResponseCode
{
    NoActionNeeded((int)0),
    SubscriptionStatusUpdated((int)1);

    private final int value;
    private GooglePlayBillingInAppMessageResponseCode(int v)
    {
        this.value = v;
    }
    public int value()
    {
        return this.value;
    }
    public static GooglePlayBillingInAppMessageResponseCode from(int v)
    {
        switch (v)
        {
            case 0:
                return GooglePlayBillingInAppMessageResponseCode.NoActionNeeded;
            case 1:
                return GooglePlayBillingInAppMessageResponseCode.SubscriptionStatusUpdated;
            default:
                throw new IllegalArgumentException("Unknown GooglePlayBillingInAppMessageResponseCode value: " + v);
        }
    }
}