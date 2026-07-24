
/**
 * @module home
 * @title Google Play Billing
 *
 * @section Extension's Features
 * @desc
 *
 * * Connect to the Google Play Store and query billing configuration/feature availability
 * * Query one-time products and subscriptions, including pricing, offers and pricing phases
 * * Launch the Play Store purchase UI for one-time products, bundles and subscriptions (including upgrades/downgrades)
 * * Query, acknowledge and consume the user's purchases
 * * Support alternative billing, external offers/payments and the Billing Choice program
 * * Show Play Store in-app messages (e.g. failed subscription renewal payments)
 *
 * @section_end
 *
 * @section Introduction
 *
 * @desc
 *
 * This extension wraps Google's [Play Billing Library](https://developer.android.com/google/play/billing) (version 9.1.0), so it is only supported on **Android**. Before using any other function you must initialize the extension with ${function.play_billing_init} and connect to the Play Store with ${function.play_billing_start_connection}.
 *
 * We recommend reviewing Google's own [Billing Overview](https://developer.android.com/google/play/billing/billing_overview) documentation before using this extension, as it introduces the concepts (products, purchases, acknowledgement, consumption) that the functions here map onto closely.
 *
 * [[Important: Purchase results are NOT returned directly by ${function.play_billing_launch_billing_flow}. Every purchase - however it was started - is delivered through the single callback registered in ${function.play_billing_init}, which fires for the lifetime of the client.]]
 *
 * @section_end
 *
 * @section Guides
 * @desc Guides for the Google Play Billing extension.
 * @reference page.getting_started
 * @section_end
 *
 * @section Modules
 * @desc The following are the available modules for the Google Play Billing extension:
 *
 * @reference module.connection
 * @reference module.products
 * @reference module.purchases
 * @reference module.billing_programs
 *
 * @section_end
 *
 * @module_end
 */
