
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_group.g.dart';

abstract class GroupPost implements Built<GroupPost, GroupPostBuilder> {

  String  get groupName;
  String  get mobileNumber;
  String  get amount;
  int get groupType;

  GroupPost._();

  factory GroupPost([updates(GroupPostBuilder b)]) = _$GroupPost;
  factory GroupPost.from(groupName, mobileNumber, amount, groupType) => new _$GroupPost._(
    groupName: groupName,
    mobileNumber: mobileNumber,
    amount: amount,
    groupType: groupType,
  );


  static Serializer<GroupPost> get serializer => _$groupPostSerializer;
}