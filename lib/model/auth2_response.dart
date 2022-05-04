import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auth2_response.g.dart';

abstract class Auth2Response implements Built<Auth2Response, Auth2ResponseBuilder> {
   @BuiltValueField(wireName: 'access_token')
   String get accessToken;
   @BuiltValueField(wireName: 'token_type')
   String get tokenType;
   @BuiltValueField(wireName: "refresh_token")
   String get refreshToken;
   @BuiltValueField(wireName: "expires_in")
   int get expiresIn;
   String get  scope;


  Auth2Response._();
  factory Auth2Response([updates(Auth2ResponseBuilder b)]) = _$Auth2Response;

  static Serializer<Auth2Response> get serializer => _$auth2ResponseSerializer;
}