import 'package:flutter/material.dart';
import 'package:invest/theme/colors.dart';
import 'package:invest/utils/formats.dart';

class YearChartWidget extends StatelessWidget {
  final double min;
  final double max;
  final String currency;

  const YearChartWidget({
    super.key,
    required this.min,
    required this.max,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0),
              overlayShape: SliderComponentShape.noOverlay,
              trackHeight: 2,
            ),
            child: RangeSlider(
              values: RangeValues(min, max),
              min: min,
              max: max,
              onChanged: (_) {},
              activeColor: AppColors.primaryBlue,
              inactiveColor: AppColors.mediumBlue.withValues(alpha: 0.15),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Formats.formatMoney(min.toString(), currency),
                style: TextStyle(
                  color: AppColors.darkBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                Formats.formatMoney(max.toString(), currency),
                style: TextStyle(
                  color: AppColors.darkBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
