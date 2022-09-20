// Imports
import express from 'express';
import { google } from 'googleapis';
import credentials from '../private/credentials.js';

// Constants
const publisher = google.androidpublisher('v3');
const router = express.Router();

// This GET function gets called on /inapps
router.get('/', (req, res) => {   
    googleVerify(req, res)
})

// Verify the subscription
function googleVerify(req, res) {

    const resolve = res;

    // Create a new authClient and provide the credentials aquired from
    // Google Development Console -> API (should be unique to your app)
    var authClient = new google.auth.JWT({
        email: credentials.client_email,
        key: credentials.private_key,
        scopes: 'https://www.googleapis.com/auth/androidpublisher'
    })

    authClient.authorize(function(err, _tokens) {
        if (err) {
            // At this point there was an error while authenticating.
            return console.log(err);
        }

        // We successfully auth with google api so we can query for products
        publisher.purchases.products.get( { 
            auth: authClient,

            // This is your package name (should be unique to you app)
            packageName: "com.yoyogames.YoyoPlayServices",

            // This is the 'productId' and 'token' from the GET request (GameMaker Studio).
            productId: req.query.productId,
            token: req.query.token,

        }, function(err, response) {        
            if (err) {
                // At this point there was an error and the subscription could not be verified.
                resolve.send('failure');
            } else {
                // At this point we successfully validated the purchase.
                resolve.send('success');
            }
        });
    });
}

export default router;