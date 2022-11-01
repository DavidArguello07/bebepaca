// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminUserModel _$AdminUserModelFromJson(Map<String, dynamic> json) =>
    AdminUserModel(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      active: json['active'] as bool?,
      approved: json['approved'] as bool?,
      createdAt: AdminUserModel._fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$AdminUserModelToJson(AdminUserModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'active': instance.active,
      'approved': instance.approved,
      'createdAt': AdminUserModel._toJson(instance.createdAt),
    };
