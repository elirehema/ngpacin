
import 'package:chopper/chopper.dart';
import 'package:mobile/data/built_value_converter.dart.dart';

import 'package:http/http.dart' as darthttp;
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
  /// POST REQUESTS
  @Post(path: '/v1/app-internal/{endpoint}')
  Future<Response<Changes?>> administration(@Path("endpoint") String endpoint, @Body() AuthPost body);

  @Post(path: '/verification')
  Future<Response<DataResponse>> verifyScannedTokens(@Body() VerificationPayload body);



  static PostApiService create() {
    final darthttp.BaseClient dartClient = createHttpClient();
    
    final client = ChopperClient(
      baseUrl: Constants.BASE_URL,
      services: [_$PostApiService()],
      client: dartClient,
      converter: BuiltValueConverter(),
      interceptors: [
        //_addQuery,
        HeadersInterceptor({'Cache-control': 'no-cache', }),
        HeadersInterceptor({'Content-Type': 'application/json'}),
        HeadersInterceptor({'Accept': '*/*'}),
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


