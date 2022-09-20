import 'package:flutter/material.dart';
import 'package:flutter_firebase_template/feature/auth/auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SnsAuthPageSignOutButton extends StatelessWidget {
  const SnsAuthPageSignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => Column(
        children: [
          FloatingActionButton(
            onPressed: () => ref.read(signOutProvider)(),
          ),
          SizedBox(
            height: 8,
          ),
          FloatingActionButton(
            onPressed: () => ref.read(signOutProvider)(),
          ),
        ],
      ),
    );
  }
}
