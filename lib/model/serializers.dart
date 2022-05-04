import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:mobile/model/index.dart';
import 'package:built_collection/built_collection.dart';

part 'serializers.g.dart';

@SerializersFor(const [
    Group, AuthPost, AuthResponse, AuthRole,Auth2Response, Notifications,  Changes,
    GroupPost,OfficeResource,UserPost, GroupPost, MemberPost,NotificationApprove,LanguageAndNetwork,
    Contribution, TransferRequest, ShareRequest,CurrentUser,LoanPayload,LoanResponse,Administration,
    GroupMember, GroupMemberPage,Fees,UserProfile, Token, ValueLabel, Penalty,GroupSettings, Password,
    SavingAccount,SavingPayload, Balance,SavingTransaction
])
final Serializers serializers = (_$serializers.toBuilder()
        ..addPlugin(StandardJsonPlugin()))
        .build();