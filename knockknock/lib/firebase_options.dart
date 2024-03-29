// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyANlDuDQt7IboCQTSHXsk3BpiL71u1Rubk',
    appId: '1:967955689130:web:e73ef2cc67824894dbaad3',
    messagingSenderId: '967955689130',
    projectId: 'hellosenior-da88b',
    authDomain: 'hellosenior-da88b.firebaseapp.com',
    storageBucket: 'hellosenior-da88b.appspot.com',
    measurementId: 'G-BC1RTXLHJZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_rXiZsAtuX-adjdSMDjT23cmGgkWGd1I',
    appId: '1:967955689130:android:8cea2382d799e303dbaad3',
    messagingSenderId: '967955689130',
    projectId: 'hellosenior-da88b',
    storageBucket: 'hellosenior-da88b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJ4lfL2XEIGz2zXQCBcg0PGsppQIrdAaA',
    appId: '1:967955689130:ios:28678b909d5ea99edbaad3',
    messagingSenderId: '967955689130',
    projectId: 'hellosenior-da88b',
    storageBucket: 'hellosenior-da88b.appspot.com',
    iosClientId: '967955689130-ic008prrlnmrckbdirakb7t21qqkmh83.apps.googleusercontent.com',
    iosBundleId: 'com.example.knockknock',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAJ4lfL2XEIGz2zXQCBcg0PGsppQIrdAaA',
    appId: '1:967955689130:ios:4f2f245a06db66c5dbaad3',
    messagingSenderId: '967955689130',
    projectId: 'hellosenior-da88b',
    storageBucket: 'hellosenior-da88b.appspot.com',
    iosClientId: '967955689130-afup0f85tk3ai8c7fq5aku5n0fcv8qod.apps.googleusercontent.com',
    iosBundleId: 'com.example.knockknock.RunnerTests',
  );
}
