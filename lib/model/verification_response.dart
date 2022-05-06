import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'verification_response.g.dart';

abstract class VerificationResponse  implements Built<VerificationResponse, VerificationResponseBuilder>  {
  String get payerName;
  int get amount;
  String get amountType;
  String get currency;
  String get paymentReference;
  String get paymentType;
  String get paymentDesc;
  String get  payerID;
  VerificationResponse._();
  factory VerificationResponse([updates(VerificationResponseBuilder b)]) = _$VerificationResponse;
  static Serializer<VerificationResponse> get serializer => _$verificationResponseSerializer;



}