import 'dart:convert';

import 'package:http/http.dart' as http;

class HomeController {
  Future<void> searchStocks(String symbol, String source) async {
    final url = Uri.parse('http://10.0.2.2:3000/stocks/$symbol?source=$source');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
      } else {
        print('Erro: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro: $e');
    }
  }
}
