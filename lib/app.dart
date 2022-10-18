import 'package:flutter/material.dart';
import 'package:flutter_firebase_template/presentation/auth/sns/sns_auth_page.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SnsAuthPage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      debugShowCheckedModeBanner: false,
      title: 'Flutter-Firebase-Template',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
