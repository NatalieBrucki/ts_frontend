// To parse this JSON data, do
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    required this.uid,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.email,
  });

  int uid;
  String username;
  String firstname;
  String lastname;
  String email;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    uid: json["uid"],
    username: json["username"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "username": username,
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
  };
}
