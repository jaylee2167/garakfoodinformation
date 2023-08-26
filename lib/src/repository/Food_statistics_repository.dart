import 'dart:async';

import 'package:dio/dio.dart';
import 'package:foodinformation/src/model/Food_statistics.dart';
import 'package:intl/intl.dart';
import 'package:xml/xml.dart';

var now = new DateTime.now(); //반드시 다른 함수에서 해야함, Mypage같은 클래스에서는 사용 불가능
String formatDate = DateFormat(
  'yyyyMMdd',
).format(now); //format변경

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
  Future<TodaysFoodModle> fetchFoodStatistics() async {
    var response = await _dio.get(
        '/hub/mealServiceDietInfo?KEY=8beae3a2dce24faea683428cf8c36291&Type=xml&pIndex=1&pSize=10&ATPT_OFCDC_SC_CODE=B10&SD_SCHUL_CODE=7010057&MLSV_YMD=${formatDate}');
    final document = XmlDocument.parse(response.data);
    final rows = document.findAllElements('row');
    if (rows.isNotEmpty) {
      return TodaysFoodModle.fromXml(rows.first);
    } else {
      return Future.value("오늘은 급식이 없습니다" as FutureOr<TodaysFoodModle>?);
    }
  }
}
