import 'dart:convert';

import 'package:dio/dio.dart';

class ApiRequest {
  final String url;
  final Map<String ,dynamic> data;

  ApiRequest({
    required this.url,
    required this.data,
  });

  Dio _dio() {
    return Dio(BaseOptions(headers: {
    'Content-Type': 'application/json',
    'x-api-key': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjIiLCJ1c2VybmFtZSI6ImRvZGk',
    // 'Content-Length': bodyBytes.length.toString(),
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    }));
  }

  void get({
     required Function() beforeSend,
     required Function(dynamic data) onSuccess,
     required Function(dynamic error) onError,
  }) {
    _dio().get(this.url, queryParameters:this.data).then((res) {
      if (onSuccess != null) onSuccess(res.data);
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }

  void post({
     required Function() beforeSend,
     required Function(dynamic data) onSuccess,
     required Function(dynamic error) onError,
  }) {
    _dio().post(this.url,data:this.data).then((res) {
      // if (onSuccess != null) onSuccess(res.data);
      if (onSuccess != null) {
        onSuccess(jsonDecode(res.data));
      }
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }
}
