// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.enums;

public enum GooglePlayBillingChoiceScreenType
{
    Unspecified((int)0),
    DeveloperRendered((int)1),
    GoogleRendered((int)2);

    private final int value;
    private GooglePlayBillingChoiceScreenType(int v)
    {
        this.value = v;
    }
    public int value()
    {
        return this.value;
    }
    public static GooglePlayBillingChoiceScreenType from(int v)
    {
        switch (v)
        {
            case 0:
                return GooglePlayBillingChoiceScreenType.Unspecified;
            case 1:
                return GooglePlayBillingChoiceScreenType.DeveloperRendered;
            case 2:
                return GooglePlayBillingChoiceScreenType.GoogleRendered;
            default:
                throw new IllegalArgumentException("Unknown GooglePlayBillingChoiceScreenType value: " + v);
        }
    }
}