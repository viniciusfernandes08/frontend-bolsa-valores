import 'package:frontend_invest/models/home_model.dart';

class GlobalController {
  HomeModel? _homeData;

  HomeModel setHomeData(HomeModel homeData) => _homeData = homeData;

  HomeModel get homeData =>
      _homeData ??
      HomeModel(
        name: '',
        symbol: '',
        price: '0.0',
        change: '0.0',
        datetime: '',
      );
}
