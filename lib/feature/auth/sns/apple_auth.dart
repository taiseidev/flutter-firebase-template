import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_template/feature/auth/sns/sns.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../utils/roggle.dart';

final appleCredentialProvider = FutureProvider<OAuthCredential>((ref) async {
  final signInAccount = await SignInWithApple.getAppleIDCredential(
    scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ],
  );
  final credential = AppleAuthProvider.credential(
    signInAccount.authorizationCode,
  );

  return credential;
});

final appleAuthProvider = Provider<Future<void> Function()>(
  (ref) => () async {
    try {
      final oauth = await ref.watch(appleCredentialProvider.future);
      await ref.watch(userCredentialProvider(oauth).future);
      return;
    } on Exception catch (e) {
      roggle.wtf(e);
    }
  },
);
