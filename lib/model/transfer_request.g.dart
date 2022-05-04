// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TransferRequest> _$transferRequestSerializer =
    new _$TransferRequestSerializer();

class _$TransferRequestSerializer
    implements StructuredSerializer<TransferRequest> {
  @override
  final Iterable<Type> types = const [TransferRequest, _$TransferRequest];
  @override
  final String wireName = 'TransferRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, TransferRequest object,
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
    value = object.mobileNumber;
    if (value != null) {
      result
        ..add('mobileNumber')
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
    return result;
  }

  @override
  TransferRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TransferRequestBuilder();

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
        case 'mobileNumber':
          result.mobileNumber = serializers.deserialize(value,
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
      }
    }

    return result.build();
  }
}

class _$TransferRequest extends TransferRequest {
  @override
  final String? groupId;
  @override
  final String? mobileNumber;
  @override
  final String? bParty;
  @override
  final int? amount;
  @override
  final String? paymentType;
  @override
  final String? loanType;

  factory _$TransferRequest([void Function(TransferRequestBuilder)? updates]) =>
      (new TransferRequestBuilder()..update(updates)).build();

  _$TransferRequest._(
      {this.groupId,
      this.mobileNumber,
      this.bParty,
      this.amount,
      this.paymentType,
      this.loanType})
      : super._();

  @override
  TransferRequest rebuild(void Function(TransferRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransferRequestBuilder toBuilder() =>
      new TransferRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransferRequest &&
        groupId == other.groupId &&
        mobileNumber == other.mobileNumber &&
        bParty == other.bParty &&
        amount == other.amount &&
        paymentType == other.paymentType &&
        loanType == other.loanType;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, groupId.hashCode), mobileNumber.hashCode),
                    bParty.hashCode),
                amount.hashCode),
            paymentType.hashCode),
        loanType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TransferRequest')
          ..add('groupId', groupId)
          ..add('mobileNumber', mobileNumber)
          ..add('bParty', bParty)
          ..add('amount', amount)
          ..add('paymentType', paymentType)
          ..add('loanType', loanType))
        .toString();
  }
}

class TransferRequestBuilder
    implements Builder<TransferRequest, TransferRequestBuilder> {
  _$TransferRequest? _$v;

  String? _groupId;
  String? get groupId => _$this._groupId;
  set groupId(String? groupId) => _$this._groupId = groupId;

  String? _mobileNumber;
  String? get mobileNumber => _$this._mobileNumber;
  set mobileNumber(String? mobileNumber) => _$this._mobileNumber = mobileNumber;

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

  TransferRequestBuilder();

  TransferRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _groupId = $v.groupId;
      _mobileNumber = $v.mobileNumber;
      _bParty = $v.bParty;
      _amount = $v.amount;
      _paymentType = $v.paymentType;
      _loanType = $v.loanType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransferRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransferRequest;
  }

  @override
  void update(void Function(TransferRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TransferRequest build() {
    final _$result = _$v ??
        new _$TransferRequest._(
            groupId: groupId,
            mobileNumber: mobileNumber,
            bParty: bParty,
            amount: amount,
            paymentType: paymentType,
            loanType: loanType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
