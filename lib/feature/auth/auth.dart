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

// ログイン状態を監視
final authUserProvider = StreamProvider<User?>(
  (ref) => ref.watch(firebaseAuthProvider).userChanges(),
);

/// whenDataはAsyncValueを加工するために使用。
/// userIdを監視
final userIdProvider = Provider<AsyncValue<String?>>(
  (ref) => ref.watch(authUserProvider).whenData((value) => value?.uid),
);

// ログイン状態をチェック
final isSignedInProvider = Provider<AsyncValue<bool>>(
  (ref) => ref.watch(userIdProvider).whenData((value) => value != null),
);
