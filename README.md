# GMEXT-GooglePlayBilling
Repository for GameMaker's Google Play Billing Extension

This repository was created with the intent of presenting users with the latest version available of the extension (even previous to marketplace updates) and also provide a way for the community to contribute with bug fixes and feature implementation.

This extension wraps Google's [Play Billing Library](https://developer.android.com/google/play/billing) (version 9.1.0), letting you connect to the Play Store, query product/subscription details, launch the purchase flow (including bundles and subscription upgrades/downgrades), and query/acknowledge/consume purchases - with support for alternative billing, external offers/payments, the Billing Choice program, and in-app messages. This is an **Android**-only extension.

> [!IMPORTANT]
> **Version 2.0.0 is a breaking change.** The extension has been fully rewritten onto Google Play Billing 9.1.0 with a new API (`play_billing_*` functions replacing the old `GPBilling_*` functions). Projects upgrading from an earlier (1.x) version will need to adjust their code. Check [the documentation](../../wiki) for the current API.

* Android source: `source/GooglePlayBilling_gml/extensions/GMGooglePlayBilling/AndroidSource/`

## Documentation

* Check [the documentation](../../wiki)

The online documentation is regularly updated to ensure it contains the most current information. For those who prefer a different format, we also offer an HTML version. This HTML is directly converted from the GitHub Wiki content, ensuring consistency, although it may follow slightly behind in updates.

We encourage users to refer primarily to the GitHub Wiki for the latest information and updates. The HTML version, included with the extension and within the demo project's data files, serves as a secondary, static reference.

Additionally, if you're contributing new features through PR (Pull Requests), we kindly ask that you also provide accompanying documentation for these features, to maintain the comprehensiveness and usefulness of our resources.
