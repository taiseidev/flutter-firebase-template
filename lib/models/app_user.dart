// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter_firebase_template/utils/json_converters/timestamp.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    @Default('') String name,
    @Default('') String mail,
    @Default('') String imageUrl,
    String? type, // バックエンド側で作成
    @timestampConverter DateTime? createdAt,
    @timestampConverter DateTime? updatedAt,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
