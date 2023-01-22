// To parse this JSON data, do
//     final projects = projectsFromJson(jsonString);

import 'dart:convert';

List<ProjectModel> projectModelFromJson(String str) => List<ProjectModel>.from(json.decode(str).map((x) => ProjectModel.fromJson(x)));

String projectModelToJson(List<ProjectModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProjectModel{
  ProjectModel({
    required this.pid,
    required this.name,
  });

  int pid;
  String name;

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
    pid: json["pid"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "pid": pid,
    "name": name,
  };
}
