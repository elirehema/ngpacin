// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_approve.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotificationApprove> _$notificationApproveSerializer =
    new _$NotificationApproveSerializer();

class _$NotificationApproveSerializer
    implements StructuredSerializer<NotificationApprove> {
  @override
  final Iterable<Type> types = const [
    NotificationApprove,
    _$NotificationApprove
  ];
  @override
  final String wireName = 'NotificationApprove';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NotificationApprove object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'notificationId',
      serializers.serialize(object.notificationId,
          specifiedType: const FullType(String)),
      'groupId',
      serializers.serialize(object.groupId,
          specifiedType: const FullType(String)),
      'action',
      serializers.serialize(object.action,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  NotificationApprove deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotificationApproveBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'notificationId':
          result.notificationId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'groupId':
          result.groupId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'action':
          result.action = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationApprove extends NotificationApprove {
  @override
  final String notificationId;
  @override
  final String groupId;
  @override
  final String action;

  factory _$NotificationApprove(
          [void Function(NotificationApproveBuilder)? updates]) =>
      (new NotificationApproveBuilder()..update(updates)).build();

  _$NotificationApprove._(
      {required this.notificationId,
      required this.groupId,
      required this.action})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        notificationId, 'NotificationApprove', 'notificationId');
    BuiltValueNullFieldError.checkNotNull(
        groupId, 'NotificationApprove', 'groupId');
    BuiltValueNullFieldError.checkNotNull(
        action, 'NotificationApprove', 'action');
  }

  @override
  NotificationApprove rebuild(
          void Function(NotificationApproveBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationApproveBuilder toBuilder() =>
      new NotificationApproveBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationApprove &&
        notificationId == other.notificationId &&
        groupId == other.groupId &&
        action == other.action;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, notificationId.hashCode), groupId.hashCode),
        action.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NotificationApprove')
          ..add('notificationId', notificationId)
          ..add('groupId', groupId)
          ..add('action', action))
        .toString();
  }
}

class NotificationApproveBuilder
    implements Builder<NotificationApprove, NotificationApproveBuilder> {
  _$NotificationApprove? _$v;

  String? _notificationId;
  String? get notificationId => _$this._notificationId;
  set notificationId(String? notificationId) =>
      _$this._notificationId = notificationId;

  String? _groupId;
  String? get groupId => _$this._groupId;
  set groupId(String? groupId) => _$this._groupId = groupId;

  String? _action;
  String? get action => _$this._action;
  set action(String? action) => _$this._action = action;

  NotificationApproveBuilder();

  NotificationApproveBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _notificationId = $v.notificationId;
      _groupId = $v.groupId;
      _action = $v.action;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationApprove other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationApprove;
  }

  @override
  void update(void Function(NotificationApproveBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NotificationApprove build() {
    final _$result = _$v ??
        new _$NotificationApprove._(
            notificationId: BuiltValueNullFieldError.checkNotNull(
                notificationId, 'NotificationApprove', 'notificationId'),
            groupId: BuiltValueNullFieldError.checkNotNull(
                groupId, 'NotificationApprove', 'groupId'),
            action: BuiltValueNullFieldError.checkNotNull(
                action, 'NotificationApprove', 'action'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
