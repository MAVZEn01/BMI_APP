import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart';

import 'package:bmi_app/screens/result_screen.dart';
import 'package:bmi_app/widgets/gender_widget.dart';
import 'package:bmi_app/widgets/info_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});
  static String route = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool switchbtn = false;
  bool isMale = true;
  int height = 150;
  int age = 21;
  int weight = 70;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C2135),
      appBar: AppBar(
        elevation: 100,
        backgroundColor: Color(0xff1C2135),
        title: Row(
          mainAxisAlignment: .center,
          children: [
            Switch(
              value: switchbtn,
              onChanged: (value) {
                switchbtn = value;
                setState(() {});
              },
              activeColor: Color(0xff3D81E8),
            ),
            Text(
              "BMI Calculator",
              style: TextStyle(
                fontSize: 20,
                fontWeight: .w600,
                color: Color(0xffFFFFFF),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 25,
          children: [
            Expanded(
              child: Row(
                spacing: 10,
                children: [
                  GenderWedgit(
                    image: "assets/images/icons/Male.png ",
                    text: "Male",
                    isSlected: isMale,
                    onTap: () {
                      isMale = true;
                      setState(() {});
                    },
                  ),
                  GenderWedgit(
                    image: "assets/images/icons/Female.png",
                    text: "Female",
                    isSlected: !isMale,
                    onTap: () {
                      isMale = false;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff333244),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: .spaceAround,
                  children: [
                    Text(
                      "Height",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: .w300,
                        color: Color(0xff8B8C9E),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .end,

                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: .w600,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                        Text(
                          "cm",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: .w300,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      min: 150,
                      max: 250,
                      activeColor: Color(0xffE83D67),
                      value: height.toDouble(),
                      onChanged: (value) {
                        height = value.toInt();
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Row(
                spacing: 10,
                children: [
                  InfoWidget(
                    value: weight,
                    title: "Weight",
                    add: () {
                      weight++;
                      setState(() {});
                    },
                    remove: () {
                      weight--;
                      setState(() {});
                    },
                  ),
                  InfoWidget(
                    value: age,
                    title: "Age",
                    add: () {
                      age++;
                      setState(() {});
                    },
                    remove: () {
                      age--;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BmiButtomWidget(
        text: "Calculate",
        onPressed: () {
          double calculateBmi = (weight / ((height / 100) * (height / 100)))
              .roundToDouble();
          print(calculateBmi);
          Navigator.of(context)
              .pushNamed(ResultScreen.route, arguments: calculateBmi);
        },
      ),
    );
  }
}

class BmiButtomWidget extends StatelessWidget {
  const BmiButtomWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Color(0xffE83D67),
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 32,
          fontWeight: .w600,
          color: Color(0xffFFFFFF),
        ),
      ),
    );
  }
}
