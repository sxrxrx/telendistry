import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:teledentistry_app/utils/api_url.dart';


// TODO 4 : Class handle login

class LoginResult {
  dynamic error;
  int? code;
  Data? data;
  String? message;

  LoginResult({this.error, this.code, this.data, this.message});

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    return LoginResult(
        error: json['error'],
        code: json['code'],
        data: json['data'] != null ? Data.fromJson(json['data']) : null,
        message: json['message']);
  }

  static Future<LoginResult> login(String email, String password) async {
    var apiResult = await http.post(Uri.parse(ApiUrl.loginUrl),
        body: {'email': email, 'password': password});

    var jsonObj = json.decode(apiResult.body);
    return LoginResult.fromJson(jsonObj as Map<String, dynamic>);
  }
}

class Data {
  String? refresh;
  String? access;

  Data({this.refresh, this.access});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(refresh: json['refresh'], access: json['access']);
  }
}
