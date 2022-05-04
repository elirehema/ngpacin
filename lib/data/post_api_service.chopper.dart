// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$PostApiService extends PostApiService {
  _$PostApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PostApiService;

  @override
  Future<Response<BuiltList<Group>>> getGroups() {
    final $url = '/v1/app-internal/group-list';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltList<Group>, Group>($request);
  }

  @override
  Future<Response<BuiltList<Group>>> getGroupById(String groupId) {
    final $url = '/v1/app-internal/group-list';
    final $params = <String, dynamic>{'groupId': groupId};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<BuiltList<Group>, Group>($request);
  }

  @override
  Future<Response<BuiltList<LoanResponse>>> getLoanList(
      {String forOthers = "0"}) {
    final $url = '/v1/app-internal/loans';
    final $params = <String, dynamic>{'forOthers': forOthers};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<BuiltList<LoanResponse>, LoanResponse>($request);
  }

  @override
  Future<Response<BuiltList<LoanResponse>>> getLoanById(
      {String? groupId,
      String? loanId,
      String? forOthers,
      String? msisdn,
      String? bParty}) {
    final $url = '/v1/app-internal/loans';
    final $params = <String, dynamic>{
      'groupId': groupId,
      'loanId': loanId,
      'forOthers': forOthers,
      'msisdn': msisdn,
      'bParty': bParty
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<BuiltList<LoanResponse>, LoanResponse>($request);
  }

  @override
  Future<Response<BuiltList<Notifications>>> getNotifications() {
    final $url = '/v1/app-internal/notifications';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltList<Notifications>, Notifications>($request);
  }

  @override
  Future<Response<BuiltList<Notifications>>> getNotificationById(
      String notificationId) {
    final $url = '/v1/app-internal/notifications';
    final $params = <String, dynamic>{'notificationId': notificationId};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<BuiltList<Notifications>, Notifications>($request);
  }

  @override
  Future<Response<CurrentUser>> getLoggedInUser() {
    final $url = 'v1/app-internal/loggeduser';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<CurrentUser, CurrentUser>($request);
  }

  @override
  Future<Response<Changes>> checkBalance(
      String groupId, String? balanceType, String? balanceScope,
      {String forOthers = "0", String amount = "100", dynamic bParty}) {
    final $url = 'v1/app-internal/balance';
    final $params = <String, dynamic>{
      'groupId': groupId,
      'balanceType': balanceType,
      'balanceScope': balanceScope,
      'forOthers': forOthers,
      'amount': amount,
      'bParty': bParty
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<Changes, Changes>($request);
  }

  @override
  Future<Response<BuiltList<GroupMember>>> getGroupMembers(String groupId) {
    final $url = 'v1/app-internal/groupmembers';
    final $params = <String, dynamic>{'groupId': groupId};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<BuiltList<GroupMember>, GroupMember>($request);
  }

  @override
  Future<Response<GroupMemberPage>> getPageableGroupMembers(String groupId,
      {String nextPage = '1'}) {
    final $url = 'v1/app-internal/groupmembers';
    final $params = <String, dynamic>{'groupId': groupId, 'nextPage': nextPage};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<GroupMemberPage, GroupMemberPage>($request);
  }

  @override
  Future<Response<Fees>> getFeesByType(String endpoint, {String? groupId}) {
    final $url = '/v1/app-internal/$endpoint';
    final $params = <String, dynamic>{'groupId': groupId};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<Fees, Fees>($request);
  }

  @override
  Future<Response<dynamic>> getTemplate(String endpoint,
      {String? groupId, String? groupType}) {
    final $url = '/v1/app-internal/templates/$endpoint';
    final $params = <String, dynamic>{
      'groupId': groupId,
      'groupType': groupType
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<BuiltList<Penalty>>> getMemberPenalty(
      {String? groupId, String? forOthers = "0", String? bParty}) {
    final $url = '/v1/app-internal/memberpenalty';
    final $params = <String, dynamic>{
      'groupId': groupId,
      'forOthers': forOthers,
      'bParty': bParty
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<BuiltList<Penalty>, Penalty>($request);
  }

  @override
  Future<Response<GroupSettings>> getGroupSettings(String groupId) {
    final $url = 'v1/app-internal/groupsettings';
    final $params = <String, dynamic>{'groupId': groupId};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<GroupSettings, GroupSettings>($request);
  }

  @override
  Future<Response<String>> getGroupImage(String entity, String groupId) {
    final $url = 'v1/app-internal/images/$entity/$groupId';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<String, String>($request);
  }

  @override
  Future<Response<BuiltList<SavingAccount>>> getSavingAccount() {
    final $url = 'v1/app-internal/savingaccounts';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltList<SavingAccount>, SavingAccount>($request);
  }

  @override
  Future<Response<Balance>> getTotalSavingBalances() {
    final $url = 'v1/app-internal/totalsavingbalance';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Balance, Balance>($request);
  }

  @override
  Future<Response<BuiltList<SavingTransaction>>> getSavingAccountTransactions(
      String? savingAccountId) {
    final $url = 'v1/app-internal/savingstransactions';
    final $params = <String, dynamic>{'savingAccount': savingAccountId};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client
        .send<BuiltList<SavingTransaction>, SavingTransaction>($request);
  }

  @override
  Future<Response<Changes>> administration(
      String endpoint, Administration body) {
    final $url = '/v1/app-internal/$endpoint';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Changes, Changes>($request);
  }

  @override
  Future<Response<Changes>> createGroup(GroupPost body) {
    final $url = '/v1/app-internal/groups';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Changes, Changes>($request);
  }

  @override
  Future<Response<Changes>> registerUser(UserPost body) {
    final $url = '/v1/app-internal/users';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Changes, Changes>($request);
  }

  @override
  Future<Response<Changes>> contributeToGroup(Contribution body) {
    final $url = 'v1/app-internal/contribute';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Changes, Changes>($request);
  }

  @override
  Future<Response<Changes>> buyShares(Contribution body) {
    final $url = 'v1/app-internal/buyshares';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Changes, Changes>($request);
  }

  @override
  Future<Response<Changes>> transfer(TransferRequest body) {
    final $url = 'v1/app-internal/transfer';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Changes, Changes>($request);
  }

  @override
  Future<Response<Changes>> applyLoan(LoanPayload body) {
    final $url = 'v1/app-internal/applyloan';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Changes, Changes>($request);
  }

  @override
  Future<Response<Changes>> payLoan(LoanPayload body) {
    final $url = 'v1/app-internal/payloan';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Changes, Changes>($request);
  }

  @override
  Future<Response<Changes>> payPenalty(Contribution body) {
    final $url = 'v1/app-internal/paypenalty';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Changes, Changes>($request);
  }

  @override
  Future<Response<Changes>> paySocialFund(Contribution body) {
    final $url = 'v1/app-internal/paysocialfund';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Changes, Changes>($request);
  }

  @override
  Future<Response<Changes>> validateToken(Token body) {
    final $url = '/v1/app-internal/users/validate';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Changes, Changes>($request);
  }

  @override
  Future<Response<Changes>> resendToken(Token body) {
    final $url = '/v1/app-internal/users/resendtoken';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Changes, Changes>($request);
  }

  @override
  Future<Response<Auth2Response>> postForLogin(
      String username, String password) {
    final $url = '/oauth/token';
    final $params = <String, dynamic>{
      'username': username,
      'password': password
    };
    final $request = Request('POST', $url, client.baseUrl, parameters: $params);
    return client.send<Auth2Response, Auth2Response>($request);
  }

  @override
  Future<Response<Changes>> postForChangePassword(Password body) {
    final $url = '/v1/app-internal/changepassword';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Changes, Changes>($request);
  }

  @override
  Future<Response<Changes>> password(String endpoint, Password body) {
    final $url = '/v1/app-internal/users/$endpoint';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Changes, Changes>($request);
  }

  @override
  Future<Response<Changes>> savingActions(String action, SavingPayload body) {
    final $url = '/v1/app-internal/$action';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Changes, Changes>($request);
  }

  @override
  Future<Response<Changes>> addGroupMember(dynamic id, dynamic body) {
    final $url = '/v1/app-internal/members/$id';
    final $body = body;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<Changes, Changes>($request);
  }

  @override
  Future<Response<Changes>> approveNotification(dynamic body) {
    final $url = '/v1/app-internal/notifications';
    final $body = body;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<Changes, Changes>($request);
  }

  @override
  Future<Response<Changes>> updateUserProfile(UserProfile body) {
    final $url = '/v1/app-internal/loggeduser';
    final $body = body;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<Changes, Changes>($request);
  }
}
