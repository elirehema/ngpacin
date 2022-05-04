import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'password.g.dart';
abstract class Password implements Built<Password, PasswordBuilder> {
  String? get currentPassword;
  String? get newPassword;
  String? get username;
  String? get token;
  String? get password;


  Password._();
  factory Password([updates(PasswordBuilder b)]) = _$Password;
  factory Password.from(currentPassword,  newPassword) => _$Password._(
    currentPassword: currentPassword,
    newPassword: newPassword
  );

  factory Password.forgotpassword(username) => _$Password._(
     username: username
  );
  factory Password.confirmforgotpassword(username,password, token ) => _$Password._(
      username: username,
      password: password,
      token: token

  );


  static Serializer<Password> get serializer => _$passwordSerializer;
}