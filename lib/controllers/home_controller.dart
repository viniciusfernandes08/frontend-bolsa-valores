import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:invest/controllers/global_controller.dart';
import 'package:invest/models/home_model.dart';
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
      Get.snackbar(
        'Erro',
        'Não foi possível buscar o ativo',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade600,
        colorText: Colors.white,
        margin: const EdgeInsets.all(12),
        borderRadius: 8,
        icon: const Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
        duration: const Duration(seconds: 3),
      );
    } finally {
      _globalController.setLoading(false);
    }
  }
}
