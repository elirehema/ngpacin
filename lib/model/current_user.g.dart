// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CurrentUser> _$currentUserSerializer = new _$CurrentUserSerializer();

class _$CurrentUserSerializer implements StructuredSerializer<CurrentUser> {
  @override
  final Iterable<Type> types = const [CurrentUser, _$CurrentUser];
  @override
  final String wireName = 'CurrentUser';

  @override
  Iterable<Object?> serialize(Serializers serializers, CurrentUser object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.username;
    if (value != null) {
      result
        ..add('username')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.firstname;
    if (value != null) {
      result
        ..add('firstname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastname;
    if (value != null) {
      result
        ..add('lastname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
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
  CurrentUser deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CurrentUserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firstname':
          result.firstname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lastname':
          result.lastname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$CurrentUser extends CurrentUser {
  @override
  final String? email;
  @override
  final String? username;
  @override
  final String? firstname;
  @override
  final String? lastname;
  @override
  final String? network;
  @override
  final String? language;

  factory _$CurrentUser([void Function(CurrentUserBuilder)? updates]) =>
      (new CurrentUserBuilder()..update(updates)).build();

  _$CurrentUser._(
      {this.email,
      this.username,
      this.firstname,
      this.lastname,
      this.network,
      this.language})
      : super._();

  @override
  CurrentUser rebuild(void Function(CurrentUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CurrentUserBuilder toBuilder() => new CurrentUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CurrentUser &&
        email == other.email &&
        username == other.username &&
        firstname == other.firstname &&
        lastname == other.lastname &&
        network == other.network &&
        language == other.language;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, email.hashCode), username.hashCode),
                    firstname.hashCode),
                lastname.hashCode),
            network.hashCode),
        language.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CurrentUser')
          ..add('email', email)
          ..add('username', username)
          ..add('firstname', firstname)
          ..add('lastname', lastname)
          ..add('network', network)
          ..add('language', language))
        .toString();
  }
}

class CurrentUserBuilder implements Builder<CurrentUser, CurrentUserBuilder> {
  _$CurrentUser? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _firstname;
  String? get firstname => _$this._firstname;
  set firstname(String? firstname) => _$this._firstname = firstname;

  String? _lastname;
  String? get lastname => _$this._lastname;
  set lastname(String? lastname) => _$this._lastname = lastname;

  String? _network;
  String? get network => _$this._network;
  set network(String? network) => _$this._network = network;

  String? _language;
  String? get language => _$this._language;
  set language(String? language) => _$this._language = language;

  CurrentUserBuilder();

  CurrentUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _username = $v.username;
      _firstname = $v.firstname;
      _lastname = $v.lastname;
      _network = $v.network;
      _language = $v.language;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CurrentUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CurrentUser;
  }

  @override
  void update(void Function(CurrentUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CurrentUser build() {
    final _$result = _$v ??
        new _$CurrentUser._(
            email: email,
            username: username,
            firstname: firstname,
            lastname: lastname,
            network: network,
            language: language);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
