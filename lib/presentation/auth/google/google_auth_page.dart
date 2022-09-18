import 'package:flutter/material.dart';
import 'package:flutter_firebase_template/presentation/auth/google/components/google_auth_page_body.dart';

class GoogleAuthPage extends StatelessWidget {
  const GoogleAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GoogleAuthPageBody(),
    );
  }
}
