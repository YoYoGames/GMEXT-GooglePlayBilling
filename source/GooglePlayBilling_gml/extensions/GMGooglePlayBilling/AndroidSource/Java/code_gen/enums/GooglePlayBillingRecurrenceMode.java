// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.enums;

public enum GooglePlayBillingRecurrenceMode
{
    Unknown((int)0),
    InfiniteRecurring((int)1),
    FiniteRecurring((int)2),
    NonRecurring((int)3);

    private final int value;
    private GooglePlayBillingRecurrenceMode(int v)
    {
        this.value = v;
    }
    public int value()
    {
        return this.value;
    }
    public static GooglePlayBillingRecurrenceMode from(int v)
    {
        switch (v)
        {
            case 0:
                return GooglePlayBillingRecurrenceMode.Unknown;
            case 1:
                return GooglePlayBillingRecurrenceMode.InfiniteRecurring;
            case 2:
                return GooglePlayBillingRecurrenceMode.FiniteRecurring;
            case 3:
                return GooglePlayBillingRecurrenceMode.NonRecurring;
            default:
                throw new IllegalArgumentException("Unknown GooglePlayBillingRecurrenceMode value: " + v);
        }
    }
}