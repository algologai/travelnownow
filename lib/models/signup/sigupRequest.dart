// ignore_for_file: file_names

import 'dart:convert';

SignupRequest signupRequestFromJson(String str) => SignupRequest.fromJson(json.decode(str));

String signupRequestToJson(SignupRequest data) => json.encode(data.toJson());

class SignupRequest {
    String? username;
    String? email;
    String? password;

    SignupRequest({
        this.username,
        this.email,
        this.password,
    });

    SignupRequest copyWith({
        String? username,
        String? email,
        String? password,
    }) => 
        SignupRequest(
            username: username ?? this.username,
            email: email ?? this.email,
            password: password ?? this.password,
        );

    factory SignupRequest.fromJson(Map<String, dynamic> json) => SignupRequest(
        username: json["username"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
    };
}