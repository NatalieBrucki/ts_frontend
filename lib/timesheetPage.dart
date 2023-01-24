import 'package:flutter/material.dart';
import 'package:timesheet_frontend/model/timesheet_model.dart';
import 'package:timesheet_frontend/services/api_service.dart';

class timesheetPage extends StatefulWidget {
  const timesheetPage({super.key});
  final String title = "Timesheet";

  @override
  State<timesheetPage> createState() => _timesheetPageState();
}

class _timesheetPageState extends State<timesheetPage> {
  late List<TimesheetModel>? _timesheetModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _timesheetModel = (await ApiService().getTimesheets())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _timesheetModel == null || _timesheetModel!.isEmpty ? const Center(
      child: CircularProgressIndicator(),
    )
        : ListView.builder(
        itemCount: _timesheetModel!.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // TODO Date in text
                    Text(_timesheetModel![index].workinghours.toString()),
                    Text(_timesheetModel![index].project.name.toString()),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(_timesheetModel![index].user.email.toString())
                  ],
                ),
              ],
            ),
          );
        },
    ),
    );
  }
}