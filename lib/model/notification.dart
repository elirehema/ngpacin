import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'notification.g.dart';
abstract class Notifications implements Built<Notifications, NotificationsBuilder> {
   String get requestId;
  @BuiltValueField(wireName: "groupid")
   String get groupId;
   String get description;
   @BuiltValueField(wireName: 'groupname')
   String get groupName;
  Notifications._();
  factory Notifications([updates(NotificationsBuilder b)]) = _$Notifications;

  static Serializer<Notifications> get serializer => _$notificationsSerializer;
}