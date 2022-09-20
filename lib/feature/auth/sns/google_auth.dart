import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_template/feature/auth/sns/sns.dart';
import 'package:flutter_firebase_template/repositories/firestore/app_user_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../firebase_options.dart';
import '../../../utils/roggle.dart';

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

final googleAuthProvider = Provider.autoDispose<Future<void> Function()>(
  (ref) => () async {
    try {
      final oauth = await ref.watch(googleCredentialProvider.future);
      if (oauth != null) {
        final credential =
            await ref.watch(userCredentialProvider(oauth).future);
        final user = credential.user;
        await ref.watch(appUserRepositoryProvider).setAppUser(
              userId: user!.uid,
              name: user.displayName!,
              mail: user.email,
              imageUrl: user.photoURL!,
              type: 0, // TODO:refactor
            );
      }
      return;
    } on Exception catch (e) {
      roggle.wtf(e);
    }
  },
);
