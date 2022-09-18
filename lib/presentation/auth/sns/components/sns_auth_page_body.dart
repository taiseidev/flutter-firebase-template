import 'package:flutter/material.dart';
import 'package:flutter_firebase_template/feature/auth/sns/apple_auth.dart';
import 'package:flutter_firebase_template/feature/auth/sns/google_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SnsAuthPageBody extends ConsumerWidget {
  const SnsAuthPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
