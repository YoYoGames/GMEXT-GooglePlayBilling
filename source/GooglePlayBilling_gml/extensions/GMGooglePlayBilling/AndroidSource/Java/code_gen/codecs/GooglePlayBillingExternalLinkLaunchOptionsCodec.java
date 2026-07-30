// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.codecs;

import java.nio.ByteBuffer;

import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.enums.*;
import ${YYAndroidPackageName}.records.*;

public final class GooglePlayBillingExternalLinkLaunchOptionsCodec {
    private GooglePlayBillingExternalLinkLaunchOptionsCodec()
    {
    }
    public static GooglePlayBillingExternalLinkLaunchOptions read(ByteBuffer b)
    {
        GooglePlayBillingProgram billing_program = GooglePlayBillingProgram.from(GMExtWire.readI32(b));

        return new GooglePlayBillingExternalLinkLaunchOptions(billing_program);
    }

    public static void write(GMExtWire.IByteWriter b, GooglePlayBillingExternalLinkLaunchOptions obj)
    {
        GMExtWire.writeI32(b, obj.billing_program().value());

    }
}