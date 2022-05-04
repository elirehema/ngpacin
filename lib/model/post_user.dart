import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'language_and_network.dart';

part 'post_user.g.dart';

abstract class UserPost extends Object with LanguageAndNetwork  implements Built<UserPost, UserPostBuilder> {
  String get username;
  String get firstname;
  String get lastname;
  String get email;
  String get password;
  String get repeatPassword;
  String get requestChannel;

  
  UserPost._();

  factory UserPost([updates(UserPostBuilder b)]) = _$UserPost;
  factory UserPost.from(username, firstname, lastname, email, password, repeatPassword, {language, network}) => new _$UserPost._(
    username: username,
    firstname: firstname,
    lastname: lastname,
    email: email,
    password: password,
    repeatPassword: repeatPassword,
    requestChannel: 'app',
    language: language,
    network: network
  );

  static Serializer<UserPost> get serializer => _$userPostSerializer;
}