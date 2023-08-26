import 'package:flutter/material.dart';
import 'package:foodinformation/src/controller/Food_statistics_controller.dart';
import 'package:foodinformation/src/app.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: BindingsBuilder(() {
          Get.put(FoodStatisticsController());
        }),
        home: App());
  }
}
