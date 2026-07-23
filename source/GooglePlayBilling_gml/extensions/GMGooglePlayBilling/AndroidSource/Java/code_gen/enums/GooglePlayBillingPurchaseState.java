// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.enums;

public enum GooglePlayBillingPurchaseState
{
    UnspecifiedState((int)0),
    Purchased((int)1),
    Pending((int)2);

    private final int value;
    private GooglePlayBillingPurchaseState(int v)
    {
        this.value = v;
    }
    public int value()
    {
        return this.value;
    }
    public static GooglePlayBillingPurchaseState from(int v)
    {
        switch (v)
        {
            case 0:
                return GooglePlayBillingPurchaseState.UnspecifiedState;
            case 1:
                return GooglePlayBillingPurchaseState.Purchased;
            case 2:
                return GooglePlayBillingPurchaseState.Pending;
            default:
                throw new IllegalArgumentException("Unknown GooglePlayBillingPurchaseState value: " + v);
        }
    }
}