class Formats {
  static String formatValueBR(String value, String market) {
    double doubleValue = double.tryParse(value) ?? 0.0;
    String formattedValue = doubleValue.toStringAsFixed(2);

    if (market.toLowerCase() == 'brapi') {
      return 'R\$ $formattedValue';
    }

    return 'US\$ $formattedValue';
  }

  static String formatRange(String range, String market) {
    List<String> splittedString = range.split('-');
    String firstPosition = formatValueBR(splittedString[0], market);
    String lastPosition = formatValueBR(splittedString[1], market);

    return '$firstPosition - $lastPosition';
  }
}
