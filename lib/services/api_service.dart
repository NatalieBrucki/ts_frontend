/*
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:lib/services/constants.dart';

import 'package:lib/time_model.dart';

class ApiService {
  Future<List<TimeModel>?> getTimes() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.endpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<TimeModel> _model = timeModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}*/