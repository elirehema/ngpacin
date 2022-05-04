// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'administration.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Administration> _$administrationSerializer =
    new _$AdministrationSerializer();

class _$AdministrationSerializer
    implements StructuredSerializer<Administration> {
  @override
  final Iterable<Type> types = const [Administration, _$Administration];
  @override
  final String wireName = 'Administration';

  @override
  Iterable<Object?> serialize(Serializers serializers, Administration object,
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
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.loanInterestType;
    if (value != null) {
      result
        ..add('loanInterestType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.loanGuarantee;
    if (value != null) {
      result
        ..add('loanGuarantee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.loanFactor;
    if (value != null) {
      result
        ..add('loanFactor')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.approvalMode;
    if (value != null) {
      result
        ..add('approvalMode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.memberApprovers;
    if (value != null) {
      result
        ..add('memberApprovers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.guardianCode;
    if (value != null) {
      result
        ..add('guardianCode')
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
    value = object.bankName;
    if (value != null) {
      result
        ..add('bankName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bankAccount;
    if (value != null) {
      result
        ..add('bankAccount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.role;
    if (value != null) {
      result
        ..add('role')
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
    value = object.bParty;
    if (value != null) {
      result
        ..add('bParty')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Administration deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AdministrationBuilder();

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
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'loanInterestType':
          result.loanInterestType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'loanGuarantee':
          result.loanGuarantee = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'loanFactor':
          result.loanFactor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'approvalMode':
          result.approvalMode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'memberApprovers':
          result.memberApprovers = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'guardianCode':
          result.guardianCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'groupName':
          result.groupName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bankName':
          result.bankName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bankAccount':
          result.bankAccount = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'role':
          result.role = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'forOthers':
          result.forOthers = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bParty':
          result.bParty = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Administration extends Administration {
  @override
  final String? groupId;
  @override
  final int? amount;
  @override
  final String? loanInterestType;
  @override
  final String? loanGuarantee;
  @override
  final String? loanFactor;
  @override
  final String? approvalMode;
  @override
  final String? memberApprovers;
  @override
  final String? guardianCode;
  @override
  final String? groupName;
  @override
  final String? bankName;
  @override
  final String? bankAccount;
  @override
  final String? role;
  @override
  final String? forOthers;
  @override
  final String? bParty;

  factory _$Administration([void Function(AdministrationBuilder)? updates]) =>
      (new AdministrationBuilder()..update(updates)).build();

  _$Administration._(
      {this.groupId,
      this.amount,
      this.loanInterestType,
      this.loanGuarantee,
      this.loanFactor,
      this.approvalMode,
      this.memberApprovers,
      this.guardianCode,
      this.groupName,
      this.bankName,
      this.bankAccount,
      this.role,
      this.forOthers,
      this.bParty})
      : super._();

  @override
  Administration rebuild(void Function(AdministrationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdministrationBuilder toBuilder() =>
      new AdministrationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Administration &&
        groupId == other.groupId &&
        amount == other.amount &&
        loanInterestType == other.loanInterestType &&
        loanGuarantee == other.loanGuarantee &&
        loanFactor == other.loanFactor &&
        approvalMode == other.approvalMode &&
        memberApprovers == other.memberApprovers &&
        guardianCode == other.guardianCode &&
        groupName == other.groupName &&
        bankName == other.bankName &&
        bankAccount == other.bankAccount &&
        role == other.role &&
        forOthers == other.forOthers &&
        bParty == other.bParty;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(0,
                                                            groupId.hashCode),
                                                        amount.hashCode),
                                                    loanInterestType.hashCode),
                                                loanGuarantee.hashCode),
                                            loanFactor.hashCode),
                                        approvalMode.hashCode),
                                    memberApprovers.hashCode),
                                guardianCode.hashCode),
                            groupName.hashCode),
                        bankName.hashCode),
                    bankAccount.hashCode),
                role.hashCode),
            forOthers.hashCode),
        bParty.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Administration')
          ..add('groupId', groupId)
          ..add('amount', amount)
          ..add('loanInterestType', loanInterestType)
          ..add('loanGuarantee', loanGuarantee)
          ..add('loanFactor', loanFactor)
          ..add('approvalMode', approvalMode)
          ..add('memberApprovers', memberApprovers)
          ..add('guardianCode', guardianCode)
          ..add('groupName', groupName)
          ..add('bankName', bankName)
          ..add('bankAccount', bankAccount)
          ..add('role', role)
          ..add('forOthers', forOthers)
          ..add('bParty', bParty))
        .toString();
  }
}

class AdministrationBuilder
    implements Builder<Administration, AdministrationBuilder> {
  _$Administration? _$v;

  String? _groupId;
  String? get groupId => _$this._groupId;
  set groupId(String? groupId) => _$this._groupId = groupId;

  int? _amount;
  int? get amount => _$this._amount;
  set amount(int? amount) => _$this._amount = amount;

  String? _loanInterestType;
  String? get loanInterestType => _$this._loanInterestType;
  set loanInterestType(String? loanInterestType) =>
      _$this._loanInterestType = loanInterestType;

  String? _loanGuarantee;
  String? get loanGuarantee => _$this._loanGuarantee;
  set loanGuarantee(String? loanGuarantee) =>
      _$this._loanGuarantee = loanGuarantee;

  String? _loanFactor;
  String? get loanFactor => _$this._loanFactor;
  set loanFactor(String? loanFactor) => _$this._loanFactor = loanFactor;

  String? _approvalMode;
  String? get approvalMode => _$this._approvalMode;
  set approvalMode(String? approvalMode) => _$this._approvalMode = approvalMode;

  String? _memberApprovers;
  String? get memberApprovers => _$this._memberApprovers;
  set memberApprovers(String? memberApprovers) =>
      _$this._memberApprovers = memberApprovers;

  String? _guardianCode;
  String? get guardianCode => _$this._guardianCode;
  set guardianCode(String? guardianCode) => _$this._guardianCode = guardianCode;

  String? _groupName;
  String? get groupName => _$this._groupName;
  set groupName(String? groupName) => _$this._groupName = groupName;

  String? _bankName;
  String? get bankName => _$this._bankName;
  set bankName(String? bankName) => _$this._bankName = bankName;

  String? _bankAccount;
  String? get bankAccount => _$this._bankAccount;
  set bankAccount(String? bankAccount) => _$this._bankAccount = bankAccount;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  String? _forOthers;
  String? get forOthers => _$this._forOthers;
  set forOthers(String? forOthers) => _$this._forOthers = forOthers;

  String? _bParty;
  String? get bParty => _$this._bParty;
  set bParty(String? bParty) => _$this._bParty = bParty;

  AdministrationBuilder();

  AdministrationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _groupId = $v.groupId;
      _amount = $v.amount;
      _loanInterestType = $v.loanInterestType;
      _loanGuarantee = $v.loanGuarantee;
      _loanFactor = $v.loanFactor;
      _approvalMode = $v.approvalMode;
      _memberApprovers = $v.memberApprovers;
      _guardianCode = $v.guardianCode;
      _groupName = $v.groupName;
      _bankName = $v.bankName;
      _bankAccount = $v.bankAccount;
      _role = $v.role;
      _forOthers = $v.forOthers;
      _bParty = $v.bParty;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Administration other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Administration;
  }

  @override
  void update(void Function(AdministrationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Administration build() {
    final _$result = _$v ??
        new _$Administration._(
            groupId: groupId,
            amount: amount,
            loanInterestType: loanInterestType,
            loanGuarantee: loanGuarantee,
            loanFactor: loanFactor,
            approvalMode: approvalMode,
            memberApprovers: memberApprovers,
            guardianCode: guardianCode,
            groupName: groupName,
            bankName: bankName,
            bankAccount: bankAccount,
            role: role,
            forOthers: forOthers,
            bParty: bParty);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
