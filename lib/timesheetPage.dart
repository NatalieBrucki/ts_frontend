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
      body: _timesheetModel == null || _timesheetModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _timesheetModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        children: const <Widget>[
                        Expanded(
                          flex: 1,
                          child: Text("Weekday", textScaleFactor: 0.7),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("Workinghours", textScaleFactor: 0.7),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("Project", textScaleFactor: 0.7),
                        ),
                      ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Text(_timesheetModel![index].weekday.toString()),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(_timesheetModel![index].workinghours.roundToDouble().toString()),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(_timesheetModel![index].project.name.toString()),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
