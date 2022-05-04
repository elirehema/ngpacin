// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_member_page.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GroupMemberPage> _$groupMemberPageSerializer =
    new _$GroupMemberPageSerializer();

class _$GroupMemberPageSerializer
    implements StructuredSerializer<GroupMemberPage> {
  @override
  final Iterable<Type> types = const [GroupMemberPage, _$GroupMemberPage];
  @override
  final String wireName = 'GroupMemberPage';

  @override
  Iterable<Object?> serialize(Serializers serializers, GroupMemberPage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'members',
      serializers.serialize(object.members,
          specifiedType:
              const FullType(BuiltList, const [const FullType(GroupMember)])),
    ];
    Object? value;
    value = object.haveNextPage;
    if (value != null) {
      result
        ..add('nextPage')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GroupMemberPage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GroupMemberPageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'nextPage':
          result.haveNextPage = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'members':
          result.members.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GroupMember)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GroupMemberPage extends GroupMemberPage {
  @override
  final bool? haveNextPage;
  @override
  final BuiltList<GroupMember> members;

  factory _$GroupMemberPage([void Function(GroupMemberPageBuilder)? updates]) =>
      (new GroupMemberPageBuilder()..update(updates)).build();

  _$GroupMemberPage._({this.haveNextPage, required this.members}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        members, 'GroupMemberPage', 'members');
  }

  @override
  GroupMemberPage rebuild(void Function(GroupMemberPageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GroupMemberPageBuilder toBuilder() =>
      new GroupMemberPageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GroupMemberPage &&
        haveNextPage == other.haveNextPage &&
        members == other.members;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, haveNextPage.hashCode), members.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GroupMemberPage')
          ..add('haveNextPage', haveNextPage)
          ..add('members', members))
        .toString();
  }
}

class GroupMemberPageBuilder
    implements Builder<GroupMemberPage, GroupMemberPageBuilder> {
  _$GroupMemberPage? _$v;

  bool? _haveNextPage;
  bool? get haveNextPage => _$this._haveNextPage;
  set haveNextPage(bool? haveNextPage) => _$this._haveNextPage = haveNextPage;

  ListBuilder<GroupMember>? _members;
  ListBuilder<GroupMember> get members =>
      _$this._members ??= new ListBuilder<GroupMember>();
  set members(ListBuilder<GroupMember>? members) => _$this._members = members;

  GroupMemberPageBuilder();

  GroupMemberPageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _haveNextPage = $v.haveNextPage;
      _members = $v.members.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GroupMemberPage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GroupMemberPage;
  }

  @override
  void update(void Function(GroupMemberPageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GroupMemberPage build() {
    _$GroupMemberPage _$result;
    try {
      _$result = _$v ??
          new _$GroupMemberPage._(
              haveNextPage: haveNextPage, members: members.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'members';
        members.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GroupMemberPage', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
