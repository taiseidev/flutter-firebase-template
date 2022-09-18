import 'package:flutter/material.dart';
import 'package:flutter_firebase_template/presentation/auth/sns/components/sns_auth_page_body.dart';

class SnsAuthPage extends StatelessWidget {
  const SnsAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SnsAuthPageBody(),
    );
  }
}
