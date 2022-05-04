import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'notification_approve.g.dart';

abstract class NotificationApprove implements Built<NotificationApprove, NotificationApproveBuilder> {
  String get notificationId;
  String get groupId;
  String get action;


  NotificationApprove._();

  factory NotificationApprove([updates(NotificationApproveBuilder b)]) = _$NotificationApprove;
  factory NotificationApprove.approve(notificationId, groupId) => _$NotificationApprove._(
    notificationId: notificationId,
    groupId: groupId,
    action: 'APPROVED',
  );

  factory NotificationApprove.reject(notificationId, groupId) => _$NotificationApprove._(
    notificationId: notificationId,
    groupId: groupId,
    action: 'REJECTED',
  );

  static Serializer<NotificationApprove> get serializer => _$notificationApproveSerializer;
}