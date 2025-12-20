import 'package:frontend_invest/models/home_model.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = false.obs;
  final Rx<HomeModel> _homeData = HomeModel(
    name: '',
    symbol: '',
    openPrice: '0.0',
    price: '0.0',
    changePercent: '0%',
    minDay: '0.0',
    maxDay: '0.0',
    rangeLastYear: '0.0 - 0.0',
  ).obs;

  bool get isLoading => _isLoading.value;
  HomeModel get homeData => _homeData.value;

  void setLoading(bool value) {
    _isLoading.value = value;
  }

  void setHomeData(HomeModel data) {
    _homeData.value = data;
  }
}
