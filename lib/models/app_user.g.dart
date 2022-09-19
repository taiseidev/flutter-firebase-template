// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => _$_AppUser(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      mail: json['mail'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      type: json['type'] as String?,
      createdAt: timestampConverter.fromJson(json['createdAt']),
      updatedAt: timestampConverter.fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mail': instance.mail,
      'imageUrl': instance.imageUrl,
      'type': instance.type,
      'createdAt': timestampConverter.toJson(instance.createdAt),
      'updatedAt': timestampConverter.toJson(instance.updatedAt),
    };
