// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VerificationPayload> _$verificationPayloadSerializer =
    new _$VerificationPayloadSerializer();

class _$VerificationPayloadSerializer
    implements StructuredSerializer<VerificationPayload> {
  @override
  final Iterable<Type> types = const [
    VerificationPayload,
    _$VerificationPayload
  ];
  @override
  final String wireName = 'VerificationPayload';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, VerificationPayload object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.paymentReference;
    if (value != null) {
      result
        ..add('paymentReference')
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
    value = object.checksum;
    if (value != null) {
      result
        ..add('checksum')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.institutionID;
    if (value != null) {
      result
        ..add('institutionID')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  VerificationPayload deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VerificationPayloadBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'paymentReference':
          result.paymentReference = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'checksum':
          result.checksum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'institutionID':
          result.institutionID = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$VerificationPayload extends VerificationPayload {
  @override
  final String? paymentReference;
  @override
  final String? token;
  @override
  final String? checksum;
  @override
  final int? institutionID;

  factory _$VerificationPayload(
          [void Function(VerificationPayloadBuilder)? updates]) =>
      (new VerificationPayloadBuilder()..update(updates)).build();

  _$VerificationPayload._(
      {this.paymentReference, this.token, this.checksum, this.institutionID})
      : super._();

  @override
  VerificationPayload rebuild(
          void Function(VerificationPayloadBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VerificationPayloadBuilder toBuilder() =>
      new VerificationPayloadBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VerificationPayload &&
        paymentReference == other.paymentReference &&
        token == other.token &&
        checksum == other.checksum &&
        institutionID == other.institutionID;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, paymentReference.hashCode), token.hashCode),
            checksum.hashCode),
        institutionID.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VerificationPayload')
          ..add('paymentReference', paymentReference)
          ..add('token', token)
          ..add('checksum', checksum)
          ..add('institutionID', institutionID))
        .toString();
  }
}

class VerificationPayloadBuilder
    implements Builder<VerificationPayload, VerificationPayloadBuilder> {
  _$VerificationPayload? _$v;

  String? _paymentReference;
  String? get paymentReference => _$this._paymentReference;
  set paymentReference(String? paymentReference) =>
      _$this._paymentReference = paymentReference;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  String? _checksum;
  String? get checksum => _$this._checksum;
  set checksum(String? checksum) => _$this._checksum = checksum;

  int? _institutionID;
  int? get institutionID => _$this._institutionID;
  set institutionID(int? institutionID) =>
      _$this._institutionID = institutionID;

  VerificationPayloadBuilder();

  VerificationPayloadBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _paymentReference = $v.paymentReference;
      _token = $v.token;
      _checksum = $v.checksum;
      _institutionID = $v.institutionID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VerificationPayload other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VerificationPayload;
  }

  @override
  void update(void Function(VerificationPayloadBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VerificationPayload build() {
    final _$result = _$v ??
        new _$VerificationPayload._(
            paymentReference: paymentReference,
            token: token,
            checksum: checksum,
            institutionID: institutionID);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
