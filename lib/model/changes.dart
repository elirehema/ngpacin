import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'changes.g.dart';
abstract class Changes implements Built<Changes, ChangesBuilder> {
  String? get code;
  String? get description;

  Changes._();
  factory Changes([updates(ChangesBuilder b)]) = _$Changes;

  static Serializer<Changes> get serializer => _$changesSerializer;
}