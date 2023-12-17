# Dropbox integration sample in flutter

A dropbox integration example in Flutter.

## For developpers

### Configuration

1. Configuration file

Add a file **$project_root_directory/config/dropbox_config.dart** :

```dart
const dropboxAppKey = 'YOUR_APP_KEY';
const dropboxRedirectSchemeMobile = 'YOUR_REDIRECT_SCHEME_MOBILE';
const dropboxRedirectUriMobile = 'YOUR_REDIRECT_URI_MOBILE';
const dropboxRedirectSchemeDesktop = 'YOUR_REDIRECT_SCHEME_DESKTOP';
const dropboxRedirectUriDesktop = 'YOUR_REDIRECT_URI_DESKTOP';
const dropboxScopes = [
    // Your scopes, each in a simple string value
];
```

The redirect uri for mobile should be something follow a pattern like `${xxxx}://${yyyy}`, where the `xxxx` value can have lowercase letters, digits, dashes and points (and must start with a letter of course, also do not put dollars and curly braces, it's just for you to know that you must make a substitution). The redirect scheme for mobile is just the part of the redirect uri for mobile that is before the part ``://${yyyy}``. As an example ``abcd123://efgh`` for the uri and ``abcd123`` for the scheme.

The redirect uri for desktop should follow the following pattern : ``http://localhost:${port}/${host}``, where port is your custom port number and host is your custom host name.
The redirect scheme for desktop is just the part before the pattern ``/${host}``. As an example ``http://localhost:2300/landing-page`` for the uri and ``http://localhost:2300`` for the scheme.

2. AndroidManifest

Modify the file **$project_root_directory/android/app/src/main/AndroidManifest.xml** :
replace the android:scheme with the scheme of your mobile redirect uri.

```xml
<activity
    android:name="com.linusu.flutter_web_auth_2.CallbackActivity"
    android:exported="true">
    <intent-filter android:label="flutter_web_auth_2">
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data android:scheme="YOUR_OWN_REDIRECT_URI_SCHEME" />
    </intent-filter>
</activity>
```

### Building missing files

* Run `dart run build_runner build` in the project root directory from your terminal.