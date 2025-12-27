class Formats {
  static String formatValueBR(String value, String market) {
    double doubleValue = double.tryParse(value) ?? 0.0;
    String formattedValue = doubleValue.toStringAsFixed(2);

    if (market.toLowerCase() == 'brapi') {
      return 'R\$ $formattedValue';
    }

    return 'US\$ $formattedValue';
  }
}
