// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_firebase_template/feature/auth/sns/google_auth.dart';
import 'package:flutter_firebase_template/presentation/auth/profile/profile_page.dart';
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
            onPressed: () async {
              await ref.read(googleAuthProvider)();
              await Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
