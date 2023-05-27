// To parse this JSON data, do
//
//     final historyPembayaran = historyPembayaranFromJson(jsonString);

import 'dart:convert';

HistoryPembayaran historyPembayaranFromJson(String str) => HistoryPembayaran.fromJson(json.decode(str));

String historyPembayaranToJson(HistoryPembayaran data) => json.encode(data.toJson());

class HistoryPembayaran {
    List<Datum> data;

    HistoryPembayaran({
        required this.data,
    });

    factory HistoryPembayaran.fromJson(Map<String, dynamic> json) => HistoryPembayaran(
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

    Datum({
        required this.id,
        required this.status,
        required this.pembayaranBulan,
        required this.usersId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        status: json["status"],
        pembayaranBulan: json["pembayaran_bulan"],
        usersId: json["users_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "pembayaran_bulan": pembayaranBulan,
        "users_id": usersId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
