// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import java.util.Optional;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingValidTimeWindowCodec {
    private GooglePlayBillingValidTimeWindowCodec()
    {
    }
    public static GooglePlayBillingValidTimeWindow read(ByteBuffer b)
    {
        java.util.Optional<Double> start_time = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            double __opt_start_time = GMExtWire.readF64(b);
            start_time = java.util.Optional.of(__opt_start_time);
        }

        java.util.Optional<Double> end_time = java.util.Optional.empty();
        if (GMExtWire.readBool(b))
        {
            double __opt_end_time = GMExtWire.readF64(b);
            end_time = java.util.Optional.of(__opt_end_time);
        }

        return new GooglePlayBillingValidTimeWindow(start_time, end_time);
    }

    public static void write(GMExtWire.IByteWriter b, GooglePlayBillingValidTimeWindow obj)
    {
        GMExtWire.writeBool(b, obj.start_time() != null && obj.start_time().isPresent());
        if (obj.start_time() != null && obj.start_time().isPresent())
        {
            GMExtWire.writeF64(b, obj.start_time().get());
        }

        GMExtWire.writeBool(b, obj.end_time() != null && obj.end_time().isPresent());
        if (obj.end_time() != null && obj.end_time().isPresent())
        {
            GMExtWire.writeF64(b, obj.end_time().get());
        }

    }
}