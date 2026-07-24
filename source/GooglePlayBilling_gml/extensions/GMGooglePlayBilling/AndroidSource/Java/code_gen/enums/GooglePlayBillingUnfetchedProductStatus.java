// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.enums;

public enum GooglePlayBillingUnfetchedProductStatus
{
    Unknown((int)0),
    InvalidProductIdFormat((int)2),
    ProductNotFound((int)3),
    NoEligibleOffer((int)4);

    private final int value;
    private GooglePlayBillingUnfetchedProductStatus(int v)
    {
        this.value = v;
    }
    public int value()
    {
        return this.value;
    }
    public static GooglePlayBillingUnfetchedProductStatus from(int v)
    {
        switch (v)
        {
            case 0:
                return GooglePlayBillingUnfetchedProductStatus.Unknown;
            case 2:
                return GooglePlayBillingUnfetchedProductStatus.InvalidProductIdFormat;
            case 3:
                return GooglePlayBillingUnfetchedProductStatus.ProductNotFound;
            case 4:
                return GooglePlayBillingUnfetchedProductStatus.NoEligibleOffer;
            default:
                throw new IllegalArgumentException("Unknown GooglePlayBillingUnfetchedProductStatus value: " + v);
        }
    }
}