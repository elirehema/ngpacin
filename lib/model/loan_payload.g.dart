// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_payload.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LoanPayload> _$loanPayloadSerializer = new _$LoanPayloadSerializer();

class _$LoanPayloadSerializer implements StructuredSerializer<LoanPayload> {
  @override
  final Iterable<Type> types = const [LoanPayload, _$LoanPayload];
  @override
  final String wireName = 'LoanPayload';

  @override
  Iterable<Object?> serialize(Serializers serializers, LoanPayload object,
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
    value = object.bParty;
    if (value != null) {
      result
        ..add('bParty')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.paymentType;
    if (value != null) {
      result
        ..add('paymentType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.loanType;
    if (value != null) {
      result
        ..add('loanType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.forOthers;
    if (value != null) {
      result
        ..add('forOthers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.loanId;
    if (value != null) {
      result
        ..add('loanId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  LoanPayload deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LoanPayloadBuilder();

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
        case 'bParty':
          result.bParty = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'paymentType':
          result.paymentType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'loanType':
          result.loanType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'forOthers':
          result.forOthers = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'loanId':
          result.loanId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$LoanPayload extends LoanPayload {
  @override
  final String? groupId;
  @override
  final String? bParty;
  @override
  final int? amount;
  @override
  final String? paymentType;
  @override
  final String? loanType;
  @override
  final String? forOthers;
  @override
  final String? loanId;

  factory _$LoanPayload([void Function(LoanPayloadBuilder)? updates]) =>
      (new LoanPayloadBuilder()..update(updates)).build();

  _$LoanPayload._(
      {this.groupId,
      this.bParty,
      this.amount,
      this.paymentType,
      this.loanType,
      this.forOthers,
      this.loanId})
      : super._();

  @override
  LoanPayload rebuild(void Function(LoanPayloadBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoanPayloadBuilder toBuilder() => new LoanPayloadBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoanPayload &&
        groupId == other.groupId &&
        bParty == other.bParty &&
        amount == other.amount &&
        paymentType == other.paymentType &&
        loanType == other.loanType &&
        forOthers == other.forOthers &&
        loanId == other.loanId;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, groupId.hashCode), bParty.hashCode),
                        amount.hashCode),
                    paymentType.hashCode),
                loanType.hashCode),
            forOthers.hashCode),
        loanId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoanPayload')
          ..add('groupId', groupId)
          ..add('bParty', bParty)
          ..add('amount', amount)
          ..add('paymentType', paymentType)
          ..add('loanType', loanType)
          ..add('forOthers', forOthers)
          ..add('loanId', loanId))
        .toString();
  }
}

class LoanPayloadBuilder implements Builder<LoanPayload, LoanPayloadBuilder> {
  _$LoanPayload? _$v;

  String? _groupId;
  String? get groupId => _$this._groupId;
  set groupId(String? groupId) => _$this._groupId = groupId;

  String? _bParty;
  String? get bParty => _$this._bParty;
  set bParty(String? bParty) => _$this._bParty = bParty;

  int? _amount;
  int? get amount => _$this._amount;
  set amount(int? amount) => _$this._amount = amount;

  String? _paymentType;
  String? get paymentType => _$this._paymentType;
  set paymentType(String? paymentType) => _$this._paymentType = paymentType;

  String? _loanType;
  String? get loanType => _$this._loanType;
  set loanType(String? loanType) => _$this._loanType = loanType;

  String? _forOthers;
  String? get forOthers => _$this._forOthers;
  set forOthers(String? forOthers) => _$this._forOthers = forOthers;

  String? _loanId;
  String? get loanId => _$this._loanId;
  set loanId(String? loanId) => _$this._loanId = loanId;

  LoanPayloadBuilder();

  LoanPayloadBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _groupId = $v.groupId;
      _bParty = $v.bParty;
      _amount = $v.amount;
      _paymentType = $v.paymentType;
      _loanType = $v.loanType;
      _forOthers = $v.forOthers;
      _loanId = $v.loanId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoanPayload other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoanPayload;
  }

  @override
  void update(void Function(LoanPayloadBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoanPayload build() {
    final _$result = _$v ??
        new _$LoanPayload._(
            groupId: groupId,
            bParty: bParty,
            amount: amount,
            paymentType: paymentType,
            loanType: loanType,
            forOthers: forOthers,
            loanId: loanId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
