import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CousesMBCall {
  static Future<ApiCallResponse> call({
    String? userID = '',
  }) {
    final body = '''
{
  "user_ID": "${userID}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'cousesMB',
      apiUrl: 'https://countmeinapi.herokuapp.com/coursesMB/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic acceptedmbcourses(dynamic response) => getJsonField(
        response,
        r'''$.data[?(@.status=='ÙÙØ§ÙÙ Ø¹ÙÙÙØ§')]''',
        true,
      );
}

class CoursesCBCall {
  static Future<ApiCallResponse> call({
    String? userID = '',
  }) {
    final body = '''
{
  "user_ID": "${userID}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'coursesCB',
      apiUrl: 'https://countmeinapi.herokuapp.com/coursesCB/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class WorkshopMBCall {
  static Future<ApiCallResponse> call({
    String? userID = '',
  }) {
    final body = '''
{
  "user_ID": "${userID}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'workshopMB',
      apiUrl: 'https://countmeinapi.herokuapp.com/workshopMB/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic acceptedworkshops(dynamic response) => getJsonField(
        response,
        r'''$.data[?(@.status=='ÙÙØ§ÙÙ Ø¹ÙÙÙØ§')]''',
        true,
      );
}

class WorkshopCBCall {
  static Future<ApiCallResponse> call({
    String? userID = '',
  }) {
    final body = '''
{
  "user_ID": "${userID}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'workshopCB',
      apiUrl: 'https://countmeinapi.herokuapp.com/workshopCB/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EvetnCBCall {
  static Future<ApiCallResponse> call({
    String? userID = '',
  }) {
    final body = '''
{
  "user_ID": "${userID}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'evetnCB',
      apiUrl: 'https://countmeinapi.herokuapp.com/activityCB/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EventMBCall {
  static Future<ApiCallResponse> call({
    String? userID = '',
  }) {
    final body = '''
{
  "user_ID": "${userID}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'eventMB',
      apiUrl: 'https://countmeinapi.herokuapp.com/activityCB/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
