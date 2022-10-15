// ignore_for_file: avoid_implementing_value_types

import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSize {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const BackButton(),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Widget get child => const SizedBox.shrink();

  @override
  Size get preferredSize => const Size(double.infinity, 100);
}
