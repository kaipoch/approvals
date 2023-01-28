// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.userName,
    required this.userPassword,
    required this.userRoles,
    required this.userToken,
    required this.userBusinessApplication,
    required this.userEmail,
  });

  String id;
  String userName;
  String userPassword;
  List<String> userRoles;
  List<dynamic> userToken;
  List<String> userBusinessApplication;
  String userEmail;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    userName: json["user_name"],
    userPassword: json["user_password"],
    userRoles: List<String>.from(json["user_roles"].map((x) => x)),
    userToken: List<dynamic>.from(json["user_token"].map((x) => x)),
    userBusinessApplication: List<String>.from(json["user_businessApplication"].map((x) => x)),
    userEmail: json["user_email"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user_name": userName,
    "user_password": userPassword,
    "user_roles": List<dynamic>.from(userRoles.map((x) => x)),
    "user_token": List<dynamic>.from(userToken.map((x) => x)),
    "user_businessApplication": List<dynamic>.from(userBusinessApplication.map((x) => x)),
    "user_email": userEmail,
  };
}
