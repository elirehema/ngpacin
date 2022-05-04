import 'package:json_annotation/json_annotation.dart';

part 'group_member_json.g.dart';
@JsonSerializable()
class JsonGroupMember {
  final String  firstName;
  final String  familyName;
  final String  role;
  final String  msisdn;
  final String groupName;
  JsonGroupMember(this.firstName, this.familyName, this.msisdn, this.role, this.groupName);

  factory JsonGroupMember.fromJson(Map<String, dynamic> json) => _$JsonGroupMemberFromJson(json);
}