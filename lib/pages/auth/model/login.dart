// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    String status;
    String token;
    List<String> role;

    LoginModel({
        required this.status,
        required this.token,
        required this.role,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        token: json["token"],
        role: List<String>.from(json["role"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "role": List<dynamic>.from(role.map((x) => x)),
    };
}
