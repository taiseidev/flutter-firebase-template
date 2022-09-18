import 'package:flutter/material.dart';
import 'package:flutter_firebase_template/presentation/auth/sns/sns_auth_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter-Firebase-Template',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SnsAuthPage(),
    );
  }
}
