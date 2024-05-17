// To parse this JSON data, do
//
//     final userLoginModel = userLoginModelFromJson(jsonString);

import 'dart:convert';

UserLoginModel userLoginModelFromJson(String str) =>
    UserLoginModel.fromJson(json.decode(str));

String userLoginModelToJson(UserLoginModel data, String s) => json.encode(data.toJson());

class UserLoginModel {
  String? username;
  String? password;

  UserLoginModel({
    this.username,
    this.password,
  });

  factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
