import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shortcut_test_project/api/comics_api.dart';
import 'package:shortcut_test_project/models/base_models/base_model_response.dart';

enum ApiState { local, dev, staging, prod }

class ApiEnvironment {
  static const ApiState apiState = ApiState.dev;

  static String _baseUrl() {
    switch (apiState) {
      case ApiState.local:
        return "";
      case ApiState.dev:
        return "https://xkcd.com";
      case ApiState.staging:
        return "";
      case ApiState.prod:
        return "";
      default:
        return "";
    }
  }

  static String getMediaURL() {
    switch (apiState) {
      case ApiState.local:
        return _baseUrl() + ":80/";
      case ApiState.dev:
        return _baseUrl() + "/";
      case ApiState.staging:
        return _baseUrl() + "/";
      case ApiState.prod:
        return _baseUrl() + "/";
      default:
        return "";
    }
  }

  static String getApiURL() {
    switch (apiState) {
      case ApiState.local:
        return _baseUrl() + ":80/api/";
      case ApiState.dev:
        return _baseUrl() + "/";
      case ApiState.staging:
        return _baseUrl() + "/";
      case ApiState.prod:
        return _baseUrl() + "/";
      default:
        return "";
    }
  }
}

class ApiContainer {
  static final ApiContainer _singleton = ApiContainer._initialize();

  factory ApiContainer() {
    return _singleton;
  }

  final Dio client = Dio(BaseOptions(
    baseUrl: ApiEnvironment.getApiURL(),
    connectTimeout: 32000,
    receiveTimeout: 32000,
  ));

  final appComicsApi = ComicsApi();

  ApiContainer._initialize() {
    client.options
      ..headers["Content-Type"] = "application/json"
      ..headers["Accept"] = "application/json";

    client.interceptors.add(
      PrettyDioLogger(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );

    appComicsApi.initClient(client);
  }

  String catchError(e) {
    if (e is DioError) {
      if (e.response != null) {
        if (kDebugMode) {
          print(e.response);
        }
        if (e.response?.statusCode == 401) {
          return messageHandler(e.response?.statusMessage ?? '');
        } else if (e.response?.statusCode == 404) {
          return messageHandler(e.response?.statusMessage ?? '');
        } else if (e.response?.data != null) {
          final parsedJson = JsonMapper.deserialize<BaseModelResponse>(e.response?.data);
          if (parsedJson != null) {
            return messageHandler(parsedJson.error!.message!);
          }
        }
      } else if (e.error != null) {
        return messageHandler(e.error.toString());
      }
    } else if (e?.toString() != null) {
      return messageHandler(e.toString());
    }

    return messageHandler(e.toString());
  }
}

String messageHandler(String message) {
  if (message.contains("Failed host lookup: 'xkcd.com'")) {
    return 'No internet connection';
  }
  if (message.contains('Connecting timed out') || message.contains('Operation timed out')) {
    return 'Request timeout';
  }

  return message;
}
