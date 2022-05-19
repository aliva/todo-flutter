// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAauAM6LaZx3m0ilj1pMzn16gJoXMNmWrw',
    appId: '1:527520411313:web:43a45de9b9fef3b2b53c90',
    messagingSenderId: '527520411313',
    projectId: 'todo-flutter-349512',
    authDomain: 'todo-flutter-349512.firebaseapp.com',
    storageBucket: 'todo-flutter-349512.appspot.com',
    measurementId: 'G-6RB80B7SL1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAA8hfTtLBvnl1-JLExRk_plmKhcSQpD9Q',
    appId: '1:527520411313:android:e33f16174b51a08bb53c90',
    messagingSenderId: '527520411313',
    projectId: 'todo-flutter-349512',
    storageBucket: 'todo-flutter-349512.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCmC4PymUOLAftChJSp759K2DIipptsk_U',
    appId: '1:527520411313:ios:61724c878f255763b53c90',
    messagingSenderId: '527520411313',
    projectId: 'todo-flutter-349512',
    storageBucket: 'todo-flutter-349512.appspot.com',
    iosClientId: '527520411313-2750gbssjvq3lk6614h5d4cpergvorse.apps.googleusercontent.com',
    iosBundleId: 'com.example.todo',
  );
}
