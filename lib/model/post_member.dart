import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'language_and_network.dart';

part 'post_member.g.dart';

abstract class MemberPost  implements Built<MemberPost, MemberPostBuilder> {
  String get role;
  String get bParty;
  String get network;

  MemberPost._();

  factory MemberPost([updates(MemberPostBuilder b)]) = _$MemberPost;
  factory MemberPost.from( role, bParty, network) => new _$MemberPost._(
    role: role,
    bParty: bParty,
    network: network,
  );
  static Serializer<MemberPost> get serializer => _$memberPostSerializer;
}