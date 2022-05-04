// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_member.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MemberPost> _$memberPostSerializer = new _$MemberPostSerializer();

class _$MemberPostSerializer implements StructuredSerializer<MemberPost> {
  @override
  final Iterable<Type> types = const [MemberPost, _$MemberPost];
  @override
  final String wireName = 'MemberPost';

  @override
  Iterable<Object?> serialize(Serializers serializers, MemberPost object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'role',
      serializers.serialize(object.role, specifiedType: const FullType(String)),
      'bParty',
      serializers.serialize(object.bParty,
          specifiedType: const FullType(String)),
      'network',
      serializers.serialize(object.network,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  MemberPost deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MemberPostBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'role':
          result.role = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bParty':
          result.bParty = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'network':
          result.network = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$MemberPost extends MemberPost {
  @override
  final String role;
  @override
  final String bParty;
  @override
  final String network;

  factory _$MemberPost([void Function(MemberPostBuilder)? updates]) =>
      (new MemberPostBuilder()..update(updates)).build();

  _$MemberPost._(
      {required this.role, required this.bParty, required this.network})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(role, 'MemberPost', 'role');
    BuiltValueNullFieldError.checkNotNull(bParty, 'MemberPost', 'bParty');
    BuiltValueNullFieldError.checkNotNull(network, 'MemberPost', 'network');
  }

  @override
  MemberPost rebuild(void Function(MemberPostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MemberPostBuilder toBuilder() => new MemberPostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MemberPost &&
        role == other.role &&
        bParty == other.bParty &&
        network == other.network;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, role.hashCode), bParty.hashCode), network.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MemberPost')
          ..add('role', role)
          ..add('bParty', bParty)
          ..add('network', network))
        .toString();
  }
}

class MemberPostBuilder implements Builder<MemberPost, MemberPostBuilder> {
  _$MemberPost? _$v;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  String? _bParty;
  String? get bParty => _$this._bParty;
  set bParty(String? bParty) => _$this._bParty = bParty;

  String? _network;
  String? get network => _$this._network;
  set network(String? network) => _$this._network = network;

  MemberPostBuilder();

  MemberPostBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _role = $v.role;
      _bParty = $v.bParty;
      _network = $v.network;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MemberPost other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MemberPost;
  }

  @override
  void update(void Function(MemberPostBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MemberPost build() {
    final _$result = _$v ??
        new _$MemberPost._(
            role: BuiltValueNullFieldError.checkNotNull(
                role, 'MemberPost', 'role'),
            bParty: BuiltValueNullFieldError.checkNotNull(
                bParty, 'MemberPost', 'bParty'),
            network: BuiltValueNullFieldError.checkNotNull(
                network, 'MemberPost', 'network'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
