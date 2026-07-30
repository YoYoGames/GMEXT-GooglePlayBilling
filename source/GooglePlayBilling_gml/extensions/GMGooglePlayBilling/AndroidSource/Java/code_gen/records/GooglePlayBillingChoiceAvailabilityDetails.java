// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;
import ${YYAndroidPackageName}.enums.*;

import java.nio.ByteBuffer;

public record GooglePlayBillingChoiceAvailabilityDetails(GooglePlayBillingChoiceScreenType choice_screen_type, boolean external_link_available) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 18;
    @Override
    public void encode(GMExtWire.IByteWriter b)
    {
        GooglePlayBillingChoiceAvailabilityDetailsCodec.write(b, this);
    }
}
