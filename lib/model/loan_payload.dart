import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mobile/model/index.dart';

part 'loan_payload.g.dart';

abstract class LoanPayload implements Built<LoanPayload, LoanPayloadBuilder> {

  String? get groupId;
  String? get bParty;
  int? get amount;
  String? get paymentType;
  String? get loanType;
  String? get forOthers;
  String? get loanId;

  LoanPayload._();

  factory LoanPayload([updates(LoanPayloadBuilder b)]) = _$LoanPayload;
  factory LoanPayload.from(groupId, bParty, amount, paymentType, loanType, {forOthers}) => new _$LoanPayload._(
    groupId:  groupId,
    bParty: bParty,
    amount: amount,
    paymentType: paymentType,
    loanType:loanType,
    forOthers: forOthers
  );

  factory LoanPayload.withId(groupId, bParty, amount, paymentType, loanType, loanId,forOthers) => new _$LoanPayload._(
    groupId:  groupId,
    bParty: bParty,
    amount: amount,
    paymentType: paymentType,
    loanType:loanType,
    loanId: loanId,
    forOthers: forOthers

  );

  static Serializer<LoanPayload> get serializer => _$loanPayloadSerializer;
}