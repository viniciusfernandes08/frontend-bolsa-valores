import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend_invest/controllers/global_controller.dart';
import 'package:frontend_invest/models/home_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final GlobalController _globalController = Get.find<GlobalController>();

  Future<void> searchStocks(String symbol, String source) async {
    final String baseUrl = dotenv.env['BASE_URL']!;

    final url = Uri.parse('$baseUrl/$symbol?source=$source');

    try {
      _globalController.setLoading(true);

      final response = await http.get(url);

      if (response.statusCode == 200) {
        HomeModel homeData = HomeModel.fromJson(response.body);

        _globalController.setHomeData(homeData);
      } else {
        throw Exception('Erro ${response.statusCode}: ${response.body}');
      }
    } catch (e) {
      print('Erro ao buscar ação: $e');
    } finally {
      _globalController.setLoading(false);
    }
  }
}
