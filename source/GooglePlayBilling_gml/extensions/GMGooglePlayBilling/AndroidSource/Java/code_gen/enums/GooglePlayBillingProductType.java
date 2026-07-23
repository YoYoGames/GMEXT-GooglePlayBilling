// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.enums;

public enum GooglePlayBillingProductType
{
    InApp((int)0),
    Subscription((int)1),
    Unknown((int)2);

    private final int value;
    private GooglePlayBillingProductType(int v)
    {
        this.value = v;
    }
    public int value()
    {
        return this.value;
    }
    public static GooglePlayBillingProductType from(int v)
    {
        switch (v)
        {
            case 0:
                return GooglePlayBillingProductType.InApp;
            case 1:
                return GooglePlayBillingProductType.Subscription;
            case 2:
                return GooglePlayBillingProductType.Unknown;
            default:
                throw new IllegalArgumentException("Unknown GooglePlayBillingProductType value: " + v);
        }
    }
}