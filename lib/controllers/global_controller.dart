import 'package:frontend_invest/models/home_model.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = false.obs;
  final Rx<HomeModel> _homeData = HomeModel(
    name: '',
    symbol: '',
    price: '0.0',
    change: '0.0',
    datetime: '',
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
