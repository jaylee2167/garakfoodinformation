// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:xml/xml.dart';
import 'package:dio/dio.dart';

var now = new DateTime.now(); //반드시 다른 함수에서 해야함, Mypage같은 클래스에서는 사용 불가능
String formatDate = DateFormat('yyyyMMdd').format(now);

class FoodStatisticsRepository {
  late var _dio;

  FoodStatisticsRepository() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://open.neis.go.kr/",
        queryParameters: {'KEY': '8beae3a2dce24faea683428cf8c36291'},
      ),
    );
  }
}

void main() {}
