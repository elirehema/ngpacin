// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth2_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Auth2Response> _$auth2ResponseSerializer =
    new _$Auth2ResponseSerializer();

class _$Auth2ResponseSerializer implements StructuredSerializer<Auth2Response> {
  @override
  final Iterable<Type> types = const [Auth2Response, _$Auth2Response];
  @override
  final String wireName = 'Auth2Response';

  @override
  Iterable<Object?> serialize(Serializers serializers, Auth2Response object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'access_token',
      serializers.serialize(object.accessToken,
          specifiedType: const FullType(String)),
      'token_type',
      serializers.serialize(object.tokenType,
          specifiedType: const FullType(String)),
      'refresh_token',
      serializers.serialize(object.refreshToken,
          specifiedType: const FullType(String)),
      'expires_in',
      serializers.serialize(object.expiresIn,
          specifiedType: const FullType(int)),
      'scope',
      serializers.serialize(object.scope,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Auth2Response deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new Auth2ResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'access_token':
          result.accessToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'token_type':
          result.tokenType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'refresh_token':
          result.refreshToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'expires_in':
          result.expiresIn = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'scope':
          result.scope = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Auth2Response extends Auth2Response {
  @override
  final String accessToken;
  @override
  final String tokenType;
  @override
  final String refreshToken;
  @override
  final int expiresIn;
  @override
  final String scope;

  factory _$Auth2Response([void Function(Auth2ResponseBuilder)? updates]) =>
      (new Auth2ResponseBuilder()..update(updates)).build();

  _$Auth2Response._(
      {required this.accessToken,
      required this.tokenType,
      required this.refreshToken,
      required this.expiresIn,
      required this.scope})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        accessToken, 'Auth2Response', 'accessToken');
    BuiltValueNullFieldError.checkNotNull(
        tokenType, 'Auth2Response', 'tokenType');
    BuiltValueNullFieldError.checkNotNull(
        refreshToken, 'Auth2Response', 'refreshToken');
    BuiltValueNullFieldError.checkNotNull(
        expiresIn, 'Auth2Response', 'expiresIn');
    BuiltValueNullFieldError.checkNotNull(scope, 'Auth2Response', 'scope');
  }

  @override
  Auth2Response rebuild(void Function(Auth2ResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Auth2ResponseBuilder toBuilder() => new Auth2ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Auth2Response &&
        accessToken == other.accessToken &&
        tokenType == other.tokenType &&
        refreshToken == other.refreshToken &&
        expiresIn == other.expiresIn &&
        scope == other.scope;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, accessToken.hashCode), tokenType.hashCode),
                refreshToken.hashCode),
            expiresIn.hashCode),
        scope.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Auth2Response')
          ..add('accessToken', accessToken)
          ..add('tokenType', tokenType)
          ..add('refreshToken', refreshToken)
          ..add('expiresIn', expiresIn)
          ..add('scope', scope))
        .toString();
  }
}

class Auth2ResponseBuilder
    implements Builder<Auth2Response, Auth2ResponseBuilder> {
  _$Auth2Response? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _tokenType;
  String? get tokenType => _$this._tokenType;
  set tokenType(String? tokenType) => _$this._tokenType = tokenType;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  int? _expiresIn;
  int? get expiresIn => _$this._expiresIn;
  set expiresIn(int? expiresIn) => _$this._expiresIn = expiresIn;

  String? _scope;
  String? get scope => _$this._scope;
  set scope(String? scope) => _$this._scope = scope;

  Auth2ResponseBuilder();

  Auth2ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _tokenType = $v.tokenType;
      _refreshToken = $v.refreshToken;
      _expiresIn = $v.expiresIn;
      _scope = $v.scope;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Auth2Response other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Auth2Response;
  }

  @override
  void update(void Function(Auth2ResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Auth2Response build() {
    final _$result = _$v ??
        new _$Auth2Response._(
            accessToken: BuiltValueNullFieldError.checkNotNull(
                accessToken, 'Auth2Response', 'accessToken'),
            tokenType: BuiltValueNullFieldError.checkNotNull(
                tokenType, 'Auth2Response', 'tokenType'),
            refreshToken: BuiltValueNullFieldError.checkNotNull(
                refreshToken, 'Auth2Response', 'refreshToken'),
            expiresIn: BuiltValueNullFieldError.checkNotNull(
                expiresIn, 'Auth2Response', 'expiresIn'),
            scope: BuiltValueNullFieldError.checkNotNull(
                scope, 'Auth2Response', 'scope'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
