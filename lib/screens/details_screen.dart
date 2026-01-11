import 'package:flutter/material.dart';
import 'package:frontend_invest/theme/colors.dart';
import 'package:frontend_invest/utils/formats.dart';

class DetailsScreen extends StatelessWidget {
  final String minDay;
  final String maxDay;
  final String symbol;
  final String currency;
  final String openPrice;
  final String? pl;
  final String? lpa;

  const DetailsScreen({
    super.key,
    required this.minDay,
    required this.maxDay,
    required this.symbol,
    required this.currency,
    required this.openPrice,
    this.pl,
    this.lpa,
  });

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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Detalhes $symbol:', 
              style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue, 
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 30,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Mínima do dia:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          spacing: 4,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              Formats.formatMoney(minDay, currency),
                              style: const TextStyle(
                                color: AppColors.darkBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.arrow_downward_outlined,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Máxima do dia:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          spacing: 4,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              Formats.formatMoney(maxDay, currency),
                              style: const TextStyle(
                                color: AppColors.darkBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.arrow_upward_outlined,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Preço de abertura:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          spacing: 4,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              Formats.formatMoney(openPrice, currency),
                              style: const TextStyle(
                                color: AppColors.darkBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.trending_up, color: AppColors.mediumBlue),
                          ],
                        ),
                      ],
                    ),
                  ),
                  pl != null && lpa != null ?
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 5,
                            children: [
                              const Text(
                                'PL:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                pl!.substring(0, 4),
                                style: const TextStyle(
                                  color: AppColors.darkBlue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 5,
                              children: [
                                const Text(
                                  'LPA:',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  lpa!.substring(0, 4),
                                  style: const TextStyle(
                                    color: AppColors.darkBlue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ) : const SizedBox.shrink(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [
                    Text(
                      '© Todos os direitos reservados - ${DateTime.now().year}', 
                      style: TextStyle(
                        color: Colors.black87, 
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
