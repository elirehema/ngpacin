// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saving_payload.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SavingPayload> _$savingPayloadSerializer =
    new _$SavingPayloadSerializer();

class _$SavingPayloadSerializer implements StructuredSerializer<SavingPayload> {
  @override
  final Iterable<Type> types = const [SavingPayload, _$SavingPayload];
  @override
  final String wireName = 'SavingPayload';

  @override
  Iterable<Object?> serialize(Serializers serializers, SavingPayload object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.savingAccount;
    if (value != null) {
      result
        ..add('savingAccount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.savingFrequency;
    if (value != null) {
      result
        ..add('savingFrequency')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.savingPeriod;
    if (value != null) {
      result
        ..add('savingPeriod')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SavingPayload deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SavingPayloadBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'savingAccount':
          result.savingAccount = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'savingFrequency':
          result.savingFrequency = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'savingPeriod':
          result.savingPeriod = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$SavingPayload extends SavingPayload {
  @override
  final String? savingAccount;
  @override
  final int? amount;
  @override
  final String? savingFrequency;
  @override
  final String? savingPeriod;

  factory _$SavingPayload([void Function(SavingPayloadBuilder)? updates]) =>
      (new SavingPayloadBuilder()..update(updates)).build();

  _$SavingPayload._(
      {this.savingAccount,
      this.amount,
      this.savingFrequency,
      this.savingPeriod})
      : super._();

  @override
  SavingPayload rebuild(void Function(SavingPayloadBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SavingPayloadBuilder toBuilder() => new SavingPayloadBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SavingPayload &&
        savingAccount == other.savingAccount &&
        amount == other.amount &&
        savingFrequency == other.savingFrequency &&
        savingPeriod == other.savingPeriod;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, savingAccount.hashCode), amount.hashCode),
            savingFrequency.hashCode),
        savingPeriod.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SavingPayload')
          ..add('savingAccount', savingAccount)
          ..add('amount', amount)
          ..add('savingFrequency', savingFrequency)
          ..add('savingPeriod', savingPeriod))
        .toString();
  }
}

class SavingPayloadBuilder
    implements Builder<SavingPayload, SavingPayloadBuilder> {
  _$SavingPayload? _$v;

  String? _savingAccount;
  String? get savingAccount => _$this._savingAccount;
  set savingAccount(String? savingAccount) =>
      _$this._savingAccount = savingAccount;

  int? _amount;
  int? get amount => _$this._amount;
  set amount(int? amount) => _$this._amount = amount;

  String? _savingFrequency;
  String? get savingFrequency => _$this._savingFrequency;
  set savingFrequency(String? savingFrequency) =>
      _$this._savingFrequency = savingFrequency;

  String? _savingPeriod;
  String? get savingPeriod => _$this._savingPeriod;
  set savingPeriod(String? savingPeriod) => _$this._savingPeriod = savingPeriod;

  SavingPayloadBuilder();

  SavingPayloadBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _savingAccount = $v.savingAccount;
      _amount = $v.amount;
      _savingFrequency = $v.savingFrequency;
      _savingPeriod = $v.savingPeriod;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SavingPayload other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SavingPayload;
  }

  @override
  void update(void Function(SavingPayloadBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SavingPayload build() {
    final _$result = _$v ??
        new _$SavingPayload._(
            savingAccount: savingAccount,
            amount: amount,
            savingFrequency: savingFrequency,
            savingPeriod: savingPeriod);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
