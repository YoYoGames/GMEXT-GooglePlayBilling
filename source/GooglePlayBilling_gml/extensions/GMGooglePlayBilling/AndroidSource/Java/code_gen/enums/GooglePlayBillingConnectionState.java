// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.enums;

public enum GooglePlayBillingConnectionState
{
    Disconnected((int)0),
    Connecting((int)1),
    Connected((int)2),
    Closed((int)3);

    private final int value;
    private GooglePlayBillingConnectionState(int v)
    {
        this.value = v;
    }
    public int value()
    {
        return this.value;
    }
    public static GooglePlayBillingConnectionState from(int v)
    {
        switch (v)
        {
            case 0:
                return GooglePlayBillingConnectionState.Disconnected;
            case 1:
                return GooglePlayBillingConnectionState.Connecting;
            case 2:
                return GooglePlayBillingConnectionState.Connected;
            case 3:
                return GooglePlayBillingConnectionState.Closed;
            default:
                throw new IllegalArgumentException("Unknown GooglePlayBillingConnectionState value: " + v);
        }
    }
}