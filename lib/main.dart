import 'package:bmi_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BMIAPP());
}

class BMIAPP extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
