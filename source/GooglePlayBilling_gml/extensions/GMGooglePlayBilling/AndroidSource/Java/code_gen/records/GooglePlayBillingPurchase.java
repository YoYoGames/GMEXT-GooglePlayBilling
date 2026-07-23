// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;
import ${YYAndroidPackageName}.enums.*;

import java.nio.ByteBuffer;
import java.util.Optional;
import java.util.List;

public record GooglePlayBillingPurchase(java.util.Optional<String> order_id, String package_name, double purchase_time, String purchase_token, java.util.List<String> products, String signature, boolean is_acknowledged, boolean is_auto_renewing, GooglePlayBillingPurchaseState purchase_state, int quantity, String original_json, boolean is_suspended, java.util.Optional<GooglePlayBillingAccountIdentifiers> account_identifiers, java.util.Optional<GooglePlayBillingPendingPurchaseUpdate> pending_purchase_update) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 25;
    @Override
    public void encode(ByteBuffer b)
    {
        GooglePlayBillingPurchaseCodec.write(b, this);
    }
}
