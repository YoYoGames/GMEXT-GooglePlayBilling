// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.enums;

public enum GooglePlayBillingSubscriptionReplacementMode
{
    UnknownReplacementMode((int)0),
    WithTimeProration((int)1),
    ChargeProratedPrice((int)2),
    WithoutProration((int)3),
    ChargeFullPrice((int)4),
    Deferred((int)5),
    KeepExisting((int)6);

    private final int value;
    private GooglePlayBillingSubscriptionReplacementMode(int v)
    {
        this.value = v;
    }
    public int value()
    {
        return this.value;
    }
    public static GooglePlayBillingSubscriptionReplacementMode from(int v)
    {
        switch (v)
        {
            case 0:
                return GooglePlayBillingSubscriptionReplacementMode.UnknownReplacementMode;
            case 1:
                return GooglePlayBillingSubscriptionReplacementMode.WithTimeProration;
            case 2:
                return GooglePlayBillingSubscriptionReplacementMode.ChargeProratedPrice;
            case 3:
                return GooglePlayBillingSubscriptionReplacementMode.WithoutProration;
            case 4:
                return GooglePlayBillingSubscriptionReplacementMode.ChargeFullPrice;
            case 5:
                return GooglePlayBillingSubscriptionReplacementMode.Deferred;
            case 6:
                return GooglePlayBillingSubscriptionReplacementMode.KeepExisting;
            default:
                throw new IllegalArgumentException("Unknown GooglePlayBillingSubscriptionReplacementMode value: " + v);
        }
    }
}