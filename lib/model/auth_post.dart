import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auth_post.g.dart';

 abstract class AuthPost  implements Built<AuthPost, AuthPostBuilder>  {
  String? get username;
  String? get  password;
  AuthPost._();
  factory AuthPost([updates(AuthPostBuilder b)]) = _$AuthPost;
  factory AuthPost.from(username,  password) => _$AuthPost._(username: username, password:password);
  static Serializer<AuthPost> get serializer => _$authPostSerializer;



}
