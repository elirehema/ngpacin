import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'language_and_network.dart';
part 'user_profile.g.dart';
abstract class UserProfile extends Object with LanguageAndNetwork implements Built<UserProfile, UserProfileBuilder> {
  String? get email;

  UserProfile._();
  factory UserProfile([updates(UserProfileBuilder b)]) = _$UserProfile;
  factory UserProfile.from( language) => new _$UserProfile._(
    language: language
  );

  static Serializer<UserProfile> get serializer => _$userProfileSerializer;
}