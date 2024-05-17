// To parse this JSON data, do
//
//     final userLoginSuccessl = userLoginSuccesslFromJson(jsonString);

import 'dart:convert';

UserLoginSuccessl userLoginSuccesslFromJson(String str) =>
    UserLoginSuccessl.fromJson(json.decode(str));

String userLoginSuccesslToJson(UserLoginSuccessl data) =>
    json.encode(data.toJson());

class UserLoginSuccessl {
  bool? status;
  String? message;
  String? username;
  String? token;

  UserLoginSuccessl({
    this.status,
    this.message,
    this.username,
    this.token,
  });

  UserLoginSuccessl copyWith({
    bool? status,
    String? message,
    String? username,
    String? token,
  }) =>
      UserLoginSuccessl(
        status: status ?? this.status,
        message: message ?? this.message,
        username: username ?? this.username,
        token: token ?? this.token,
      );

  factory UserLoginSuccessl.fromJson(Map<String, dynamic> json) =>
      UserLoginSuccessl(
        status: json["status"],
        message: json["message"],
        username: json["username"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "username": username,
        "token": token,
      };
}
