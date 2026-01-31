import 'package:flutter/material.dart';
import 'package:invest/controllers/global_controller.dart';
import 'package:invest/screens/details_screen.dart';
import 'package:invest/theme/colors.dart';
import 'package:invest/utils/formats.dart';
import 'package:invest/widgets/safe_svg_widget.dart';
import 'package:invest/widgets/year_chart_widget.dart';
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

      final double change = double.tryParse(homeData.changePercent) ?? 0.0;
      final range = Formats.parseRange(homeData.rangeLastYear);
      final minRange = range[0];
      final maxRange = range[1];

      final bool isNegative = change < 0;
      final Color textColor = isNegative ? Colors.red : Colors.green;
      final String signal = isNegative ? '' : '+';

      String formattedChange = change.toStringAsFixed(2);

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryBlue, width: 1.5),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          spacing: 8,
                          children: [
                            homeData.logoUrl != null
                                ? Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: SafeSvg(url: homeData.logoUrl!, size: 45),
                                    ),
                                  )
                                : Container(
                                    height: 45,
                                    width: 45,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.mediumBlue.withValues(
                                        alpha: 0.15,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      homeData.symbol.substring(0, 1),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Formats.formatMoney(
                                    homeData.price,
                                    homeData.currency,
                                  ),
                                  style: const TextStyle(
                                    color: AppColors.darkBlue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '$signal$formattedChange%',
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 4),
                                      child: Text(
                                        homeData.symbol,
                                        style: const TextStyle(
                                          color: AppColors.darkBlue,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    if (homeData.isMarketOpen != null)
                                      Text(
                                        '- ${homeData.name.toLowerCase().startsWith('the') ? '${homeData.name.split(' ')[1]} ${homeData.name.split(' ')[2]}' : homeData.name.split(' ')[0]}',
                                        style: const TextStyle(
                                          color: AppColors.darkBlue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                  ],
                                ),
                                homeData.isMarketOpen != null
                                    ? Row(
                                        children: [
                                          const Text(
                                            'Mercado:',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const SizedBox(width: 6),
                                          homeData.isMarketOpen == true
                                              ? Text(
                                                  'ABERTO',
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              : Text(
                                                  'FECHADO',
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                        ],
                                      )
                                    : SizedBox(
                                        width: 200,
                                        child: Text(
                                          homeData.name,
                                          maxLines: 1,
                                          textAlign: TextAlign.end,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: AppColors.darkBlue,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const Text(
                  'Variação no último ano:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                YearChartWidget(
                  min: minRange,
                  max: maxRange,
                  currency: homeData.currency,
                ),
                const SizedBox(height: 36),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          minDay: homeData.minDay,
                          maxDay: homeData.maxDay,
                          dailyVolume: homeData.dailyVolume,
                          symbol: homeData.symbol,
                          currency: homeData.currency,
                          openPrice: homeData.openPrice,
                          pl: homeData.pl,
                          lpa: homeData.lpa,
                          marketValue: homeData.marketValue,
                        ),
                      ),
                    );
                  },
                  child: Ink(
                    child: Text(
                      'Ver detalhes',
                      style: TextStyle(
                        color: AppColors.mediumBlue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
