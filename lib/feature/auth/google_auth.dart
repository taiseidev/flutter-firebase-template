import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_template/feature/auth/sms.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../firebase_options.dart';

final googleSigninProvider = FutureProvider<OAuthCredential?>((ref) async {
  final signinAccount = await GoogleSignIn(
    clientId: DefaultFirebaseOptions.currentPlatform.iosClientId,
  ).signIn();

  final auth = await signinAccount!.authentication;
  final credential = GoogleAuthProvider.credential(
    idToken: auth.idToken,
    accessToken: auth.accessToken,
  );
  return credential;
});

final googleAuthProvider = Provider<Future<void> Function()>((ref) => () async {
      try {
        final oauth = await ref.read(googleSigninProvider.future);
        if (oauth != null) {
          final credential =
              await ref.read(userCredentialProvider(oauth).future);
        }
        return;
      } catch (e) {}
    });
