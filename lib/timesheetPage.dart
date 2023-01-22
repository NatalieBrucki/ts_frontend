import 'package:flutter/material.dart';

class timesheetPage extends StatefulWidget {
  const timesheetPage({super.key});
  final String title = "Timesheet";

  @override
  State<timesheetPage> createState() => _timesheetPageState();
}

class _timesheetPageState extends State<timesheetPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text(widget.title),
          Text("Hallo Test"),
        ]
      )
    );
  }
}