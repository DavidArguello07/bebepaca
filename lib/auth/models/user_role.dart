import 'package:json_annotation/json_annotation.dart';

enum UserRole {
  @JsonValue('superAdmin')
  superAdmin,
  @JsonValue('admin')
  admin,
  @JsonValue('none')
  none
}

String userRoleTraslate(UserRole role) {
  String traslate;

  switch (role) {
    case UserRole.superAdmin:
      traslate = 'Super Admin';
      break;
    case UserRole.admin:
      traslate = 'Admin';
      break;
    case UserRole.none:
      traslate = 'Ninguna';
      break;
  }
  return traslate;
}

String userRoleToString(Object o) => o.toString().split('.').last;
