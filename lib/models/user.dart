// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.firstName,
    required this.name,
    required this.email,
  });

  String firstName;
  String name;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json["firstName"],
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "name": name,
    "email": email,
  };
}
