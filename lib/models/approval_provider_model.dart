import 'dart:convert';

import 'package:approvals/environment_variables/globals.dart' as globals;
import 'package:approvals/models/approvals.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class ApprovalProviderModel extends ChangeNotifier {
  List<Approval> approvalsFromJson(String str) => List<Approval>.from(
      json.decode(str)["data"].map((x) => Approval.fromJson(x)));

  List<Approval> _approvals = [];

  List<Approval> get approvals => _approvals;

  void getApprovals(String status) async {
    var serviceUrl = '${globals.apiUrl}/approvals?status=$status';
    final headers = {
      'Content-Type': 'application/json',
      'token': globals.jwtToken
    };
    try {
      final response = await http.get(Uri.parse(serviceUrl), headers: headers);
      _approvals = approvalsFromJson(response.body);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  void approveRejectApprovals(String id, String status, String comments) async {
    var serviceUrl = '${globals.apiUrl}/approvals';
    final headers = {
      'Content-Type': 'application/json',
      'token': globals.jwtToken
    };
    List<String> ids = [];
    ids.add(id);
    final body = {'id': ids, 'status': status, 'comments': comments};
    try {
      final response = await http.put(Uri.parse(serviceUrl),
          headers: headers, body: jsonEncode(body));
      var result = json.decode(response.body);
      if (result["code"] == 200) {
        _approvals.removeWhere((element) => element.id == id);
        Fluttertoast.showToast(
            msg: '$status Successfully',
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
