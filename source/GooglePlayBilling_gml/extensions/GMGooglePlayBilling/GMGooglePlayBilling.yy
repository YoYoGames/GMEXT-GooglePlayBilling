{
  "$GMExtension": "",
  "%Name": "GMGooglePlayBilling",
  "androidactivityinject": null,
  "androidclassname": "GMGooglePlayBilling",
  "androidcodeinjection": "\r\n\u003CYYAndroidGradleAndroid\u003E\r\n    compileOptions {\r\n        sourceCompatibility JavaVersion.VERSION_17\r\n        targetCompatibility JavaVersion.VERSION_17\r\n    }\r\n\r\n    kotlinOptions {\r\n        jvmTarget = \u002217\u0022\r\n    }\r\n\u003C/YYAndroidGradleAndroid\u003E\r\n\r\n\u003CYYAndroidGradleDependencies\u003E\r\n    implementation \u0022org.jetbrains.kotlin:kotlin-stdlib:$kotlin_version\u0022\r\n    implementation \u0022androidx.core:core-ktx:1.13.1\u0022\r\n\r\n    implementation \u0022com.android.billingclient:billing:9.1.0\u0022\r\n\u003C/YYAndroidGradleDependencies\u003E\r\n\r\n\u003CYYAndroidTopLevelGradleBuildscript\u003E\r\n    ext.kotlin_version = \u00222.1.21\u0022\r\n\r\n    dependencies {\r\n        classpath \u0022org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version\u0022\r\n    }\r\n\u003C/YYAndroidTopLevelGradleBuildscript\u003E\r\n\r\n",
  "androidinject": null,
  "androidmanifestinject": null,
  "androidPermissions": [
    "com.android.vending.BILLING"
  ],
  "androidProps": true,
  "androidsourcedir": "",
  "author": "",
  "classname": "",
  "copyToTargets": 8,
  "description": "",
  "exportToGame": true,
  "extensionVersion": "2.0.0",
  "files": [
    {
      "$GMExtensionFile": "v1",
      "%Name": "",
      "constants": [],
      "copyToTargets": -1,
      "filename": "GMGooglePlayBilling.ext",
      "final": "",
      "functions": [
        {
          "$GMExtensionFunction": "",
          "%Name": "__play_billing_init",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__play_billing_init",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__play_billing_init",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__play_billing_start_connection",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__play_billing_start_connection",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__play_billing_start_connection",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "play_billing_end_connection",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__play_billing_end_connection",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "play_billing_end_connection",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__play_billing_get_connection_state",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__play_billing_get_connection_state",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__play_billing_get_connection_state",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "play_billing_is_ready",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__play_billing_is_ready",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "play_billing_is_ready",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__play_billing_get_config_async",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__play_billing_get_config_async",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__play_billing_get_config_async",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__play_billing_is_alternative_billing_only_available_async",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__play_billing_is_alternative_billing_only_available_async",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__play_billing_is_alternative_billing_only_available_async",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__play_billing_is_billing_program_available_async",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__play_billing_is_billing_program_available_async",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__play_billing_is_billing_program_available_async",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__play_billing_is_feature_supported",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__play_billing_is_feature_supported",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__play_billing_is_feature_supported",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__play_billing_query_product_details_async",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__play_billing_query_product_details_async",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__play_billing_query_product_details_async",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "play_billing_clear_products",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__play_billing_clear_products",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "play_billing_clear_products",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__play_billing_launch_billing_flow",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__play_billing_launch_billing_flow",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__play_billing_launch_billing_flow",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__play_billing_query_purchases_async",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__play_billing_query_purchases_async",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__play_billing_query_purchases_async",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__play_billing_acknowledge_purchase",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__play_billing_acknowledge_purchase",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__play_billing_acknowledge_purchase",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__play_billing_consume_async",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__play_billing_consume_async",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__play_billing_consume_async",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__play_billing_create_alternative_billing_only_reporting_details_async",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__play_billing_create_alternative_billing_only_reporting_details_async",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__play_billing_create_alternative_billing_only_reporting_details_async",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__play_billing_create_billing_program_reporting_details_async",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__play_billing_create_billing_program_reporting_details_async",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__play_billing_create_billing_program_reporting_details_async",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__play_billing_show_in_app_messages",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__play_billing_show_in_app_messages",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__play_billing_show_in_app_messages",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__play_billing_get_billing_choice_info_async",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__play_billing_get_billing_choice_info_async",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__play_billing_get_billing_choice_info_async",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__play_billing_show_billing_program_information_dialog",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__play_billing_show_billing_program_information_dialog",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__play_billing_show_billing_program_information_dialog",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__play_billing_show_alternative_billing_only_information_dialog",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__play_billing_show_alternative_billing_only_information_dialog",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__play_billing_show_alternative_billing_only_information_dialog",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__play_billing_launch_external_link",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__play_billing_launch_external_link",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__play_billing_launch_external_link",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__GMGooglePlayBilling_invocation_handler",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _buffer_ptr\r\n@param {Real} _buffer_size",
          "externalName": "__EXT_NATIVE__GMGooglePlayBilling_invocation_handler",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__GMGooglePlayBilling_invocation_handler",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        }
      ],
      "init": "",
      "kind": 4,
      "name": "",
      "origname": "",
      "ProxyFiles": [],
      "resourceType": "GMExtensionFile",
      "resourceVersion": "2.0",
      "uncompress": false,
      "usesRunnerInterface": false
    }
  ],
  "gradleinject": null,
  "hasConvertedCodeInjection": true,
  "helpfile": "",
  "HTML5CodeInjection": "",
  "html5Props": false,
  "IncludedResources": [],
  "installdir": "",
  "iosCocoaPodDependencies": "",
  "iosCocoaPods": "",
  "ioscodeinjection": "",
  "iosdelegatename": "",
  "iosplistinject": null,
  "iosProps": false,
  "iosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "license": "",
  "maccompilerflags": "",
  "maclinkerflags": "",
  "macsourcedir": "",
  "name": "GMGooglePlayBilling",
  "options": [],
  "optionsFile": "options.json",
  "packageId": "",
  "parent": {
    "name": "GMGooglePlayBilling",
    "path": "folders/GMGooglePlayBilling.yy"
  },
  "productId": "",
  "resourceType": "GMExtension",
  "resourceVersion": "2.0",
  "sourcedir": "",
  "supportedTargets": -1,
  "tvosclassname": null,
  "tvosCocoaPodDependencies": "",
  "tvosCocoaPods": "",
  "tvoscodeinjection": "",
  "tvosdelegatename": null,
  "tvosmaccompilerflags": "",
  "tvosmaclinkerflags": "",
  "tvosplistinject": null,
  "tvosProps": false,
  "tvosSystemFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": []
}