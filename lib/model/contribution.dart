import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'contribution.g.dart';

abstract class Contribution  implements Built<Contribution, ContributionBuilder> {

  String? get groupId;
  String? get mobileNumber;
  String? get bParty;
  int? get amount;
  String? get forOthers;

  Contribution._();

  factory Contribution([updates(ContributionBuilder b)]) = _$Contribution;
  factory Contribution.from(groupId, mobileNumber,bParty, amount, forOther) => new _$Contribution._(
      groupId:  groupId,
      mobileNumber: mobileNumber,
      bParty: bParty,
      amount: amount,
      forOthers: forOther
  );

  static Serializer<Contribution> get serializer => _$contributionSerializer;
}