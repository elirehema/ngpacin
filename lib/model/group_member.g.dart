// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_member.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GroupMember> _$groupMemberSerializer = new _$GroupMemberSerializer();

class _$GroupMemberSerializer implements StructuredSerializer<GroupMember> {
  @override
  final Iterable<Type> types = const [GroupMember, _$GroupMember];
  @override
  final String wireName = 'GroupMember';

  @override
  Iterable<Object?> serialize(Serializers serializers, GroupMember object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firstName',
      serializers.serialize(object.firstName,
          specifiedType: const FullType(String)),
      'familyName',
      serializers.serialize(object.familyName,
          specifiedType: const FullType(String)),
      'role',
      serializers.serialize(object.role, specifiedType: const FullType(String)),
      'msisdn',
      serializers.serialize(object.msisdn,
          specifiedType: const FullType(String)),
      'groupName',
      serializers.serialize(object.groupName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GroupMember deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GroupMemberBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'familyName':
          result.familyName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'role':
          result.role = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'msisdn':
          result.msisdn = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'groupName':
          result.groupName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GroupMember extends GroupMember {
  @override
  final String firstName;
  @override
  final String familyName;
  @override
  final String role;
  @override
  final String msisdn;
  @override
  final String groupName;

  factory _$GroupMember([void Function(GroupMemberBuilder)? updates]) =>
      (new GroupMemberBuilder()..update(updates)).build();

  _$GroupMember._(
      {required this.firstName,
      required this.familyName,
      required this.role,
      required this.msisdn,
      required this.groupName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firstName, 'GroupMember', 'firstName');
    BuiltValueNullFieldError.checkNotNull(
        familyName, 'GroupMember', 'familyName');
    BuiltValueNullFieldError.checkNotNull(role, 'GroupMember', 'role');
    BuiltValueNullFieldError.checkNotNull(msisdn, 'GroupMember', 'msisdn');
    BuiltValueNullFieldError.checkNotNull(
        groupName, 'GroupMember', 'groupName');
  }

  @override
  GroupMember rebuild(void Function(GroupMemberBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GroupMemberBuilder toBuilder() => new GroupMemberBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GroupMember &&
        firstName == other.firstName &&
        familyName == other.familyName &&
        role == other.role &&
        msisdn == other.msisdn &&
        groupName == other.groupName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, firstName.hashCode), familyName.hashCode),
                role.hashCode),
            msisdn.hashCode),
        groupName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GroupMember')
          ..add('firstName', firstName)
          ..add('familyName', familyName)
          ..add('role', role)
          ..add('msisdn', msisdn)
          ..add('groupName', groupName))
        .toString();
  }
}

class GroupMemberBuilder implements Builder<GroupMember, GroupMemberBuilder> {
  _$GroupMember? _$v;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _familyName;
  String? get familyName => _$this._familyName;
  set familyName(String? familyName) => _$this._familyName = familyName;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  String? _msisdn;
  String? get msisdn => _$this._msisdn;
  set msisdn(String? msisdn) => _$this._msisdn = msisdn;

  String? _groupName;
  String? get groupName => _$this._groupName;
  set groupName(String? groupName) => _$this._groupName = groupName;

  GroupMemberBuilder();

  GroupMemberBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _firstName = $v.firstName;
      _familyName = $v.familyName;
      _role = $v.role;
      _msisdn = $v.msisdn;
      _groupName = $v.groupName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GroupMember other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GroupMember;
  }

  @override
  void update(void Function(GroupMemberBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GroupMember build() {
    final _$result = _$v ??
        new _$GroupMember._(
            firstName: BuiltValueNullFieldError.checkNotNull(
                firstName, 'GroupMember', 'firstName'),
            familyName: BuiltValueNullFieldError.checkNotNull(
                familyName, 'GroupMember', 'familyName'),
            role: BuiltValueNullFieldError.checkNotNull(
                role, 'GroupMember', 'role'),
            msisdn: BuiltValueNullFieldError.checkNotNull(
                msisdn, 'GroupMember', 'msisdn'),
            groupName: BuiltValueNullFieldError.checkNotNull(
                groupName, 'GroupMember', 'groupName'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
