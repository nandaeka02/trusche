// To parse this JSON data, do
//
//     final userdetail = userdetailFromJson(jsonString);

import 'dart:convert';

Userdetail userdetailFromJson(String str) => Userdetail.fromJson(json.decode(str));

String userdetailToJson(Userdetail data) => json.encode(data.toJson());

class Userdetail {
    String status;
    User user;

    Userdetail({
        required this.status,
        required this.user,
    });

    factory Userdetail.fromJson(Map<String, dynamic> json) => Userdetail(
        status: json["status"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "user": user.toJson(),
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
    List<String> role;

    User({
        required this.id,
        required this.nikUser,
        required this.fullName,
        required this.address,
        required this.phoneNumber,
        required this.email,
        required this.createdAt,
        required this.updatedAt,
        required this.role,
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
        role: List<String>.from(json["role"].map((x) => x)),
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
        "role": List<dynamic>.from(role.map((x) => x)),
    };
}
