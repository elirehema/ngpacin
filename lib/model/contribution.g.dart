// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contribution.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Contribution> _$contributionSerializer =
    new _$ContributionSerializer();

class _$ContributionSerializer implements StructuredSerializer<Contribution> {
  @override
  final Iterable<Type> types = const [Contribution, _$Contribution];
  @override
  final String wireName = 'Contribution';

  @override
  Iterable<Object?> serialize(Serializers serializers, Contribution object,
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
    return result;
  }

  @override
  Contribution deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContributionBuilder();

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
      }
    }

    return result.build();
  }
}

class _$Contribution extends Contribution {
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

  factory _$Contribution([void Function(ContributionBuilder)? updates]) =>
      (new ContributionBuilder()..update(updates)).build();

  _$Contribution._(
      {this.groupId,
      this.mobileNumber,
      this.bParty,
      this.amount,
      this.forOthers})
      : super._();

  @override
  Contribution rebuild(void Function(ContributionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContributionBuilder toBuilder() => new ContributionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Contribution &&
        groupId == other.groupId &&
        mobileNumber == other.mobileNumber &&
        bParty == other.bParty &&
        amount == other.amount &&
        forOthers == other.forOthers;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, groupId.hashCode), mobileNumber.hashCode),
                bParty.hashCode),
            amount.hashCode),
        forOthers.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Contribution')
          ..add('groupId', groupId)
          ..add('mobileNumber', mobileNumber)
          ..add('bParty', bParty)
          ..add('amount', amount)
          ..add('forOthers', forOthers))
        .toString();
  }
}

class ContributionBuilder
    implements Builder<Contribution, ContributionBuilder> {
  _$Contribution? _$v;

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

  ContributionBuilder();

  ContributionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _groupId = $v.groupId;
      _mobileNumber = $v.mobileNumber;
      _bParty = $v.bParty;
      _amount = $v.amount;
      _forOthers = $v.forOthers;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Contribution other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Contribution;
  }

  @override
  void update(void Function(ContributionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Contribution build() {
    final _$result = _$v ??
        new _$Contribution._(
            groupId: groupId,
            mobileNumber: mobileNumber,
            bParty: bParty,
            amount: amount,
            forOthers: forOthers);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
