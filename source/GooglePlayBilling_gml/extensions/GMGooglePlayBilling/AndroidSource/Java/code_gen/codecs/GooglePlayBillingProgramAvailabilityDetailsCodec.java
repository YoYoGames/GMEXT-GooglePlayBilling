// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import java.util.Optional;
import ${YYAndroidPackageName}.enums.*;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingProgramAvailabilityDetailsCodec {
    private GooglePlayBillingProgramAvailabilityDetailsCodec()
    {
    }
    public static GooglePlayBillingProgramAvailabilityDetails read(ByteBuffer b)
    {
        GooglePlayBillingProgram billing_program = GooglePlayBillingProgram.from(GMExtWire.readI32(b));

        java.util.Optional<GooglePlayBillingChoiceAvailabilityDetails> billing_choice_details = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            GooglePlayBillingChoiceAvailabilityDetails __opt_billing_choice_details = GooglePlayBillingChoiceAvailabilityDetailsCodec.read(b);
            billing_choice_details = java.util.Optional.of(__opt_billing_choice_details);
        }

        return new GooglePlayBillingProgramAvailabilityDetails(billing_program, billing_choice_details);
    }

    public static void write(GMExtWire.IByteWriter b, GooglePlayBillingProgramAvailabilityDetails obj)
    {
        GMExtWire.writeI32(b, obj.billing_program().value());

        GMExtWire.writeBool(b, obj.billing_choice_details() != null && obj.billing_choice_details().isPresent());
        if (obj.billing_choice_details() != null && obj.billing_choice_details().isPresent())
        {
            GooglePlayBillingChoiceAvailabilityDetailsCodec.write(b, obj.billing_choice_details().get());
        }

    }
}