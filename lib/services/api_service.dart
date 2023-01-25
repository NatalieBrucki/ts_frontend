import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:timesheet_frontend/model/timesheet_model.dart';
import 'package:timesheet_frontend/model/user_model.dart';
import 'package:timesheet_frontend/model/project_model.dart';
import 'package:timesheet_frontend/services/api_service.dart';
import '../constants.dart';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.getUsersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<ProjectModel>?> getProjects() async {
    try {
      var url =
          Uri.parse(ApiConstants.baseUrl + ApiConstants.getProjectsEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<ProjectModel> _model = projectModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<TimesheetModel>?> getTimesheets() async {
    try {
      var url =
          Uri.parse(ApiConstants.baseUrl + ApiConstants.getTimesheetsEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<TimesheetModel> _model = timesheetModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<ProjectModel> addProject(String projectname) async {
    http.Response res = await http.post(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.addProjectEndpoint),
        headers: <String, String>{'Content-Type': 'text/plain'},
        body: projectname);

    if (res.statusCode == 201) {
      List<ProjectModel> projects = projectModelFromJson("[" + res.body + "]");
      return projects[0];
    } else {
      throw "Add Project faild";
    }
  }

  bool addTimesheet(String weekday, String starttime, String endtime,
      String workinghours, int pid, int uid) {
    String bodytxt = jsonEncode(<String, String>{
      "weekday": weekday,
      "starttime": starttime,
      "endtime": endtime,
      "workinghours": workinghours,
      "pid": pid.toString(),
      "uid": uid.toString(),
    });

    http.post(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.addTimesheetEndpoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: bodytxt,
    );

    return true;
  }
}
