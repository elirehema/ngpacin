// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_groups.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Group> _$groupSerializer = new _$GroupSerializer();

class _$GroupSerializer implements StructuredSerializer<Group> {
  @override
  final Iterable<Type> types = const [Group, _$Group];
  @override
  final String wireName = 'Group';

  @override
  Iterable<Object?> serialize(Serializers serializers, Group object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'groupId',
      serializers.serialize(object.groupId, specifiedType: const FullType(int)),
      'groupAcct',
      serializers.serialize(object.groupAcct,
          specifiedType: const FullType(String)),
      'groupName',
      serializers.serialize(object.groupName,
          specifiedType: const FullType(String)),
      'groupType',
      serializers.serialize(object.groupType,
          specifiedType: const FullType(String)),
      'totalMembers',
      serializers.serialize(object.totalMembers,
          specifiedType: const FullType(int)),
      'sharePrice',
      serializers.serialize(object.sharePrice,
          specifiedType: const FullType(int)),
      'role',
      serializers.serialize(object.role, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Group deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GroupBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'groupId':
          result.groupId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'groupAcct':
          result.groupAcct = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'groupName':
          result.groupName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'groupType':
          result.groupType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'totalMembers':
          result.totalMembers = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'sharePrice':
          result.sharePrice = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'role':
          result.role = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Group extends Group {
  @override
  final int groupId;
  @override
  final String groupAcct;
  @override
  final String groupName;
  @override
  final String groupType;
  @override
  final int totalMembers;
  @override
  final int sharePrice;
  @override
  final String role;

  factory _$Group([void Function(GroupBuilder)? updates]) =>
      (new GroupBuilder()..update(updates)).build();

  _$Group._(
      {required this.groupId,
      required this.groupAcct,
      required this.groupName,
      required this.groupType,
      required this.totalMembers,
      required this.sharePrice,
      required this.role})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(groupId, 'Group', 'groupId');
    BuiltValueNullFieldError.checkNotNull(groupAcct, 'Group', 'groupAcct');
    BuiltValueNullFieldError.checkNotNull(groupName, 'Group', 'groupName');
    BuiltValueNullFieldError.checkNotNull(groupType, 'Group', 'groupType');
    BuiltValueNullFieldError.checkNotNull(
        totalMembers, 'Group', 'totalMembers');
    BuiltValueNullFieldError.checkNotNull(sharePrice, 'Group', 'sharePrice');
    BuiltValueNullFieldError.checkNotNull(role, 'Group', 'role');
  }

  @override
  Group rebuild(void Function(GroupBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GroupBuilder toBuilder() => new GroupBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Group &&
        groupId == other.groupId &&
        groupAcct == other.groupAcct &&
        groupName == other.groupName &&
        groupType == other.groupType &&
        totalMembers == other.totalMembers &&
        sharePrice == other.sharePrice &&
        role == other.role;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, groupId.hashCode), groupAcct.hashCode),
                        groupName.hashCode),
                    groupType.hashCode),
                totalMembers.hashCode),
            sharePrice.hashCode),
        role.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Group')
          ..add('groupId', groupId)
          ..add('groupAcct', groupAcct)
          ..add('groupName', groupName)
          ..add('groupType', groupType)
          ..add('totalMembers', totalMembers)
          ..add('sharePrice', sharePrice)
          ..add('role', role))
        .toString();
  }
}

class GroupBuilder implements Builder<Group, GroupBuilder> {
  _$Group? _$v;

  int? _groupId;
  int? get groupId => _$this._groupId;
  set groupId(int? groupId) => _$this._groupId = groupId;

  String? _groupAcct;
  String? get groupAcct => _$this._groupAcct;
  set groupAcct(String? groupAcct) => _$this._groupAcct = groupAcct;

  String? _groupName;
  String? get groupName => _$this._groupName;
  set groupName(String? groupName) => _$this._groupName = groupName;

  String? _groupType;
  String? get groupType => _$this._groupType;
  set groupType(String? groupType) => _$this._groupType = groupType;

  int? _totalMembers;
  int? get totalMembers => _$this._totalMembers;
  set totalMembers(int? totalMembers) => _$this._totalMembers = totalMembers;

  int? _sharePrice;
  int? get sharePrice => _$this._sharePrice;
  set sharePrice(int? sharePrice) => _$this._sharePrice = sharePrice;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  GroupBuilder();

  GroupBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _groupId = $v.groupId;
      _groupAcct = $v.groupAcct;
      _groupName = $v.groupName;
      _groupType = $v.groupType;
      _totalMembers = $v.totalMembers;
      _sharePrice = $v.sharePrice;
      _role = $v.role;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Group other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Group;
  }

  @override
  void update(void Function(GroupBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Group build() {
    final _$result = _$v ??
        new _$Group._(
            groupId: BuiltValueNullFieldError.checkNotNull(
                groupId, 'Group', 'groupId'),
            groupAcct: BuiltValueNullFieldError.checkNotNull(
                groupAcct, 'Group', 'groupAcct'),
            groupName: BuiltValueNullFieldError.checkNotNull(
                groupName, 'Group', 'groupName'),
            groupType: BuiltValueNullFieldError.checkNotNull(
                groupType, 'Group', 'groupType'),
            totalMembers: BuiltValueNullFieldError.checkNotNull(
                totalMembers, 'Group', 'totalMembers'),
            sharePrice: BuiltValueNullFieldError.checkNotNull(
                sharePrice, 'Group', 'sharePrice'),
            role: BuiltValueNullFieldError.checkNotNull(role, 'Group', 'role'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
