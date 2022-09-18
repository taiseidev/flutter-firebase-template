import 'package:flutter/material.dart';
import 'package:flutter_firebase_template/feature/auth/sns/apple_auth.dart';
import 'package:flutter_firebase_template/feature/auth/sns/google_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../feature/auth/auth.dart';

class SnsAuthPageBody extends ConsumerWidget {
  const SnsAuthPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(userIdProvider).value;
    final isSignedIn = ref.watch(isSignedInProvider).value;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isSignedIn != null) Text(isSignedIn ? '$userId' : '未ログイン'),
          SignInButton(
            Buttons.Google,
            onPressed: () => ref.read(googleAuthProvider)(),
          ),
          SignInButton(
            Buttons.Apple,
            onPressed: () => ref.read(appleAuthProvider)(),
          ),
        ],
      ),
    );
  }
}
