// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDNqZAXQ9-3TQriwzy78HrCue92JfEMApg',
    appId: '1:882145937099:web:3b980ffa45d245cba4bd4e',
    messagingSenderId: '882145937099',
    projectId: 'fir-8c20f',
    authDomain: 'fir-8c20f.firebaseapp.com',
    storageBucket: 'fir-8c20f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAYL6lbVpqBBG-eqxPptdVJgT5ZHkVLNRo',
    appId: '1:882145937099:android:5c3a8caf0750f570a4bd4e',
    messagingSenderId: '882145937099',
    projectId: 'fir-8c20f',
    storageBucket: 'fir-8c20f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC7hf51O5w4zcuwBd8lHWG-zVWvbJIiJV8',
    appId: '1:882145937099:ios:82e58c9ab0db23a4a4bd4e',
    messagingSenderId: '882145937099',
    projectId: 'fir-8c20f',
    storageBucket: 'fir-8c20f.appspot.com',
    iosBundleId: 'com.example.demoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC7hf51O5w4zcuwBd8lHWG-zVWvbJIiJV8',
    appId: '1:882145937099:ios:82e58c9ab0db23a4a4bd4e',
    messagingSenderId: '882145937099',
    projectId: 'fir-8c20f',
    storageBucket: 'fir-8c20f.appspot.com',
    iosBundleId: 'com.example.demoApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDNqZAXQ9-3TQriwzy78HrCue92JfEMApg',
    appId: '1:882145937099:web:c0d58061b79a57a2a4bd4e',
    messagingSenderId: '882145937099',
    projectId: 'fir-8c20f',
    authDomain: 'fir-8c20f.firebaseapp.com',
    storageBucket: 'fir-8c20f.appspot.com',
  );
}
