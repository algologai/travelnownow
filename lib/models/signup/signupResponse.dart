// ignore_for_file: file_names

import 'dart:convert';

SignupResponse signupResponseFromJson(String str) =>
    SignupResponse.fromJson(json.decode(str));

String signupResponseToJson(SignupResponse data) => json.encode(data.toJson());

class SignupResponse {
  bool? status;
  String? message;

  SignupResponse({
    this.status,
    this.message,
  });

  SignupResponse copyWith({
    bool? status,
    String? message,
  }) =>
      SignupResponse(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  factory SignupResponse.fromJson(Map<String, dynamic> json) => SignupResponse(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
