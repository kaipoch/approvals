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
    required this.initialDocs,
    required this.history,
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
  });

  List<dynamic> refLinks;
  String status;
  List<InitialDoc> initialDocs;
  List<History> history;
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

  factory Approval.fromJson(Map<String, dynamic> json) => Approval(
        refLinks: List<dynamic>.from(json["refLinks"].map((x) => x)),
        status: json["status"],
        initialDocs: List<InitialDoc>.from(
            json["initialDocs"].map((x) => InitialDoc.fromJson(x))),
        history:
            List<History>.from(json["history"].map((x) => History.fromJson(x))),
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
        updatedAt: DateTime.parse(json["updatedAt"]).toLocal(),
        createdAt: DateTime.parse(json["createdAt"]).toLocal(),
      );

  Map<String, dynamic> toJson() => {
        "refLinks": List<dynamic>.from(refLinks.map((x) => x)),
        "status": status,
        "initialDocs": List<dynamic>.from(initialDocs.map((x) => x.toJson())),
        "history": List<dynamic>.from(history.map((x) => x.toJson())),
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
      };
}

class History {
  History({
    required this.status,
    required this.comments,
    required this.createdAt,
    required this.createdBy,
    required this.queryFor,
  });

  String status;
  String comments;
  DateTime createdAt;
  String createdBy;
  String queryFor;

  factory History.fromJson(Map<String, dynamic> json) => History(
        status: json["status"],
        comments: json["comments"],
        createdAt: DateTime.parse(json["createdAt"]),
        createdBy: json["createdBy"],
        queryFor: json["queryFor"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "comments": comments,
        "createdAt": createdAt.toIso8601String(),
        "createdBy": createdBy,
        "queryFor": queryFor,
      };
}

class InitialDoc {
  InitialDoc({
    required this.docId,
    required this.docOriginalName,
    required this.docS3Link,
  });

  String docId;
  String docOriginalName;
  String docS3Link;

  factory InitialDoc.fromJson(Map<String, dynamic> json) => InitialDoc(
        docId: json["doc_id"],
        docOriginalName: json["doc_originalName"],
        docS3Link: json["docS3Link"],
      );

  Map<String, dynamic> toJson() => {
        "doc_id": docId,
        "doc_originalName": docOriginalName,
        "docS3Link": docS3Link,
      };
}
