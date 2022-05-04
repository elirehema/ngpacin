import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'language_and_network.dart';

part 'token.g.dart';

abstract class Token implements Built<Token, TokenBuilder> {
  String? get username;
  String? get token;


  Token._();

  factory Token([updates(TokenBuilder b)]) = _$Token;
  factory Token.from(username, token) => new _$Token._(
      username: username,
      token: token
  );
  factory Token.resend(username) => new _$Token._(
      username: username
  );

  static Serializer<Token> get serializer => _$tokenSerializer;
}