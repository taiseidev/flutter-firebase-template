import 'package:flutter/material.dart';
import 'package:flutter_firebase_template/feature/auth/google_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GoogleAuthPageBody extends StatelessWidget {
  const GoogleAuthPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
            builder: (context, ref, child) => SignInButton(
              Buttons.Google,
              onPressed: () => ref.read(googleAuthProvider)(),
            ),
          ),
        ],
      ),
    );
  }
}
