// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GroupsResponse> _$groupsResponseSerializer =
    new _$GroupsResponseSerializer();

class _$GroupsResponseSerializer
    implements StructuredSerializer<GroupsResponse> {
  @override
  final Iterable<Type> types = const [GroupsResponse, _$GroupsResponse];
  @override
  final String wireName = 'GroupsResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, GroupsResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(String)),
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
    ];

    return result;
  }

  @override
  GroupsResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GroupsResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
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
      }
    }

    return result.build();
  }
}

class _$GroupsResponse extends GroupsResponse {
  @override
  final String username;
  @override
  final String password;
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

  factory _$GroupsResponse([void Function(GroupsResponseBuilder)? updates]) =>
      (new GroupsResponseBuilder()..update(updates)).build();

  _$GroupsResponse._(
      {required this.username,
      required this.password,
      required this.groupId,
      required this.groupAcct,
      required this.groupName,
      required this.groupType,
      required this.totalMembers,
      required this.sharePrice})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        username, 'GroupsResponse', 'username');
    BuiltValueNullFieldError.checkNotNull(
        password, 'GroupsResponse', 'password');
    BuiltValueNullFieldError.checkNotNull(groupId, 'GroupsResponse', 'groupId');
    BuiltValueNullFieldError.checkNotNull(
        groupAcct, 'GroupsResponse', 'groupAcct');
    BuiltValueNullFieldError.checkNotNull(
        groupName, 'GroupsResponse', 'groupName');
    BuiltValueNullFieldError.checkNotNull(
        groupType, 'GroupsResponse', 'groupType');
    BuiltValueNullFieldError.checkNotNull(
        totalMembers, 'GroupsResponse', 'totalMembers');
    BuiltValueNullFieldError.checkNotNull(
        sharePrice, 'GroupsResponse', 'sharePrice');
  }

  @override
  GroupsResponse rebuild(void Function(GroupsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GroupsResponseBuilder toBuilder() =>
      new GroupsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GroupsResponse &&
        username == other.username &&
        password == other.password &&
        groupId == other.groupId &&
        groupAcct == other.groupAcct &&
        groupName == other.groupName &&
        groupType == other.groupType &&
        totalMembers == other.totalMembers &&
        sharePrice == other.sharePrice;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, username.hashCode), password.hashCode),
                            groupId.hashCode),
                        groupAcct.hashCode),
                    groupName.hashCode),
                groupType.hashCode),
            totalMembers.hashCode),
        sharePrice.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GroupsResponse')
          ..add('username', username)
          ..add('password', password)
          ..add('groupId', groupId)
          ..add('groupAcct', groupAcct)
          ..add('groupName', groupName)
          ..add('groupType', groupType)
          ..add('totalMembers', totalMembers)
          ..add('sharePrice', sharePrice))
        .toString();
  }
}

class GroupsResponseBuilder
    implements Builder<GroupsResponse, GroupsResponseBuilder> {
  _$GroupsResponse? _$v;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

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

  GroupsResponseBuilder();

  GroupsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username;
      _password = $v.password;
      _groupId = $v.groupId;
      _groupAcct = $v.groupAcct;
      _groupName = $v.groupName;
      _groupType = $v.groupType;
      _totalMembers = $v.totalMembers;
      _sharePrice = $v.sharePrice;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GroupsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GroupsResponse;
  }

  @override
  void update(void Function(GroupsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GroupsResponse build() {
    final _$result = _$v ??
        new _$GroupsResponse._(
            username: BuiltValueNullFieldError.checkNotNull(
                username, 'GroupsResponse', 'username'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, 'GroupsResponse', 'password'),
            groupId: BuiltValueNullFieldError.checkNotNull(
                groupId, 'GroupsResponse', 'groupId'),
            groupAcct: BuiltValueNullFieldError.checkNotNull(
                groupAcct, 'GroupsResponse', 'groupAcct'),
            groupName: BuiltValueNullFieldError.checkNotNull(
                groupName, 'GroupsResponse', 'groupName'),
            groupType: BuiltValueNullFieldError.checkNotNull(
                groupType, 'GroupsResponse', 'groupType'),
            totalMembers: BuiltValueNullFieldError.checkNotNull(
                totalMembers, 'GroupsResponse', 'totalMembers'),
            sharePrice: BuiltValueNullFieldError.checkNotNull(
                sharePrice, 'GroupsResponse', 'sharePrice'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
