import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mobile/model/verification_response.dart';

part 'data_response.g.dart';

abstract class DataResponse  implements Built<DataResponse, DataResponseBuilder>  {
  int get status;
  String get statusDesc;
  VerificationResponse get data;
  DataResponse._();
  factory DataResponse([updates(DataResponseBuilder b)]) = _$DataResponse;
  static Serializer<DataResponse> get serializer => _$dataResponseSerializer;



}