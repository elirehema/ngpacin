// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DataResponse> _$dataResponseSerializer =
    new _$DataResponseSerializer();

class _$DataResponseSerializer implements StructuredSerializer<DataResponse> {
  @override
  final Iterable<Type> types = const [DataResponse, _$DataResponse];
  @override
  final String wireName = 'DataResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, DataResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(int)),
      'statusDesc',
      serializers.serialize(object.statusDesc,
          specifiedType: const FullType(String)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(VerificationResponse)),
    ];

    return result;
  }

  @override
  DataResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DataResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'statusDesc':
          result.statusDesc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(VerificationResponse))!
              as VerificationResponse);
          break;
      }
    }

    return result.build();
  }
}

class _$DataResponse extends DataResponse {
  @override
  final int status;
  @override
  final String statusDesc;
  @override
  final VerificationResponse data;

  factory _$DataResponse([void Function(DataResponseBuilder)? updates]) =>
      (new DataResponseBuilder()..update(updates)).build();

  _$DataResponse._(
      {required this.status, required this.statusDesc, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, 'DataResponse', 'status');
    BuiltValueNullFieldError.checkNotNull(
        statusDesc, 'DataResponse', 'statusDesc');
    BuiltValueNullFieldError.checkNotNull(data, 'DataResponse', 'data');
  }

  @override
  DataResponse rebuild(void Function(DataResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DataResponseBuilder toBuilder() => new DataResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DataResponse &&
        status == other.status &&
        statusDesc == other.statusDesc &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, status.hashCode), statusDesc.hashCode), data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DataResponse')
          ..add('status', status)
          ..add('statusDesc', statusDesc)
          ..add('data', data))
        .toString();
  }
}

class DataResponseBuilder
    implements Builder<DataResponse, DataResponseBuilder> {
  _$DataResponse? _$v;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  String? _statusDesc;
  String? get statusDesc => _$this._statusDesc;
  set statusDesc(String? statusDesc) => _$this._statusDesc = statusDesc;

  VerificationResponseBuilder? _data;
  VerificationResponseBuilder get data =>
      _$this._data ??= new VerificationResponseBuilder();
  set data(VerificationResponseBuilder? data) => _$this._data = data;

  DataResponseBuilder();

  DataResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _statusDesc = $v.statusDesc;
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DataResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DataResponse;
  }

  @override
  void update(void Function(DataResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DataResponse build() {
    _$DataResponse _$result;
    try {
      _$result = _$v ??
          new _$DataResponse._(
              status: BuiltValueNullFieldError.checkNotNull(
                  status, 'DataResponse', 'status'),
              statusDesc: BuiltValueNullFieldError.checkNotNull(
                  statusDesc, 'DataResponse', 'statusDesc'),
              data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DataResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
