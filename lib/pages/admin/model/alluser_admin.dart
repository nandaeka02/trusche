// To parse this JSON data, do
//
//     final userRoleAdmin = userRoleAdminFromJson(jsonString);

import 'dart:convert';

UserRoleAdmin userRoleAdminFromJson(String str) =>
    UserRoleAdmin.fromJson(json.decode(str));

String userRoleAdminToJson(UserRoleAdmin data) => json.encode(data.toJson());

class UserRoleAdmin {
  List<User> user;

  UserRoleAdmin({
    required this.user,
  });

  factory UserRoleAdmin.fromJson(Map<String, dynamic> json) => UserRoleAdmin(
        user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": List<dynamic>.from(user.map((x) => x.toJson())),
      };
}

class User {
  int id;
  String nikUser;
  String fullName;
  String address;
  String phoneNumber;
  String email;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.nikUser,
    required this.fullName,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        nikUser: json["nik_user"],
        fullName: json["full_name"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nik_user": nikUser,
        "full_name": fullName,
        "address": address,
        "phone_number": phoneNumber,
        "email": email,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
