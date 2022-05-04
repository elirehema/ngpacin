// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_group.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GroupPost> _$groupPostSerializer = new _$GroupPostSerializer();

class _$GroupPostSerializer implements StructuredSerializer<GroupPost> {
  @override
  final Iterable<Type> types = const [GroupPost, _$GroupPost];
  @override
  final String wireName = 'GroupPost';

  @override
  Iterable<Object?> serialize(Serializers serializers, GroupPost object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'groupName',
      serializers.serialize(object.groupName,
          specifiedType: const FullType(String)),
      'mobileNumber',
      serializers.serialize(object.mobileNumber,
          specifiedType: const FullType(String)),
      'amount',
      serializers.serialize(object.amount,
          specifiedType: const FullType(String)),
      'groupType',
      serializers.serialize(object.groupType,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GroupPost deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GroupPostBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'groupName':
          result.groupName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mobileNumber':
          result.mobileNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'groupType':
          result.groupType = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GroupPost extends GroupPost {
  @override
  final String groupName;
  @override
  final String mobileNumber;
  @override
  final String amount;
  @override
  final int groupType;

  factory _$GroupPost([void Function(GroupPostBuilder)? updates]) =>
      (new GroupPostBuilder()..update(updates)).build();

  _$GroupPost._(
      {required this.groupName,
      required this.mobileNumber,
      required this.amount,
      required this.groupType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(groupName, 'GroupPost', 'groupName');
    BuiltValueNullFieldError.checkNotNull(
        mobileNumber, 'GroupPost', 'mobileNumber');
    BuiltValueNullFieldError.checkNotNull(amount, 'GroupPost', 'amount');
    BuiltValueNullFieldError.checkNotNull(groupType, 'GroupPost', 'groupType');
  }

  @override
  GroupPost rebuild(void Function(GroupPostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GroupPostBuilder toBuilder() => new GroupPostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GroupPost &&
        groupName == other.groupName &&
        mobileNumber == other.mobileNumber &&
        amount == other.amount &&
        groupType == other.groupType;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, groupName.hashCode), mobileNumber.hashCode),
            amount.hashCode),
        groupType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GroupPost')
          ..add('groupName', groupName)
          ..add('mobileNumber', mobileNumber)
          ..add('amount', amount)
          ..add('groupType', groupType))
        .toString();
  }
}

class GroupPostBuilder implements Builder<GroupPost, GroupPostBuilder> {
  _$GroupPost? _$v;

  String? _groupName;
  String? get groupName => _$this._groupName;
  set groupName(String? groupName) => _$this._groupName = groupName;

  String? _mobileNumber;
  String? get mobileNumber => _$this._mobileNumber;
  set mobileNumber(String? mobileNumber) => _$this._mobileNumber = mobileNumber;

  String? _amount;
  String? get amount => _$this._amount;
  set amount(String? amount) => _$this._amount = amount;

  int? _groupType;
  int? get groupType => _$this._groupType;
  set groupType(int? groupType) => _$this._groupType = groupType;

  GroupPostBuilder();

  GroupPostBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _groupName = $v.groupName;
      _mobileNumber = $v.mobileNumber;
      _amount = $v.amount;
      _groupType = $v.groupType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GroupPost other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GroupPost;
  }

  @override
  void update(void Function(GroupPostBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GroupPost build() {
    final _$result = _$v ??
        new _$GroupPost._(
            groupName: BuiltValueNullFieldError.checkNotNull(
                groupName, 'GroupPost', 'groupName'),
            mobileNumber: BuiltValueNullFieldError.checkNotNull(
                mobileNumber, 'GroupPost', 'mobileNumber'),
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, 'GroupPost', 'amount'),
            groupType: BuiltValueNullFieldError.checkNotNull(
                groupType, 'GroupPost', 'groupType'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
