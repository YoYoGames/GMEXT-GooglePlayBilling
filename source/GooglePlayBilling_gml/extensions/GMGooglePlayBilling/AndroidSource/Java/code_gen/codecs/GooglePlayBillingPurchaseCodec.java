// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import java.util.Optional;
import java.util.List;
import ${YYAndroidPackageName}.enums.*;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingPurchaseCodec {
    private GooglePlayBillingPurchaseCodec()
    {
    }
    public static GooglePlayBillingPurchase read(ByteBuffer b)
    {
        java.util.Optional<String> order_id = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            String __opt_order_id = GMExtWire.readString(b);
            order_id = java.util.Optional.of(__opt_order_id);
        }

        String package_name = GMExtWire.readString(b);

        double purchase_time = GMExtWire.readF64(b);

        String purchase_token = GMExtWire.readString(b);

        java.util.List<String> products = GMExtWire.readList(b, bb -> GMExtWire.readString(bb));

        String signature = GMExtWire.readString(b);

        boolean is_acknowledged = GMExtWire.readBool(b);

        boolean is_auto_renewing = GMExtWire.readBool(b);

        GooglePlayBillingPurchaseState purchase_state = GooglePlayBillingPurchaseState.from(GMExtWire.readI32(b));

        int quantity = GMExtWire.readI32(b);

        String original_json = GMExtWire.readString(b);

        boolean is_suspended = GMExtWire.readBool(b);

        java.util.Optional<GooglePlayBillingAccountIdentifiers> account_identifiers = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            GooglePlayBillingAccountIdentifiers __opt_account_identifiers = GooglePlayBillingAccountIdentifiersCodec.read(b);
            account_identifiers = java.util.Optional.of(__opt_account_identifiers);
        }

        java.util.Optional<GooglePlayBillingPendingPurchaseUpdate> pending_purchase_update = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            GooglePlayBillingPendingPurchaseUpdate __opt_pending_purchase_update = GooglePlayBillingPendingPurchaseUpdateCodec.read(b);
            pending_purchase_update = java.util.Optional.of(__opt_pending_purchase_update);
        }

        return new GooglePlayBillingPurchase(order_id, package_name, purchase_time, purchase_token, products, signature, is_acknowledged, is_auto_renewing, purchase_state, quantity, original_json, is_suspended, account_identifiers, pending_purchase_update);
    }

    public static void write(GMExtWire.IByteWriter b, GooglePlayBillingPurchase obj)
    {
        GMExtWire.writeBool(b, obj.order_id() != null && obj.order_id().isPresent());
        if (obj.order_id() != null && obj.order_id().isPresent())
        {
            GMExtWire.writeString(b, obj.order_id().get());
        }

        GMExtWire.writeString(b, obj.package_name());

        GMExtWire.writeF64(b, obj.purchase_time());

        GMExtWire.writeString(b, obj.purchase_token());

        GMExtWire.writeList(b, obj.products(), (bb, x) -> GMExtWire.writeString(bb, x));

        GMExtWire.writeString(b, obj.signature());

        GMExtWire.writeBool(b, obj.is_acknowledged());

        GMExtWire.writeBool(b, obj.is_auto_renewing());

        GMExtWire.writeI32(b, obj.purchase_state().value());

        GMExtWire.writeI32(b, obj.quantity());

        GMExtWire.writeString(b, obj.original_json());

        GMExtWire.writeBool(b, obj.is_suspended());

        GMExtWire.writeBool(b, obj.account_identifiers() != null && obj.account_identifiers().isPresent());
        if (obj.account_identifiers() != null && obj.account_identifiers().isPresent())
        {
            GooglePlayBillingAccountIdentifiersCodec.write(b, obj.account_identifiers().get());
        }

        GMExtWire.writeBool(b, obj.pending_purchase_update() != null && obj.pending_purchase_update().isPresent());
        if (obj.pending_purchase_update() != null && obj.pending_purchase_update().isPresent())
        {
            GooglePlayBillingPendingPurchaseUpdateCodec.write(b, obj.pending_purchase_update().get());
        }

    }
}