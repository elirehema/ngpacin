import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mobile/model/group_member.dart';
import 'package:built_collection/built_collection.dart';

part 'group_member_page.g.dart';
abstract class GroupMemberPage implements Built<GroupMemberPage, GroupMemberPageBuilder> {
  @BuiltValueField(wireName: 'nextPage')
  bool? get haveNextPage;
  BuiltList<GroupMember> get members;
  GroupMemberPage._();

  factory GroupMemberPage([updates(GroupMemberPageBuilder b)]) = _$GroupMemberPage;

  static Serializer<GroupMemberPage> get serializer => _$groupMemberPageSerializer;
}
