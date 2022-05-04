// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_fees.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Fees> _$feesSerializer = new _$FeesSerializer();

class _$FeesSerializer implements StructuredSerializer<Fees> {
  @override
  final Iterable<Type> types = const [Fees, _$Fees];
  @override
  final String wireName = 'Fees';

  @override
  Iterable<Object?> serialize(Serializers serializers, Fees object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.serviceCode;
    if (value != null) {
      result
        ..add('serviceCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.charge;
    if (value != null) {
      result
        ..add('charge')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Fees deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FeesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'serviceCode':
          result.serviceCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'charge':
          result.charge = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Fees extends Fees {
  @override
  final String? serviceCode;
  @override
  final String? charge;

  factory _$Fees([void Function(FeesBuilder)? updates]) =>
      (new FeesBuilder()..update(updates)).build();

  _$Fees._({this.serviceCode, this.charge}) : super._();

  @override
  Fees rebuild(void Function(FeesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FeesBuilder toBuilder() => new FeesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Fees &&
        serviceCode == other.serviceCode &&
        charge == other.charge;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, serviceCode.hashCode), charge.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Fees')
          ..add('serviceCode', serviceCode)
          ..add('charge', charge))
        .toString();
  }
}

class FeesBuilder implements Builder<Fees, FeesBuilder> {
  _$Fees? _$v;

  String? _serviceCode;
  String? get serviceCode => _$this._serviceCode;
  set serviceCode(String? serviceCode) => _$this._serviceCode = serviceCode;

  String? _charge;
  String? get charge => _$this._charge;
  set charge(String? charge) => _$this._charge = charge;

  FeesBuilder();

  FeesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _serviceCode = $v.serviceCode;
      _charge = $v.charge;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Fees other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Fees;
  }

  @override
  void update(void Function(FeesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Fees build() {
    final _$result =
        _$v ?? new _$Fees._(serviceCode: serviceCode, charge: charge);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
