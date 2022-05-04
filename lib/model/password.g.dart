// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Password> _$passwordSerializer = new _$PasswordSerializer();

class _$PasswordSerializer implements StructuredSerializer<Password> {
  @override
  final Iterable<Type> types = const [Password, _$Password];
  @override
  final String wireName = 'Password';

  @override
  Iterable<Object?> serialize(Serializers serializers, Password object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.currentPassword;
    if (value != null) {
      result
        ..add('currentPassword')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.newPassword;
    if (value != null) {
      result
        ..add('newPassword')
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
    value = object.token;
    if (value != null) {
      result
        ..add('token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Password deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PasswordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'currentPassword':
          result.currentPassword = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'newPassword':
          result.newPassword = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Password extends Password {
  @override
  final String? currentPassword;
  @override
  final String? newPassword;
  @override
  final String? username;
  @override
  final String? token;
  @override
  final String? password;

  factory _$Password([void Function(PasswordBuilder)? updates]) =>
      (new PasswordBuilder()..update(updates)).build();

  _$Password._(
      {this.currentPassword,
      this.newPassword,
      this.username,
      this.token,
      this.password})
      : super._();

  @override
  Password rebuild(void Function(PasswordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PasswordBuilder toBuilder() => new PasswordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Password &&
        currentPassword == other.currentPassword &&
        newPassword == other.newPassword &&
        username == other.username &&
        token == other.token &&
        password == other.password;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, currentPassword.hashCode), newPassword.hashCode),
                username.hashCode),
            token.hashCode),
        password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Password')
          ..add('currentPassword', currentPassword)
          ..add('newPassword', newPassword)
          ..add('username', username)
          ..add('token', token)
          ..add('password', password))
        .toString();
  }
}

class PasswordBuilder implements Builder<Password, PasswordBuilder> {
  _$Password? _$v;

  String? _currentPassword;
  String? get currentPassword => _$this._currentPassword;
  set currentPassword(String? currentPassword) =>
      _$this._currentPassword = currentPassword;

  String? _newPassword;
  String? get newPassword => _$this._newPassword;
  set newPassword(String? newPassword) => _$this._newPassword = newPassword;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  PasswordBuilder();

  PasswordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currentPassword = $v.currentPassword;
      _newPassword = $v.newPassword;
      _username = $v.username;
      _token = $v.token;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Password other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Password;
  }

  @override
  void update(void Function(PasswordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Password build() {
    final _$result = _$v ??
        new _$Password._(
            currentPassword: currentPassword,
            newPassword: newPassword,
            username: username,
            token: token,
            password: password);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
