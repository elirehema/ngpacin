// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Notifications> _$notificationsSerializer =
    new _$NotificationsSerializer();

class _$NotificationsSerializer implements StructuredSerializer<Notifications> {
  @override
  final Iterable<Type> types = const [Notifications, _$Notifications];
  @override
  final String wireName = 'Notifications';

  @override
  Iterable<Object?> serialize(Serializers serializers, Notifications object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'requestId',
      serializers.serialize(object.requestId,
          specifiedType: const FullType(String)),
      'groupid',
      serializers.serialize(object.groupId,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'groupname',
      serializers.serialize(object.groupName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Notifications deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotificationsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'requestId':
          result.requestId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'groupid':
          result.groupId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'groupname':
          result.groupName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Notifications extends Notifications {
  @override
  final String requestId;
  @override
  final String groupId;
  @override
  final String description;
  @override
  final String groupName;

  factory _$Notifications([void Function(NotificationsBuilder)? updates]) =>
      (new NotificationsBuilder()..update(updates)).build();

  _$Notifications._(
      {required this.requestId,
      required this.groupId,
      required this.description,
      required this.groupName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        requestId, 'Notifications', 'requestId');
    BuiltValueNullFieldError.checkNotNull(groupId, 'Notifications', 'groupId');
    BuiltValueNullFieldError.checkNotNull(
        description, 'Notifications', 'description');
    BuiltValueNullFieldError.checkNotNull(
        groupName, 'Notifications', 'groupName');
  }

  @override
  Notifications rebuild(void Function(NotificationsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationsBuilder toBuilder() => new NotificationsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Notifications &&
        requestId == other.requestId &&
        groupId == other.groupId &&
        description == other.description &&
        groupName == other.groupName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, requestId.hashCode), groupId.hashCode),
            description.hashCode),
        groupName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Notifications')
          ..add('requestId', requestId)
          ..add('groupId', groupId)
          ..add('description', description)
          ..add('groupName', groupName))
        .toString();
  }
}

class NotificationsBuilder
    implements Builder<Notifications, NotificationsBuilder> {
  _$Notifications? _$v;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  String? _groupId;
  String? get groupId => _$this._groupId;
  set groupId(String? groupId) => _$this._groupId = groupId;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _groupName;
  String? get groupName => _$this._groupName;
  set groupName(String? groupName) => _$this._groupName = groupName;

  NotificationsBuilder();

  NotificationsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _requestId = $v.requestId;
      _groupId = $v.groupId;
      _description = $v.description;
      _groupName = $v.groupName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Notifications other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Notifications;
  }

  @override
  void update(void Function(NotificationsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Notifications build() {
    final _$result = _$v ??
        new _$Notifications._(
            requestId: BuiltValueNullFieldError.checkNotNull(
                requestId, 'Notifications', 'requestId'),
            groupId: BuiltValueNullFieldError.checkNotNull(
                groupId, 'Notifications', 'groupId'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, 'Notifications', 'description'),
            groupName: BuiltValueNullFieldError.checkNotNull(
                groupName, 'Notifications', 'groupName'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
