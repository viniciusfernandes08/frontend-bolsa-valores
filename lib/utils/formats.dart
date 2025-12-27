class Formats {
  static String formatValueBR(String value) {
    double doubleValue = double.tryParse(value) ?? 0.0;
    String formattedValue = doubleValue.toStringAsFixed(2);
    return 'R\$ $formattedValue';
  }
}
