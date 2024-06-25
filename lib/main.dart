import 'package:flutter/material.dart';
import 'package:ui_health_app/homepage.dart';
import 'package:ui_health_app/slider/slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      home: MyHomePage(title: "Slider",),
   //  home:HomePage()
    );
  }
}
