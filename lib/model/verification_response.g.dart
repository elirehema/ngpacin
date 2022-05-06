// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VerificationResponse> _$verificationResponseSerializer =
    new _$VerificationResponseSerializer();

class _$VerificationResponseSerializer
    implements StructuredSerializer<VerificationResponse> {
  @override
  final Iterable<Type> types = const [
    VerificationResponse,
    _$VerificationResponse
  ];
  @override
  final String wireName = 'VerificationResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, VerificationResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'payerName',
      serializers.serialize(object.payerName,
          specifiedType: const FullType(String)),
      'amount',
      serializers.serialize(object.amount, specifiedType: const FullType(int)),
      'amountType',
      serializers.serialize(object.amountType,
          specifiedType: const FullType(String)),
      'currency',
      serializers.serialize(object.currency,
          specifiedType: const FullType(String)),
      'paymentReference',
      serializers.serialize(object.paymentReference,
          specifiedType: const FullType(String)),
      'paymentType',
      serializers.serialize(object.paymentType,
          specifiedType: const FullType(String)),
      'paymentDesc',
      serializers.serialize(object.paymentDesc,
          specifiedType: const FullType(String)),
      'payerID',
      serializers.serialize(object.payerID,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  VerificationResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VerificationResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'payerName':
          result.payerName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'amountType':
          result.amountType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'currency':
          result.currency = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'paymentReference':
          result.paymentReference = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'paymentType':
          result.paymentType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'paymentDesc':
          result.paymentDesc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'payerID':
          result.payerID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$VerificationResponse extends VerificationResponse {
  @override
  final String payerName;
  @override
  final int amount;
  @override
  final String amountType;
  @override
  final String currency;
  @override
  final String paymentReference;
  @override
  final String paymentType;
  @override
  final String paymentDesc;
  @override
  final String payerID;

  factory _$VerificationResponse(
          [void Function(VerificationResponseBuilder)? updates]) =>
      (new VerificationResponseBuilder()..update(updates)).build();

  _$VerificationResponse._(
      {required this.payerName,
      required this.amount,
      required this.amountType,
      required this.currency,
      required this.paymentReference,
      required this.paymentType,
      required this.paymentDesc,
      required this.payerID})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        payerName, 'VerificationResponse', 'payerName');
    BuiltValueNullFieldError.checkNotNull(
        amount, 'VerificationResponse', 'amount');
    BuiltValueNullFieldError.checkNotNull(
        amountType, 'VerificationResponse', 'amountType');
    BuiltValueNullFieldError.checkNotNull(
        currency, 'VerificationResponse', 'currency');
    BuiltValueNullFieldError.checkNotNull(
        paymentReference, 'VerificationResponse', 'paymentReference');
    BuiltValueNullFieldError.checkNotNull(
        paymentType, 'VerificationResponse', 'paymentType');
    BuiltValueNullFieldError.checkNotNull(
        paymentDesc, 'VerificationResponse', 'paymentDesc');
    BuiltValueNullFieldError.checkNotNull(
        payerID, 'VerificationResponse', 'payerID');
  }

  @override
  VerificationResponse rebuild(
          void Function(VerificationResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VerificationResponseBuilder toBuilder() =>
      new VerificationResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VerificationResponse &&
        payerName == other.payerName &&
        amount == other.amount &&
        amountType == other.amountType &&
        currency == other.currency &&
        paymentReference == other.paymentReference &&
        paymentType == other.paymentType &&
        paymentDesc == other.paymentDesc &&
        payerID == other.payerID;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, payerName.hashCode), amount.hashCode),
                            amountType.hashCode),
                        currency.hashCode),
                    paymentReference.hashCode),
                paymentType.hashCode),
            paymentDesc.hashCode),
        payerID.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VerificationResponse')
          ..add('payerName', payerName)
          ..add('amount', amount)
          ..add('amountType', amountType)
          ..add('currency', currency)
          ..add('paymentReference', paymentReference)
          ..add('paymentType', paymentType)
          ..add('paymentDesc', paymentDesc)
          ..add('payerID', payerID))
        .toString();
  }
}

class VerificationResponseBuilder
    implements Builder<VerificationResponse, VerificationResponseBuilder> {
  _$VerificationResponse? _$v;

  String? _payerName;
  String? get payerName => _$this._payerName;
  set payerName(String? payerName) => _$this._payerName = payerName;

  int? _amount;
  int? get amount => _$this._amount;
  set amount(int? amount) => _$this._amount = amount;

  String? _amountType;
  String? get amountType => _$this._amountType;
  set amountType(String? amountType) => _$this._amountType = amountType;

  String? _currency;
  String? get currency => _$this._currency;
  set currency(String? currency) => _$this._currency = currency;

  String? _paymentReference;
  String? get paymentReference => _$this._paymentReference;
  set paymentReference(String? paymentReference) =>
      _$this._paymentReference = paymentReference;

  String? _paymentType;
  String? get paymentType => _$this._paymentType;
  set paymentType(String? paymentType) => _$this._paymentType = paymentType;

  String? _paymentDesc;
  String? get paymentDesc => _$this._paymentDesc;
  set paymentDesc(String? paymentDesc) => _$this._paymentDesc = paymentDesc;

  String? _payerID;
  String? get payerID => _$this._payerID;
  set payerID(String? payerID) => _$this._payerID = payerID;

  VerificationResponseBuilder();

  VerificationResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _payerName = $v.payerName;
      _amount = $v.amount;
      _amountType = $v.amountType;
      _currency = $v.currency;
      _paymentReference = $v.paymentReference;
      _paymentType = $v.paymentType;
      _paymentDesc = $v.paymentDesc;
      _payerID = $v.payerID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VerificationResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VerificationResponse;
  }

  @override
  void update(void Function(VerificationResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VerificationResponse build() {
    final _$result = _$v ??
        new _$VerificationResponse._(
            payerName: BuiltValueNullFieldError.checkNotNull(
                payerName, 'VerificationResponse', 'payerName'),
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, 'VerificationResponse', 'amount'),
            amountType: BuiltValueNullFieldError.checkNotNull(
                amountType, 'VerificationResponse', 'amountType'),
            currency: BuiltValueNullFieldError.checkNotNull(
                currency, 'VerificationResponse', 'currency'),
            paymentReference: BuiltValueNullFieldError.checkNotNull(
                paymentReference, 'VerificationResponse', 'paymentReference'),
            paymentType: BuiltValueNullFieldError.checkNotNull(
                paymentType, 'VerificationResponse', 'paymentType'),
            paymentDesc: BuiltValueNullFieldError.checkNotNull(
                paymentDesc, 'VerificationResponse', 'paymentDesc'),
            payerID: BuiltValueNullFieldError.checkNotNull(
                payerID, 'VerificationResponse', 'payerID'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
