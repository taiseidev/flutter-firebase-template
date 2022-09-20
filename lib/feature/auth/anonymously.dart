import 'package:flutter_firebase_template/feature/auth/auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../repositories/firestore/app_user_repository.dart';
import '../../utils/roggle.dart';

/// 匿名認証
final signInAnonymouslyProvider = Provider.autoDispose<Future<void> Function()>(
  (ref) => () async {
    try {
      final userCredential =
          await ref.watch(firebaseAuthProvider).signInAnonymously();
      final user = userCredential.user;
      if (user == null) {
        // userがnullの場合のハンドリング
      }
      await ref.watch(appUserRepositoryProvider).setAppUser(
            userId: user!.uid,
            name: '匿名',
            type: 1,
            imageUrl: '',
          );
    } on Exception catch (e) {
      roggle.wtf(e);
    }
  },
);
