// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_settings.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GroupSettings> _$groupSettingsSerializer =
    new _$GroupSettingsSerializer();

class _$GroupSettingsSerializer implements StructuredSerializer<GroupSettings> {
  @override
  final Iterable<Type> types = const [GroupSettings, _$GroupSettings];
  @override
  final String wireName = 'GroupSettings';

  @override
  Iterable<Object?> serialize(Serializers serializers, GroupSettings object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'sharePrice',
      serializers.serialize(object.sharePrice,
          specifiedType: const FullType(String)),
      'loanInterest',
      serializers.serialize(object.loanInterest,
          specifiedType: const FullType(String)),
      'interestType',
      serializers.serialize(object.interestType,
          specifiedType: const FullType(String)),
      'loanFactor',
      serializers.serialize(object.loanFactor,
          specifiedType: const FullType(String)),
      'approvalMode',
      serializers.serialize(object.approvalMode,
          specifiedType: const FullType(String)),
      'approvalMembers',
      serializers.serialize(object.approvalMembers,
          specifiedType: const FullType(String)),
      'creditBroadcast',
      serializers.serialize(object.creditBroadcast,
          specifiedType: const FullType(String)),
      'guaranteeMode',
      serializers.serialize(object.guaranteeMode,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GroupSettings deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GroupSettingsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'sharePrice':
          result.sharePrice = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'loanInterest':
          result.loanInterest = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'interestType':
          result.interestType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'loanFactor':
          result.loanFactor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'approvalMode':
          result.approvalMode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'approvalMembers':
          result.approvalMembers = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'creditBroadcast':
          result.creditBroadcast = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'guaranteeMode':
          result.guaranteeMode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GroupSettings extends GroupSettings {
  @override
  final String sharePrice;
  @override
  final String loanInterest;
  @override
  final String interestType;
  @override
  final String loanFactor;
  @override
  final String approvalMode;
  @override
  final String approvalMembers;
  @override
  final String creditBroadcast;
  @override
  final String guaranteeMode;

  factory _$GroupSettings([void Function(GroupSettingsBuilder)? updates]) =>
      (new GroupSettingsBuilder()..update(updates)).build();

  _$GroupSettings._(
      {required this.sharePrice,
      required this.loanInterest,
      required this.interestType,
      required this.loanFactor,
      required this.approvalMode,
      required this.approvalMembers,
      required this.creditBroadcast,
      required this.guaranteeMode})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        sharePrice, 'GroupSettings', 'sharePrice');
    BuiltValueNullFieldError.checkNotNull(
        loanInterest, 'GroupSettings', 'loanInterest');
    BuiltValueNullFieldError.checkNotNull(
        interestType, 'GroupSettings', 'interestType');
    BuiltValueNullFieldError.checkNotNull(
        loanFactor, 'GroupSettings', 'loanFactor');
    BuiltValueNullFieldError.checkNotNull(
        approvalMode, 'GroupSettings', 'approvalMode');
    BuiltValueNullFieldError.checkNotNull(
        approvalMembers, 'GroupSettings', 'approvalMembers');
    BuiltValueNullFieldError.checkNotNull(
        creditBroadcast, 'GroupSettings', 'creditBroadcast');
    BuiltValueNullFieldError.checkNotNull(
        guaranteeMode, 'GroupSettings', 'guaranteeMode');
  }

  @override
  GroupSettings rebuild(void Function(GroupSettingsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GroupSettingsBuilder toBuilder() => new GroupSettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GroupSettings &&
        sharePrice == other.sharePrice &&
        loanInterest == other.loanInterest &&
        interestType == other.interestType &&
        loanFactor == other.loanFactor &&
        approvalMode == other.approvalMode &&
        approvalMembers == other.approvalMembers &&
        creditBroadcast == other.creditBroadcast &&
        guaranteeMode == other.guaranteeMode;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc(0, sharePrice.hashCode),
                                loanInterest.hashCode),
                            interestType.hashCode),
                        loanFactor.hashCode),
                    approvalMode.hashCode),
                approvalMembers.hashCode),
            creditBroadcast.hashCode),
        guaranteeMode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GroupSettings')
          ..add('sharePrice', sharePrice)
          ..add('loanInterest', loanInterest)
          ..add('interestType', interestType)
          ..add('loanFactor', loanFactor)
          ..add('approvalMode', approvalMode)
          ..add('approvalMembers', approvalMembers)
          ..add('creditBroadcast', creditBroadcast)
          ..add('guaranteeMode', guaranteeMode))
        .toString();
  }
}

class GroupSettingsBuilder
    implements Builder<GroupSettings, GroupSettingsBuilder> {
  _$GroupSettings? _$v;

  String? _sharePrice;
  String? get sharePrice => _$this._sharePrice;
  set sharePrice(String? sharePrice) => _$this._sharePrice = sharePrice;

  String? _loanInterest;
  String? get loanInterest => _$this._loanInterest;
  set loanInterest(String? loanInterest) => _$this._loanInterest = loanInterest;

  String? _interestType;
  String? get interestType => _$this._interestType;
  set interestType(String? interestType) => _$this._interestType = interestType;

  String? _loanFactor;
  String? get loanFactor => _$this._loanFactor;
  set loanFactor(String? loanFactor) => _$this._loanFactor = loanFactor;

  String? _approvalMode;
  String? get approvalMode => _$this._approvalMode;
  set approvalMode(String? approvalMode) => _$this._approvalMode = approvalMode;

  String? _approvalMembers;
  String? get approvalMembers => _$this._approvalMembers;
  set approvalMembers(String? approvalMembers) =>
      _$this._approvalMembers = approvalMembers;

  String? _creditBroadcast;
  String? get creditBroadcast => _$this._creditBroadcast;
  set creditBroadcast(String? creditBroadcast) =>
      _$this._creditBroadcast = creditBroadcast;

  String? _guaranteeMode;
  String? get guaranteeMode => _$this._guaranteeMode;
  set guaranteeMode(String? guaranteeMode) =>
      _$this._guaranteeMode = guaranteeMode;

  GroupSettingsBuilder();

  GroupSettingsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sharePrice = $v.sharePrice;
      _loanInterest = $v.loanInterest;
      _interestType = $v.interestType;
      _loanFactor = $v.loanFactor;
      _approvalMode = $v.approvalMode;
      _approvalMembers = $v.approvalMembers;
      _creditBroadcast = $v.creditBroadcast;
      _guaranteeMode = $v.guaranteeMode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GroupSettings other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GroupSettings;
  }

  @override
  void update(void Function(GroupSettingsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GroupSettings build() {
    final _$result = _$v ??
        new _$GroupSettings._(
            sharePrice: BuiltValueNullFieldError.checkNotNull(
                sharePrice, 'GroupSettings', 'sharePrice'),
            loanInterest: BuiltValueNullFieldError.checkNotNull(
                loanInterest, 'GroupSettings', 'loanInterest'),
            interestType: BuiltValueNullFieldError.checkNotNull(
                interestType, 'GroupSettings', 'interestType'),
            loanFactor: BuiltValueNullFieldError.checkNotNull(
                loanFactor, 'GroupSettings', 'loanFactor'),
            approvalMode: BuiltValueNullFieldError.checkNotNull(
                approvalMode, 'GroupSettings', 'approvalMode'),
            approvalMembers: BuiltValueNullFieldError.checkNotNull(
                approvalMembers, 'GroupSettings', 'approvalMembers'),
            creditBroadcast: BuiltValueNullFieldError.checkNotNull(
                creditBroadcast, 'GroupSettings', 'creditBroadcast'),
            guaranteeMode: BuiltValueNullFieldError.checkNotNull(
                guaranteeMode, 'GroupSettings', 'guaranteeMode'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
