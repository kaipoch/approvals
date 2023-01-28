import 'dart:convert';

import 'package:approvals/environment_variables/globals.dart' as globals;
import 'package:approvals/models/queries.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class QueryProviderModel extends ChangeNotifier {
  List<Query> queriesFromJson(String str) =>
      List<Query>.from(json.decode(str)["data"].map((x) => Query.fromJson(x)));

  List<Query> _queries = [];

  List<Query> get queries => _queries;

  void getQueries(String status) async {
    var serviceUrl = '${globals.apiUrl}/approvals/queries?status=$status';
    final headers = {
      'Content-Type': 'application/json',
      'token': globals.jwtToken
    };
    try {
      final response = await http.get(Uri.parse(serviceUrl), headers: headers);
      _queries = queriesFromJson(response.body);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  void closeQuery(String id, String comments) async {
    var serviceUrl = '${globals.apiUrl}/approvals/raiseQuery?status=CLOSED';
    final headers = {
      'Content-Type': 'application/json',
      'token': globals.jwtToken
    };
    final body = {'id': id, 'query': comments};
    try {
      final response = await http.post(Uri.parse(serviceUrl),
          headers: headers, body: jsonEncode(body));
      var result = json.decode(response.body);
      if (result["code"] == 200) {
        _queries.removeWhere((element) => element.id == id);
        Fluttertoast.showToast(
            msg: 'Query Closed Successfully',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.green,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Oops! Something went wrong.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
