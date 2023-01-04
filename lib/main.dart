import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClockApp(),
    ),
  );
}

class ClockApp extends StatefulWidget {
  const ClockApp({super.key});
  @override
  State<ClockApp> createState() => _ClockAppState();
}

class _ClockAppState extends State<ClockApp> {
  String? h3;
  String? h2;
  String? h1;
  String? t;
  Random random = Random();

  bool h = true;
  bool m = true;
  bool s = true;

  @override
  void initState() {
    t = "${DateTime.now().hour} : ${DateTime.now().minute} : ${DateTime.now().second}";
    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      return Time();
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime r = DateTime.now();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
            "https://wallpapercave.com/wp/wp4317782.jpg",
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          Center(
            child: Text(
              (DateTime.now().hour < 12) ? "$t AM" : "$t pm",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),)
        ],
      ),
    );
  }

  void Time() {
    setState(() {
      if (DateTime.now().hour % 12 < 10) {
        h = false;
      } else {
        h = true;
      }
      if (DateTime.now().minute < 10) {
        m = false;
      } else {
        m = true;
      }
      if (DateTime.now().second < 10) {
        s = false;
      } else {
        s = true;
      }
      h1 = (h) ? "${DateTime.now().hour % 12}" : "0${DateTime.now().hour % 12}";
      h2 = (m) ? "${DateTime.now().minute}" : "0${DateTime.now().minute}";
      h3 = (s) ? "${DateTime.now().second}" : "0${DateTime.now().second}";
      t = h1! + " : " + h2! + " : " + h3!;

    });
  }
}

