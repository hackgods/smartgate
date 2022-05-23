// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.the0,
    this.the1,
    this.the2,
    this.id,
    this.numberPlate,
    this.timestamp,
    this.image,
  });

  String the0;
  String the1;
  DateTime the2;
  String id;
  String numberPlate;
  String timestamp;
  String image;

  factory User.fromJson(Map<String, dynamic> json) => User(
    the0: json["0"],
    the1: json["1"],
    the2: DateTime.parse(json["2"]),
    id: json["id"],
    numberPlate: json["numberPlate"],
    timestamp: json["timestamp"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "0": the0,
    "1": the1,
    "2": the2.toIso8601String(),
    "id": id,
    "numberPlate": numberPlate,
    "timestamp": timestamp,
    "image": image,
  };
}
