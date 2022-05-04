// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'penalty.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Penalty> _$penaltySerializer = new _$PenaltySerializer();

class _$PenaltySerializer implements StructuredSerializer<Penalty> {
  @override
  final Iterable<Type> types = const [Penalty, _$Penalty];
  @override
  final String wireName = 'Penalty';

  @override
  Iterable<Object?> serialize(Serializers serializers, Penalty object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.groupId;
    if (value != null) {
      result
        ..add('groupId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.groupName;
    if (value != null) {
      result
        ..add('groupName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
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
  Penalty deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PenaltyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'groupId':
          result.groupId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'groupName':
          result.groupName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
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

class _$Penalty extends Penalty {
  @override
  final String? groupId;
  @override
  final String? groupName;
  @override
  final String? amount;
  @override
  final String? msisdn;

  factory _$Penalty([void Function(PenaltyBuilder)? updates]) =>
      (new PenaltyBuilder()..update(updates)).build();

  _$Penalty._({this.groupId, this.groupName, this.amount, this.msisdn})
      : super._();

  @override
  Penalty rebuild(void Function(PenaltyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PenaltyBuilder toBuilder() => new PenaltyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Penalty &&
        groupId == other.groupId &&
        groupName == other.groupName &&
        amount == other.amount &&
        msisdn == other.msisdn;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, groupId.hashCode), groupName.hashCode), amount.hashCode),
        msisdn.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Penalty')
          ..add('groupId', groupId)
          ..add('groupName', groupName)
          ..add('amount', amount)
          ..add('msisdn', msisdn))
        .toString();
  }
}

class PenaltyBuilder implements Builder<Penalty, PenaltyBuilder> {
  _$Penalty? _$v;

  String? _groupId;
  String? get groupId => _$this._groupId;
  set groupId(String? groupId) => _$this._groupId = groupId;

  String? _groupName;
  String? get groupName => _$this._groupName;
  set groupName(String? groupName) => _$this._groupName = groupName;

  String? _amount;
  String? get amount => _$this._amount;
  set amount(String? amount) => _$this._amount = amount;

  String? _msisdn;
  String? get msisdn => _$this._msisdn;
  set msisdn(String? msisdn) => _$this._msisdn = msisdn;

  PenaltyBuilder();

  PenaltyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _groupId = $v.groupId;
      _groupName = $v.groupName;
      _amount = $v.amount;
      _msisdn = $v.msisdn;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Penalty other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Penalty;
  }

  @override
  void update(void Function(PenaltyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Penalty build() {
    final _$result = _$v ??
        new _$Penalty._(
            groupId: groupId,
            groupName: groupName,
            amount: amount,
            msisdn: msisdn);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
