import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (_) => throw UnimplementedError(),
);

final signOutProvider = Provider.autoDispose<Future<void> Function()>(
  (ref) => () async {
    try {
      await ref.watch(firebaseAuthProvider).signOut();
    } on Exception catch (_) {}
  },
);
