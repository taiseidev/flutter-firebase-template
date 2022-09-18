import 'package:flutter/material.dart';
import 'package:flutter_firebase_template/feature/auth/google_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GoogleAuthPageBody extends HookConsumerWidget {
  const GoogleAuthPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async => ref.read(googleAuthProvider)(),
            child: const Text('管理者'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('スタッフ'),
          ),
        ],
      ),
    );
  }
}
