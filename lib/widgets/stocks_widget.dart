import 'package:flutter/material.dart';
import 'package:frontend_invest/controllers/global_controller.dart';
import 'package:frontend_invest/theme/colors.dart';
import 'package:get/get.dart';

class StocksWidget extends StatelessWidget {
  const StocksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalController controller = Get.find<GlobalController>();

    return Obx(() {
      if (controller.isLoading) {
        return const Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: CircularProgressIndicator(color: AppColors.primaryBlue),
          ),
        );
      }

      final homeData = controller.homeData;

      if (homeData.symbol.isEmpty) {
        return const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Nenhuma ação encontrada',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        );
      }

      final double price = double.tryParse(homeData.price) ?? 0.0;
      final double openPrice = double.tryParse(homeData.openPrice) ?? 0.0;
      final double change = double.tryParse(homeData.changePercent) ?? 0.0;

      final bool isNegative = change < 0;
      final Color textColor = isNegative ? Colors.red : Colors.green;
      final String signal = isNegative ? '' : '+';

      String formattedPrice = price.toStringAsFixed(2);
      String formattedOpenPrice = openPrice.toStringAsFixed(2);
      String formattedChange = change.toStringAsFixed(2);

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryBlue),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: 5,
                      children: [
                        const Text(
                          'Valor da ação:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'R\$$formattedPrice ',
                                style: const TextStyle(
                                  color: AppColors.darkBlue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              TextSpan(
                                text: '$signal $formattedChange%',
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: 5,
                      children: [
                        const Text(
                          'Símbolo:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          homeData.symbol,
                          style: const TextStyle(
                            color: AppColors.darkBlue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: 5,
                      children: [
                        const Text(
                          'Preço de abertura:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'R\$$formattedOpenPrice',
                          style: const TextStyle(
                            color: AppColors.darkBlue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Preço no último ano:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          homeData.rangeLastYear,
                          style: const TextStyle(
                            color: AppColors.darkBlue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    homeData.pl != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            spacing: 5,
                            children: [
                              const Text(
                                'PL:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                homeData.pl!.substring(0, 4),
                                style: const TextStyle(
                                  color: AppColors.darkBlue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    homeData.pl != null
                        ? const SizedBox(height: 12)
                        : Container(),
                    homeData.lpa != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            spacing: 5,
                            children: [
                              const Text(
                                'LPA:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                homeData.lpa!.substring(0, 4),
                                style: const TextStyle(
                                  color: AppColors.darkBlue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    const SizedBox(height: 12),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Mercado aberto?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    homeData.isMarketOpen == true
                        ? Text(
                            'SIM',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Text(
                            'NÃO',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    const SizedBox(height: 12),
                    const Text(
                      'Mínima do dia:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'R\$${homeData.minDay}',
                      style: const TextStyle(
                        color: AppColors.darkBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Máxima do dia:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'R\$${homeData.maxDay}',
                      style: const TextStyle(
                        color: AppColors.darkBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
