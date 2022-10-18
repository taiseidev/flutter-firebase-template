import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_template/app.dart';
import 'package:flutter_firebase_template/feature/auth/auth.dart';
import 'package:flutter_firebase_template/firebase_options.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ProviderScope(
      overrides: [
        firebaseAuthProvider.overrideWithValue(FirebaseAuth.instance),
      ],
      child: MyApp(),
    ),
  );
}
