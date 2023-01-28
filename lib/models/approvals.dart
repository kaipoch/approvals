// To parse this JSON data, do
//
//     final approval = approvalFromJson(jsonString);

import 'dart:convert';

Approval approvalFromJson(String str) => Approval.fromJson(json.decode(str));

String approvalToJson(Approval data) => json.encode(data.toJson());

class Approval {
  Approval({
    required this.refLinks,
    required this.status,
    required this.initialDocIds,
    required this.assigned,
    required this.type,
    required this.assignedEmail,
    required this.initiator,
    required this.initiatorEmail,
    required this.businessApplication,
    required this.mailSubject,
    required this.mailContent,
    required this.comments,
    required this.referenceId,
    required this.id,
    required this.updatedBy,
    required this.createdBy,
    required this.updatedAt,
    required this.createdAt,
    required this.history,
  });

  List<dynamic> refLinks;
  String status;
  List<dynamic> initialDocIds;
  String assigned;
  String type;
  String assignedEmail;
  String initiator;
  String initiatorEmail;
  String businessApplication;
  String mailSubject;
  String mailContent;
  String comments;
  String referenceId;
  String id;
  String updatedBy;
  String createdBy;
  DateTime updatedAt;
  DateTime createdAt;
  List<dynamic> history;

  factory Approval.fromJson(Map<String, dynamic> json) => Approval(
        refLinks: List<dynamic>.from(json["refLinks"].map((x) => x)),
        status: json["status"],
        initialDocIds: List<dynamic>.from(json["initialDocIds"].map((x) => x)),
        assigned: json["assigned"],
        type: json["type"],
        assignedEmail: json["assignedEmail"],
        initiator: json["initiator"],
        initiatorEmail: json["initiatorEmail"],
        businessApplication: json["businessApplication"],
        mailSubject: json["mailSubject"],
        mailContent: json["mailContent"],
        comments: json["comments"],
        referenceId: json["referenceId"],
        id: json["id"],
        updatedBy: json["updatedBy"],
        createdBy: json["createdBy"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        history: List<dynamic>.from(json["history"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "refLinks": List<dynamic>.from(refLinks.map((x) => x)),
        "status": status,
        "initialDocIds": List<dynamic>.from(initialDocIds.map((x) => x)),
        "assigned": assigned,
        "type": type,
        "assignedEmail": assignedEmail,
        "initiator": initiator,
        "initiatorEmail": initiatorEmail,
        "businessApplication": businessApplication,
        "mailSubject": mailSubject,
        "mailContent": mailContent,
        "comments": comments,
        "referenceId": referenceId,
        "id": id,
        "updatedBy": updatedBy,
        "createdBy": createdBy,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "history": List<dynamic>.from(history.map((x) => x)),
      };
}
