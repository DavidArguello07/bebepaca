// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_user_model.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class AdminUserModel {
  String? uid;
  String? name;
  bool? active;
  bool? approved;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime? createdAt;
  AdminUserModel({
    this.uid,
    this.name,
    this.active,
    this.approved,
    this.createdAt,
  });

  factory AdminUserModel.fromJson(Map<String, dynamic> json) => _$AdminUserModelFromJson(json);
  Map<String, dynamic> toJson() => _$AdminUserModelToJson(this);

  static DateTime? _fromJson(Timestamp? i) =>
      DateTime.fromMillisecondsSinceEpoch((i != null) ? i.millisecondsSinceEpoch : 0);
  static Timestamp? _toJson(DateTime? time) => Timestamp.fromDate(time ?? DateTime.now());
}
