import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});
  final String title = "Homepage";

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime dateTimeStart = DateTime.now();
  DateTime dateTimeEnd = DateTime.now();
  bool showDate = false;
  bool showTime = false;
  bool showDateTime = true;

//    // Select for Date
  Future<DateTime> _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
    return selectedDate;
  }

// Select for Time
  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (selected != null && selected != selectedTime) {
      setState(() {
        selectedTime = selected;
      });
    }
    return selectedTime;
  }
  // select date time picker

  Future _selectDateTimeStart(BuildContext context) async {
    final date = await _selectDate(context);
    if (date == null) return;

    final time = await _selectTime(context);

    if (time == null) return;
    setState(() {
      dateTimeStart = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  Future _selectDateTimeEnd(BuildContext context) async {
    final date = await _selectDate(context);
    if (date == null) return;

    final time = await _selectTime(context);

    if (time == null) return;
    setState(() {
      dateTimeEnd = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  String getDate() {
    // ignore: unnecessary_null_comparison
    if (selectedDate == null) {
      return 'select date';
    } else {
      return DateFormat('MMM d, yyyy').format(selectedDate);
    }
  }

  String getDateTime(bool start) {
    // ignore: unnecessary_null_comparison
    var dateTime;
    if (start) {
      dateTime = dateTimeStart;
    } else {
      dateTime = dateTimeEnd;
    }
    if (dateTime == null) {
      return 'select date timer';
    } else {
      return DateFormat('yyyy-MM-dd HH:mm a').format(dateTime);
    }
  }

  String getTime(TimeOfDay tod) {
    final now = DateTime.now();

    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = 
    ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 251, 157, 64));
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              child: ElevatedButton(
                style: style,
                onPressed: () {
                  _selectDateTimeStart(context);
                  showDateTime = true;
                },
                child: const Text('Select start time'),
              ),
            ),
            showDateTime
                ? Center(child: Text(getDateTime(true)))
                : const SizedBox(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              child: ElevatedButton(
                style: style,
                onPressed: () {
                  _selectDateTimeEnd(context);
                  showDateTime = true;
                },
                child: const Text('Select end time'),
              ),
            ),
            showDateTime
                ? Center(child: Text(getDateTime(false)))
                : const SizedBox(),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              // ignore: prefer_const_constructors
              child: Theme(
                data: ThemeData(
                  primaryColor: Colors.orangeAccent, 
                  primaryColorDark: Colors.deepOrangeAccent,),
                  // ignore: prefer_const_constructors
                  child: TextField(
                  obscureText: false,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                  border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 238, 134, 14))),
                  labelText: 'Project',
                  ),
                ),
              ),
             ),
          ],
        ),
      ),
    );
  }
}
