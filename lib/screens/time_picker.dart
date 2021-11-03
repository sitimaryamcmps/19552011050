import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(),
              onPressed: () {
                showTime(context);
              },
              child: Text('Time Picker'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Time value : ' + selectedTime.format(context),
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  showTime(context) async {
    final _timePick = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              alwaysUse24HourFormat: true,
            ),
            child: child!,
          );
        });

    if (_timePick != null) {
      setState(() {
        selectedTime = _timePick;
      });
    }
  }
}
