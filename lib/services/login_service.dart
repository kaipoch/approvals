import "dart:convert";

import "package:approvals/environment_variables/globals.dart" as globals;
import "package:approvals/services/secure_storage_service.dart";
import 'package:flutter/material.dart';
import "package:fluttertoast/fluttertoast.dart";
import 'package:http/http.dart' as http;

class LoginService {
  Future verifyLogin(String email, String password) async {
    const serviceUrl = '${globals.apiUrl}/login';
    final headers = {'Content-Type': 'application/json'};
    SecureStorage secureStorage = SecureStorage();
    try {
      String json = _toJson(email, password);
      final response =
          await http.post(Uri.parse(serviceUrl), headers: headers, body: json);
      print(response);
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Login Failed! Please try again!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
      print(e);
    }
  }

  String _toJson(String email, String password) {
    var mapData = {};
    mapData["user_email"] = email;
    mapData["user_password"] = password;
    String json = jsonEncode(mapData);
    return json;
  }
}
