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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCtnISFvS7SpEXHH5yJNF0cBKs-r8TtXDE',
    appId: '1:906144696409:web:101b56663ac11004008948',
    messagingSenderId: '906144696409',
    projectId: 'spikemonster-6d46d',
    authDomain: 'spikemonster-6d46d.firebaseapp.com',
    storageBucket: 'spikemonster-6d46d.appspot.com',
    measurementId: 'G-910NNYEJCP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBm1kDjJoGDLVEmvx29RA-UYPZtbkoD3dc',
    appId: '1:906144696409:android:7779632eb352be1a008948',
    messagingSenderId: '906144696409',
    projectId: 'spikemonster-6d46d',
    storageBucket: 'spikemonster-6d46d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDLFdIvPnt7FQgisHW8ZuikZ_3KSnxVaHo',
    appId: '1:906144696409:ios:bde6f826c4585b2e008948',
    messagingSenderId: '906144696409',
    projectId: 'spikemonster-6d46d',
    storageBucket: 'spikemonster-6d46d.appspot.com',
    iosClientId: '906144696409-et6uup558htq6adbp9gbojdgfcah6t6p.apps.googleusercontent.com',
    iosBundleId: 'com.spikemonster.spikeMonster',
  );
}
