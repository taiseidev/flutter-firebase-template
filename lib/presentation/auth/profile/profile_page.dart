// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'components/profile_app_bar.dart';
import 'components/profile_image.dart';
import 'components/profile_name.dart';
import 'components/profile_numbers.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final sizedBoxH24 = const SizedBox(height: 24);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: const ProfileAppBar(),
        body: Stack(
          children: [
            ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const ProfileImage(),
                sizedBoxH24,
                const ProfileName(),
                sizedBoxH24,
                const ProfileNumbers(),
                sizedBoxH24,
              ],
            ),
          ],
        ));
  }
}
