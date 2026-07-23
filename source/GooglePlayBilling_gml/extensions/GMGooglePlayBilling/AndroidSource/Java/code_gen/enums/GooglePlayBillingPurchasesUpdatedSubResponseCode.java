// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.enums;

public enum GooglePlayBillingPurchasesUpdatedSubResponseCode
{
    None((int)0),
    PaymentDeclinedDueToInsufficientFunds((int)1),
    UserIneligible((int)2);

    private final int value;
    private GooglePlayBillingPurchasesUpdatedSubResponseCode(int v)
    {
        this.value = v;
    }
    public int value()
    {
        return this.value;
    }
    public static GooglePlayBillingPurchasesUpdatedSubResponseCode from(int v)
    {
        switch (v)
        {
            case 0:
                return GooglePlayBillingPurchasesUpdatedSubResponseCode.None;
            case 1:
                return GooglePlayBillingPurchasesUpdatedSubResponseCode.PaymentDeclinedDueToInsufficientFunds;
            case 2:
                return GooglePlayBillingPurchasesUpdatedSubResponseCode.UserIneligible;
            default:
                throw new IllegalArgumentException("Unknown GooglePlayBillingPurchasesUpdatedSubResponseCode value: " + v);
        }
    }
}