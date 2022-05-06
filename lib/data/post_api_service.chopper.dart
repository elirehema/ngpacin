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
  Future<Response<Changes>> administration(String endpoint, AuthPost body) {
    final $url = '/v1/app-internal/$endpoint';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Changes, Changes>($request);
  }

  @override
  Future<Response<DataResponse>> verifyScannedTokens(VerificationPayload body) {
    final $url = '/verification';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<DataResponse, DataResponse>($request);
  }
}
