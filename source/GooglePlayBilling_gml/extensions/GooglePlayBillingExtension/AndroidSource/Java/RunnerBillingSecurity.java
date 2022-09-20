package ${YYAndroidPackageName};

import android.util.Base64;


import com.yoyogames.runner.RunnerJNILib;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.text.TextUtils;
import android.util.Log;

import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.security.Signature;
import java.security.SignatureException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.X509EncodedKeySpec;
import java.util.ArrayList;
import java.util.HashSet;

/**
 * Security-related methods. For a secure implementation, all of this code
 * should be implemented on a server that communicates with the
 * application on the device. For the sake of simplicity and clarity of this
 * example, this code is included here and is executed on the device. If you
 * must verify the purchases on the phone, you should obfuscate this code to
 * make it harder for an attacker to replace the code with stubs that treat all
 * purchases as verified.
 */
public class RunnerBillingSecurity 
{
    private static final String KEY_FACTORY_ALGORITHM = "RSA";
    private static final String SIGNATURE_ALGORITHM = "SHA1withRSA";
    private static final SecureRandom RANDOM = new SecureRandom();
	
    /**
     * This keeps track of the nonces that we generated and sent to the
     * server.  We need to keep track of these until we get back the purchase
     * state and send a confirmation message back to Android Market. If we are
     * killed and lose this list of nonces, it is not fatal. Android Market will
     * send us a new "notify" message and we will re-generate a new nonce.
     * This has to be "static" so that the {@link BillingReceiver} can
     * check if a nonce exists.
     */
    private static HashSet<Long> sKnownNonces = new HashSet<Long>();    

    /** Generates a nonce (a random number used once). */
    public static long generateNonce() 
    {
        long nonce = RANDOM.nextLong();
        sKnownNonces.add(nonce);
        return nonce;
    }

    public static void removeNonce(long nonce) 
    {
        sKnownNonces.remove(nonce);
    }

    public static boolean isNonceKnown(long nonce) 
    {
        return sKnownNonces.contains(nonce);
    }


	public static boolean verifyPurchase(String signedData, String signature) {		

        if (signedData == null) {
			Log.e("yoyo", "BILLING: signedData is null");
            return false;
        }

        boolean verified = false;
        if (!TextUtils.isEmpty(signature)) {

			String base64EncodedPublicKey = getBase64EncodedPublicKey();
			PublicKey key = RunnerBillingSecurity.generatePublicKey(base64EncodedPublicKey);
            
            verified = verify(key, signedData, signature);
            if (!verified) {
				Log.w("yoyo", "BILLING: signature does not match data.");
                return false;
            }
        }
        return true;
    }
       
    /**
     * Runs a private algorithm to generate our public key from 
     *  a previously encoded string
     */
    public static String getBase64EncodedPublicKey() {
    
		return RunnerActivity.BASE64_PUBLIC_KEY;
    }
    
    /**
     * Generates a PublicKey instance from a string containing the
     * Base64-encoded public key.
     *
     * @param encodedPublicKey Base64-encoded public key
     * @throws IllegalArgumentException if encodedPublicKey is invalid
     */
    public static PublicKey generatePublicKey(String encodedPublicKey) 
    {
        try 
        {
            byte[] decodedKey = Base64.decode(encodedPublicKey,0);
            KeyFactory keyFactory = KeyFactory.getInstance(KEY_FACTORY_ALGORITHM);
            return keyFactory.generatePublic(new X509EncodedKeySpec(decodedKey));
        } 
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        } 
        catch (InvalidKeySpecException e) {
            Log.e("yoyo", "BILLING: Invalid key specification.");
            throw new IllegalArgumentException(e);
        } 
        catch (IllegalArgumentException e) {
           Log.e("yoyo", "BILLING: Base64 decoding failed.");
            throw new IllegalArgumentException(e);
        }
    }

    /**
     * Verifies that the signature from the server matches the computed
     * signature on the data.  Returns true if the data is correctly signed.
     *
     * @param publicKey public key associated with the developer account
     * @param signedData signed data from server
     * @param signature server signature
     * @return true if the data and signature match
     */
    public static boolean verify(PublicKey publicKey, String signedData, String signature) 
    {        
        Signature sig;
        try 
        {
            sig = Signature.getInstance(SIGNATURE_ALGORITHM);
            sig.initVerify(publicKey);
            sig.update(signedData.getBytes());
            if (!sig.verify(Base64.decode(signature,0))) 
            {
                Log.e("yoyo", "BILLING: Signature verification failed.");
                return false;
            }
            return true;
        } 
        catch (NoSuchAlgorithmException e) {
			Log.e("yoyo", "BILLING: NoSuchAlgorithmException.");
        } 
        catch (InvalidKeyException e) {
            Log.e("yoyo", "BILLING: Invalid key specification.");
        } 
        catch (SignatureException e) {
            Log.e("yoyo", "BILLING: Signature exception.");
        } 
        catch (IllegalArgumentException e) {
            Log.e("yoyo", "BILLING: Base64 decoding failed.");
        }
        return false;
    }
}
