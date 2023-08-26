import 'package:foodinformation/src/model/Food_statistics.dart';
import 'package:foodinformation/src/repository/Food_statistics_repository.dart';
import 'package:get/get.dart';


class FoodStatisticsController extends GetxController {
  late FoodStatisticsRepository _foodStatisticsRepository;
  Rx<TodaysFoodModle> foodStatistic = TodaysFoodModle().obs;

  @override
  void onInit() {
    super.onInit();
    _foodStatisticsRepository = FoodStatisticsRepository();
    fetchFoodstate();
  }

  void fetchFoodstate() async {
    var result = await _foodStatisticsRepository.fetchFoodStatistics();
    if (result != null) {
      foodStatistic(result);
    }
  }
}
