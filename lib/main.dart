import 'package:flutter/material.dart';
import 'package:frontend_invest/controllers/global_controller.dart';
import 'package:frontend_invest/screens/home_screen.dart';
import 'package:get/get.dart';

void main() {
  Get.put(GlobalController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
