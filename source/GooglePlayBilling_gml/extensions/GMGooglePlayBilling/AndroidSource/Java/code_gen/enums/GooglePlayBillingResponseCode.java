// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.enums;

public enum GooglePlayBillingResponseCode
{
    ServiceTimeout((int)-3),
    FeatureNotSupported((int)-2),
    ServiceDisconnected((int)-1),
    Ok((int)0),
    UserCanceled((int)1),
    ServiceUnavailable((int)2),
    BillingUnavailable((int)3),
    ItemUnavailable((int)4),
    DeveloperError((int)5),
    Error((int)6),
    ItemAlreadyOwned((int)7),
    ItemNotOwned((int)8),
    NetworkError((int)12);

    private final int value;
    private GooglePlayBillingResponseCode(int v)
    {
        this.value = v;
    }
    public int value()
    {
        return this.value;
    }
    public static GooglePlayBillingResponseCode from(int v)
    {
        switch (v)
        {
            case -3:
                return GooglePlayBillingResponseCode.ServiceTimeout;
            case -2:
                return GooglePlayBillingResponseCode.FeatureNotSupported;
            case -1:
                return GooglePlayBillingResponseCode.ServiceDisconnected;
            case 0:
                return GooglePlayBillingResponseCode.Ok;
            case 1:
                return GooglePlayBillingResponseCode.UserCanceled;
            case 2:
                return GooglePlayBillingResponseCode.ServiceUnavailable;
            case 3:
                return GooglePlayBillingResponseCode.BillingUnavailable;
            case 4:
                return GooglePlayBillingResponseCode.ItemUnavailable;
            case 5:
                return GooglePlayBillingResponseCode.DeveloperError;
            case 6:
                return GooglePlayBillingResponseCode.Error;
            case 7:
                return GooglePlayBillingResponseCode.ItemAlreadyOwned;
            case 8:
                return GooglePlayBillingResponseCode.ItemNotOwned;
            case 12:
                return GooglePlayBillingResponseCode.NetworkError;
            default:
                throw new IllegalArgumentException("Unknown GooglePlayBillingResponseCode value: " + v);
        }
    }
}