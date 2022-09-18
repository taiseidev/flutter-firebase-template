import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_template/feature/auth/sns.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../firebase_options.dart';

final googleCredentialProvider = FutureProvider<OAuthCredential?>((_) async {
  final platform = DefaultFirebaseOptions.currentPlatform;
  // ignore: todo
  // TODO: Platform用のutilファイルを作成する
  final signinAccount = await GoogleSignIn(
    clientId: Platform.isIOS ? platform.iosClientId : platform.androidClientId,
  ).signIn();
  if (signinAccount == null) {
    return null;
  }

  final auth = await signinAccount.authentication;
  final credential = GoogleAuthProvider.credential(
    idToken: auth.idToken,
    accessToken: auth.accessToken,
  );
  return credential;
});

final googleAuthProvider = Provider<Future<void> Function()>(
  (ref) => () async {
    try {
      final oauth = await ref.watch(googleCredentialProvider.future);
      if (oauth != null) {
        await ref.watch(userCredentialProvider(oauth).future);
      }
      return;
    } on Exception catch (_) {}
  },
);
