import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(),
              onPressed: () {
                showDate(context);
              },
              child: Text('Date Picker'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Date value : ' + dateFormat.format(selectedDate),
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  showDate(context) async {
    final datePick = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: selectedDate.subtract(
        Duration(days: 30),
      ),
      lastDate: DateTime(selectedDate.year + 1),
    );

    if (datePick != null) {
      setState(() {
        selectedDate = datePick;
      });
    }
  }
}
