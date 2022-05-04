// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserPost> _$userPostSerializer = new _$UserPostSerializer();

class _$UserPostSerializer implements StructuredSerializer<UserPost> {
  @override
  final Iterable<Type> types = const [UserPost, _$UserPost];
  @override
  final String wireName = 'UserPost';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserPost object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'firstname',
      serializers.serialize(object.firstname,
          specifiedType: const FullType(String)),
      'lastname',
      serializers.serialize(object.lastname,
          specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(String)),
      'repeatPassword',
      serializers.serialize(object.repeatPassword,
          specifiedType: const FullType(String)),
      'requestChannel',
      serializers.serialize(object.requestChannel,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.network;
    if (value != null) {
      result
        ..add('network')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.language;
    if (value != null) {
      result
        ..add('language')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserPost deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserPostBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'firstname':
          result.firstname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastname':
          result.lastname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'repeatPassword':
          result.repeatPassword = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'requestChannel':
          result.requestChannel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'network':
          result.network = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'language':
          result.language = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$UserPost extends UserPost {
  @override
  final String username;
  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final String email;
  @override
  final String password;
  @override
  final String repeatPassword;
  @override
  final String requestChannel;
  @override
  final String? network;
  @override
  final String? language;

  factory _$UserPost([void Function(UserPostBuilder)? updates]) =>
      (new UserPostBuilder()..update(updates)).build();

  _$UserPost._(
      {required this.username,
      required this.firstname,
      required this.lastname,
      required this.email,
      required this.password,
      required this.repeatPassword,
      required this.requestChannel,
      this.network,
      this.language})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(username, 'UserPost', 'username');
    BuiltValueNullFieldError.checkNotNull(firstname, 'UserPost', 'firstname');
    BuiltValueNullFieldError.checkNotNull(lastname, 'UserPost', 'lastname');
    BuiltValueNullFieldError.checkNotNull(email, 'UserPost', 'email');
    BuiltValueNullFieldError.checkNotNull(password, 'UserPost', 'password');
    BuiltValueNullFieldError.checkNotNull(
        repeatPassword, 'UserPost', 'repeatPassword');
    BuiltValueNullFieldError.checkNotNull(
        requestChannel, 'UserPost', 'requestChannel');
  }

  @override
  UserPost rebuild(void Function(UserPostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserPostBuilder toBuilder() => new UserPostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserPost &&
        username == other.username &&
        firstname == other.firstname &&
        lastname == other.lastname &&
        email == other.email &&
        password == other.password &&
        repeatPassword == other.repeatPassword &&
        requestChannel == other.requestChannel &&
        network == other.network &&
        language == other.language;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc(0, username.hashCode),
                                    firstname.hashCode),
                                lastname.hashCode),
                            email.hashCode),
                        password.hashCode),
                    repeatPassword.hashCode),
                requestChannel.hashCode),
            network.hashCode),
        language.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserPost')
          ..add('username', username)
          ..add('firstname', firstname)
          ..add('lastname', lastname)
          ..add('email', email)
          ..add('password', password)
          ..add('repeatPassword', repeatPassword)
          ..add('requestChannel', requestChannel)
          ..add('network', network)
          ..add('language', language))
        .toString();
  }
}

class UserPostBuilder implements Builder<UserPost, UserPostBuilder> {
  _$UserPost? _$v;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _firstname;
  String? get firstname => _$this._firstname;
  set firstname(String? firstname) => _$this._firstname = firstname;

  String? _lastname;
  String? get lastname => _$this._lastname;
  set lastname(String? lastname) => _$this._lastname = lastname;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _repeatPassword;
  String? get repeatPassword => _$this._repeatPassword;
  set repeatPassword(String? repeatPassword) =>
      _$this._repeatPassword = repeatPassword;

  String? _requestChannel;
  String? get requestChannel => _$this._requestChannel;
  set requestChannel(String? requestChannel) =>
      _$this._requestChannel = requestChannel;

  String? _network;
  String? get network => _$this._network;
  set network(String? network) => _$this._network = network;

  String? _language;
  String? get language => _$this._language;
  set language(String? language) => _$this._language = language;

  UserPostBuilder();

  UserPostBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username;
      _firstname = $v.firstname;
      _lastname = $v.lastname;
      _email = $v.email;
      _password = $v.password;
      _repeatPassword = $v.repeatPassword;
      _requestChannel = $v.requestChannel;
      _network = $v.network;
      _language = $v.language;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserPost other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserPost;
  }

  @override
  void update(void Function(UserPostBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserPost build() {
    final _$result = _$v ??
        new _$UserPost._(
            username: BuiltValueNullFieldError.checkNotNull(
                username, 'UserPost', 'username'),
            firstname: BuiltValueNullFieldError.checkNotNull(
                firstname, 'UserPost', 'firstname'),
            lastname: BuiltValueNullFieldError.checkNotNull(
                lastname, 'UserPost', 'lastname'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, 'UserPost', 'email'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, 'UserPost', 'password'),
            repeatPassword: BuiltValueNullFieldError.checkNotNull(
                repeatPassword, 'UserPost', 'repeatPassword'),
            requestChannel: BuiltValueNullFieldError.checkNotNull(
                requestChannel, 'UserPost', 'requestChannel'),
            network: network,
            language: language);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
