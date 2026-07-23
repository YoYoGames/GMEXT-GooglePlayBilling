// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import java.util.Optional;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingRentalDetailsCodec {
    private GooglePlayBillingRentalDetailsCodec()
    {
    }
    public static GooglePlayBillingRentalDetails read(ByteBuffer b)
    {
        String rental_period = GMExtWire.readString(b);

        java.util.Optional<String> rental_expiration_period = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            String __opt_rental_expiration_period = GMExtWire.readString(b);
            rental_expiration_period = java.util.Optional.of(__opt_rental_expiration_period);
        }

        return new GooglePlayBillingRentalDetails(rental_period, rental_expiration_period);
    }

    public static void write(ByteBuffer b, GooglePlayBillingRentalDetails obj)
    {
        GMExtWire.writeString(b, obj.rental_period());

        GMExtWire.writeBool(b, obj.rental_expiration_period() != null && obj.rental_expiration_period().isPresent());
        if (obj.rental_expiration_period() != null && obj.rental_expiration_period().isPresent())
        {
            GMExtWire.writeString(b, obj.rental_expiration_period().get());
        }

    }
}