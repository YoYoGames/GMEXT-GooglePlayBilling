// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.records;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.codecs.*;
import ${YYAndroidPackageName}.enums.*;

import java.nio.ByteBuffer;
import java.util.Optional;

public record GooglePlayBillingProgramAvailabilityDetails(GooglePlayBillingProgram billing_program, java.util.Optional<GooglePlayBillingChoiceAvailabilityDetails> billing_choice_details) implements GMExtWire.ITypedStruct
{
    public static final int CODEC_ID = 26;
    @Override
    public void encode(ByteBuffer b)
    {
        GooglePlayBillingProgramAvailabilityDetailsCodec.write(b, this);
    }
}
