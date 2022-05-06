import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'verification.g.dart';

abstract class VerificationPayload  implements Built<VerificationPayload, VerificationPayloadBuilder>  {
  String? get paymentReference;
  String? get  token;
  String? get checksum;
  int? get institutionID;
  VerificationPayload._();
  factory VerificationPayload([updates(VerificationPayloadBuilder b)]) = _$VerificationPayload;
  factory VerificationPayload.from(paymentReference) => _$VerificationPayload._(
      paymentReference: paymentReference,
      token: "463917799b220d99f68b84419570267eef6a34b181c47",
      checksum: "de809c4f9f3f05f20e2b6c5fc3312423ac32b783",
      institutionID: 8008,
  );
  static Serializer<VerificationPayload> get serializer => _$verificationPayloadSerializer;



}