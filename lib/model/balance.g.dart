// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Balance> _$balanceSerializer = new _$BalanceSerializer();

class _$BalanceSerializer implements StructuredSerializer<Balance> {
  @override
  final Iterable<Type> types = const [Balance, _$Balance];
  @override
  final String wireName = 'Balance';

  @override
  Iterable<Object?> serialize(Serializers serializers, Balance object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.balance;
    if (value != null) {
      result
        ..add('balance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.msisdn;
    if (value != null) {
      result
        ..add('msisdn')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Balance deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BalanceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'balance':
          result.balance = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'msisdn':
          result.msisdn = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Balance extends Balance {
  @override
  final String? balance;
  @override
  final String? msisdn;

  factory _$Balance([void Function(BalanceBuilder)? updates]) =>
      (new BalanceBuilder()..update(updates)).build();

  _$Balance._({this.balance, this.msisdn}) : super._();

  @override
  Balance rebuild(void Function(BalanceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BalanceBuilder toBuilder() => new BalanceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Balance &&
        balance == other.balance &&
        msisdn == other.msisdn;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, balance.hashCode), msisdn.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Balance')
          ..add('balance', balance)
          ..add('msisdn', msisdn))
        .toString();
  }
}

class BalanceBuilder implements Builder<Balance, BalanceBuilder> {
  _$Balance? _$v;

  String? _balance;
  String? get balance => _$this._balance;
  set balance(String? balance) => _$this._balance = balance;

  String? _msisdn;
  String? get msisdn => _$this._msisdn;
  set msisdn(String? msisdn) => _$this._msisdn = msisdn;

  BalanceBuilder();

  BalanceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _balance = $v.balance;
      _msisdn = $v.msisdn;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Balance other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Balance;
  }

  @override
  void update(void Function(BalanceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Balance build() {
    final _$result = _$v ?? new _$Balance._(balance: balance, msisdn: msisdn);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
