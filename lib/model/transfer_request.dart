import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'transfer_request.g.dart';

abstract class TransferRequest implements Built<TransferRequest, TransferRequestBuilder> {

  String? get groupId;
  String? get mobileNumber;
  String? get bParty;
  int? get amount;
  String? get paymentType;
  String? get loanType;

  TransferRequest._();

  factory TransferRequest([updates(TransferRequestBuilder b)]) = _$TransferRequest;
  factory TransferRequest.from(groupId, mobileNumber,bParty, amount, paymentType, loanType) => new _$TransferRequest._(
      groupId:  groupId,
      mobileNumber: mobileNumber,
      bParty: bParty,
      amount: amount,
      paymentType: paymentType,
      loanType:loanType,
  );

  static Serializer<TransferRequest> get serializer => _$transferRequestSerializer;
}