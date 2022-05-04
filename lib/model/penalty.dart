import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'penalty.g.dart';
abstract class Penalty implements Built<Penalty, PenaltyBuilder> {
  String? get groupId;
  String? get groupName;
  String? get amount;
  String? get msisdn;

  Penalty._();
  factory Penalty([updates(PenaltyBuilder b)]) = _$Penalty;

  static Serializer<Penalty> get serializer => _$penaltySerializer;
}