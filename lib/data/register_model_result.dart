import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:teledentistry_app/utils/api_url.dart';


//TODO 5 : Class handle register
class RegistResult {
  dynamic error;
  int? code;
  Data? data;
  String? message;

  RegistResult({this.error, this.code, this.data, this.message});

  factory RegistResult.fromJson(Map<String, dynamic> json) {
    return RegistResult(
        error: json['error'],
        code: json['code'],
        data: json['data'] != null ? Data.fromJson(json['data']) : null,
        message: json['message']);
  }

  static Future<RegistResult> register(String email, String password) async {
    var apiResult = await http.post(Uri.parse(ApiUrl.registerUrl),
        body: {'email': email, 'password': password});
    var jsonObj = json.decode(apiResult.body);

    return RegistResult.fromJson(jsonObj as Map<String, dynamic>);
  }
}

class Data {
  String? email;
  int? roleId;

  Data({this.email, this.roleId});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    roleId = json['role_id'];
  }
}
