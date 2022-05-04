// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ShareRequest> _$shareRequestSerializer =
    new _$ShareRequestSerializer();

class _$ShareRequestSerializer implements StructuredSerializer<ShareRequest> {
  @override
  final Iterable<Type> types = const [ShareRequest, _$ShareRequest];
  @override
  final String wireName = 'ShareRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, ShareRequest object,
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
    value = object.forOthers;
    if (value != null) {
      result
        ..add('forOthers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.network;
    if (value != null) {
      result
        ..add('network')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.language;
    if (value != null) {
      result
        ..add('language')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ShareRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ShareRequestBuilder();

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
        case 'forOthers':
          result.forOthers = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'network':
          result.network = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'language':
          result.language = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ShareRequest extends ShareRequest {
  @override
  final String? groupId;
  @override
  final String? mobileNumber;
  @override
  final String? bParty;
  @override
  final int? amount;
  @override
  final String? forOthers;
  @override
  final String? network;
  @override
  final String? language;

  factory _$ShareRequest([void Function(ShareRequestBuilder)? updates]) =>
      (new ShareRequestBuilder()..update(updates)).build();

  _$ShareRequest._(
      {this.groupId,
      this.mobileNumber,
      this.bParty,
      this.amount,
      this.forOthers,
      this.network,
      this.language})
      : super._();

  @override
  ShareRequest rebuild(void Function(ShareRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShareRequestBuilder toBuilder() => new ShareRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShareRequest &&
        groupId == other.groupId &&
        mobileNumber == other.mobileNumber &&
        bParty == other.bParty &&
        amount == other.amount &&
        forOthers == other.forOthers &&
        network == other.network &&
        language == other.language;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, groupId.hashCode), mobileNumber.hashCode),
                        bParty.hashCode),
                    amount.hashCode),
                forOthers.hashCode),
            network.hashCode),
        language.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ShareRequest')
          ..add('groupId', groupId)
          ..add('mobileNumber', mobileNumber)
          ..add('bParty', bParty)
          ..add('amount', amount)
          ..add('forOthers', forOthers)
          ..add('network', network)
          ..add('language', language))
        .toString();
  }
}

class ShareRequestBuilder
    implements Builder<ShareRequest, ShareRequestBuilder> {
  _$ShareRequest? _$v;

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

  String? _forOthers;
  String? get forOthers => _$this._forOthers;
  set forOthers(String? forOthers) => _$this._forOthers = forOthers;

  String? _network;
  String? get network => _$this._network;
  set network(String? network) => _$this._network = network;

  String? _language;
  String? get language => _$this._language;
  set language(String? language) => _$this._language = language;

  ShareRequestBuilder();

  ShareRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _groupId = $v.groupId;
      _mobileNumber = $v.mobileNumber;
      _bParty = $v.bParty;
      _amount = $v.amount;
      _forOthers = $v.forOthers;
      _network = $v.network;
      _language = $v.language;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShareRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShareRequest;
  }

  @override
  void update(void Function(ShareRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ShareRequest build() {
    final _$result = _$v ??
        new _$ShareRequest._(
            groupId: groupId,
            mobileNumber: mobileNumber,
            bParty: bParty,
            amount: amount,
            forOthers: forOthers,
            network: network,
            language: language);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
