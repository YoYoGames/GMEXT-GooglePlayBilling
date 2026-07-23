// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.enums;

public enum GooglePlayBillingProgram
{
    Unspecified((int)0),
    ExternalContentLink((int)1),
    ExternalOffer((int)3),
    ExternalPayments((int)4),
    BillingChoice((int)5);

    private final int value;
    private GooglePlayBillingProgram(int v)
    {
        this.value = v;
    }
    public int value()
    {
        return this.value;
    }
    public static GooglePlayBillingProgram from(int v)
    {
        switch (v)
        {
            case 0:
                return GooglePlayBillingProgram.Unspecified;
            case 1:
                return GooglePlayBillingProgram.ExternalContentLink;
            case 3:
                return GooglePlayBillingProgram.ExternalOffer;
            case 4:
                return GooglePlayBillingProgram.ExternalPayments;
            case 5:
                return GooglePlayBillingProgram.BillingChoice;
            default:
                throw new IllegalArgumentException("Unknown GooglePlayBillingProgram value: " + v);
        }
    }
}