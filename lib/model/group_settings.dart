import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'group_settings.g.dart';
abstract class GroupSettings implements Built<GroupSettings, GroupSettingsBuilder> {
  String get sharePrice;
  String get loanInterest;
  String get interestType;
  String get loanFactor;
  String get approvalMode;
  String get approvalMembers;
  String get creditBroadcast;
  String get guaranteeMode;

  GroupSettings._();
  factory GroupSettings([updates(GroupSettingsBuilder b)]) = _$GroupSettings;

  static Serializer<GroupSettings> get serializer => _$groupSettingsSerializer;
}