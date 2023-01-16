import 'package:flutter/material.dart';
//import 'package:lib/model/user_model.dart';
//import 'package:lib/services/api_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<TimeModel>? _timeModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _timeModel = (await ApiService().getTimes())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),
      ),
      body: _timeModel == null || _timeModel!.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _timeModel!.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(_timeModel![index].id.toString()),
                    Text(_timeModel![index].time),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(_timeModel![index].timeMinute),
                    Text(_timeModel![index].timeHour),
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