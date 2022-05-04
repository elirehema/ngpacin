// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saving_account.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SavingAccount> _$savingAccountSerializer =
    new _$SavingAccountSerializer();

class _$SavingAccountSerializer implements StructuredSerializer<SavingAccount> {
  @override
  final Iterable<Type> types = const [SavingAccount, _$SavingAccount];
  @override
  final String wireName = 'SavingAccount';

  @override
  Iterable<Object?> serialize(Serializers serializers, SavingAccount object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.account;
    if (value != null) {
      result
        ..add('account')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.balance;
    if (value != null) {
      result
        ..add('balance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SavingAccount deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SavingAccountBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'account':
          result.account = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'balance':
          result.balance = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$SavingAccount extends SavingAccount {
  @override
  final String? account;
  @override
  final String? description;
  @override
  final String? balance;

  factory _$SavingAccount([void Function(SavingAccountBuilder)? updates]) =>
      (new SavingAccountBuilder()..update(updates)).build();

  _$SavingAccount._({this.account, this.description, this.balance}) : super._();

  @override
  SavingAccount rebuild(void Function(SavingAccountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SavingAccountBuilder toBuilder() => new SavingAccountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SavingAccount &&
        account == other.account &&
        description == other.description &&
        balance == other.balance;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, account.hashCode), description.hashCode), balance.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SavingAccount')
          ..add('account', account)
          ..add('description', description)
          ..add('balance', balance))
        .toString();
  }
}

class SavingAccountBuilder
    implements Builder<SavingAccount, SavingAccountBuilder> {
  _$SavingAccount? _$v;

  String? _account;
  String? get account => _$this._account;
  set account(String? account) => _$this._account = account;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _balance;
  String? get balance => _$this._balance;
  set balance(String? balance) => _$this._balance = balance;

  SavingAccountBuilder();

  SavingAccountBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _account = $v.account;
      _description = $v.description;
      _balance = $v.balance;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SavingAccount other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SavingAccount;
  }

  @override
  void update(void Function(SavingAccountBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SavingAccount build() {
    final _$result = _$v ??
        new _$SavingAccount._(
            account: account, description: description, balance: balance);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
