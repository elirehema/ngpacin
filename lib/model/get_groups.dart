
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mobile/model/serializers.dart';

part 'get_groups.g.dart';


abstract class Group implements Built<Group, GroupBuilder> {
   int get groupId;
   String get groupAcct;
   String get groupName;
   String get groupType;
   int get totalMembers;
   int get sharePrice;
   String get role;

  Group._();

  factory Group([updates(GroupBuilder b)]) = _$Group;

  static Serializer<Group> get serializer => _$groupSerializer;


   static Group? fromJson(Map<String, dynamic> json) {
     return serializers.deserializeWith(Group.serializer, json);
   }
}