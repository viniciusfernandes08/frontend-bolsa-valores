import 'dart:convert';

import 'package:frontend_invest/controllers/global_controller.dart';
import 'package:frontend_invest/models/home_model.dart';
import 'package:http/http.dart' as http;

class HomeController {
  late GlobalController _globalController;

  Future<void> searchStocks(String symbol, String source) async {
    final url = Uri.parse('http://10.0.2.2:3000/stocks/$symbol?source=$source');

    try {
      final response = await http.get(url);

      HomeModel homeData = HomeModel.fromJson(response);

      _globalController.setHomeData(homeData);
    } catch (e) {
      print('Erro: $e');
    }
  }
}
