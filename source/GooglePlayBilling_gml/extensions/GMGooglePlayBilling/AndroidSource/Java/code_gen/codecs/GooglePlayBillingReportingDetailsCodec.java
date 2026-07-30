// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import java.util.Optional;
import ${YYAndroidPackageName}.enums.*;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingReportingDetailsCodec {
    private GooglePlayBillingReportingDetailsCodec()
    {
    }
    public static GooglePlayBillingReportingDetails read(ByteBuffer b)
    {
        java.util.Optional<GooglePlayBillingProgram> billing_program = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            GooglePlayBillingProgram __opt_billing_program = GooglePlayBillingProgram.from(GMExtWire.readI32(b));
            billing_program = java.util.Optional.of(__opt_billing_program);
        }

        String external_transaction_token = GMExtWire.readString(b);

        return new GooglePlayBillingReportingDetails(billing_program, external_transaction_token);
    }

    public static void write(GMExtWire.IByteWriter b, GooglePlayBillingReportingDetails obj)
    {
        GMExtWire.writeBool(b, obj.billing_program() != null && obj.billing_program().isPresent());
        if (obj.billing_program() != null && obj.billing_program().isPresent())
        {
            GMExtWire.writeI32(b, obj.billing_program().get().value());
        }

        GMExtWire.writeString(b, obj.external_transaction_token());

    }
}