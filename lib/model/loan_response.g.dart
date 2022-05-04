// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LoanResponse> _$loanResponseSerializer =
    new _$LoanResponseSerializer();

class _$LoanResponseSerializer implements StructuredSerializer<LoanResponse> {
  @override
  final Iterable<Type> types = const [LoanResponse, _$LoanResponse];
  @override
  final String wireName = 'LoanResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, LoanResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.loanId;
    if (value != null) {
      result
        ..add('loanId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.groupId;
    if (value != null) {
      result
        ..add('groupId')
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
    value = object.loanBalance;
    if (value != null) {
      result
        ..add('loanBalance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.loanAmount;
    if (value != null) {
      result
        ..add('loanAmount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.groupName;
    if (value != null) {
      result
        ..add('groupName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  LoanResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LoanResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'loanId':
          result.loanId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'groupId':
          result.groupId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'loanType':
          result.loanType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'loanBalance':
          result.loanBalance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'loanAmount':
          result.loanAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'groupName':
          result.groupName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$LoanResponse extends LoanResponse {
  @override
  final String? loanId;
  @override
  final String? groupId;
  @override
  final String? loanType;
  @override
  final double? loanBalance;
  @override
  final double? loanAmount;
  @override
  final String? groupName;

  factory _$LoanResponse([void Function(LoanResponseBuilder)? updates]) =>
      (new LoanResponseBuilder()..update(updates)).build();

  _$LoanResponse._(
      {this.loanId,
      this.groupId,
      this.loanType,
      this.loanBalance,
      this.loanAmount,
      this.groupName})
      : super._();

  @override
  LoanResponse rebuild(void Function(LoanResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoanResponseBuilder toBuilder() => new LoanResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoanResponse &&
        loanId == other.loanId &&
        groupId == other.groupId &&
        loanType == other.loanType &&
        loanBalance == other.loanBalance &&
        loanAmount == other.loanAmount &&
        groupName == other.groupName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, loanId.hashCode), groupId.hashCode),
                    loanType.hashCode),
                loanBalance.hashCode),
            loanAmount.hashCode),
        groupName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoanResponse')
          ..add('loanId', loanId)
          ..add('groupId', groupId)
          ..add('loanType', loanType)
          ..add('loanBalance', loanBalance)
          ..add('loanAmount', loanAmount)
          ..add('groupName', groupName))
        .toString();
  }
}

class LoanResponseBuilder
    implements Builder<LoanResponse, LoanResponseBuilder> {
  _$LoanResponse? _$v;

  String? _loanId;
  String? get loanId => _$this._loanId;
  set loanId(String? loanId) => _$this._loanId = loanId;

  String? _groupId;
  String? get groupId => _$this._groupId;
  set groupId(String? groupId) => _$this._groupId = groupId;

  String? _loanType;
  String? get loanType => _$this._loanType;
  set loanType(String? loanType) => _$this._loanType = loanType;

  double? _loanBalance;
  double? get loanBalance => _$this._loanBalance;
  set loanBalance(double? loanBalance) => _$this._loanBalance = loanBalance;

  double? _loanAmount;
  double? get loanAmount => _$this._loanAmount;
  set loanAmount(double? loanAmount) => _$this._loanAmount = loanAmount;

  String? _groupName;
  String? get groupName => _$this._groupName;
  set groupName(String? groupName) => _$this._groupName = groupName;

  LoanResponseBuilder();

  LoanResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _loanId = $v.loanId;
      _groupId = $v.groupId;
      _loanType = $v.loanType;
      _loanBalance = $v.loanBalance;
      _loanAmount = $v.loanAmount;
      _groupName = $v.groupName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoanResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoanResponse;
  }

  @override
  void update(void Function(LoanResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoanResponse build() {
    final _$result = _$v ??
        new _$LoanResponse._(
            loanId: loanId,
            groupId: groupId,
            loanType: loanType,
            loanBalance: loanBalance,
            loanAmount: loanAmount,
            groupName: groupName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
