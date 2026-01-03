class Formats {
  static String formatMoney(String value, String currency) {
    double doubleValue = double.tryParse(value) ?? 0.0;
    String formattedValue = doubleValue.toStringAsFixed(2);

    if (currency.toLowerCase() == 'brl') {
      return 'R\$ $formattedValue';
    }

    return 'US\$ $formattedValue';
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
