
import 'package:chopper/chopper.dart';
import 'package:mobile/data/built_value_converter.dart.dart';

import 'package:http/http.dart' as darthttp;
import 'package:mobile/model/auth2_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:mobile/model/notification.dart';
import 'package:mobile/model/index.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:mobile/utils/navigation_service.dart';
import 'package:mobile/utils/sharedpreference.dart';

import 'package:mobile/utils/httpclients/http_client_base.dart'
// ignore: uri_does_not_exist
if (dart.library.html) 'package:mobile/utils/httpclients/http_client_web.dart'
// ignore: uri_does_not_exist
if (dart.library.io) 'package:mobile/utils/httpclients/http_client_nonweb.dart';



part 'post_api_service.chopper.dart';

@ChopperApi()
abstract class PostApiService extends ChopperService {
  /// GET REQUESTS

  @Get(path: '/v1/app-internal/group-list')
  Future<Response<BuiltList<Group>>> getGroups();

  @Get(path: '/v1/app-internal/group-list')
  Future<Response<BuiltList<Group>>> getGroupById(@Query("groupId") String groupId);


  @Get(path: '/v1/app-internal/loans')
  Future<Response<BuiltList<LoanResponse>>> getLoanList({@Query("forOthers") String forOthers="0"});

  @Get(path: '/v1/app-internal/loans')
  Future<Response<BuiltList<LoanResponse>>> getLoanById({@Query("groupId") String? groupId, @Query("loanId") String? loanId,  @Query("forOthers") String? forOthers, @Query('msisdn') String? msisdn, @Query('bParty') String? bParty, });



  @Get(path: '/v1/app-internal/notifications')
  Future<Response<BuiltList<Notifications>>> getNotifications();

  @Get(path: '/v1/app-internal/notifications')
  Future<Response<BuiltList<Notifications?>>> getNotificationById(@Query() String notificationId);

  @Get(path: 'v1/app-internal/loggeduser')
  Future<Response<CurrentUser>> getLoggedInUser();

  @Get(path: 'v1/app-internal/balance')
  Future<Response<Changes?>> checkBalance(@Query("groupId") String groupId,@Query("balanceType") String? balanceType, @Query("balanceScope") String? balanceScope,  {@Query("forOthers") String forOthers="0", @Query("amount") String amount="100", @Query("bParty") var bParty});

  @Get(path: 'v1/app-internal/groupmembers')
  Future<Response<BuiltList<GroupMember>>> getGroupMembers(@Query("groupId") String groupId);

  @Get(path: 'v1/app-internal/groupmembers')
  Future<Response<GroupMemberPage>> getPageableGroupMembers(@Query("groupId") String groupId, {@Query("nextPage", ) String nextPage = '1'});

  @Get(path: '/v1/app-internal/{endpoint}')
  Future<Response<Fees>> getFeesByType(@Path("endpoint") String endpoint,{ @Query("groupId") String? groupId });

  @Get(path: '/v1/app-internal/templates/{endpoint}')
  Future<Response> getTemplate(@Path("endpoint") String endpoint,{ @Query("groupId") String? groupId, @Query("groupType") String? groupType });

  @Get(path: '/v1/app-internal/memberpenalty')
  Future<Response<BuiltList<Penalty>>> getMemberPenalty({ @Query("groupId") String? groupId, @Query("forOthers") String? forOthers="0", @Query("bParty") String? bParty });

  @Get(path: 'v1/app-internal/groupsettings')
  Future<Response<GroupSettings>> getGroupSettings(@Query("groupId") String groupId);

  @Get(path: 'v1/app-internal/images/{entity}/{groupId}')
  Future<Response<String>> getGroupImage(@Path("entity") String entity, @Path("groupId") String groupId);

  @Get(path: 'v1/app-internal/savingaccounts')
  Future<Response<BuiltList<SavingAccount>>> getSavingAccount();

  @Get(path: 'v1/app-internal/totalsavingbalance')
  Future<Response<Balance>> getTotalSavingBalances();

  @Get(path: 'v1/app-internal/savingstransactions')
  Future<Response<BuiltList<SavingTransaction>>> getSavingAccountTransactions(@Query("savingAccount") String? savingAccountId);

  /// POST REQUESTS
  @Post(path: '/v1/app-internal/{endpoint}')
  Future<Response<Changes?>> administration(@Path("endpoint") String endpoint, @Body() Administration body);

  @Post(path: '/v1/app-internal/groups')
  Future<Response<Changes>> createGroup(@Body() GroupPost body);

  @Post(path: '/v1/app-internal/users')
  Future<Response<Changes>> registerUser(@Body() UserPost body);

  @Post(path: 'v1/app-internal/contribute')
  Future<Response<Changes?>> contributeToGroup(@Body() Contribution body);

  @Post(path: 'v1/app-internal/buyshares')
  Future<Response<Changes>> buyShares(@Body() Contribution body);

  @Post(path: 'v1/app-internal/transfer')
  Future<Response<Changes>> transfer(@Body() TransferRequest body);

  @Post(path: 'v1/app-internal/applyloan')
  Future<Response<Changes>> applyLoan(@Body() LoanPayload body);

  @Post(path: 'v1/app-internal/payloan')
  Future<Response<Changes>> payLoan(@Body() LoanPayload body);

  @Post(path: 'v1/app-internal/paypenalty')
  Future<Response<Changes>> payPenalty(@Body() Contribution body);

  @Post(path: 'v1/app-internal/paysocialfund')
  Future<Response<Changes>> paySocialFund(@Body() Contribution body);

  @Post(path: '/v1/app-internal/users/validate')
  Future<Response<Changes>> validateToken(@Body()  Token body);

  @Post(path: '/v1/app-internal/users/resendtoken')
  Future<Response<Changes>> resendToken(@Body() Token body);

  @Post(path: '/oauth/token', optionalBody: true)
  Future<Response<Auth2Response?>> postForLogin(@Query() String username, @Query() String password);

  @Post(path: '/v1/app-internal/changepassword')
  Future<Response<Changes>> postForChangePassword(@Body() Password body);

  @Post(path: '/v1/app-internal/users/{endpoint}')
  Future<Response<Changes?>> password(@Path("endpoint") String endpoint, @Body() Password body);

  @Post(path: '/v1/app-internal/{action}')
  Future<Response<Changes>> savingActions(@Path("action") String action, @Body() SavingPayload body);

  /// PUT REQUESTS

  @Put(path: '/v1/app-internal/members/{id}')
  Future<Response<Changes>> addGroupMember(@Path('id') dynamic id, @Body() dynamic body);

  @Put(path: '/v1/app-internal/notifications')
  Future<Response<Changes>> approveNotification(@Body() dynamic body);

  @Put(path: '/v1/app-internal/loggeduser')
  Future<Response<Changes>> updateUserProfile(@Body() UserProfile body);


  static PostApiService create() {
    final darthttp.BaseClient dartClient = createHttpClient();
    
    final client = ChopperClient(
      baseUrl: Constants.BASE_URL,
      services: [_$PostApiService()],
      client: dartClient,
      converter: BuiltValueConverter(),
      interceptors: [
        _addQuery,
        HeadersInterceptor({'Cache-control': 'no-cache', }),
        HeadersInterceptor({'Content-Type': 'application/json'}),
        HeadersInterceptor({'Accept': '*/*'}),
        HeadersInterceptor({'Fineract-Platform-TenantId':'default'}),
        HttpLoggingInterceptor(),
        (Response response) async{
          if(response.statusCode == 401) {
            SharedPreference sharedPref = SharedPreference.getInstance();
            sharedPref.clearSF();
          }
          if(response.statusCode == 404){
            NavigationService.instance.navigateTo('/error');
          }
          return response;
        },
      ],
    );

    return _$PostApiService(client);
  }
}

Future<Request> _addQuery(Request req) async {
  SharedPreference sharedPref = SharedPreference.getInstance();
   String n = await sharedPref.getStringValuesSF(enumKey.BASE_64_EncodedAuthenticationKey.toString());
   String _mssidn = await sharedPref.getStringValuesSF(currentUserEnum.M_SSD_IN.toString());
  String _sentMsisdn = req.parameters['msisdn'];
  final params = Map<String, dynamic>.from(req.parameters);
  //params['tenantIdentifier'] = 'default';
  if(req.url == '/oauth/token') {
    params['client_secret'] = 'ilq8mETljSdlLJDKqAk7hIPn4-H_hRiGHMhZMu7DkH0';
    params['client_id']='eg-saving';
    params['grant_type'] = 'password';
  }


  final header = new Map<String, String>.from(req.parameters);
  print(req.url == '/oauth/token');
  print(req.url != '/v1/app-internal/users');

   bool _sendAuthorization = req.url != '/oauth/token' && req.url != '/v1/app-internal/users' && req.url != '/v1/app-internal/users/resendtoken' && req.url != '/v1/app-internal/users/validate' ;

   if(_sentMsisdn != null){
     _mssidn = _sentMsisdn;
   }
   print('Authorization $_sendAuthorization, ${n.isNotEmpty} , ${n=='null'}, , ');
  if(_sendAuthorization && n != 'null') {
    header['Authorization'] = 'Bearer $n';
    if(_mssidn.isNotEmpty || _mssidn != null) {
      params['msisdn'] = _mssidn;
    }
  }
  return req.copyWith(parameters: params, headers: header);
}


