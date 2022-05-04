import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'loan_response.g.dart';

abstract class LoanResponse implements Built<LoanResponse, LoanResponseBuilder> {
  String? get loanId;
  String? get groupId;
  String? get loanType;
  double? get loanBalance;
  @BuiltValueField(wireName: "loanAmount")
  double? get loanAmount;
  String? get groupName;

  LoanResponse._();

  factory LoanResponse([updates(LoanResponseBuilder b)]) = _$LoanResponse;
  static Serializer<LoanResponse> get serializer => _$loanResponseSerializer;
}