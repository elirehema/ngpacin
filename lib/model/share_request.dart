import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mobile/model/index.dart';

part 'share_request.g.dart';

abstract class ShareRequest extends Object with LanguageAndNetwork implements Built<ShareRequest, ShareRequestBuilder> {

  String? get groupId;
  String? get mobileNumber;
  String? get bParty;
  int? get amount;
  String? get forOthers;

  ShareRequest._();

  factory ShareRequest([updates(ShareRequestBuilder b)]) = _$ShareRequest;
  factory ShareRequest.from(groupId, mobileNumber,bParty, amount) => new _$ShareRequest._(
      groupId:  groupId,
      mobileNumber: mobileNumber,
      bParty: bParty,
      amount: amount,
      network: 'VODACOM',
      language: 'SWA',
      forOthers: '0'
  );

  static Serializer<ShareRequest> get serializer => _$shareRequestSerializer;
}