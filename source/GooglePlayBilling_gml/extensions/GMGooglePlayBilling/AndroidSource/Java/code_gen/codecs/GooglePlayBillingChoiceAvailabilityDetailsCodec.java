// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.enums.*;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingChoiceAvailabilityDetailsCodec {
    private GooglePlayBillingChoiceAvailabilityDetailsCodec()
    {
    }
    public static GooglePlayBillingChoiceAvailabilityDetails read(ByteBuffer b)
    {
        GooglePlayBillingChoiceScreenType choice_screen_type = GooglePlayBillingChoiceScreenType.from(GMExtWire.readI32(b));

        boolean external_link_available = GMExtWire.readBool(b);

        return new GooglePlayBillingChoiceAvailabilityDetails(choice_screen_type, external_link_available);
    }

    public static void write(ByteBuffer b, GooglePlayBillingChoiceAvailabilityDetails obj)
    {
        GMExtWire.writeI32(b, obj.choice_screen_type().value());

        GMExtWire.writeBool(b, obj.external_link_available());

    }
}