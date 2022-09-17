import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_template/feature/auth/auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userCredentialProvider =
    FutureProvider.family<UserCredential, OAuthCredential>(
  (ref, oauth) async =>
      await ref.read(firebaseAuthProvider).signInWithCredential(oauth),
);
