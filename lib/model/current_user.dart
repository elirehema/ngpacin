import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'language_and_network.dart';

part 'current_user.g.dart';
abstract class CurrentUser extends Object with LanguageAndNetwork implements Built<CurrentUser, CurrentUserBuilder> {
   String? get email;
   String? get username;
   String? get firstname;
   String? get lastname;

  CurrentUser._();
  factory CurrentUser([updates(CurrentUserBuilder b)]) = _$CurrentUser;

  static Serializer<CurrentUser> get serializer => _$currentUserSerializer;
}