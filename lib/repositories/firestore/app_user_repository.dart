import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_template/models/app_user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/firestore_refs.dart';

final appUserRepositoryProvider =
    Provider.autoDispose((ref) => AppUserRepository(ref.read));

class AppUserRepository {
  AppUserRepository(this._read);
  Reader _read;

  // 現在のAppUser情報を取得
  Future<AppUser?> fetchAppUser({
    required String userId,
  }) async {
    final ds = await appUserRef(userId: userId).get();
    if (!ds.exists) {
      // ドキュメントが存在しない時のハンドリング
    }
    return ds.data();
  }

  Future<void> setAppUser({
    required String userId,
    required String name,
    String? mail,
    required int type,
    required String imageUrl,
  }) async {
    await appUserRef(userId: userId).set(
      AppUser(
        id: userId,
        name: name,
        mail: mail ?? '',
        imageUrl: imageUrl,
        type: type,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      SetOptions(merge: true),
    );
  }
}
