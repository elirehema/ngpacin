// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'office_resource.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OfficeResource> _$officeResourceSerializer =
    new _$OfficeResourceSerializer();

class _$OfficeResourceSerializer
    implements StructuredSerializer<OfficeResource> {
  @override
  final Iterable<Type> types = const [OfficeResource, _$OfficeResource];
  @override
  final String wireName = 'OfficeResource';

  @override
  Iterable<Object?> serialize(Serializers serializers, OfficeResource object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'officeId',
      serializers.serialize(object.officeId,
          specifiedType: const FullType(int)),
      'resourceId',
      serializers.serialize(object.resourceId,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  OfficeResource deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OfficeResourceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'officeId':
          result.officeId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'resourceId':
          result.resourceId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$OfficeResource extends OfficeResource {
  @override
  final int officeId;
  @override
  final int resourceId;

  factory _$OfficeResource([void Function(OfficeResourceBuilder)? updates]) =>
      (new OfficeResourceBuilder()..update(updates)).build();

  _$OfficeResource._({required this.officeId, required this.resourceId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        officeId, 'OfficeResource', 'officeId');
    BuiltValueNullFieldError.checkNotNull(
        resourceId, 'OfficeResource', 'resourceId');
  }

  @override
  OfficeResource rebuild(void Function(OfficeResourceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OfficeResourceBuilder toBuilder() =>
      new OfficeResourceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OfficeResource &&
        officeId == other.officeId &&
        resourceId == other.resourceId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, officeId.hashCode), resourceId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OfficeResource')
          ..add('officeId', officeId)
          ..add('resourceId', resourceId))
        .toString();
  }
}

class OfficeResourceBuilder
    implements Builder<OfficeResource, OfficeResourceBuilder> {
  _$OfficeResource? _$v;

  int? _officeId;
  int? get officeId => _$this._officeId;
  set officeId(int? officeId) => _$this._officeId = officeId;

  int? _resourceId;
  int? get resourceId => _$this._resourceId;
  set resourceId(int? resourceId) => _$this._resourceId = resourceId;

  OfficeResourceBuilder();

  OfficeResourceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _officeId = $v.officeId;
      _resourceId = $v.resourceId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OfficeResource other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OfficeResource;
  }

  @override
  void update(void Function(OfficeResourceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OfficeResource build() {
    final _$result = _$v ??
        new _$OfficeResource._(
            officeId: BuiltValueNullFieldError.checkNotNull(
                officeId, 'OfficeResource', 'officeId'),
            resourceId: BuiltValueNullFieldError.checkNotNull(
                resourceId, 'OfficeResource', 'resourceId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
