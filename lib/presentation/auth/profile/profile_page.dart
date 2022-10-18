// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_template/models/app_user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'components/profile_app_bar.dart';
import 'components/profile_image.dart';
import 'components/profile_name.dart';
import 'components/profile_numbers.dart';

class ProfilePage extends ConsumerWidget {
  final sizedBoxH24 = const SizedBox(height: 24);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(userMetaDataProvider);
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
      ),
    );
  }
}

final userMetaDataProvider = FutureProvider.autoDispose<AppUser>((ref) async {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final snapshot =
      await FirebaseFirestore.instance.collection('users').doc(uid).get();
  return AppUser.fromDocumentSnapshot(snapshot);
});
