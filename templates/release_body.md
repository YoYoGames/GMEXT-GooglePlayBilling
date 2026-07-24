## IMPORTANT

- This extension is to be used with GM 2022.9 and future releases.
- Works with **Android**.
- **Version 2.0.0 is a breaking change**: the extension has been fully rewritten onto Google Play Billing 9.1.0 with a new API (`play_billing_*` functions replacing the old `GPBilling_*` functions). Projects upgrading from an earlier (1.x) version will need to adjust their code. Check the documentation for the current API.

## CHANGES SINCE ${releaseOldVersion}

https://github.com/YoYoGames/GMEXT-GooglePlayBilling/compare/${releaseOldVersion}...${releaseNewVersion}

## DESCRIPTION

This extension wraps Google's Play Billing Library (version 9.1.0), allowing developers to add and control in-app purchases and subscriptions inside their application/game.

## FEATURES

- Connecting to the Google Play Store, and querying billing configuration/feature availability
- Querying product/subscription details, including pricing, offers and pricing phases
- Launching the purchase flow for one-time products, bundles and subscriptions (including upgrades/downgrades)
- Querying, acknowledging and consuming purchases
- Alternative billing, external offers/payments, and the Billing Choice program
- Showing Play Store in-app messages (e.g. failed subscription renewal payments)

## DOCUMENTATION

The full documentation of the API is included in the extension asset (included files).

## NOTES

You will need to have created an app on your Google Play dev panel, so you can provide the app's public licensing key in Game Options -> Android -> Packaging.


