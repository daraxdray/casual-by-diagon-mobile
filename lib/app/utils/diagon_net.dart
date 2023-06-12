import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'custom_exception.dart';
import 'package:get/get.dart';
import '../services/auth_service.dart';

class DiagonNet {
  final appId = dotenv.env['APP_ID'];
  static final _apiKey = dotenv.env['API_KEY'];

  static String? get apiKey => _apiKey;
  String? queryLink;
  final http.Client? trClient = http.Client();
  static const baseUrl = "https://api.diagon.gg/";
  static const localUrl = "http://172.20.10.5/";
  final dgAuthService = Get.find<DgAuthService>();

  Future<dynamic> get(String url, {body, token, encoding}) async {
    var responseJson;
    try {
      final response = await trClient!.get(Uri.parse(baseUrl + url), headers: {
        "accept": "application/json",
        "Authorization": "Bearer ${dgAuthService.token}"
      });


        responseJson = _response(response, url);

    } on SocketException {
      throw const SocketException("Network Error");
    }

    return responseJson;
  }

  Future<dynamic> getNoBase(String url,
      {body,
      token,
      encoding,
      headers = const {"accept": "application/json"}}) async {
    var responseJson;
    try {
      final response = await trClient!.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200 || response.statusCode == 401) {
        responseJson = _response(response, url);
      } else {
        throw Exception('Request Error: ${response.statusCode}');
      }
    } on SocketException {
      throw const SocketException("Network Error");
    }

    return responseJson;
  }

  Future<dynamic> post(String url, {body, headers, encoding}) async {
    var responseJson;
    headers = {
      "accept": "application/json",
      "Authorization": "Bearer ${dgAuthService.token}"
    };
    try {
      await http
          .post(Uri.parse(baseUrl + url),
              body: body, headers: headers, encoding: encoding)
          .then((http.Response response) {
        final int statusCode = response.statusCode;
        if (statusCode < 200 || json == null) {
          throw Exception(
              "Error while fetching data, Error: ${response.statusCode}");
        }
        responseJson = _response(response,url);
      });
    } on SocketException {
      throw FetchDataException({'message':'No Internet connection'});
    }
    return responseJson;
  }
  Future<dynamic> patch(String url, {body, headers, encoding}) async {
    var responseJson;

    headers = {
      "accept": "application/json",
      "Authorization": "Bearer ${dgAuthService.token}"
    };
    try {
      await http
          .patch(Uri.parse(baseUrl + url),
              body: body, headers: headers, encoding: encoding)
          .then((http.Response response) {
        final int statusCode = response.statusCode;
        if (statusCode < 200 || json == null) {
          throw Exception(
              "Error while fetching data, Error: ${response.statusCode}");
        }
        responseJson = _response(response,url);
      });
    } on SocketException {
      throw FetchDataException({'message':'No Internet connection'});
    }
    return responseJson;
  }

  Future<dynamic> delete(String url, {body, headers, encoding}) async {
    var responseJson;

    headers = {
      "accept": "application/json",
      "Authorization": "Bearer ${dgAuthService.token}"
    };
    try {
      await http
          .delete(Uri.parse(baseUrl + url),
              body: body, headers: headers, encoding: encoding)
          .then((http.Response response) {
        final int statusCode = response.statusCode;
        if (statusCode < 200 || json == null) {
          throw Exception(
              "Error while fetching data, Error: ${response.statusCode}");
        }
        responseJson = _response(response,url);
      });
    } on SocketException {
      throw FetchDataException({'message':'No Internet connection'});
    }
    return responseJson;
  }

  Future<dynamic> postWithFiles(String url,
      {body, headers, encoding, required Map<String, File?> file}) async {
    var responseJson;
    headers = {"accept": "application/json", "Authorization": "Bearer "};
    try {
      http.MultipartFile multiFile = await http.MultipartFile.fromPath(
        file.keys.first,
        file.values.first?.path ?? "image",
      );
      final request = await http.MultipartRequest(
        "POST",
        Uri.parse(baseUrl + url),
      );
      request.fields.addAll(body);
      request.headers.addAll(headers);
      request.files.add(multiFile);

      http.StreamedResponse response = await request.send();

      final int statusCode = response.statusCode;
      if (statusCode < 200 || json == null) {
        throw Exception(
            "Error while fetching data, Error: ${response.statusCode}");
      }
      if (statusCode >= 500) {
        throw Exception(
            "Oops!!! Internal server error" + statusCode.toString());
      }
      if (statusCode >= 400 && statusCode < 500) {
        throw Exception(
            "Could not match your details - please try again with correct input");
      }
      response.stream.transform(utf8.decoder).listen((value) {
        responseJson = value;
      });
      await Future.delayed(const Duration(seconds: 1), () {});
      return json.decode(responseJson);
    } on SocketException {
      throw FetchDataException({'message':'No Internet connection'});
    } catch (e) {
      // debugPrint(e.toString());
    }
  }

  Future<dynamic> postNoBase(String url,
      {body, headers = const {"accept": "application/json"}, encoding}) async {
    var responseJson;

    try {
      final result = await http
          .post(Uri.parse(url),
              body: body, headers: headers, encoding: encoding)
          .then((http.Response response) {
        final String res = response.body;
        final int statusCode = response.statusCode;
        // debugPrint(response.body);
        if (statusCode < 200 || json == null) {
          throw Exception(
              "Error while fetching data, Error: ${response.statusCode}");
        }
        responseJson = _response(response, url);
      });
    } on SocketException {
      throw FetchDataException({'message':'No Internet connection'});
    }
    return responseJson;
  }

  //handles the response from api
  dynamic _response(http.Response response, String url) {
    log(response.statusCode.toString());

    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson;
        if (response.body.isNotEmpty) {
          responseJson = json.decode(response.body);
        } else {
          var result = {};
          responseJson = result;
        }
        return responseJson;
      case 400:
        throw BadRequestException(json.decode(response.body));
      case 401:
        return json.decode(response.body);
      case 403:
        throw UnauthorisedException(json.decode(response.body));
      case 404:
        throw UnknownResource(json.decode(response.body));
      case 422:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 500:
        throw InternalServerError(json.decode(response.body));
      default:
        throw FetchDataException(
            {'message' : '${response.statusCode}',},);
    }
  }
}
