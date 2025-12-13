import 'package:flutter/material.dart';
import 'package:frontend_invest/controllers/global_controller.dart';
import 'package:frontend_invest/theme/colors.dart';
import 'package:get/get.dart';

class StocksWidget extends StatelessWidget {
  const StocksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeData = Get.find<GlobalController>().homeData;
    final bool? isMarketOpen = homeData.isMarketOpen;

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
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        homeData.price.toString(),
                        style: const TextStyle(color: AppColors.darkBlue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Símbolo:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        homeData.symbol,
                        style: const TextStyle(color: AppColors.darkBlue),
                      ),
                    ],
                  ),
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
                  isMarketOpen == false
                      ? Text(
                          'NÃO',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          'SIM',
                          style: TextStyle(
                            color: Colors.green,
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
  }
}
