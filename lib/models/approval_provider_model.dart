import 'dart:convert';

import 'package:approvals/environment_variables/globals.dart' as globals;
import 'package:approvals/models/approvals.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApprovalProviderModel extends ChangeNotifier {
  List<Approval> approvalsFromJson(String str) => List<Approval>.from(
      json.decode(str).data.map((x) => Approval.fromJson(x)));

  List<Approval> _approvals = [
    Approval(
        refLinks: [],
        status: "PENDING",
        initialDocIds: [],
        assigned: "Dhruv",
        type: "Loan approval",
        assignedEmail: "naga.harshita@epikindifi.com",
        initiator: "Harshita",
        initiatorEmail: "naga.harshita@epikindifi.com",
        businessApplication: "COLLECTION_PORTAL",
        mailSubject: "Approval request for ID-123456",
        mailContent: "ApprovalContent",
        comments: "Comments",
        referenceId: "444444",
        id: "APP02-kti75sn345c0000#ID",
        updatedBy: "naga.harshita@epikindifi.com",
        createdBy: "naga.harshita@epikindifi.com",
        updatedAt: DateTime.parse("2023-01-27T19:56:06.368Z"),
        createdAt: DateTime.parse("2023-01-27T19:56:06.368Z"),
        history: [])
  ];

  List<Approval> get approvals => _approvals;

  void getApprovals() async {
    const serviceUrl = '${globals.apiUrl}/approvals';
    final headers = {
      'Content-Type': 'application/json',
      'token': globals.jwtToken
    };
    try {
      final response = await http.post(Uri.parse(serviceUrl), headers: headers);
      _approvals = approvalsFromJson(response.body);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
