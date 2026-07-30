// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import java.util.Optional;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingFlowOptionsCodec {
    private GooglePlayBillingFlowOptionsCodec()
    {
    }
    public static GooglePlayBillingFlowOptions read(ByteBuffer b)
    {
        java.util.Optional<Boolean> is_offer_personalized = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            boolean __opt_is_offer_personalized = GMExtWire.readBool(b);
            is_offer_personalized = java.util.Optional.of(__opt_is_offer_personalized);
        }

        java.util.Optional<String> obfuscated_account_id = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            String __opt_obfuscated_account_id = GMExtWire.readString(b);
            obfuscated_account_id = java.util.Optional.of(__opt_obfuscated_account_id);
        }

        java.util.Optional<String> obfuscated_profile_id = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            String __opt_obfuscated_profile_id = GMExtWire.readString(b);
            obfuscated_profile_id = java.util.Optional.of(__opt_obfuscated_profile_id);
        }

        return new GooglePlayBillingFlowOptions(is_offer_personalized, obfuscated_account_id, obfuscated_profile_id);
    }

    public static void write(GMExtWire.IByteWriter b, GooglePlayBillingFlowOptions obj)
    {
        GMExtWire.writeBool(b, obj.is_offer_personalized() != null && obj.is_offer_personalized().isPresent());
        if (obj.is_offer_personalized() != null && obj.is_offer_personalized().isPresent())
        {
            GMExtWire.writeBool(b, obj.is_offer_personalized().get());
        }

        GMExtWire.writeBool(b, obj.obfuscated_account_id() != null && obj.obfuscated_account_id().isPresent());
        if (obj.obfuscated_account_id() != null && obj.obfuscated_account_id().isPresent())
        {
            GMExtWire.writeString(b, obj.obfuscated_account_id().get());
        }

        GMExtWire.writeBool(b, obj.obfuscated_profile_id() != null && obj.obfuscated_profile_id().isPresent());
        if (obj.obfuscated_profile_id() != null && obj.obfuscated_profile_id().isPresent())
        {
            GMExtWire.writeString(b, obj.obfuscated_profile_id().get());
        }

    }
}