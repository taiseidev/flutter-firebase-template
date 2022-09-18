import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_template/feature/auth/sms.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../firebase_options.dart';

final appleSigninProvider = FutureProvider<OAuthCredential>((ref) async {
  final signinAccount = await SignInWithApple.getAppleIDCredential(
    scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ],
  );
  final credential = AppleAuthProvider.credential(
    signinAccount.authorizationCode,
  );

  return credential;
});

final appleAuthProvider = Provider<Future<void> Function()>((ref) => () async {
      try {
        final oauth = await ref.read(appleSigninProvider.future);
        if (oauth != null) {
          final credential =
              await ref.read(userCredentialProvider(oauth).future);
        }
        return;
      } catch (e) {}
    });