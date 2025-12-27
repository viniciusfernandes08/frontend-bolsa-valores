import 'package:flutter/material.dart';
import 'package:frontend_invest/controllers/home_controller.dart';
import 'package:frontend_invest/theme/colors.dart';
import 'package:frontend_invest/widgets/stocks_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _controller = HomeController();
  final TextEditingController _textController = TextEditingController();
  String _selectedMarket = 'brapi';

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        centerTitle: true,
        title: const Text(
          'INVEST+  Consulta de ações',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 40),
            const Text(
              'Digite a ação para filtrar',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: 'Ex: PETR4',
                        hintStyle: TextStyle(color: Colors.blueGrey),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: AppColors.primaryBlue,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: AppColors.primaryBlue,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      final symbol = _textController.text.trim().toUpperCase();

                      if (symbol.isNotEmpty) {
                        _controller.searchStocks(
                          symbol,
                          _selectedMarket.toLowerCase(),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                    ),
                    child: const Icon(Icons.search, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 5,
                children: [
                  const Text(
                    'Mercado: ',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  ToggleButtons(
                    isSelected: [
                      _selectedMarket == 'brapi',
                      _selectedMarket == 'twelve',
                    ],
                    fillColor: AppColors.primaryBlue,
                    onPressed: (index) {
                      setState(() {
                        _selectedMarket = index == 0 ? 'brapi' : 'twelve';
                      });
                    },
                    color: Colors.blueGrey,
                    selectedColor: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 12, right: 12),
                        child: Text(
                          'BR',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12, right: 12),
                        child: Text(
                          'USA',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            StocksWidget(selectedMarket: _selectedMarket,),
          ],
        ),
      ),
    );
  }
}
