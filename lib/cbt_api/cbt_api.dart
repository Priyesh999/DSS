import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get_connect/connect.dart';

class CbtRequest extends GetConnect {
  final String url;
  final bool isStandredData;
  final Map<String, dynamic> data;

  CbtRequest({
    required this.url,
    required this.data,
    this.isStandredData = true,
  });

  Dio _dio() {
    // Put your authorization token here
    return Dio(BaseOptions(
        connectTimeout: Duration(minutes: 2),
        receiveTimeout: Duration(minutes: 2),
        followRedirects: true,
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*",
          'X-Requested-With': 'XMLHttpRequest',
          // Required for CORS support to work
          "Access-Control-Allow-Credentials": true,
          // Required for cookies, authorization headers with HTTPS
          "Access-Control-Allow-Headers":
              "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          "Access-Control-Allow-Methods": "POST,OPTIONS"
        }));
  }

  void getApi({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    _dio().get(this.url, queryParameters: this.data).then((res) {
      if (onSuccess != null) onSuccess(res.data);
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }

  void postRequest({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    _dio()
        .post(this.url,
            data: isStandredData
                ? await getRequestData()
                : json.encode(data) ?? {})
        .then((res) {
      if (onSuccess != null) onSuccess(res.data);
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }

  void postApi({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    final response = await httpClient
        .post(this.url,
            body: isStandredData ? await getRequestData() : data ?? {})
        .then((res) {
      // if (res.hasError) onError(error);
      if (onSuccess != null) onSuccess(res.body);
    }).catchError((error) {
      if (onError != null) onError(error);
    });
    if (response?.hasError == null) return null;
    return response.body;
  }

  getRequestData() async {
    return {
      "CBT_REQUEST_DATA": data,
      "CBT_TRACKING_DATA": {
        "PR_LOCATION": "",
        "PR_IP_ADDRESS": "",
        "PR_LAT_LONG": "asdas",
        "PR_BATTERY": "rewrw",
        "PR_OS": "dewrewr",
        "PR_PHONE_BRAND": "",
        "PR_ACTIVITY_TYPE": "",
        "PR_KM": ""
      }
    };
  }
}
