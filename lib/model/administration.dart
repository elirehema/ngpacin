import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'administration.g.dart';
abstract class Administration implements Built<Administration, AdministrationBuilder> {

  String? get groupId;
  int? get amount;
  String? get loanInterestType;
  String? get loanGuarantee;
  String? get loanFactor;
  String? get approvalMode;
  String? get memberApprovers;
  String? get guardianCode;
  String? get groupName;
  String? get bankName;
  String? get bankAccount;
  String? get role;
  String? get forOthers;
  String? get bParty;



  Administration._();
  factory Administration([updates(AdministrationBuilder b)]) = _$Administration;

  ///For setting loan interest
  factory Administration.sharePrice(String groupId, int amount) => _$Administration._(
      groupId: groupId, amount: amount);

  ///For setting loan interest
  factory Administration.loanInterest(String groupId, int amount, String loanInterestType) => _$Administration._(
    groupId: groupId, amount: amount, loanInterestType: loanInterestType);

  ///For setting group loan guarantee mode
  factory Administration.setLoanGuaranteeMode(String groupId,  String  loanGuarantee) => _$Administration._(
      groupId: groupId, loanGuarantee: loanGuarantee );

  ///For setting group loan factor
  factory Administration.loanFactor(String groupId,  String  loanFactor) => _$Administration._(
      groupId: groupId, loanFactor:loanFactor );

  ///For setting group approval mode
  factory Administration.setApprovalMode(String groupId,  String  approvalMode, String memberApprovers) => _$Administration._(
      groupId: groupId, approvalMode: approvalMode, memberApprovers: memberApprovers);

  ///Set group Guardian
  factory Administration.setGuardianCode(String groupId,  String guardianCode) => _$Administration._(
      groupId: groupId, guardianCode: guardianCode);

  ///Set Group name
  factory Administration.setGroupName(String groupId,  String groupName) => _$Administration._(
      groupId: groupId, groupName: groupName);

  ///Set bank account
  factory Administration.setBankAccount(String groupId,String? bankName, String?  bankAccount,) => _$Administration._(
      groupId: groupId, bankAccount: bankAccount, bankName: bankName);

  ///Change group leader
  factory Administration.changeGroupLeader(String groupId,String? role, String?  forOthers, String? bParty) => _$Administration._(
      groupId: groupId, role:role, forOthers: forOthers, bParty: bParty);

  ///Set group guarantor
  factory Administration.setGroupGuarantor(String groupId, String? bParty) => _$Administration._(
      groupId: groupId,  bParty: bParty);

  ///Remove member
  factory Administration.removeMember(String groupId, String? bParty) => _$Administration._(
      groupId: groupId,  bParty: bParty);

  ///Set penatly
  factory Administration.setPenalty(String groupId, int? amount, String? bParty) => _$Administration._(
      groupId: groupId,  bParty: bParty, amount: amount );

  static Serializer<Administration> get serializer => _$administrationSerializer;
}