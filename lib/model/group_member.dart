import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'group_member.g.dart';
abstract class GroupMember implements Built<GroupMember, GroupMemberBuilder> {
   String get firstName;
   String get familyName;
   String get role;
   String get  msisdn;
   String get groupName;
  GroupMember._();

   factory GroupMember([updates(GroupMemberBuilder b)]) = _$GroupMember;

   static Serializer<GroupMember> get serializer => _$groupMemberSerializer;
}
