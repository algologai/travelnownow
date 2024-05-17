// To parse this JSON data, do
//
//     final signupErrorResponse = signupErrorResponseFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

SignupErrorResponse signupErrorResponseFromJson(String str) =>
    SignupErrorResponse.fromJson(json.decode(str));

String signupErrorResponseToJson(SignupErrorResponse data) =>
    json.encode(data.toJson());

class SignupErrorResponse {
  bool? status;
  Message? message;

  SignupErrorResponse({
    this.status,
    this.message,
  });

  SignupErrorResponse copyWith({
    bool? status,
    Message? message,
  }) =>
      SignupErrorResponse(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  factory SignupErrorResponse.fromJson(Map<String, dynamic> json) =>
      SignupErrorResponse(
        status: json["status"],
        message:
            json["message"] == null ? null : Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message?.toJson(),
      };
}

class Message {
  List<String>? nonFieldErrors;

  Message({
    this.nonFieldErrors,
  });

  Message copyWith({
    List<String>? nonFieldErrors,
  }) =>
      Message(
        nonFieldErrors: nonFieldErrors ?? this.nonFieldErrors,
      );

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        nonFieldErrors: json["non_field_errors"] == null
            ? []
            : List<String>.from(json["non_field_errors"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "non_field_errors": nonFieldErrors == null
            ? []
            : List<dynamic>.from(nonFieldErrors!.map((x) => x)),
      };
}
