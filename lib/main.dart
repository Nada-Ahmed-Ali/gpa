import 'package:flutter/material.dart';
import 'package:gpa/screen/input.dart';

void main() {
  runApp(GPACalculatorApp());
}

class GPACalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: InputScreen(),
    );
  }
}


