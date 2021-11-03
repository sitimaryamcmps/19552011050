import 'package:flutter/material.dart';
import 'package:sitimaryam_19552011050/navybar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navybar(),
    );
  }
}
