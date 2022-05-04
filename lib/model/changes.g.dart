// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'changes.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Changes> _$changesSerializer = new _$ChangesSerializer();

class _$ChangesSerializer implements StructuredSerializer<Changes> {
  @override
  final Iterable<Type> types = const [Changes, _$Changes];
  @override
  final String wireName = 'Changes';

  @override
  Iterable<Object?> serialize(Serializers serializers, Changes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Changes deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChangesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Changes extends Changes {
  @override
  final String? code;
  @override
  final String? description;

  factory _$Changes([void Function(ChangesBuilder)? updates]) =>
      (new ChangesBuilder()..update(updates)).build();

  _$Changes._({this.code, this.description}) : super._();

  @override
  Changes rebuild(void Function(ChangesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangesBuilder toBuilder() => new ChangesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Changes &&
        code == other.code &&
        description == other.description;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, code.hashCode), description.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Changes')
          ..add('code', code)
          ..add('description', description))
        .toString();
  }
}

class ChangesBuilder implements Builder<Changes, ChangesBuilder> {
  _$Changes? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ChangesBuilder();

  ChangesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Changes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Changes;
  }

  @override
  void update(void Function(ChangesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Changes build() {
    final _$result =
        _$v ?? new _$Changes._(code: code, description: description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
