import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});
  final String title = "Homepage";

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

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