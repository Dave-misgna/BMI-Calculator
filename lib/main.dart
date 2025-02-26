import 'package:bmi_calculator_project/bmi_calulator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith( 
        scaffoldBackgroundColor: Color(0xFF0A0E21), 
       ),

      home: BmiCalulator(),
    );
  }
}
