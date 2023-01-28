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
    required this.userEmailId,
    required this.userToken,
    required this.userBusinessApplication,
    required this.userEmail,
    required this.token,
  });

  String id;
  String userName;
  String userPassword;
  List<String> userRoles;
  String userEmailId;
  List<dynamic> userToken;
  List<String> userBusinessApplication;
  String userEmail;
  String token;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["data._id"],
        userName: json["data.user_name"],
        userPassword: json["data.user_password"],
        userRoles: List<String>.from(json["data.user_roles"].map((x) => x)),
        userEmailId: json["data.user_emailId"],
        userToken: List<dynamic>.from(json["data.user_token"].map((x) => x)),
        userBusinessApplication: List<String>.from(
            json["data.user_businessApplication"].map((x) => x)),
        userEmail: json["data.user_email"],
        token: json["data.token"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user_name": userName,
        "user_password": userPassword,
        "user_roles": List<dynamic>.from(userRoles.map((x) => x)),
        "user_emailId": userEmailId,
        "user_token": List<dynamic>.from(userToken.map((x) => x)),
        "user_businessApplication":
            List<dynamic>.from(userBusinessApplication.map((x) => x)),
        "user_email": userEmail,
        "token": token,
      };
}
