import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_fees.g.dart';
abstract class Fees implements Built<Fees, FeesBuilder> {
  String? get serviceCode;
  String? get charge;

  Fees._();
  factory Fees([updates(FeesBuilder b)]) = _$Fees;

  static Serializer<Fees> get serializer => _$feesSerializer;
}