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
    apiKey: 'AIzaSyDOyqDbPo5RvTanCqJIlgIaOl-d6QBsvNg',
    appId: '1:446678077160:web:1b6012245dcae9bd9dc35d',
    messagingSenderId: '446678077160',
    projectId: 'e-commerce-83a51',
    authDomain: 'e-commerce-83a51.firebaseapp.com',
    storageBucket: 'e-commerce-83a51.appspot.com',
    measurementId: 'G-CSEKC7RBC1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCdWPzTkEmjRDi_2cZTGntm-su6KCn872w',
    appId: '1:446678077160:android:9243faf8b21dcce99dc35d',
    messagingSenderId: '446678077160',
    projectId: 'e-commerce-83a51',
    storageBucket: 'e-commerce-83a51.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQKokwYj9omqlN0qkH48UZ8dPajM8US7s',
    appId: '1:446678077160:ios:5d6cc107f20338849dc35d',
    messagingSenderId: '446678077160',
    projectId: 'e-commerce-83a51',
    storageBucket: 'e-commerce-83a51.appspot.com',
    iosBundleId: 'com.example.eCommerce',
  );
}
