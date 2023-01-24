// To parse this JSON data, do
//     final timesheetModel = timesheetModelFromJson(jsonString);

import 'dart:convert';

List<TimesheetModel> timesheetModelFromJson(String str) =>
    List<TimesheetModel>.from(
        json.decode(str).map((x) => TimesheetModel.fromJson(x)));

String timesheetModelToJson(List<TimesheetModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TimesheetModel {
  TimesheetModel({
    required this.tid,
    required this.weekday,
    required this.starttime,
    required this.endtime,
    required this.workinghours,
    required this.project,
    required this.user,
  });

  int tid;
  String weekday;
  String starttime;
  String endtime;
  double workinghours;
  Project project;
  User user;

  factory TimesheetModel.fromJson(Map<String, dynamic> json) => TimesheetModel(
        tid: json["tid"],
        weekday: json["weekday"],
        starttime: json["starttime"],
        endtime: json["endtime"],
        workinghours: json["workinghours"],
        project: Project.fromJson(json["project"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "tid": tid,
        "weekday": weekday,
        "starttime": starttime,
        "endtime": endtime,
        "workinghours": workinghours,
        "project": project.toJson(),
        "user": user.toJson(),
      };
}

class Project {
  Project({
    required this.pid,
    required this.name,
  });

  int pid;
  String name;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        pid: json["pid"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "pid": pid,
        "name": name,
      };
}

class User {
  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
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
