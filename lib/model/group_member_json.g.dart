// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_member_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonGroupMember _$JsonGroupMemberFromJson(Map<String, dynamic> json) {
  return JsonGroupMember(
    json['firstName'] as String,
    json['familyName'] as String,
    json['msisdn'] as String,
    json['role'] as String,
    json['groupName'] as String,
  );
}

Map<String, dynamic> _$JsonGroupMemberToJson(JsonGroupMember instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'familyName': instance.familyName,
      'role': instance.role,
      'msisdn': instance.msisdn,
      'groupName': instance.groupName,
    };
