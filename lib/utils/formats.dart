import 'package:intl/intl.dart';

class Formats {
  static String formatMoney(String value, String currency) {
    double doubleValue = double.tryParse(value) ?? 0.0;
    
    if (currency.toLowerCase() == 'brl') {
      final format = NumberFormat.currency(
        locale: 'pt_BR',
        symbol: 'R\$',
        decimalDigits: 2,
      );
      return format.format(doubleValue);
    }

    final format = NumberFormat.currency(
      locale: 'en_US',
      symbol: 'US\$',
      decimalDigits: 2,
    );

    return format.format(doubleValue);
  }

  static String formatVolume(String value) {
    final numValue = double.tryParse(value) ?? 0;
  
    final formatter = NumberFormat('#,##0.##', 'pt_BR');
  
    if (numValue >= 1e9) {
      return '${formatter.format(numValue / 1e9)} B';
    } else if (numValue >= 1e6) {
      return '${formatter.format(numValue / 1e6)} M';
    } else if (numValue >= 1e3) {
      return '${formatter.format(numValue / 1e3)} mil';
    }
  
    return formatter.format(numValue);
  }

  static List<double> parseRange(String value) {
    final parts = value.split('-');

    if (parts.length != 2) {
      return [0, 0];
    }

    return [
      double.tryParse(parts[0].trim()) ?? 0,
      double.tryParse(parts[1].trim()) ?? 0,
    ];
  }
}
