import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


class BaseApi {
  late Dio client;

  BaseApi();

  initClient(client) {
    this.client = client;
  }

  post(String url, final parameters) async {
    try {
      var response = await client.post(url, data: parameters);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  get(String url) async {
    try {
      var response = await client.get(url);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  put(String url, final parameters) async {
    try {
      var response = await client.put(url, data: parameters);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  delete(String url, final parameters) async {
    try {
      var response = await client.delete(url, data: parameters);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  sendFile(String url, FormData data) async {
    try {
      var response = await client.post(url, data: data);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  getPresignedUrl(String url, final parameters) async {
    try {
      var response = await client.post(url, data: parameters);

      return response;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }
}
