// To parse this JSON data, do
//
//     final adminTransaksi = adminTransaksiFromJson(jsonString);

import 'dart:convert';

AdminTransaksi adminTransaksiFromJson(String str) =>
    AdminTransaksi.fromJson(json.decode(str));

String adminTransaksiToJson(AdminTransaksi data) => json.encode(data.toJson());

class AdminTransaksi {
  List<Datum> data;

  AdminTransaksi({
    required this.data,
  });

  factory AdminTransaksi.fromJson(Map<String, dynamic> json) => AdminTransaksi(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String status;
  String pembayaranBulan;
  int usersId;
  DateTime createdAt;
  DateTime updatedAt;
  Users users;

  Datum({
    required this.id,
    required this.status,
    required this.pembayaranBulan,
    required this.usersId,
    required this.createdAt,
    required this.updatedAt,
    required this.users,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        status: json["status"],
        pembayaranBulan: json["pembayaran_bulan"],
        usersId: json["users_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        users: Users.fromJson(json["users"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "pembayaran_bulan": pembayaranBulan,
        "users_id": usersId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "users": users.toJson(),
      };
}

class Users {
  int id;
  String nikUser;
  String fullName;
  String address;
  String phoneNumber;
  String email;
  DateTime createdAt;
  DateTime updatedAt;

  Users({
    required this.id,
    required this.nikUser,
    required this.fullName,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
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
