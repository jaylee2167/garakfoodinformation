import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:foodinformation/src/controller/Food_statistics_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

var now = new DateTime.now(); //반드시 다른 함수에서 해야함, Mypage같은 클래스에서는 사용 불가능
String formatDate = DateFormat('yyyy-MM-dd').format(now); //format변경

class App extends GetView<FoodStatisticsController> {
  App({super.key});
  late double hedearTopZone;

  Widget infowiget(String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Container(
            width: 200,
            child: Text(
              ': $value',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    hedearTopZone = Get.mediaQuery.padding.top + AppBar().preferredSize.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.menu,
          color: Color(0xffFF8551),
        ),
        elevation: 0,
        foregroundColor: Color(0xffFF8551),
        title: Text(
          '오늘의 급식',
          style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Icon(
              Icons.notifications,
              color: Color(0xffFF8551),
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  Color.fromARGB(255, 255, 234, 208),
                  Color.fromARGB(255, 250, 240, 228),
                ],
              ),
            ),
          ),
          Positioned(
            top: hedearTopZone + 80,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                child: Image.asset(
                  'assets/숟가락_포크-removebg-preview-removebg-preview.png',
                  width: Get.size.width * 0.7,
                ),
              ),
            ),
          ),
          Positioned(
            top: hedearTopZone + 10,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 247, 228, 204),
                ),
                child: Text(
                  '날짜:${formatDate}',
                  style: TextStyle(
                    color: Color(0xffFF8551),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: hedearTopZone + 240,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.all(25),
              child: Obx(
                () {
                  var info = controller.foodStatistic.value;
                  String result =
                      info.DDISH_NM!.replaceAll(RegExp('[^가-힣&\\s]'), "");
                  return Container(
                    width: 400,
                    child: Column(
                      children: [
                        Text(
                          "오늘의 급식",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          ':${result}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
