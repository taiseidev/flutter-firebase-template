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
    apiKey: 'AIzaSyDTVTrWB1rFbPvwoTpx4SsVFbBRqpRz5co',
    appId: '1:829526359215:web:11102439b08f68b6f6685a',
    messagingSenderId: '829526359215',
    projectId: 'flutter-firebase-tpl',
    authDomain: 'flutter-firebase-tpl.firebaseapp.com',
    storageBucket: 'flutter-firebase-tpl.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDbDHJzeQTDSRj2gQzwWyQscaCSoKHbN_U',
    appId: '1:829526359215:android:00e30b2d6bfdbe78f6685a',
    messagingSenderId: '829526359215',
    projectId: 'flutter-firebase-tpl',
    storageBucket: 'flutter-firebase-tpl.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkdfhqBVsIdigAvutXmlIrNeblPCnUq6c',
    appId: '1:829526359215:ios:b8be1589b0dd16f5f6685a',
    messagingSenderId: '829526359215',
    projectId: 'flutter-firebase-tpl',
    storageBucket: 'flutter-firebase-tpl.appspot.com',
    iosClientId: '829526359215-gd9ui8c15ui79rv2lfqustdi1f32tjs1.apps.googleusercontent.com',
    iosBundleId: 'com.flutter.firebase.template.flutterFirebaseTemplate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDkdfhqBVsIdigAvutXmlIrNeblPCnUq6c',
    appId: '1:829526359215:ios:b8be1589b0dd16f5f6685a',
    messagingSenderId: '829526359215',
    projectId: 'flutter-firebase-tpl',
    storageBucket: 'flutter-firebase-tpl.appspot.com',
    iosClientId: '829526359215-gd9ui8c15ui79rv2lfqustdi1f32tjs1.apps.googleusercontent.com',
    iosBundleId: 'com.flutter.firebase.template.flutterFirebaseTemplate',
  );
}
